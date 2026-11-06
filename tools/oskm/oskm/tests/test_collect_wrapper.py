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

"""Build-system wrapper: target CPU must reach the scan request, not just logs."""
import contextlib
import io
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch

import oskm.cli
from oskm_collect import _run_scan, oskm_collect


class CollectWrapperTest(unittest.TestCase):
    def test_target_cpu_is_forwarded_to_scan_cli(self):
        with patch('oskm.cli.main', return_value=0) as scan_main, \
                contextlib.redirect_stdout(io.StringIO()):
            code = _run_scan(Path('/workspace'), 'abi/device', Path('/tmp/knowledge.db'),
                             zone='yellow', cpu_arch='arm64')
        self.assertEqual(code, 0)
        argv = scan_main.call_args.args[0]
        self.assertEqual(argv[argv.index('--zone') + 1], 'yellow')
        self.assertEqual(argv[argv.index('--cpu-arch') + 1], 'arm64')

    def test_missing_target_cpu_does_not_add_an_empty_argument(self):
        with patch('oskm.cli.main', return_value=0) as scan_main, \
                contextlib.redirect_stdout(io.StringIO()):
            _run_scan(Path('/workspace'), 'test', Path('/tmp/knowledge.db'))
        self.assertNotIn('--cpu-arch', scan_main.call_args.args[0])

    def test_collect_entrypoint_forwards_target_cpu(self):
        with tempfile.TemporaryDirectory() as tmp, \
                patch('oskm_collect._run_scan', return_value=0) as run_scan, \
                contextlib.redirect_stdout(io.StringIO()):
            self.assertEqual(oskm_collect(tmp, 'arm64', zone='yellow'), 0)
        run_scan.assert_called_once()
        self.assertEqual(run_scan.call_args.args[4], 'arm64')
        self.assertEqual(run_scan.call_args.args[3], 'yellow')


if __name__ == '__main__':
    unittest.main()
