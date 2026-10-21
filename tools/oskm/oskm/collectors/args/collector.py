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
"""Args collector: GN build arguments via gn args --list --json.

Depends on components for component_id association via manifest directory
longest-prefix matching (core/ownership.nearest_component).
"""
import json

from .gn_args import find_gn, run_gn_args, extract_json, parse_gn_value, classify_value
from .models import ArgsScanRequest, ArgsResult
from ...core.framework import BaseCollector, ScanContext, register
from ...core.ownership import manifest_directories, nearest_component
from ...core.models import RequestError
from ...core.schema import Column, Index, Table

GN_ARGS = Table(
    'gn_args',
    columns=(
        Column('name', nullable=False),
        Column('component_id', 'INTEGER', references='components(id)'),
        Column('decl_file', nullable=False),
        Column('decl_line', 'INTEGER', nullable=False),
        Column('default_value', 'JSON'),
        Column('has_override', 'INTEGER', nullable=False, default='0'),
        Column('current_value', 'JSON'),
        Column('comment'),
        Column('value_type', nullable=False),
    ),
    primary_key=('name',),
    surrogate=True,
    indexes=(
        Index('idx_gn_args_component', ('scan_id', 'component_id')),
        Index('idx_gn_args_file', ('scan_id', 'decl_file')),
    ),
)


class ArgsContext(ScanContext):
    def setup(self):
        self.out_dir = self.workspace / 'out' / self.request.product
        self.gn_path = find_gn(self.workspace)


@register
class ArgsCollector(BaseCollector):
    NAME = 'args'
    DESCRIPTION = 'Extract GN build arguments via gn args --list --json'
    DEPENDS_ON = ('components',)
    SCHEMA_VERSION = '1.0.0'
    TABLES = (GN_ARGS,)
    CONTEXT_TYPE = ArgsContext
    REQUEST_TYPE = ArgsScanRequest
    REQUEST_TYPE_ERROR = 'EXPECTED_SCAN_REQUEST'
    RESULT_TYPE = ArgsResult
    RESULT_FIELD = 'gn_args'
    EXPORT_ORDER = 'name'

    def collect(self, ctx):
        if not ctx.gn_path:
            ctx.issue(ctx.workspace, 'GN_TOOL_NOT_FOUND', advisory=True)
            return
        if not (ctx.out_dir / 'args.gn').exists():
            ctx.issue(ctx.workspace, 'GN_BUILD_DIR_MISSING', advisory=True)
            return

        ctx.progress('gn-args', 0, 1)
        output = run_gn_args(ctx.gn_path, ctx.out_dir)
        if output is None:
            ctx.issue(ctx.workspace, 'GN_ARGS_TIMEOUT', advisory=True)
            return

        data = extract_json(output)
        if not data:
            ctx.issue(ctx.workspace, 'GN_ARGS_PARSE_FAILED', advisory=True)
            return
        ctx.progress('gn-args', 1, 1)

        index = ctx.component_index(location=ctx.workspace)
        dir_index = manifest_directories(index) if index else {}

        for i, item in enumerate(data):
            ctx.check()
            name = item.get('name')
            if not isinstance(name, str) or not name:
                continue
            default = item.get('default', {})
            if not isinstance(default, dict) or 'file' not in default:
                continue

            decl_file = default.get('file', '')
            decl_line = default.get('line')
            default_value = parse_gn_value(default.get('value', ''))

            current = item.get('current')
            if current:
                actual_value = parse_gn_value(current.get('value', ''))
                has_override = 1
            else:
                actual_value = default_value
                has_override = 0

            comment = (item.get('comment') or '').strip()
            value_type = classify_value(actual_value)

            comp = nearest_component(dir_index, decl_file)
            component_id = comp['id'] if comp else None

            decl_file_rel = decl_file.lstrip('/') if decl_file else None

            ctx.emit('gn_args', dict(
                name=name,
                component_id=component_id,
                decl_file=decl_file_rel,
                decl_line=decl_line,
                default_value=json.dumps(default_value) if default_value is not None else None,
                has_override=has_override,
                current_value=json.dumps(actual_value) if actual_value is not None else None,
                comment=comment or None,
                value_type=value_type,
            ))

    def scope(self, ctx):
        return 'gn args --list --json'

    @classmethod
    def export_record(cls, row, connection, scan_id):
        from ...core.export import record_from_row
        return record_from_row(row, cls.TABLES[0])
