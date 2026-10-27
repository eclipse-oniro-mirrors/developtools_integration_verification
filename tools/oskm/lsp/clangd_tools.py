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

"""Headless clangd driver used to build/query the OpenHarmony background index.

Portable edition: all machine-specific values come from the environment
(set by build_index.py or by hand); defaults are derived from this file's
location (developtools/integration_verification/tools/oskm/lsp/ -> source root).

Environment:
    CLANGD_BIN   clangd binary (>= 20 recommended for outgoingCalls)
    OH_ROOT      source root (default: derived from this file's location)
    CDB_DIR      directory containing compile_commands.json (required)
    CLANGD_JOBS  parallel workers per instance (default: cpu count, max 60)
    KICKOFF_FILE source file to open, triggering whole-CDB background indexing

Usage:
    python3 clangd_tools.py status
    python3 clangd_tools.py warm [--interval 60]
    python3 clangd_tools.py def|refs|callers|callees <file> <line> <col>
"""
import glob
import json
import os
import subprocess
import sys
import threading
import time

_HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.environ.get("OH_ROOT") or os.path.normpath(
    os.path.join(_HERE, "..", "..", "..", "..", ".."))
CDB_DIR = os.environ.get("CDB_DIR", "")
CLANGD = os.environ.get("CLANGD_BIN", "clangd")
JOBS = os.environ.get("CLANGD_JOBS") or str(min(os.cpu_count() or 8, 60))
PCH = os.environ.get("CLANGD_PCH", "memory")
if PCH not in ("memory", "disk"):
    PCH = "memory"
KICKOFF = os.environ.get("KICKOFF_FILE", "")
CACHE_DIRS = [
    os.path.join(CDB_DIR, ".cache", "clangd", "index"),
    os.path.join(ROOT, ".cache", "clangd", "index"),
]

SYMBOL_KIND = {
    1: "File", 2: "Module", 3: "Namespace", 4: "Package", 5: "Class",
    6: "Method", 7: "Property", 8: "Field", 9: "Constructor", 10: "Enum",
    11: "Interface", 12: "Function", 13: "Variable", 14: "Constant",
    15: "String", 16: "Number", 17: "Boolean", 18: "Array", 19: "Object",
    20: "Key", 21: "Null", 22: "EnumMember", 23: "Struct", 24: "Event",
    25: "Operator", 26: "TypeParameter",
}


def shard_count():
    return sum(len(glob.glob(os.path.join(d, "*.idx")))
               for d in CACHE_DIRS if os.path.isdir(d))


def proc_cpu_jiffies(pid):
    with open("/proc/%d/stat" % pid) as f:
        data = f.read()
    rest = data[data.rfind(")") + 2:].split()
    return int(rest[11]) + int(rest[12])


class Clangd:
    def __init__(self):
        if not CDB_DIR:
            sys.exit("CDB_DIR env is required (dir with compile_commands.json)")
        cmd = [
            CLANGD,
            "--background-index",
            "--background-index-priority=normal",
            "-j=" + JOBS,
            "--limit-results=0",
            "--limit-references=0",
            "--compile-commands-dir=" + CDB_DIR,
            "--pch-storage=" + PCH,
        ]
        self.proc = subprocess.Popen(
            cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE,
            stderr=subprocess.DEVNULL)
        self.next_id = 1
        self.responses = {}
        self.progress = []
        self.cv = threading.Condition()
        threading.Thread(target=self._reader, daemon=True).start()

    def _reader(self):
        while True:
            headers = {}
            while True:
                line = self.proc.stdout.readline()
                if not line:
                    return
                line = line.strip()
                if not line:
                    break
                k, _, v = line.partition(b":")
                headers[k.strip().lower()] = v.strip()
            n = int(headers.get(b"content-length", b"0"))
            body = b""
            while len(body) < n:
                chunk = self.proc.stdout.read(n - len(body))
                if not chunk:
                    return
                body += chunk
            msg = json.loads(body.decode("utf-8"))
            with self.cv:
                if "id" in msg:
                    self.responses[msg["id"]] = msg
                elif "method" in msg:
                    self.progress.append(msg)
                self.cv.notify_all()

    def request(self, method, params, timeout=3600):
        with self.cv:
            rid = self.next_id
            self.next_id += 1
        msg = {"jsonrpc": "2.0", "id": rid, "method": method, "params": params}
        data = json.dumps(msg).encode()
        self.proc.stdin.write(
            b"Content-Length: %d\r\n\r\n%s" % (len(data), data))
        self.proc.stdin.flush()
        deadline = time.time() + timeout
        with self.cv:
            while rid not in self.responses:
                left = deadline - time.time()
                if left <= 0:
                    raise TimeoutError(method)
                self.cv.wait(left)
            return self.responses.pop(rid)

    def notify(self, method, params):
        msg = {"jsonrpc": "2.0", "method": method, "params": params}
        data = json.dumps(msg).encode()
        self.proc.stdin.write(
            b"Content-Length: %d\r\n\r\n%s" % (len(data), data))
        self.proc.stdin.flush()

    def initialize(self):
        r = self.request("initialize", {
            "processId": os.getpid(),
            "rootUri": "file://" + ROOT,
            "capabilities": {
                "textDocument": {
                    "documentSymbol": {"hierarchicalDocumentSymbolSupport": True},
                    "callHierarchy": {"dynamicRegistration": False},
                    "synchronization": {"didSave": True},
                },
                "workspace": {"symbol": {"dynamicRegistration": False}},
                "window": {"workDoneProgress": True},
            },
        })
        self.notify("initialized", {})
        return r

    def latest_progress(self):
        with self.cv:
            return list(self.progress[-3:])


