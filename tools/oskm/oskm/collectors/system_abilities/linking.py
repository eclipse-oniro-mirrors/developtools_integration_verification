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
"""Link profile paths to sa_main's first argument, never by process name alone."""
from collections import defaultdict
from pathlib import PurePosixPath


def profile_argument(service):
    executable, args = service.get('executable'), service.get('args')
    if service.get('type') != 'sa' or not isinstance(executable, str) or executable.rsplit('/', 1)[-1] != 'sa_main':
        return None
    if not isinstance(args, (tuple, list)) or not args or not isinstance(args[0], str):
        return None
    value = args[0]
    if not value.startswith('/') or any(c in value for c in '$\x00{}') or '..' in PurePosixPath(value).parts:
        return None
    return PurePosixPath(value.lstrip('/')).as_posix()


def link_services(ctx, records, states):
    if not states:
        return
    if not ctx.upstream.ran('services') or not ctx.upstream.inventory_complete('services'):
        ctx.issue(ctx.package, 'SERVICE_INDEX_INCOMPLETE')
        return
    index = defaultdict(list)
    for identifier, service in ctx.upstream.identified('services'):
        path = profile_argument(service)
        if path is not None:
            index[path].append((identifier, service))
    for profile, state in states.items():
        if profile in index and state in ('unrelated', 'empty'):
            ctx.issue(ctx.package / profile, 'PROFILE_DECLARATION_MISSING')
    references = {}
    for record, _ in records:
        ctx.check()
        profile = record['profile']
        if profile not in references:
            hits = index.get(profile, [])
            reference = None
            if len(hits) != 1:
                ctx.issue(ctx.package / profile, 'SERVICE_UNMATCHED' if not hits else 'SERVICE_AMBIGUOUS')
            elif not isinstance(hits[0][1].get('name'), str) or not hits[0][1]['name']:
                ctx.issue(ctx.package / profile, 'SERVICE_NAME_INVALID')
            else:
                identifier, host_service = hits[0]
                reference = (identifier, dict(cfg=host_service['cfg'], name=host_service['name']))
                if reference[1]['name'] != record.get('process'):
                    ctx.issue(ctx.package / profile, 'PROCESS_NAME_MISMATCH', '/process')
            references[profile] = reference
        if references[profile] is not None:
            record['service_id'], record['service'] = references[profile]
