#!/usr/bin/env python3
# -*- coding: utf-8 -*-

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
#

"""Build the clangd background index (.idx shards) for an OpenHarmony build.

Invoked by oskm_collect.py in the postTargetCompilation phase, or standalone:

    python3 build_index.py -i out/rk3568 [options]

Flow:
  1. resolve source root (from this script's location) and the out dir
  2. locate clangd (LSP_CLANGD_BIN > bundled clangd/ > PATH > OHOS prebuilts)
  3. verify compile_commands.json exists in the out dir
  4. apply the musl stddef nullptr_t patch (C++ parse quality)
  5. ensure a .clangd config exists at the source root (libcxx include path)
  6. stream-partition the compile database; run N clangd instances in
     parallel, all writing shards into one index dir (atomic temp+rename)
  7. clean up the slice work dirs, keeping the small instance logs
  8. print a summary

The index lands in <out_dir>/.cache/clangd/index and is fully incremental:
existing shards whose source files are unchanged are validated and skipped.
"""

import argparse
import glob
import json
import os
import re
import shutil
import subprocess
import sys
import time
import zlib

HERE = os.path.dirname(os.path.abspath(__file__))
TOOLS_DIR = os.path.join(HERE, "..", "..", "..", "..", "..")  # -> source root


def find_root():
    """Locate the OHOS source root above this script.

    The script lives at <root>/developtools/integration_verification/tools/
    oskm/lsp/, so the root is five levels up. Verify with several layout
    markers so the check survives renames of any single entry file.
    """
    root = os.path.normpath(TOOLS_DIR)
    markers = [
        os.path.isfile(os.path.join(root, "build.sh")),
        os.path.isfile(os.path.join(root, "build.py")),
        os.path.isdir(os.path.join(root, "developtools"))
        and os.path.isdir(os.path.join(root, "prebuilts")),
    ]
    if not any(markers):
        return None
    return root


def find_clangd(root):
    candidates = []
    env = os.environ.get("LSP_CLANGD_BIN")
    if env:
        candidates.append(env)
    bundled = os.path.join(HERE, "clangd", "bin", "clangd")
    if os.path.isfile(bundled):
        candidates.append(bundled)
    found = shutil.which("clangd")
    if found:
        candidates.append(found)
    prebuilt = glob.glob(os.path.join(
        root, "prebuilts", "clang", "ohos", "*", "llvm", "bin", "clangd"))
    candidates.extend(prebuilt)
    for cand in candidates:
        if _is_executable_binary(cand):
            return cand
    return None


def _is_executable_binary(path):
    """Check that a path is a real executable binary, not an LFS pointer."""
    if not os.path.isfile(path) or not os.access(path, os.X_OK):
        return False
    try:
        with open(path, "rb") as f:
            magic = f.read(4)
    except OSError:
        return False
    # ELF magic: \x7fELF; also allow "#!/usr/bin/env" scripts
    return magic == b"\x7fELF" or magic.startswith(b"#!")


def clangd_version(clangd_bin):
    try:
        out = subprocess.run([clangd_bin, "--version"], capture_output=True,
                             text=True, timeout=30).stdout
        m = re.search(r"clangd version (\d+)", out)
        return int(m.group(1)) if m else 0
    except Exception:
        return 0


def ensure_clangd_config(root):
    """Write a .clangd at the source root if none exists.

    The libcxx-ohos include path is not part of the compile commands (the
    OHOS clang driver adds it implicitly), so clangd needs it via config.
    Paths are absolute as computed on this build machine; the generated
    index is path-bound anyway.
    """
    path = os.path.join(root, ".clangd")
    if os.path.exists(path):
        return "exists (left untouched)"
    libcxx = glob.glob(os.path.join(
        root, "prebuilts", "clang", "ohos", "*", "llvm", "include",
        "libcxx-ohos", "include", "c++", "v1"))
    if not libcxx:
        return "SKIPPED (libcxx-ohos not found; C++ indexing may degrade)"
    content = (
        "Index:\n"
        "  Background: Build\n"
        "  StandardLibrary: Yes\n"
        "\n"
        "CompileFlags:\n"
        "  Add:\n"
        "    - -Wno-unknown-warning-option\n"
        "    - -Wno-unknown-attributes\n"
        "    - -isystem\n"
        "    - %s\n"
        "  Remove:\n"
        "    - -enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang\n"
        "\n"
        "Diagnostics:\n"
        "  ClangTidy:\n"
        '    Checks: "-*"\n'
        "  UnusedIncludes: None\n"
        "  MissingIncludes: None\n"
    ) % libcxx[0]
    with open(path, "w", encoding="utf-8") as f:
        f.write(content)
    return "generated"


