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
"""Find every etc/init directory without following directory symlinks."""
import os
from pathlib import Path
from ...core.io import InputFailure
from ...core.models import ScanFatalError
from .records import make_record


def discover_configs(ctx):
    paths = set()

    def failed(exc):
        path = Path(exc.filename or ctx.package)
        ctx.issue(path, 'DIRECTORY_UNREADABLE')
    for directory, dirs, files in os.walk(ctx.package, followlinks=False, onerror=failed):
        ctx.check()
        directory = Path(directory)
        relative = directory.relative_to(ctx.package)
        # Record discovered init roots even if entering one subsequently fails.
        if relative.name == 'etc' and 'init' in dirs and not (directory / 'init').is_symlink():
            ctx.scope.add((relative / 'init').as_posix())
        if relative.parts[-2:] == ('etc', 'init'):
            ctx.scope.add(relative.as_posix())
        if any(directory.is_relative_to(ctx.package / scope) for scope in ctx.scope):
            paths.update(directory / name for name in files if name.endswith('.cfg'))
            if len(paths) > ctx.limits.input_files:
                raise ScanFatalError(ctx.INPUT_LIMIT_CODE)
    return sorted(paths, key=lambda p: p.relative_to(ctx.package).as_posix())


def read_configs(ctx, paths):
    for i, path in enumerate(paths):
        cfg = path.relative_to(ctx.package).as_posix()
        ctx.progress('configs', i, len(paths), cfg)
        try:
            obj = ctx.read_json(path, ctx.package)
            if not isinstance(obj, dict) or ('services' in obj and not isinstance(obj['services'], list)):
                ctx.issue(path, 'CFG_STRUCTURE_INVALID')
                continue
            for n, raw in enumerate(obj.get('services', [])):
                pointer = '/services/' + str(n)
                if not isinstance(raw, dict):
                    ctx.issue(path, 'SERVICE_NOT_OBJECT', pointer)
                else:
                    # The pointer travels with the record so later passes can
                    # report against the declaration, not against a list index
                    # that non-object entries have already shifted.
                    yield make_record(cfg, raw), pointer
        except InputFailure as exc:
            ctx.issue(path, 'CFG_' + exc.code)
        except (ValueError, UnicodeError, RecursionError):
            ctx.issue(path, 'CFG_INVALID_JSON')
