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
"""oskm collection: scan the built source tree into a SQLite knowledge database.

Invoked by the hb build driver during the postTargetCompilation phase when
``--gn-args enable_oskm_collect=true`` (or ``--enable-oskm-collect``) is set.
The resolver in ``build_args_resolver.py`` calls ``oskm_collect()`` with the
build output path, target CPU, workspace root, and product name.

The output database is written to ``{out_path}/oskm/knowledge.db``.
After the scan, a clangd .idx index is built under the build output
(non-fatal on failure).
"""
import argparse
import os
import subprocess
import sys
from pathlib import Path


def __create_arg_parser():
    parser = argparse.ArgumentParser(
        description='oskm collection: scan the source tree into a knowledge database.')
    parser.add_argument('-i', '--input',
                        help='build output directory', required=True)
    parser.add_argument('-t', '--target-cpu',
                        help='target cpu (defaults by zone: blue=arm, yellow=arm64)',
                        required=False)
    parser.add_argument('-w', '--workspace-root',
                        help='source tree root (defaults to parent of out/)',
                        required=False)
    parser.add_argument('-p', '--product',
                        help='product name (defaults to the output directory name; '
                             'yellow zone: "{abi}/{device}" relative to out/)',
                        required=False)
    parser.add_argument('-z', '--zone', choices=('blue', 'yellow'), default='blue',
                        help="build layout: 'blue' (default, out/{product}/) "
                             "or 'yellow' (out/{abi}/{device}/)")
    return parser


def oskm_collect(out_path, target_cpu, workspace_root=None,
                 product=None, zone='blue', args=None):
    """Scan the source tree into a SQLite knowledge database.

    Called by the hb resolver during postTargetCompilation phase.
    Output: ``{out_path}/oskm/knowledge.db``.
    """
    root, prod, db_path = _resolve_params(
        out_path, workspace_root, product, zone)
    print(f"[oskm_collect] workspace_root={root}, product={prod}, "
          f"zone={zone}, target_cpu={target_cpu}, db={db_path}")
    exit_code = _run_scan(root, prod, db_path, zone, target_cpu)
    if exit_code != 0:
        print(f"[oskm_collect] scan completed with exit code {exit_code}",
              file=sys.stderr)
    else:
        print(f"[oskm_collect] scan complete: {db_path}")
    __build_lsp_index(out_path)
    return exit_code


def _resolve_params(out_path, workspace_root, product, zone='blue'):
    """Derive workspace root, product name, and database path."""
    out_dir = Path(out_path)
    root = Path(workspace_root) if workspace_root else out_dir.parent.parent
    if product:
        prod = product
    elif zone == 'yellow' and out_dir.parent.name == 'out':
        # out/{abi}/{device} -> product = '{abi}/{device}'
        prod = out_dir.parent.name + '/' + out_dir.name
    else:
        prod = out_dir.name
    db_dir = out_dir / 'oskm'
    db_dir.mkdir(parents=True, exist_ok=True)
    db_path = db_dir / 'knowledge.db'
    return root, prod, db_path


def _run_scan(root, product, db_path, zone='blue', cpu_arch=None):
    """Import and run the oskm scan subcommand."""
    from oskm.cli import main as oskm_main
    argv = [
        'scan',
        '--workspace-root', str(root),
        '--product', product,
        '--zone', zone,
        '--db', str(db_path),
    ]
    if cpu_arch:
        argv.extend(('--cpu-arch', str(cpu_arch)))
    print(f"[oskm_collect] running: oskm {' '.join(argv)}")
    return oskm_main(argv)


def __build_lsp_index(out_path):
    """Build the clangd .idx index under the build output (non-fatal).

    Delegates to lsp/build_index.py; any failure is logged and swallowed
    so it never breaks the collection phase.
    Set OSKM_LSP_INDEX=off to skip.
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
            print(f'[oskm_collect] lsp index build exit={result.returncode} '
                  '(non-fatal)')
    except Exception as exc:
        print(f'[oskm_collect] lsp index build failed (non-fatal): {exc}')


if __name__ == '__main__':
    parser = __create_arg_parser()
    cli_args = parser.parse_args()
    workspace = cli_args.workspace_root or (
        os.path.dirname(os.path.dirname(cli_args.input))
        if cli_args.input else None)
    oskm_collect(cli_args.input, cli_args.target_cpu,
                 workspace_root=workspace, product=cli_args.product,
                 zone=cli_args.zone)