def mem_available_gb():
    try:
        with open("/proc/meminfo") as f:
            for line in f:
                if line.startswith("MemAvailable:"):
                    return int(line.split()[1]) / (1 << 20)
    except OSError:
        pass
    return 16.0


def partition_cdb(cdb_path, n, work_dir, index_dir):
    """Split compile_commands.json into n slice files.

    Fast path loads the whole CDB with json (needs roughly 5x file size of
    RAM); the streaming fallback is memory-flat but slow and is only used
    when RAM is tight. Entries are routed by crc32 of the "file" field so
    all entries of one source file land in one slice.
    Returns ([(slice_cdb, kickoff_abs_path, entry_count), ...], total).
    """
    size_gb = os.path.getsize(cdb_path) / (1 << 30)
    use_json = mem_available_gb() > size_gb * 6 + 4
    for i in range(n):
        os.makedirs(os.path.join(work_dir, str(i), ".cache", "clangd"),
                    exist_ok=True)
        link = os.path.join(work_dir, str(i), ".cache", "clangd", "index")
        if not os.path.lexists(link):
            os.symlink(index_dir, link)

    if use_json:
        with open(cdb_path, "r", encoding="utf-8") as f:
            entries = json.load(f)
        groups = [[] for _ in range(n)]
        for e in entries:
            groups[zlib.crc32(e["file"].encode("utf-8")) % n].append(e)
        result = []
        for i, group in enumerate(groups):
            cdb = os.path.join(work_dir, str(i), "compile_commands.json")
            with open(cdb, "w", encoding="utf-8") as f:
                json.dump(group, f)
            first = None
            if group:
                first = os.path.normpath(os.path.join(
                    group[0]["directory"], group[0]["file"]))
            result.append((cdb, first, len(group)))
        return result, len(entries)

    # Streaming fallback: memory-flat, char-by-char state machine.
    slices = []
    for i in range(n):
        cdb = os.path.join(work_dir, str(i), "compile_commands.json")
        slices.append({"fh": open(cdb, "w", encoding="utf-8"),
                       "cdb": cdb, "count": 0, "first": None})
    for s in slices:
        s["fh"].write("[")
    in_string = escape = False
    depth = 0
    entry = []
    total = 0
    with open(cdb_path, "r", encoding="utf-8") as f:
        while True:
            chunk = f.read(1 << 22)
            if not chunk:
                break
            for ch in chunk:
                if depth == 0:
                    if ch == "{":
                        depth = 1
                        entry = ["{"]
                    continue
                entry.append(ch)
                if in_string:
                    if escape:
                        escape = False
                    elif ch == "\\":
                        escape = True
                    elif ch == '"':
                        in_string = False
                    continue
                if ch == '"':
                    in_string = True
                elif ch == "{":
                    depth += 1
                elif ch == "}":
                    depth -= 1
                    if depth == 0:
                        text = "".join(entry)
                        try:
                            obj = json.loads(text)
                        except ValueError:
                            obj = {}
                        key = obj.get("file", "")
                        idx = zlib.crc32(key.encode("utf-8")) % n if key else 0
                        s = slices[idx]
                        if s["count"] > 0:
                            s["fh"].write(", ")
                        s["fh"].write(text)
                        s["count"] += 1
                        if s["first"] is None and key:
                            s["first"] = os.path.normpath(os.path.join(
                                obj.get("directory", ""), key))
                        total += 1
    result = []
    for s in slices:
        s["fh"].write("]")
        s["fh"].close()
        result.append((s["cdb"], s["first"], s["count"]))
    return result, total