def open_doc(c, path):
    path = os.path.abspath(path)
    with open(path, "rb") as f:
        text = f.read().decode("utf-8", "replace")
    if path.endswith(".c"):
        lang = "c"
    else:
        lang = "cpp"
    c.notify("textDocument/didOpen", {
        "textDocument": {"uri": "file://" + path,
                         "languageId": lang, "version": 1, "text": text}})


def loc_str(loc):
    uri = loc.get("uri") or loc.get("targetUri", "")
    path = uri.replace("file://", "")
    rng = loc.get("range") or loc.get("targetRange", {})
    s = rng.get("start", {})
    return "%s:%d:%d" % (path, s.get("line", 0) + 1, s.get("character", 0) + 1)


def cmd_warm(interval):
    if not KICKOFF or not os.path.isfile(KICKOFF):
        sys.exit("KICKOFF_FILE env must point to an existing source file")
    c = Clangd()
    print("clangd: %s (cdb: %s, j=%s)" % (CLANGD, CDB_DIR, JOBS), flush=True)
    c.initialize()
    open_doc(c, KICKOFF)
    print("background indexing started", flush=True)
    clk = os.sysconf("SC_CLK_TCK")
    last, last_cpu, stable, end_seen = -1, None, 0, False
    while True:
        time.sleep(interval)
        n = shard_count()
        try:
            cur = proc_cpu_jiffies(c.proc.pid)
        except (FileNotFoundError, ProcessLookupError):
            print("index INCOMPLETE: clangd exited early; shards on "
                  "disk: %d" % n, flush=True)
            sys.exit(1)
        cpu = 0.0 if last_cpu is None \
            else (cur - last_cpu) / clk / interval * 100.0
        last_cpu = cur
        for msg in c.latest_progress():
            if msg.get("params", {}).get("value", {}).get("kind") == "end":
                end_seen = True
        rate = (n - last) / interval if last >= 0 else 0
        print("index shards: %d (+%.1f/s)  clangd-cpu: %.0f%%  "
              "progress-end=%s  stable=%d"
              % (n, rate, cpu, end_seen, stable), flush=True)
        if last == n and cpu < 10.0:
            stable += 1
        else:
            stable = 0
        last = n
        if (stable >= 3 and end_seen) or stable >= 6:
            print("index build appears complete: %d shards" % n, flush=True)
            break


def cmd_status():
    print("root:    %s" % ROOT)
    print("clangd:  %s" % CLANGD)
    print("cdb:     %s" % (CDB_DIR or "(CDB_DIR not set)"))
    for d in CACHE_DIRS:
        if os.path.isdir(d):
            print("index:   %s (%d shards)" % (d, len(glob.glob(
                os.path.join(d, "*.idx")))))


def cmd_query(args):
    mode = args[0]
    c = Clangd()
    c.initialize()
    if mode in ("def", "refs", "callers", "callees"):
        path = os.path.abspath(args[1])
        open_doc(c, path)
        line, col = int(args[2]) - 1, int(args[3]) - 1
        if mode in ("def", "refs"):
            method = {"def": "textDocument/definition",
                      "refs": "textDocument/references"}[mode]
            params = {"textDocument": {"uri": "file://" + path},
                      "position": {"line": line, "character": col}}
            if mode == "refs":
                params["context"] = {"includeDeclaration": False}
            r = c.request(method, params)
            for loc in r.get("result") or []:
                print(loc_str(loc))
            return
        r = c.request("textDocument/prepareCallHierarchy", {
            "textDocument": {"uri": "file://" + path},
            "position": {"line": line, "character": col}})
        items = r.get("result") or []
        if not items:
            print("no call hierarchy item at position", file=sys.stderr)
            return
        m = ("callHierarchy/incomingCalls" if mode == "callers"
             else "callHierarchy/outgoingCalls")
        for it in items:
            r2 = c.request(m, {"item": it})
            for call in r2.get("result") or []:
                other = call.get("from" if mode == "callers" else "to", {})
                print("%s  %s" % (other.get("name", ""), loc_str(other)))
    else:
        print(__doc__)


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print(__doc__)
        sys.exit(1)
    if sys.argv[1] == "warm":
        interval = int(sys.argv[3]) if len(sys.argv) > 3 else 60
        cmd_warm(interval)
    elif sys.argv[1] == "status":
        cmd_status()
    else:
        cmd_query(sys.argv[1:])
