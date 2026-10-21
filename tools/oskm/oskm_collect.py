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
"""
import argparse
import os
import sys
from pathlib import Path


def __create_arg_parser():
    parser = argparse.ArgumentParser(
        description='oskm collection: scan the source tree into a knowledge database.')
    parser.add_argument('-i', '--input',
                        help='build output directory', required=True)
    parser.add_argument('-t', '--target-cpu',
                        help='target cpu', required=False)
    parser.add_argument('-w', '--workspace-root',
                        help='source tree root (defaults to parent of out/)',
                        required=False)
    parser.add_argument('-p', '--product',
                        help='product name (defaults to the output directory name)',
                        required=False)
    return parser


def oskm_collect(out_path, target_cpu, workspace_root=None,
                 product=None, args=None):
    """Scan the source tree into a SQLite knowledge database.

    Called by the hb resolver during postTargetCompilation phase.
    Output: ``{out_path}/oskm/knowledge.db``.
    """
    root, prod, db_path = _resolve_params(
        out_path, workspace_root, product)
    print(f"[oskm_collect] workspace_root={root}, product={prod}, "
          f"target_cpu={target_cpu}, db={db_path}")
    exit_code = _run_scan(root, prod, db_path)
    if exit_code != 0:
        print(f"[oskm_collect] scan completed with exit code {exit_code}",
              file=sys.stderr)
    else:
        print(f"[oskm_collect] scan complete: {db_path}")
    return exit_code


def _resolve_params(out_path, workspace_root, product):
    """Derive workspace root, product name, and database path."""
    out_dir = Path(out_path)
    root = Path(workspace_root) if workspace_root else out_dir.parent.parent
    prod = product if product else out_dir.name
    db_dir = out_dir / 'oskm'
    db_dir.mkdir(parents=True, exist_ok=True)
    db_path = db_dir / 'knowledge.db'
    return root, prod, db_path


def _run_scan(root, product, db_path):
    """Import and run the oskm scan subcommand."""
    from oskm.cli import main as oskm_main
    argv = [
        'scan',
        '--workspace-root', str(root),
        '--product', product,
        '--db', str(db_path),
    ]
    print(f"[oskm_collect] running: oskm {' '.join(argv)}")
    return oskm_main(argv)


if __name__ == '__main__':
    parser = __create_arg_parser()
    cli_args = parser.parse_args()
    workspace = cli_args.workspace_root or (
        os.path.dirname(os.path.dirname(cli_args.input))
        if cli_args.input else None)
    oskm_collect(cli_args.input, cli_args.target_cpu,
                 workspace_root=workspace, product=cli_args.product)
