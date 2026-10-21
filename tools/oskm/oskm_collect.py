#!/usr/bin/env python3
#coding=utf-8

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
import argparse
import os
import subprocess
import sys


def __create_arg_parser():
    parser = argparse.ArgumentParser(
        description='oskm collection: collect oskm information from compiled output files.')
    parser.add_argument('-i', '--input',
                        help='build output directory', required=True)
    parser.add_argument('-t', '--target-cpu',
                        help='target cpu', required=False)
    return parser


def __build_lsp_index(out_path):
    """Build the clangd .idx index under the build output (non-fatal).

    Delegates to lsp/build_index.py; any failure is logged and swallowed so
    it never breaks the collection phase. Set OSKM_LSP_INDEX=off to skip.
    """
    if os.environ.get('OSKM_LSP_INDEX', '').lower() in ('off', '0', 'no'):
        print('[oskm_collect] lsp index disabled by OSKM_LSP_INDEX')
        return
    lsp_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'lsp')
    build_script = os.path.join(lsp_dir, 'build_index.py')
    if not os.path.isfile(build_script):
        print('[oskm_collect] lsp/build_index.py not found, skip')
        return
    try:
        result = subprocess.run(
            [sys.executable, build_script, '-i', str(out_path)],
            cwd=lsp_dir)
        if result.returncode != 0:
            print('[oskm_collect] lsp index build exit={} (non-fatal)'.format(
                result.returncode))
    except Exception as exc:  # noqa: BLE001 - never block the pipeline
        print('[oskm_collect] lsp index build failed (non-fatal): {}'.format(exc))


def oskm_collect(out_path, target_cpu, args=None):
    """Collect oskm information from build output.

    Currently generates the clangd background index (.idx shards) under
    ``<out_path>/.cache/clangd/index`` via ``lsp/build_index.py``; extend
    with further collection logic here.

    Args:
        out_path: build output directory.
        target_cpu: target cpu name, e.g. ``arm64``.
        args: optional extra arguments from CLI.

    Returns:
        None
    """
    print("[oskm_collect] entry point reached, out_path={}, target_cpu={}".format(
        out_path, target_cpu), flush=True)
    __build_lsp_index(out_path)
    return


if __name__ == '__main__':
    parser = __create_arg_parser()
    cli_args = parser.parse_args()
    oskm_collect(cli_args.input, cli_args.target_cpu, cli_args)