def ensure_mcp_config(root, out_dir, clangd_bin, kickoff=None):
    """Generate the consumer-side MCP config and symlink it to the root.

    Writes oskm/lsp/lsp-mcp.json from the actual build parameters (product
    out dir, the very clangd that built the index, a real kickoff file from
    the CDB), then symlinks <root>/.lsp-mcp.json to it so consumers need no
    manual setup. All paths are relative to the source root: the root config
    is only discovered when the MCP is launched from the source root, so
    relative paths are always self-consistent and the whole tree stays
    relocatable. An existing regular file at the root is left untouched
    (user-managed). Returns a status string.
    """
    here_rel = os.path.relpath(HERE, root)
    config_path = os.path.join(HERE, "lsp-mcp.json")
    clangd_rel = os.path.relpath(clangd_bin, root)
    out_rel = os.path.relpath(out_dir, root)
    warmup_rel = None
    if kickoff and os.path.isfile(kickoff):
        warmup_rel = os.path.relpath(kickoff, root)
    config = {
        "servers": [{
            "id": "cpp",
            "extensions": [".c", ".h", ".cpp", ".hpp", ".cc", ".hh",
                           ".cxx", ".hxx", ".c++", ".h++"],
            "languageIds": ["c", "cpp"],
            "command": clangd_rel,
            "args": [
                "--background-index",
                "--compile-commands-dir=" + out_rel,
                "-j=32",
                "--pch-storage=memory",
                "--limit-references=0",
                "--limit-results=0",
            ],
            "rootPatterns": [".clangd", "compile_commands.json"],
            "warmup": warmup_rel,
        }],
        "requestTimeout": 600000,
        "autoStart": True,
        "idleTimeout": 28800000,
        "logLevel": "info",
    }
    server = config["servers"][0]
    if not server["warmup"]:
        del server["warmup"]
    with open(config_path, "w", encoding="utf-8") as f:
        json.dump(config, f, indent=2, ensure_ascii=False)
        f.write("\n")

    link = os.path.join(root, ".lsp-mcp.json")
    target_rel = os.path.join(here_rel, "lsp-mcp.json")
    if os.path.islink(link):
        os.unlink(link)
        os.symlink(target_rel, link)
        return "symlink refreshed -> {}".format(target_rel)
    if os.path.exists(link):
        return "generated {} but root .lsp-mcp.json exists (left untouched)".format(
            target_rel)
    os.symlink(target_rel, link)
    return "symlinked <root>/.lsp-mcp.json -> {}".format(target_rel)


def ensure_cdb(out_dir, root):
    """Return (cdb_path, status); generate the CDB if it is missing.

    The normal path is the compile_commands.json produced by the OHOS build
    itself. When absent (e.g. a build variant that skips it), fall back to
    ``ninja -w dupbuild=warn -t compdb`` — the warning flag tolerates the
    duplicate build targets common in OHOS builds (phony stamp aliases) so
    ninja still emits a full, exact CDB. If ninja fails for any other
    reason, fall back to a custom parser that reads .ninja files directly
    and extracts compile commands.
    """
    cdb = os.path.join(out_dir, "compile_commands.json")
    if os.path.isfile(cdb):
        return cdb, "exists"
    build_ninja = os.path.join(out_dir, "build.ninja")
    if not os.path.isfile(build_ninja):
        return None, "missing and no build.ninja to generate from"
    ninja = shutil.which("ninja")
    if not ninja:
        cand = glob.glob(os.path.join(root, "prebuilts", "build-tools",
                                       "*", "bin", "ninja"))
        ninja = cand[0] if cand else None
    if not ninja:
        return None, "missing and ninja not found"
    rules = ["cxx", "cc", "objc", "objcxx", "asm"]
    tmp = cdb + ".gen-tmp"
    with open(tmp, "w", encoding="utf-8") as f:
        rc = subprocess.run(
            [ninja, "-C", out_dir, "-w", "dupbuild=warn",
             "-t", "compdb"] + rules,
            stdout=f, stderr=subprocess.DEVNULL).returncode
    if rc == 0 and os.path.isfile(tmp) and os.path.getsize(tmp) >= 1024:
        os.replace(tmp, cdb)
        return cdb, "generated via ninja -t compdb"
    if os.path.isfile(tmp):
        os.remove(tmp)
    print("[lsp] ninja -t compdb failed (exit {}), "
          "falling back to direct .ninja parser".format(rc))
    entries = _parse_ninja_compile_commands(out_dir, rules)
    if not entries:
        return None, "generation failed (ninja error + parser found nothing)"
    with open(tmp, "w", encoding="utf-8") as f:
        json.dump(entries, f)
    if os.path.getsize(tmp) < 1024:
        os.remove(tmp)
        return None, "parser output too small"
    os.replace(tmp, cdb)
    return cdb, "generated via direct .ninja parser ({} " \
           "entries)".format(len(entries))


