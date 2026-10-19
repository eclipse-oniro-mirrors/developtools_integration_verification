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


def __create_arg_parser():
    parser = argparse.ArgumentParser(
        description='oskm collection: collect oskm information from compiled output files.')
    parser.add_argument('-i', '--input',
                        help='build output directory', required=True)
    parser.add_argument('-t', '--target-cpu',
                        help='target cpu', required=False)
    return parser


def oskm_collect(out_path, target_cpu, args=None):
    """Collect oskm information from build output.

    Placeholder for extension. Add the real collection logic here, e.g.
    scanning build outputs, aggregating metadata, writing result files
    under ``out_path``.

    Args:
        out_path: build output directory.
        target_cpu: target cpu name, e.g. ``arm64``.
        args: optional extra arguments from CLI.

    Returns:
        None
    """
    # TODO: implement oskm collection logic here.
    print("[oskm_collect] entry point reached, out_path={}, target_cpu={}".format(
        out_path, target_cpu))
    return


if __name__ == '__main__':
    parser = __create_arg_parser()
    cli_args = parser.parse_args()
    oskm_collect(cli_args.input, cli_args.target_cpu, cli_args)
