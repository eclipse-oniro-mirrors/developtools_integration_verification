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

"""clangd launcher that binds the pipeline-built index to this workspace.

build_index.py records the build host's absolute paths in the shipped
compile_commands.json, and the shard cache under out/<product>/.cache/clangd
is keyed by those same paths. clangd loads the prebuilt index as-is (and
performs no rebuilding, because the recorded file digests still match) only
when the recorded paths resolve locally.

Referenced as the server "command" in lsp-mcp.json, this wrapper runs
before clangd starts and — ONLY when the shipped shard cache actually
contains index files — makes the recorded build root point at this
workspace with a single symlink:

    <build_root>  (e.g. /mnt/disk/workspace/preheat_code_prod/code)
        -> <local workspace root>  (the directory the MCP launched from)

Without an index to load the wrapper does not bind: a reachable build path
with an empty shard cache would make clangd rebuild the whole index from
source, which is exactly what the pipeline-built index exists to avoid.
If the index disappears while the binding exists — deleted on purpose to
rebuild locally, or not yet synced — the symlink is removed again so
clangd never silently rebuilds through it; the binding comes back as soon
as the pipeline index is synced back.

The wrapper never modifies compile_commands.json and never touches the
shard cache. If the symlink cannot be created (permission denied, read-only
mount) or is owned by another live workspace, clangd starts unchanged.

It also enforces one clangd per workspace: a stdio LSP server cannot be
shared between sessions, so restarts are made single-copy. An orphaned
previous server (its MCP gone) is reaped directly; a whole orphaned
MCP chain (its opencode exited without signaling, leaving a warm index
nobody can reuse) is stopped through the MCP so the cleanup is graceful
and triggers no crash-restart. Servers owned by live sessions are left
alone.
"""

import hashlib
import json
import os
import re
import shutil
import sys
import tempfile
import time

DIR_RE = re.compile(rb'"directory"\s*:\s*"((?:[^"\\]|\\.)*)"')
MCP_MARKER = "lsp/mcp/dist/index.js"


def log(msg):
    sys.stderr.write("[clangd_wrapper] " + msg + "\n")
    sys.stderr.flush()


def parse_compile_commands_dir(argv):
    for i, arg in enumerate(argv):
        if arg.startswith("--compile-commands-dir="):
            return arg.split("=", 1)[1]
        if arg == "--compile-commands-dir" and i + 1 < len(argv):
            return argv[i + 1]
    return None


def find_clangd(here):
    candidate = os.environ.get("LSP_CLANGD_BIN")
    if not candidate:
        candidate = os.path.join(here, "clangd", "bin", "clangd")
    if os.path.isfile(candidate) and os.access(candidate, os.X_OK):
        return candidate
    return shutil.which("clangd")


def peek_first_directory(path):
    try:
        with open(path, "rb") as f:
            head = f.read(512 << 10)
    except OSError:
        return None
    match = DIR_RE.search(head)
    if not match:
        return None
    try:
        return json.loads(b'"' + match.group(1) + b'"')
    except ValueError:
        return None


def shard_cache_present(cdb_dir):
    index = os.path.join(cdb_dir, ".cache", "clangd", "index")
    try:
        return any(name.endswith(".idx") for name in os.listdir(index))
    except OSError:
        return False


def bind_build_root(build_root, root):
    """Symlink build_root -> root. Returns True if build_root resolves."""
    if os.path.isdir(build_root):
        target = os.path.realpath(build_root)
        if target != os.path.realpath(root):
            log("{} already resolves to another live workspace ({}); "
                "leaving it alone".format(build_root, target))
            return False
        return True
    if os.path.exists(build_root):
        log("{} exists but is not a directory; leaving it alone".format(
            build_root))
        return False
    if os.path.islink(build_root):
        old = os.readlink(build_root)
        log("re-pointing {} -> {} (previous target {} is gone)".format(
            build_root, root, old))
        try:
            os.unlink(build_root)
        except OSError as exc:
            log("cannot remove the stale link ({}); leaving it alone".format(
                exc))
            return False
    parent = os.path.dirname(build_root)
    try:
        if parent and not os.path.isdir(parent):
            os.makedirs(parent, exist_ok=True)
        os.symlink(root, build_root)
        log("symlinked {} -> {}; the pipeline index will load as-is".format(
            build_root, root))
        return True
    except FileExistsError:
        return bind_build_root(build_root, root)
    except OSError as exc:
        log("cannot create symlink {} -> {} ({}); clangd will start "
            "without the pipeline index".format(build_root, root, exc))
        return False


def drop_empty_binding(build_root, root, cdb_dir):
    """Remove our symlink when the shard cache has gone empty.

    An empty shard cache at this point means the index was deleted —
    usually on purpose, to rebuild locally with consistent local paths —
    or has not been synced yet. Keeping the binding would let clangd
    silently rebuild the whole index through the symlink, so drop it and
    let the intended local flow take over; the binding is re-created
    automatically once the pipeline index is back.
    """
    index = os.path.join(cdb_dir, ".cache", "clangd", "index")
    if build_root is None:
        log("shard cache {} is empty; clangd will index from source".format(
            index))
        return
    if os.path.islink(build_root) and \
            os.path.realpath(build_root) == os.path.realpath(root):
        try:
            os.unlink(build_root)
            log("shard cache {} is empty; removed the binding {} -> {} "
                "(it comes back once the index is synced again)".format(
                    index, build_root, root))
        except OSError as exc:
            log("shard cache {} is empty but cannot remove the binding "
                "{}: {}".format(index, build_root, exc))
        return
    log("shard cache {} is empty; clangd will index from source (sync the "
        "pipeline index to load instead)".format(index))