def _parse_ninja_compile_commands(out_dir, rules):
    """Parse .ninja files directly to extract compile commands.

    Reads build.ninja, toolchain.ninja and all obj/*.ninja subninja files,
    finds ``build X.o: cxx source.cpp`` edges, and converts each into a
    compile_commands.json entry. Duplicate outputs are skipped (first wins).
    """
    rule_set = set(rules)
    entries = []
    seen = set()
    ninja_files = [os.path.join(out_dir, "build.ninja"),
                   os.path.join(out_dir, "toolchain.ninja")]
    ninja_files += glob.glob(os.path.join(out_dir, "obj", "**",
                                          "*.ninja"), recursive=True)
    for nf_path in ninja_files:
        if not os.path.isfile(nf_path):
            continue
        try:
            with open(nf_path, encoding="utf-8",
                      errors="replace") as f:
                lines = f.readlines()
        except OSError:
            continue
        for line in lines:
            stripped = line.strip()
            m = re.match(r'^build (\S+\.o): (\S+) (.+)$', stripped)
            if not m or m.group(2) not in rule_set:
                continue
            output = m.group(1)
            if output in seen:
                continue
            seen.add(output)
            rest = m.group(3)
            rest = re.split(r'\s*\|\|?\s*', rest)[0].strip()
            src_m = re.search(
                r'(\S+\.(?:c|cc|cpp|cxx|s|S|m|mm))\s*$', rest)
            if not src_m:
                continue
            src = src_m.group(1)
            if not src.startswith('/'):
                src = os.path.normpath(
                    os.path.join(out_dir, src))
            entries.append({
                "directory": out_dir,
                "file": src,
                "output": output,
                "command": stripped,
            })
    return entries


def _report_revert(results):
    print("[lsp] musl fix reverted: {}".format(
        ", ".join("{}: {}".format(os.path.basename(os.path.dirname(p)), s)
                  for p, s in results) or "no musl sysroot found"))


