#!/usr/bin/env python3
#
# Copyright (c) 2026 Huawei Device Co., Ltd.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""Portable clangd shards using a private mount namespace, never global links."""

import functools
import hashlib
import json
import os
from pathlib import Path
import shlex
import shutil
import subprocess
import tempfile

VIRTUAL_ROOT = "/tmp/ohos-clangd-workspace"
MANIFEST = "portable-index.json"
FORMAT = 1


def entries(path):
    """Stream both minified and pretty JSON compilation databases."""
    decoder = json.JSONDecoder()
    with open(path, encoding="utf-8") as stream:
        buffer, pos, eof = "", 0, False

        def more():
            nonlocal buffer, pos, eof
            chunk = stream.read(1 << 20)
            buffer, pos, eof = buffer[pos:] + chunk, 0, not chunk

        def space():
            nonlocal pos
            while True:
                while pos < len(buffer) and buffer[pos].isspace():
                    pos += 1
                if pos < len(buffer) or eof:
                    return
                more()

        space()
        if pos == len(buffer) or buffer[pos] != "[":
            raise ValueError("CDB must be a JSON array")
        pos += 1
        space()
        if pos < len(buffer) and buffer[pos] == "]":
            pos += 1
        else:
            while True:
                space()
                try:
                    entry, end = decoder.raw_decode(buffer, pos)
                except json.JSONDecodeError:
                    if eof:
                        raise ValueError("Incomplete CDB")
                    more()
                    continue
                if not isinstance(entry, dict):
                    raise ValueError("CDB entry must be an object")
                pos = end
                yield entry
                space()
                if pos < len(buffer) and buffer[pos] == "]":
                    pos += 1
                    break
                if pos == len(buffer) or buffer[pos] != ",":
                    raise ValueError("Invalid CDB delimiter")
                pos += 1
        space()
        if pos < len(buffer):
            raise ValueError("Trailing CDB data")


def digest(path):
    result = hashlib.sha256()
    with open(path, "rb") as stream:
        for chunk in iter(lambda: stream.read(1 << 20), b""):
            result.update(chunk)
    return result.hexdigest()


def atomic_json(path, value):
    path = Path(path)
    fd, temporary = tempfile.mkstemp(prefix=path.name + ".", dir=path.parent)
    try:
        with os.fdopen(fd, "w", encoding="utf-8") as output:
            json.dump(value, output, indent=2, ensure_ascii=False)
            output.write("\n")
        os.replace(temporary, path)
    finally:
        if os.path.exists(temporary):
            os.unlink(temporary)


def server_path(path, workspace):
    """Map only a complete workspace prefix, not an unrelated prefix collision."""
    path, root = str(path), str(Path(workspace).resolve())
    if path == root:
        return VIRTUAL_ROOT
    if path.startswith(root + "/"):
        return VIRTUAL_ROOT + path[len(root):]
    return path


def local_path(path, workspace):
    path = str(path)
    if path == VIRTUAL_ROOT or path.startswith(VIRTUAL_ROOT + "/"):
        return str(Path(workspace).resolve()) + path[len(VIRTUAL_ROOT):]
    return path


def map_token(token, workspace):
    mapped = server_path(token, workspace)
    if mapped != token:
        return mapped
    for prefix in ("-isystem", "-idirafter", "-iquote", "-isysroot",
                   "-include", "-imacros", "-I", "-F"):
        if token.startswith(prefix):
            return prefix + server_path(token[len(prefix):], workspace)
    if "=" in token:
        key, value = token.split("=", 1)
        quote = '"' if value.startswith('"') and value.endswith('"') else ""
        bare = value[1:-1] if quote else value
        return key + "=" + quote + server_path(bare, workspace) + quote
    return token


def expand_response(tokens, directory, stack=()):
    result = []
    for token in tokens:
        if not token.startswith("@"):
            result.append(token)
            continue
        path = (Path(directory) / token[1:]).resolve()
        if path in stack or len(stack) >= 16:
            raise ValueError("Cyclic/deep response file: " + str(path))
        result.extend(expand_response(shlex.split(path.read_text()),
                                      directory, stack + (path,)))
    return result


@functools.lru_cache(maxsize=8)
def clangd_version(binary):
    return subprocess.run([str(binary), "--version"], check=True,
                          capture_output=True, text=True, timeout=30).stdout.strip()


def namespace_command(workspace, command, cache=None):
    bwrap = shutil.which("bwrap")
    if not bwrap:
        raise RuntimeError("Portable index requires bubblewrap (bwrap); no native rebuild fallback")
    root = str(Path(workspace).resolve())
    args = [bwrap, "--die-with-parent", "--ro-bind", "/", "/",
            "--tmpfs", "/tmp", "--bind", root, VIRTUAL_ROOT,
            "--proc", "/proc", "--dev-bind", "/dev", "/dev",
            "--chdir", VIRTUAL_ROOT]
    if cache:
        args += ["--setenv", "XDG_CACHE_HOME", server_path(cache, root)]
    return args + ["--"] + list(command)


