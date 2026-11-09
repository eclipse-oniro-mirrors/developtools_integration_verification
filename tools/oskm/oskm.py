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
"""Single CLI entry point.

扫描类子命令来自采集器注册表（`oskm.cli`）；查询类来自 `agentic.cli`。
在这里分派而不是让 `oskm/cli.py` 去 import agentic，是为了守住分层：
`oskm` 包是库，`agentic` 依赖它，反过来不行。
"""
import sys

QUERY = ('ask', 'arch', 'diff', 'sql')
# 查询 CLI 的全局 flag 写在子命令前面（`--db X ask …`），所以不能只看 argv[0]；
# 但也不能傻扫所有 token——`scan --product sql` 会被 `sql` 骗过去。
# 这几个 flag 的取值要跳过。
VALUED = ('--db', '--product', '--scan-id', '--format')


def _is_query(argv):
    skip = False
    for token in argv:
        if skip:
            skip = False
            continue
        if token.startswith('-'):
            skip = token in VALUED          # --flag=value 形式自带取值，不用跳
            continue
        return token in QUERY               # 第一个真正的位置参数就是子命令
    return False


def main(argv=None):
    argv = sys.argv[1:] if argv is None else argv
    if _is_query(argv):
        from agentic.cli import main as query_main
        return query_main(argv)
    from oskm.cli import main as scan_main
    return scan_main(argv)


if __name__ == '__main__':
    raise SystemExit(main())