def ensure_index_binding(cdb, cdb_dir, root, rel):
    build_dir = peek_first_directory(cdb)
    if build_dir is None:
        return
    has_index = shard_cache_present(cdb_dir)
    rel_norm = os.path.normpath(rel)
    suffix = os.sep + rel_norm
    layout = bool(rel_norm and rel_norm != "." and build_dir.endswith(suffix))
    build_root = build_dir[: -len(suffix)] if layout else None

    if os.path.isdir(build_dir):
        if os.path.realpath(build_dir) == os.path.realpath(cdb_dir):
            if not has_index:
                drop_empty_binding(build_root, root, cdb_dir)
        else:
            log("build path {} is bound to another live workspace ({}); "
                "leaving it alone".format(build_dir,
                                          os.path.realpath(build_dir)))
        return
    if not has_index:
        log("no shard cache under {}; not binding {} — a reachable build "
            "path with no index would make clangd rebuild everything".format(
                os.path.join(cdb_dir, ".cache", "clangd"), build_dir))
        return
    if build_root is None:
        log("CDB directory {} does not match the out-dir layout; "
            "nothing to bind".format(build_dir))
        return
    bind_build_root(build_root, root)


def pidfile_path(root):
    digest = hashlib.sha1(root.encode()).hexdigest()[:16]
    return os.path.join(tempfile.gettempdir(),
                        "clangd-wrapper-%s.pid" % digest)


def process_info(pid):
    try:
        with open("/proc/%d/cmdline" % pid, "rb") as f:
            cmdline = f.read().decode("utf-8", "replace")
        with open("/proc/%d/stat" % pid) as f:
            stat = f.read()
    except OSError:
        return None
    try:
        ppid = int(stat.rsplit(")", 1)[1].split()[1])
    except (IndexError, ValueError):
        return None
    return cmdline, ppid


def _stop_and_wait(pid, note):
    try:
        os.kill(pid, 15)
    except OSError as exc:
        log("cannot stop clangd pid {} ({})".format(pid, exc))
        return
    deadline = time.time() + 10
    while time.time() < deadline and process_info(pid) is not None:
        time.sleep(0.2)
    log(note)


def reap_previous_clangd(root):
    """Ensure a previous clangd for this workspace is not duplicated.

    A stdio LSP server cannot be shared between sessions, so a restart
    would silently load a second copy of the index into memory. Three
    cases, from simplest to most involved:

      * the previous clangd is gone: nothing to do
      * its MCP is gone too (clangd reparented to init): stop the
        orphaned clangd directly — nothing is watching it, so no
        crash-restart can trigger
      * its MCP still runs but is itself an orphan (the opencode that
        spawned it exited without signaling; the MCP lingers for its
        8h idle timeout holding the warm index nobody can reuse):
        SIGTERM that MCP first — its own shutdown handler then stops
        its clangd gracefully, the whole chain exits 0 and triggers no
        crash-restart; a leftover clangd is stopped directly after a
        short grace period

    A clangd owned by a live session is never touched.
    """
    try:
        with open(pidfile_path(root)) as f:
            pid = int(f.read().strip())
    except (OSError, ValueError):
        return
    if pid <= 1 or pid == os.getpid():
        return
    info = process_info(pid)
    if info is None:
        return
    cmdline, ppid = info
    if "clangd" not in cmdline or "--compile-commands-dir" not in cmdline:
        return
    if ppid == os.getppid():
        return
    if ppid == 1:
        _stop_and_wait(pid, "reaped orphaned clangd (pid {}) that was "
                       "still holding the index in memory".format(pid))
        return
    parent = process_info(ppid)
    if parent is not None and MCP_MARKER in parent[0] and parent[1] == 1:
        log("the previous index copy lives under an orphaned MCP "
            "(pid {}); stopping the whole chain".format(ppid))
        try:
            os.kill(ppid, 15)
        except OSError as exc:
            log("cannot stop the orphaned MCP pid {} ({})".format(
                ppid, exc))
            return
        deadline = time.time() + 15
        mcp_gone_at = None
        while time.time() < deadline:
            if process_info(pid) is None:
                log("reaped orphaned MCP chain (mcp pid {}, clangd pid "
                    "{}) that kept another copy of the index in "
                    "memory".format(ppid, pid))
                return
            if mcp_gone_at is None and process_info(ppid) is None:
                mcp_gone_at = time.time()
            if mcp_gone_at is not None and time.time() - mcp_gone_at > 3:
                _stop_and_wait(pid, "the orphaned MCP exited without "
                               "stopping its clangd; terminated the "
                               "leftover (pid {}) directly".format(pid))
                return
            time.sleep(0.2)
        _stop_and_wait(pid, "timed out waiting for the orphaned MCP "
                       "chain; terminated clangd (pid {}) "
                       "directly".format(pid))
        return
    log("a clangd for this workspace is already running (pid {}) under "
        "a live session; starting a second one will load another copy "
        "of the index into memory".format(pid))


def write_pidfile(root):
    try:
        with open(pidfile_path(root), "w") as f:
            f.write(str(os.getpid()))
    except OSError:
        pass


def main():
    argv = sys.argv[1:]
    here = os.path.dirname(os.path.realpath(__file__))
    clangd = find_clangd(here)
    if not clangd:
        log("no clangd found (set LSP_CLANGD_BIN); cannot start")
        sys.exit(1)
    root = os.getcwd()
    rel = parse_compile_commands_dir(argv)
    if rel:
        cdb_dir = os.path.normpath(os.path.join(root, rel))
        cdb = os.path.join(cdb_dir, "compile_commands.json")
        if os.path.isfile(cdb):
            ensure_index_binding(cdb, cdb_dir, root, rel)
    reap_previous_clangd(root)
    write_pidfile(root)
    os.execv(clangd, [clangd] + argv)


if __name__ == "__main__":
    main()
