#!/usr/bin/env python3
# coding=utf-8

#
# Copyright (c) 2021-2026 Huawei Device Co., Ltd.
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
"""Contract tests for the NDK ELF-to-header mapping collector."""
from pathlib import Path
import sqlite3
import sys
import tempfile
import unittest
from unittest.mock import patch

from oskm.collectors.ndk_headers.collector import NdkHeadersContext, NdkHeadersCollector
from oskm.core.models import ScanRequest


sys.path.insert(0, str(Path(__file__).resolve().parents[1]))


class NdkHeadersTest(unittest.TestCase):
    def setUp(self):
        temporary = tempfile.TemporaryDirectory()
        self.addCleanup(temporary.cleanup)
        self.root = Path(temporary.name)
        self.sdk = self.root / "prebuilts/ohos-sdk/linux/26.0.1/native"

    def write(self, relative, value):
        path = self.root / relative
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(value)
        return path

    def context(self, file_name, soname=None):
        connection = sqlite3.connect(":memory:")
        connection.row_factory = sqlite3.Row
        self.addCleanup(connection.close)
        connection.execute(
            "CREATE TABLE collector_runs (scan_id INTEGER, collector TEXT, status TEXT)")
        connection.execute(
            "CREATE TABLE elf_modules (id INTEGER PRIMARY KEY, scan_id INTEGER, "
            "file_name TEXT, soname TEXT, category TEXT)")
        connection.execute(
            "INSERT INTO collector_runs VALUES (1, 'elf_modules', 'complete')")
        connection.execute(
            "INSERT INTO elf_modules VALUES (1, 1, ?, ?, '[\"ndk\"]')",
            (file_name, soname or file_name))
        request = ScanRequest(self.root, "test")
        return NdkHeadersContext(scan_id=1, connection=connection, request=request,
                                  collector=NdkHeadersCollector())

    def collect(self, ctx):
        NdkHeadersCollector().collect(ctx)
        return ctx.records.get("ndk_headers", ())

    def test_header_library_tag_fallback(self):
        self.write(self.sdk / "sysroot/usr/include/hilog/log.h",
                   "/*\n * @library libhilog_ndk.z.so\n"
                   " * @syscap SystemCapability.HiviewDFX.HiLog\n */\n")
        self.write(self.root / "interface/sdk_c/hiviewdfx/hilog/include/hilog/log.h",
                   "/* @library libhilog_ndk.z.so */\n")
        self.write(self.root / "interface/sdk_c/hiviewdfx/hilog/BUILD.gn", """
ohos_ndk_headers("hilog_header") {
  dest_dir = "$ndk_headers_out_dir/hilog"
  sources = [ "./include/hilog/log.h" ]
}
""")
        ctx = self.context("libhilog_ndk.z.so")
        records = self.collect(ctx)

        self.assertEqual(len(records), 1)
        self.assertEqual(set(records[0]), {"elf_module_id", "header_path", "match_strategy"})
        self.assertEqual(records[0]["header_path"],
                         "interface/sdk_c/hiviewdfx/hilog/include/hilog/log.h")
        self.assertEqual(records[0]["match_strategy"], "header_library")

    def test_build_gn_mapping_is_preferred(self):
        self.write(self.sdk / "sysroot/usr/include/GLES3/gl3.h",
                   "#include <stdint.h>\n")
        self.write(self.root / "interface/sdk_c/graphic/BUILD.gn", """
ohos_ndk_headers("GLES3_header") {
  dest_dir = "$ndk_headers_out_dir/GLES3"
  sources = [ "//interface/sdk_c/third_party/openGLES/GLES3/gl3.h" ]
}

ohos_ndk_library("libGLESv3_ndk") {
  output_name = "GLESv3"
  output_extension = "so"
  system_capability = "SystemCapability.Graphic.Graphic2D.GLES3"
  system_capability_headers = [ "GLES3/gl3.h" ]
}
""")
        ctx = self.context("libGLESv3.so")
        records = self.collect(ctx)

        self.assertEqual(len(records), 1)
        self.assertEqual(set(records[0]), {"elf_module_id", "header_path", "match_strategy"})
        self.assertEqual(records[0]["match_strategy"], "build_gn")
        self.assertEqual(records[0]["header_path"].endswith("GLES3/gl3.h"), True)

    def test_exported_symbols_are_last_resort(self):
        self.write(self.sdk / "sysroot/usr/include/uv.h",
                   "void uv_close(void *handle);\nvoid uv_run(void *loop);\n")
        self.write(self.root / "interface/sdk_c/third_party/libuv/include/uv_ndk/uv.h",
                   "void uv_close(void *handle);\nvoid uv_run(void *loop);\n")
        self.write(self.root / "interface/sdk_c/third_party/libuv/BUILD.gn", """
ohos_ndk_headers("libuv_header") {
  dest_dir = "$ndk_headers_out_dir"
  sources = [ "include/uv_ndk/uv.h" ]
}
""")
        library = self.sdk / "sysroot/usr/lib/x86_64-linux-ohos/libuv.so"
        library.parent.mkdir(parents=True, exist_ok=True)
        library.write_bytes(b"fake-elf")
        ctx = self.context("libuv.so")

        from oskm.collectors.ndk_headers import collector as module
        with patch.object(module, "read_elf", return_value={
                "exported_symbols": ("uv_close", "uv_run")}):
            records = self.collect(ctx)

        self.assertEqual(len(records), 1)
        self.assertEqual(set(records[0]), {"elf_module_id", "header_path", "match_strategy"})
        self.assertEqual(records[0]["match_strategy"], "symbol")
        self.assertEqual(records[0]["header_path"],
                         "interface/sdk_c/third_party/libuv/include/uv_ndk/uv.h")

    def test_schema_keeps_only_mapping_columns(self):
        columns = tuple(column.name for column in NdkHeadersCollector.TABLES[0].columns)

        self.assertEqual(columns, ("elf_module_id", "header_path", "match_strategy"))
        self.assertEqual(NdkHeadersCollector.SCHEMA_VERSION, "1.2.0")

    def test_build_gn_directory_source_is_expanded(self):
        self.write(self.root / "interface/sdk_c/sample/attrs/button.h", "")
        self.write(self.sdk / "sysroot/usr/include/sample/attrs/button.h", "")
        self.write(self.root / "interface/sdk_c/sample/BUILD.gn", """
ohos_ndk_headers("sample_header") {
  dest_dir = "$ndk_headers_out_dir/sample"
  sources = [ "./attrs" ]
}

ohos_ndk_library("sample") {
  system_capability_headers = [ "sample/attrs/button.h" ]
}
""")
        ctx = self.context("libsample.z.so")
        records = self.collect(ctx)

        self.assertEqual([record["header_path"] for record in records],
                         ["interface/sdk_c/sample/attrs/button.h"])


if __name__ == "__main__":
    unittest.main()
