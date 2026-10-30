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

"""Launch clangd with private portable paths and per-workspace lifecycle.

Portable artifacts use a fixed root inside a bubblewrap mount namespace.
Native artifacts are accepted only in their original local workspace.
No global symlinks are created and no consumer CDB is rewritten. Pipeline
artifacts must be regenerated once before they can be moved between roots.
"""

import hashlib
import os
import shutil
import sys
import tempfile
import time
from portable_index import launch_command

MCP_MARKER = "lsp/mcp/dist/index.js"


def log(msg):
    sys.stderr.write("[clangd_wrapper] " + msg + "\n")
    sys.stderr.flush()


def find_clangd(here):
    candidate = os.environ.get("LSP_CLANGD_BIN")
    if not candidate:
        candidate = os.path.join(here, "clangd", "bin", "clangd")
    if os.path.isfile(candidate) and os.access(candidate, os.X_OK):
        return candidate
    return shutil.which("clangd")


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
    root = os.path.normpath(os.path.join(here, "..", "..", "..", "..", ".."))
    # Paths in a portable CDB belong to a private mount namespace. Never bind
    # a pipeline path globally or rewrite the consumer's CDB as a fallback.
    command = launch_command(root, clangd, argv)
    reap_previous_clangd(root)
    write_pidfile(root)
    os.execv(command[0], command)


if __name__ == "__main__":
    main()
