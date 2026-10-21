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
"""hdf_devhost -n is the declaration host identity; cfg.name is not a fallback."""
from collections import defaultdict


def host_argument(service):
    args = service.get('args', ())
    if '-n' not in args:
        return None
    if len(args) % 2 or not all(isinstance(a, str) for a in args) or args.count('-n') != 1:
        raise ValueError('HOST_ARGUMENT_INVALID')
    pairs = list(zip(args[::2], args[1::2]))
    names = [v for k, v in pairs if k == '-n']
    if len(names) != 1 or not names[0] or any(c in names[0] for c in '$\x00{}'):
        raise ValueError('HOST_ARGUMENT_INVALID')
    return names[0]


def link_services(ctx, records):
    if not records:
        return
    # The services collector already ran in this scan; its rows are the input.
    # Previously this re-scanned services in-process, which both duplicated work
    # and merged that scan's issues into the HDI snapshot.
    if not ctx.upstream.ran('services'):
        ctx.issue(ctx.package, 'SERVICE_INDEX_INCOMPLETE')
        return
    complete = ctx.upstream.inventory_complete('services')
    index = defaultdict(list)
    for identifier, service in ctx.upstream.identified('services'):
        if service.get('type') != 'hdf' or service.get('executable', '').rsplit('/', 1)[-1] != 'hdf_devhost':
            continue
        try:
            host = host_argument(service)
            if host is not None:
                index[host].append((identifier, service))
        except ValueError:
            complete = False
            ctx.issue(ctx.package / service['cfg'], 'HOST_ARGUMENT_INVALID')
    if not complete:
        ctx.issue(ctx.package, 'SERVICE_INDEX_INCOMPLETE')
    for i, record in enumerate(records):
        ctx.progress('hdi-link', i, len(records), record['hcb'])
        path, pointer, process = ctx.package / record['hcb'], record['node'], record.get('process')
        if not isinstance(process, str) or not process:
            ctx.issue(path, 'HOST_NAME_INVALID', pointer)
            continue
        if not complete:
            continue
        hits = index.get(process, [])
        if len(hits) != 1:
            ctx.issue(path, 'SERVICE_UNMATCHED' if not hits else 'SERVICE_AMBIGUOUS', pointer)
        elif not isinstance(hits[0][1].get('name'), str) or not hits[0][1]['name']:
            ctx.issue(path, 'SERVICE_NAME_INVALID', pointer)
        else:
            identifier, host_service = hits[0]
            record['service'] = dict(cfg=host_service['cfg'], name=host_service['name'])
            record['service_id'] = identifier
            if record['service']['name'] != process:
                ctx.issue(path, 'PROCESS_NAME_MISMATCH', pointer)
