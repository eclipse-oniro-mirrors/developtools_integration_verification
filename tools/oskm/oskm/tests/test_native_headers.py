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
"""Contract tests for the Native SDK ELF-to-header mapping collector."""
from pathlib import Path
import sqlite3
import sys
import tempfile
import unittest
from unittest.mock import patch

from oskm.collectors.native_headers.collector import NativeHeadersContext, NativeHeadersCollector
from oskm.core.models import ScanRequest


sys.path.insert(0, str(Path(__file__).resolve().parents[1]))


class NativeHeadersTest(unittest.TestCase):
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
            "INSERT INTO elf_modules VALUES (1, 1, ?, ?, '[\"native\"]')",
            (file_name, soname or file_name))
        request = ScanRequest(self.root, "test")
        return NativeHeadersContext(scan_id=1, connection=connection, request=request,
                                  collector=NativeHeadersCollector())

    def collect(self, ctx):
        NativeHeadersCollector().collect(ctx)
        return ctx.records.get("native_headers", ())

    def test_header_library_tag_fallback(self):
        self.write(self.sdk / "sysroot/usr/include/hilog/log.h",
                   "/*\n * @library libhilog_native.z.so\n"
                   " * @syscap SystemCapability.HiviewDFX.HiLog\n */\n")
        self.write(self.root / "interface/sdk_c/hiviewdfx/hilog/include/hilog/log.h",
                   "/* @library libhilog_native.z.so */\n")
        self.write(self.root / "interface/sdk_c/hiviewdfx/hilog/BUILD.gn", """
ohos_native_headers("hilog_header") {
  dest_dir = "$native_headers_out_dir/hilog"
  sources = [ "./include/hilog/log.h" ]
}
""")
        ctx = self.context("libhilog_native.z.so")
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
ohos_native_headers("GLES3_header") {
  dest_dir = "$native_headers_out_dir/GLES3"
  sources = [ "//interface/sdk_c/third_party/openGLES/GLES3/gl3.h" ]
}

ohos_native_library("libGLESv3_native") {
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

    def test_current_ndk_templates_are_parsed(self):
        self.write(self.sdk / "sysroot/usr/include/bundle/native_interface_bundle.h",
                   "/* @library libbundle_ndk.z.so */\n")
        self.write(self.root / "interface/sdk_c/bundlemanager/BUILD.gn", """
ohos_ndk_headers("bundle_header") {
  dest_dir = "$ndk_headers_out_dir/bundle/"
  sources = [ "include/native_interface_bundle.h" ]
}

ohos_ndk_library("libbundle_ndk") {
  output_name = "bundle_ndk"
  output_extension = "z.so"
  system_capability_headers = [ "bundle/native_interface_bundle.h" ]
}
""")
        self.write(self.root / "interface/sdk_c/bundlemanager/include/native_interface_bundle.h",
                   "/* @library libbundle_ndk.z.so */\n")
        ctx = self.context("libbundle_ndk.z.so")
        records = self.collect(ctx)

        self.assertEqual(len(records), 1)
        self.assertEqual(records[0]["header_path"],
                         "interface/sdk_c/bundlemanager/include/native_interface_bundle.h")
        self.assertEqual(records[0]["match_strategy"], "build_gn")

    def test_exported_symbols_are_last_resort(self):
        self.write(self.sdk / "sysroot/usr/include/uv.h",
                   "void uv_close(void *handle);\nvoid uv_run(void *loop);\n")
        self.write(self.root / "interface/sdk_c/third_party/libuv/include/uv_native/uv.h",
                   "void uv_close(void *handle);\nvoid uv_run(void *loop);\n")
        self.write(self.root / "interface/sdk_c/third_party/libuv/BUILD.gn", """
ohos_native_headers("libuv_header") {
  dest_dir = "$native_headers_out_dir"
  sources = [ "include/uv_native/uv.h" ]
}
""")
        library = self.sdk / "sysroot/usr/lib/x86_64-linux-ohos/libuv.so"
        library.parent.mkdir(parents=True, exist_ok=True)
        library.write_bytes(b"fake-elf")
        ctx = self.context("libuv.so")

        from oskm.collectors.native_headers import collector as module
        with patch.object(module, "read_elf", return_value={
                "exported_symbols": ("uv_close", "uv_run")}):
            records = self.collect(ctx)

        self.assertEqual(len(records), 1)
        self.assertEqual(set(records[0]), {"elf_module_id", "header_path", "match_strategy"})
        self.assertEqual(records[0]["match_strategy"], "symbol")
        self.assertEqual(records[0]["header_path"],
                         "interface/sdk_c/third_party/libuv/include/uv_native/uv.h")

    def test_schema_keeps_only_mapping_columns(self):
        columns = tuple(column.name for column in NativeHeadersCollector.TABLES[0].columns)

        self.assertEqual(columns, ("elf_module_id", "header_path", "match_strategy"))
        self.assertEqual(NativeHeadersCollector.SCHEMA_VERSION, "1.2.0")

    def test_build_gn_directory_source_is_expanded(self):
        self.write(self.root / "interface/sdk_c/sample/attrs/button.h", "")
        self.write(self.sdk / "sysroot/usr/include/sample/attrs/button.h", "")
        self.write(self.root / "interface/sdk_c/sample/BUILD.gn", """
ohos_native_headers("sample_header") {
  dest_dir = "$native_headers_out_dir/sample"
  sources = [ "./attrs" ]
}

ohos_native_library("sample") {
  system_capability_headers = [ "sample/attrs/button.h" ]
}
""")
        ctx = self.context("libsample.z.so")
        records = self.collect(ctx)

        self.assertEqual([record["header_path"] for record in records],
                         ["interface/sdk_c/sample/attrs/button.h"])


if __name__ == "__main__":
    unittest.main()
