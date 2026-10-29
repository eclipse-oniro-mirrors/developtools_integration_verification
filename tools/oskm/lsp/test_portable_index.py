#!/usr/bin/env python3
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
"""Portable index regression tests. LSP_TEST_CLANGD enables real clangd tests."""
import concurrent.futures
import json
import os
import select
from pathlib import Path
import shlex
import shutil
import subprocess
import sys
import tempfile
import threading
import time
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parent))
import portable_index as portable

BINARY = os.environ.get("LSP_TEST_CLANGD", "")


class Client:
    def __init__(self, root, artifact, binary, log):
        self.root, self.log = root, log
        args = ["--background-index", "--compile-commands-dir=" + str(artifact),
                "-j=2", "--log=verbose"]
        self.errors = log.open("w")
        self.process = subprocess.Popen(portable.launch_command(root, binary, args, building=True),
            stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=self.errors)
        self.lock, self.condition = threading.Lock(), threading.Condition()
        self.responses, self.sequence = {}, 0
        threading.Thread(target=self.reader, daemon=True).start()

    def send(self, message):
        data = json.dumps(message).encode()
        with self.lock:
            self.process.stdin.write(b"Content-Length: %d\r\n\r\n" % len(data) + data)
            self.process.stdin.flush()

    def reader(self):
        while True:
            headers = {}
            while True:
                line = self.process.stdout.readline()
                if not line:
                    return
                if not line.strip():
                    break
                key, value = line.decode().split(":", 1)
                headers[key.lower()] = value.strip()
            message = json.loads(self.process.stdout.read(int(headers["content-length"])))
            if "id" in message and "method" in message:
                self.send({"jsonrpc": "2.0", "id": message["id"], "result": None})
            elif "id" in message:
                with self.condition:
                    self.responses[message["id"]] = message
                    self.condition.notify_all()

    def request(self, method, params):
        self.sequence += 1
        identifier = self.sequence
        self.send({"jsonrpc": "2.0", "id": identifier, "method": method, "params": params})
        deadline = time.monotonic() + 20
        with self.condition:
            while identifier not in self.responses:
                if self.process.poll() is not None or time.monotonic() > deadline:
                    raise RuntimeError(method + ": " + self.log.read_text()[-3000:])
                self.condition.wait(0.1)
            result = self.responses.pop(identifier)
        if "error" in result:
            raise RuntimeError(result)
        return result.get("result")

    def notify(self, method, params):
        self.send({"jsonrpc": "2.0", "method": method, "params": params})

    def start(self):
        self.request("initialize", {"processId": os.getpid(), "rootUri": self.root.as_uri(),
            "capabilities": {"window": {"workDoneProgress": True}}})
        self.notify("initialized", {})
        path = self.root / "main.cc"
        self.notify("textDocument/didOpen", {"textDocument": {
            "uri": path.as_uri(), "languageId": "cpp", "version": 1, "text": path.read_text()}})

    def close(self):
        try:
            if self.process.poll() is None:
                self.request("shutdown", None)
                self.notify("exit", None)
                self.process.wait(timeout=5)
        finally:
            if self.process.poll() is None:
                self.process.kill()
                self.process.wait()
            self.process.stdin.close()
            self.process.stdout.close()
            self.errors.close()


class PortableTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(dir=os.environ.get("LSP_TEST_TMPDIR"))
        self.base = Path(self.temp.name)
        self.root = self.base / "pipeline checkout"
        (self.root / "out/gen").mkdir(parents=True)
        (self.root / ".repo").mkdir()
        (self.root / ".clangd").write_text("Index:\n  StandardLibrary: false\n")
        (self.root / "api.h").write_text("#pragma once\nint portable_target();\n")
        (self.root / "out/gen/value.h").write_text("#define GENERATED_VALUE 17\n")
        (self.root / "lib.cc").write_text(
            '#include "api.h"\n#include "value.h"\nint portable_target() { return GENERATED_VALUE; }\n')
        (self.root / "main.cc").write_text(
            '#include "api.h"\nint caller() { return portable_target(); }\n')
        (self.root / "flags.rsp").write_text(shlex.join([
            "-I" + str(self.root), "-I" + str(self.root / "out/gen"), "-std=c++17"]))
        self.cdb = self.root / "out/compile_commands.json"
        self.cdb.write_text(json.dumps([
            {"directory": str(self.root / "out"), "file": str(self.root / name),
             "arguments": [BINARY or "/usr/bin/clang++", "@" + str(self.root / "flags.rsp"),
                           "-c", str(self.root / name)]} for name in ("lib.cc", "main.cc")]))
        self.artifact = self.root / "out/lsp-portable"

    def tearDown(self):
        self.temp.cleanup()

    def prepare(self, real=False):
        if real:
            portable.prepare(self.root, self.cdb, self.artifact, BINARY, "out")
        else:
            with patch.object(portable, "clangd_version", return_value="test-clangd"), \
                    patch.object(portable.subprocess, "run"):
                portable.prepare(self.root, self.cdb, self.artifact, "/usr/bin/clangd", "out")

    def test_canonical_cdb_response_and_generated_paths(self):
        self.prepare()
        values = list(portable.entries(self.artifact / "compile_commands.json"))
        self.assertEqual(values[0]["directory"], portable.VIRTUAL_ROOT + "/out")
        self.assertEqual(values[0]["file"], portable.VIRTUAL_ROOT + "/lib.cc")
        self.assertIn("-I" + portable.VIRTUAL_ROOT + "/out/gen", values[0]["arguments"])
        self.assertFalse(any(t.startswith("@") for t in values[0]["arguments"]))
        self.assertNotIn(str(self.root), (self.artifact / "compile_commands.json").read_text())
        self.assertEqual(json.loads(self.cdb.read_text())[0]["directory"], str(self.root / "out"))

    def test_prefix_boundaries(self):
        self.assertEqual(portable.server_path(str(self.root) + "-other/a.cc", self.root),
                         str(self.root) + "-other/a.cc")
        self.assertEqual(portable.map_token("--sysroot=" + str(self.root / "sdk"), self.root),
                         "--sysroot=" + portable.VIRTUAL_ROOT + "/sdk")

    def test_missing_namespace_support_is_explicit(self):
        with patch.object(portable.shutil, "which", return_value=None):
            with self.assertRaisesRegex(RuntimeError, "bubblewrap"):
                portable.namespace_command(self.root, ["/usr/bin/true"])

    def test_manifest_checks(self):
        self.prepare()
        with patch.object(portable, "clangd_version", return_value="test-clangd"):
            with self.assertRaisesRegex(RuntimeError, "not complete"):
                portable.validate(self.root, self.artifact, "/usr/bin/clangd")
            with self.assertRaisesRegex(RuntimeError, "not complete"):
                portable.launch_command(self.root, "/usr/bin/clangd",
                    ["--compile-commands-dir=" + str(self.artifact)])
            portable.finish(self.artifact, True)
            with self.assertRaisesRegex(RuntimeError, "shard files"):
                portable.validate(self.root, self.artifact, "/usr/bin/clangd")
            cache = self.artifact / ".cache/clangd/index"
            cache.mkdir(parents=True)
            (cache / "sample.idx").touch()
            self.assertIsNotNone(portable.validate(self.root, self.artifact, "/usr/bin/clangd"))
            with patch.object(portable, "clangd_version", return_value="different-version"):
                with self.assertRaisesRegex(RuntimeError, "version differs"):
                    portable.validate(self.root, self.artifact, "/usr/bin/clangd")
            with (self.artifact / "compile_commands.json").open("a") as stream:
                stream.write(" ")
            with self.assertRaisesRegex(RuntimeError, "checksum"):
                portable.validate(self.root, self.artifact, "/usr/bin/clangd")

    def test_foreign_native_cdb_is_not_rewritten(self):
        foreign = self.root / "foreign"
        foreign.mkdir()
        cdb = foreign / "compile_commands.json"
        cdb.write_text('[{"directory":"/nonexistent/pipeline/out","file":"a.cc"}]')
        before = cdb.read_bytes()
        with self.assertRaisesRegex(RuntimeError, "Foreign-path"):
            portable.launch_command(self.root, "/usr/bin/clangd",
                                    ["--compile-commands-dir=" + str(foreign)])
        self.assertEqual(before, cdb.read_bytes())

    def test_response_cycle(self):
        (self.root / "flags.rsp").write_text("@" + shlex.quote(str(self.root / "flags.rsp")))
        with self.assertRaisesRegex(ValueError, "Cyclic"):
            portable.expand_response(["@" + str(self.root / "flags.rsp")], self.root)

    def snapshot(self, artifact):
        return {p.name: (portable.digest(p), p.stat().st_mtime_ns)
                for p in (artifact / ".cache/clangd/index").glob("*.idx")}

    def exercise(self, root, artifact, label):
        before = self.snapshot(artifact)
        log = self.base / (label + ".log")
        client = Client(root, artifact, BINARY, log)
        try:
            client.start()
            previous, stable = None, 0
            start = time.monotonic()
            while time.monotonic() - start < 25:
                symbols = client.request("workspace/symbol", {"query": "portable_target"})
                current = self.snapshot(artifact)
                stable = stable + 1 if current and current == previous else 0
                previous = current
                if symbols and stable >= 6 and time.monotonic() - start > 2:
                    break
                time.sleep(0.25)
            else:
                self.fail("Index did not settle: " + log.read_text()[-3000:])
            main = root / "main.cc"
            result = client.request("textDocument/definition", {
                "textDocument": {"uri": main.as_uri()},
                "position": {"line": 1, "character": main.read_text().splitlines()[1].index("portable_target")}})
            self.assertTrue(result)
            self.assertEqual(result[0]["uri"], (root / "lib.cc").as_uri())
            self.assertTrue(all(s["location"]["uri"].startswith(root.as_uri() + "/") for s in symbols))
            self.assertNotIn("file_not_found", log.read_text())
        finally:
            client.close()
        return before, self.snapshot(artifact), log.read_text()

    @unittest.skipUnless(BINARY and shutil.which("bwrap"), "set LSP_TEST_CLANGD for real clangd")
    def test_build_entrypoint(self):
        here = Path(__file__).resolve().parent
        arkweb = here.name == "arkweb_lsp"
        if arkweb:
            tool = self.root / "src/arkweb/arkweb_km/tools/arkweb_lsp"
            tool.mkdir(parents=True)
            shutil.copy2(here.parent / "km_paths.py", tool.parent)
            (self.root / "src/.gn").touch()
            (self.root / "src/DEPS").touch()
            out = self.root / "src/out/rk3568_64"
            artifact = out / "arkweb_km/arkweb_lsp/portable"
        else:
            tool = self.root / "developtools/integration_verification/tools/oskm/lsp"
            tool.mkdir(parents=True)
            (self.root / "build.sh").touch()
            out = self.root / "out/rk3568"
            artifact = out / "lsp-portable"
        for name in ("build_index.py", "clangd_tools.py", "clangd_wrapper.py",
                     "portable_index.py", "cdb_trim.py", "config_locator.py",
                     "apply_musl_fix.py"):
            if (here / name).is_file():
                shutil.copy2(here / name, tool)
        out.mkdir(parents=True)
        shutil.copy2(self.cdb, out / "compile_commands.json")
        env = dict(os.environ, LSP_CLANGD_BIN=BINARY, LSP_INDEX_INTERVAL="1",
                   PYTHONDONTWRITEBYTECODE="1")
        result = subprocess.run([sys.executable, str(tool / "build_index.py"),
            "-i", str(out), "--instances", "2", "--jobs-per-instance", "1"],
            env=env, capture_output=True, text=True, timeout=50)
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertEqual(json.loads((artifact / portable.MANIFEST).read_text())["status"], "complete")
        self.assertGreaterEqual(len(self.snapshot(artifact)), 4)
        self.assertIsNotNone(portable.validate(self.root, artifact, BINARY))
        if arkweb:
            status = subprocess.run([sys.executable, str(tool / "clangd_tools.py"), "status"],
                env=env, capture_output=True, text=True, timeout=10)
            self.assertEqual(status.returncode, 0, status.stderr)
            self.assertIn("cdb:     " + str(artifact), status.stdout)
        # Run the real MCP distribution with the configuration produced above.
        # Only tools/call(status) is sent: no manual open-file/start request.
        mcp = here.parent.parent / "mcp/arkweb_lsp/dist/index.js" if arkweb else here / "mcp/dist/index.js"
        if shutil.which("node") and mcp.is_file():
            self.check_mcp_warmup(mcp)

    def check_mcp_warmup(self, mcp):
        errors = self.base / "mcp.log"
        with errors.open("w") as log:
            process = subprocess.Popen(["node", str(mcp)], cwd=self.root,
                stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=log)
            def rpc(identifier, method, params):
                message = {"jsonrpc": "2.0", "id": identifier, "method": method, "params": params}
                process.stdin.write(json.dumps(message).encode() + b"\n")
                process.stdin.flush()
                deadline = time.monotonic() + 15
                while time.monotonic() < deadline:
                    if not select.select([process.stdout], [], [], 0.2)[0]:
                        continue
                    line = process.stdout.readline()
                    if not line:
                        break
                    reply = json.loads(line)
                    if reply.get("id") == identifier:
                        self.assertNotIn("error", reply, reply)
                        return reply["result"]
                self.fail("MCP response missing: " + errors.read_text()[-3000:])
            try:
                rpc(1, "initialize", {"protocolVersion": "2025-03-26", "capabilities": {},
                    "clientInfo": {"name": "portable-index-test", "version": "1"}})
                process.stdin.write(b'{"jsonrpc":"2.0","method":"notifications/initialized"}\n')
                process.stdin.flush()
                for identifier in range(2, 82):
                    status = rpc(identifier, "tools/call", {"name": "lsp_server_status", "arguments": {}})
                    servers = json.loads(status["content"][0]["text"])["servers"]
                    if any(s["status"] == "running" and s["workspace_root"] == str(self.root)
                           for s in servers) and "warmup: opened" in errors.read_text():
                        break
                    time.sleep(0.2)
                else:
                    self.fail("Portable MCP warmup failed: " + errors.read_text()[-3000:])
            finally:
                process.terminate()
                try:
                    process.wait(timeout=10)
                except subprocess.TimeoutExpired:
                    process.kill()
                    process.wait()
                process.stdin.close()
                process.stdout.close()

    @unittest.skipUnless(BINARY and shutil.which("bwrap"), "set LSP_TEST_CLANGD for real clangd")
    def test_relocation_concurrency_and_incremental(self):
        self.prepare(real=True)
        _, initial, _ = self.exercise(self.root, self.artifact, "pipeline")
        self.assertGreaterEqual(len(initial), 4)  # two TUs and two headers
        portable.finish(self.artifact, True)
        copies = []
        for number in (1, 2):
            root = self.base / ("local-" + str(number))
            shutil.copytree(self.root, root)
            for name in ("lib.cc", "main.cc", "api.h", "out/gen/value.h"):
                os.utime(root / name, None)
            copies.append((root, root / "out/lsp-portable"))
        with concurrent.futures.ThreadPoolExecutor(max_workers=2) as executor:
            futures = [executor.submit(self.exercise, root, artifact, "local-" + str(i))
                       for i, (root, artifact) in enumerate(copies)]
            for future in futures:
                before, after, log = future.result()
                self.assertEqual(before, after, "Relocation rewrote an existing shard")
                self.assertIn("after loading index from disk", log)
                self.assertNotIn("Indexing " + portable.VIRTUAL_ROOT + "/lib.cc", log)
        root, artifact = copies[0]
        (root / "lib.cc").write_text(
            '#include "api.h"\n#include "value.h"\nint portable_target() { return GENERATED_VALUE + 3; }\n')
        before, after, log = self.exercise(root, artifact, "local-edit")
        changed = [key for key in before if before[key] != after[key]]
        self.assertEqual(len(changed), 1)
        self.assertTrue(changed[0].startswith("lib.cc."))
        self.assertIn("Indexing " + portable.VIRTUAL_ROOT + "/lib.cc", log)
        self.assertEqual(self.snapshot(copies[1][1]), initial)


if __name__ == "__main__":
    unittest.main()