def prepare(workspace, source_cdb, artifact, clangd, product):
    """Create a canonical CDB and a not-yet-published artifact manifest."""
    root, artifact = Path(workspace).resolve(), Path(artifact).resolve()
    artifact.relative_to(root)  # everything needed must travel with the workspace
    subprocess.run(namespace_command(root, ["/usr/bin/true"]),
                   check=True, timeout=15)
    artifact.mkdir(parents=True, exist_ok=True)
    cdb = artifact / "compile_commands.json"
    version = clangd_version(str(clangd))
    previous = artifact / MANIFEST
    if previous.exists():
        old = json.loads(previous.read_text())
        if (old.get("virtual_root") != VIRTUAL_ROOT or old.get("product") != product
                or old.get("clangd_version") != version or old.get("format") != FORMAT):
            raise RuntimeError("Portable artifact identity changed; use a separate artifact directory")
    fd, temporary = tempfile.mkstemp(prefix="cdb-", suffix=".json", dir=artifact)
    count, warmup = 0, None
    try:
        with os.fdopen(fd, "w", encoding="utf-8") as output:
            output.write("[\n")
            for entry in entries(source_cdb):
                directory = Path(entry["directory"])
                if not directory.is_absolute():
                    raise ValueError("CDB directory must be absolute: " + str(directory))
                directory = directory.resolve()
                directory.relative_to(root)
                source = (directory / entry["file"]).resolve()
                source.relative_to(root)
                tokens = entry.get("arguments") or shlex.split(entry["command"])
                tokens = expand_response(tokens, directory)
                record = {"directory": server_path(directory, root),
                          "file": server_path(source, root),
                          "arguments": [map_token(t, root) for t in tokens]}
                if entry.get("output"):
                    record["output"] = map_token(entry["output"], root)
                if count:
                    output.write(",\n")
                json.dump(record, output, ensure_ascii=False)
                count += 1
                if warmup is None and source.is_file() and source.suffix in (
                        ".c", ".cc", ".cpp", ".cxx", ".m", ".mm"):
                    warmup = source.relative_to(root).as_posix()
            output.write("\n]\n")
        if not count or warmup is None:
            raise ValueError("Portable CDB has no existing source translation unit")
        os.replace(temporary, cdb)
    finally:
        if os.path.exists(temporary):
            os.unlink(temporary)
    manifest = {"format": FORMAT, "virtual_root": VIRTUAL_ROOT,
                "product": product, "clangd_version": version,
                "cdb_sha256": digest(cdb), "translation_units": count,
                "warmup": warmup, "status": "building",
                "snapshot_id": os.environ.get("LSP_SNAPSHOT_ID", "")}
    atomic_json(previous, manifest)
    return artifact


def finish(artifact, success):
    path = Path(artifact) / MANIFEST
    manifest = json.loads(path.read_text())
    manifest["status"] = "complete" if success else "incomplete"
    atomic_json(path, manifest)


def validate(workspace, cdb_dir, clangd, building=False):
    directory = Path(cdb_dir).resolve()
    path = directory / MANIFEST
    if not path.is_file():
        return None
    manifest = json.loads(path.read_text())
    if manifest.get("format") != FORMAT or manifest.get("virtual_root") != VIRTUAL_ROOT:
        raise RuntimeError("Unsupported portable index format/root")
    if manifest.get("status") != "complete" and not building:
        raise RuntimeError("Portable index is not complete; refusing silent local rebuilding")
    if manifest.get("clangd_version") != clangd_version(str(clangd)):
        raise RuntimeError("clangd version differs from the portable index producer")
    if manifest.get("cdb_sha256") != digest(directory / "compile_commands.json"):
        raise RuntimeError("Portable CDB checksum mismatch")
    directory.relative_to(Path(workspace).resolve())
    product = Path(manifest["product"])
    if product.is_absolute() or ".." in product.parts:
        raise RuntimeError("Invalid portable product identity")
    directory.relative_to(Path(workspace).resolve() / product)
    warmup = (Path(workspace) / manifest["warmup"]).resolve()
    warmup.relative_to(Path(workspace).resolve())
    if not warmup.is_file():
        raise RuntimeError("Portable source/generated files are missing: " + str(warmup))
    if not building and not any((directory / ".cache/clangd/index").glob("*.idx")):
        raise RuntimeError("Portable shard files are missing; refusing full local rebuilding")
    return manifest


def launch_command(workspace, clangd, arguments, building=False):
    """Return argv for the native or namespace-isolated clangd process."""
    clangd = str(Path(shutil.which(str(clangd)) or clangd).resolve())
    args = list(arguments)
    directory = None
    for i, arg in enumerate(args):
        if arg.startswith("--compile-commands-dir="):
            directory = arg.split("=", 1)[1]
        elif arg == "--compile-commands-dir" and i + 1 < len(args):
            directory = args[i + 1]
    if not directory:
        raise ValueError("--compile-commands-dir is required")
    directory = Path(directory).resolve()
    # Worker slices have their own CDB; the manifest lives next to the full CDB.
    artifact = os.environ.get("LSP_PORTABLE_ARTIFACT")
    manifest_dir = Path(artifact) if building and artifact else directory
    manifest = validate(workspace, manifest_dir, clangd, building)
    if manifest is None:
        first = next(entries(directory / "compile_commands.json"), None)
        if first:
            try:
                Path(first["directory"]).resolve().relative_to(Path(workspace).resolve())
            except ValueError:
                raise RuntimeError("Foreign-path native CDB: rebuild a portable baseline first")
        return [str(clangd)] + args
    mapped = [map_token(a, workspace) for a in args]
    mapped.append("--path-mappings=" + str(Path(workspace).resolve()) + "=" + VIRTUAL_ROOT)
    command = [server_path(clangd, workspace)] + mapped
    return namespace_command(workspace, command, cache=directory / ".cache/user")


def tree_cpu_jiffies(pid):
    """Include bubblewrap's clangd child, not just the waiting launcher."""
    stat = Path("/proc") / str(pid)
    fields = (stat / "stat").read_text().rsplit(")", 1)[1].split()
    total = int(fields[11]) + int(fields[12])
    try:
        children = (stat / "task" / str(pid) / "children").read_text().split()
        for child in children:
            try:
                total += tree_cpu_jiffies(int(child))
            except (FileNotFoundError, ProcessLookupError):
                pass
    except FileNotFoundError:
        pass
    return total