def main():
    parser = argparse.ArgumentParser(
        description="Build the clangd background index for an OHOS build.")
    parser.add_argument("-i", "--input", required=True,
                        help="build output directory, e.g. out/rk3568")
    parser.add_argument("--instances", type=int, default=0,
                        help="parallel clangd instances (0 = auto)")
    parser.add_argument("--jobs-per-instance", type=int, default=0,
                        help="clangd workers per instance (0 = auto)")
    parser.add_argument("--timeout-hours", type=float, default=0,
                        help="abort after N hours (0 = unlimited; "
                             "partial progress is kept and resumed next run)")
    parser.add_argument("--dry-run", action="store_true",
                        help="print the plan and checks without building")
    args = parser.parse_args()

    root = find_root()
    if not root:
        print("[lsp] cannot locate source root from {}".format(HERE))
        return 1
    out_dir = os.path.abspath(args.input)
    if not os.path.isdir(out_dir):
        candidate = os.path.normpath(os.path.join(root, args.input))
        if os.path.isdir(candidate):
            out_dir = candidate

    if args.dry_run:
        cdb = os.path.join(out_dir, "compile_commands.json")
        cdb_note = ("exists" if os.path.isfile(cdb)
                    else "absent -> would generate via ninja -t compdb")
        clangd_bin = find_clangd(root)
        ver = clangd_version(clangd_bin) if clangd_bin else 0
        print("[lsp] root: {}".format(root))
        print("[lsp] out:  {}".format(out_dir))
        print("[lsp] cdb:  {}".format(cdb_note))
        print("[lsp] clangd: {} (version {})".format(clangd_bin, ver or "?"))
        print("[lsp] (dry-run) would launch instances and generate mcp config")
        return 0

    cdb, cdb_status = ensure_cdb(out_dir, root)
    if not cdb:
        print("[lsp] compile_commands.json unavailable: {}".format(cdb_status))
        return 1
    index_dir = os.path.join(out_dir, ".cache", "clangd", "index")
    os.makedirs(index_dir, exist_ok=True)
    print("[lsp] cdb: {}".format(cdb_status))

    clangd_bin = find_clangd(root)
    if not clangd_bin:
        print("[lsp] no clangd found (set LSP_CLANGD_BIN, bundle one at "
              "oskm/lsp/clangd/, or install clangd >= 20 in PATH)")
        return 1
    ver = clangd_version(clangd_bin)
    ver_note = ""
    if ver and ver < 20:
        ver_note = ("WARNING: clangd {} < 20: outgoingCalls unsupported, "
                    "C++ index quality degraded".format(ver))

    cpu = os.cpu_count() or 8
    instances = args.instances or (4 if cpu >= 48 else 2 if cpu >= 24 else 1)
    # 内存紧张时退回单实例（无需切分 CDB）
    cdb_gb = os.path.getsize(cdb) / (1 << 30)
    if instances > 1 and mem_available_gb() < cdb_gb * 6 + 4:
        print("[lsp] low free RAM; falling back to 1 instance (no CDB slice)")
        instances = 1
    jobs = args.jobs_per_instance or max(1, min(60, cpu // instances))

    from apply_musl_fix import apply_musl_fix, revert_musl_fix
    musl_results = apply_musl_fix(out_dir)
    clangd_cfg = ensure_clangd_config(root)

    print("[lsp] root: {}".format(root))
    print("[lsp] out:  {}".format(out_dir))
    print("[lsp] clangd: {} (version {})".format(clangd_bin, ver or "?"))
    if ver_note:
        print("[lsp] " + ver_note)
    print("[lsp] instances={} jobs/instance={}".format(instances, jobs))
    print("[lsp] musl fix: {}".format(
        ", ".join("{}: {}".format(os.path.basename(os.path.dirname(p)), s)
                  for p, s in musl_results) or "no musl sysroot found"))
    print("[lsp] .clangd: {}".format(clangd_cfg))
    print("[lsp] index: {}".format(index_dir))

    work_dir = os.path.join(out_dir, ".clangd-lsp-work")
    os.makedirs(work_dir, exist_ok=True)
    t0 = time.time()
    if instances == 1:
        slices = [(cdb, None, -1)]
        kickoffs = []
        with open(cdb, "r", encoding="utf-8") as f:
            head = f.read(1 << 20)
        m = re.search(r'"file":\s*"([^"]+)"', head)
        dirm = re.search(r'"directory":\s*"([^"]+)"', head)
        if m and dirm:
            kickoffs.append(os.path.normpath(
                os.path.join(dirm.group(1), m.group(1))))
    else:
        slices, total = partition_cdb(cdb, instances, work_dir, index_dir)
        kickoffs = [s[1] for s in slices]
        print("[lsp] CDB partitioned: {} entries -> {} slices".format(
            total, instances))
    if not kickoffs or not kickoffs[0]:
        with open(cdb, "r", encoding="utf-8") as f:
            head = f.read(1 << 20)
        m = re.search(r'"file":\s*"([^"]+)"', head)
        dirm = re.search(r'"directory":\s*"([^"]+)"', head)
        if m and dirm:
            kickoffs = [os.path.normpath(os.path.join(dirm.group(1),
                                                      m.group(1)))]
    if not kickoffs or not kickoffs[0]:
        print("[lsp] cannot determine a kickoff file from the CDB")
        _report_revert(revert_musl_fix(out_dir))
        return 1
    kickoffs = [k or kickoffs[0] for k in kickoffs]

    procs = []
    for i in range(instances):
        cdb_dir = os.path.dirname(slices[i][0])
        env = dict(os.environ,
                   OH_ROOT=root,
                   CDB_DIR=cdb_dir,
                   CLANGD_BIN=clangd_bin,
                   CLANGD_JOBS=str(jobs),
                   KICKOFF_FILE=kickoffs[i] if instances > 1 else kickoffs[0])
        log = open(os.path.join(work_dir, "instance-{}.log".format(i)), "w")
        procs.append(subprocess.Popen(
            [sys.executable, os.path.join(HERE, "clangd_tools.py"), "warm", "60"],
            cwd=root, env=env, stdout=log, stderr=subprocess.STDOUT))
        print("[lsp] instance {} started (cdb slice: {}, log: {}/instance-{}.log)"
              .format(i, cdb_dir, work_dir, i))

    deadline = time.time() + args.timeout_hours * 3600 if args.timeout_hours else 0
    try:
        for i, p in enumerate(procs):
            remaining = None
            if deadline:
                remaining = max(1, int(deadline - time.time()))
            try:
                p.wait(timeout=remaining)
            except subprocess.TimeoutExpired:
                print("[lsp] timeout reached; terminating instances "
                      "(progress kept, resumed next run)")
                for q in procs:
                    q.terminate()
                break
    finally:
        for p in procs:
            if p.poll() is None:
                p.terminate()

    if instances > 1:
        for i in range(instances):
            shutil.rmtree(os.path.join(work_dir, str(i)), ignore_errors=True)
        print("[lsp] work slices cleaned (instance logs kept: {})"
              .format(work_dir))

    import glob as _glob
    shards = len(_glob.glob(os.path.join(index_dir, "*.idx")))
    print("[lsp] done in {:.0f}s: {} shards in {}".format(
        time.time() - t0, shards, index_dir))

    mcp_status = ensure_mcp_config(root, out_dir, clangd_bin,
                                    kickoff=kickoffs[0])
    print("[lsp] mcp config: {}".format(mcp_status))
    _report_revert(revert_musl_fix(out_dir))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
