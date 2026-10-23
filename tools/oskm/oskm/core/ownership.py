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
"""Bind a candidate component to a components dependency entry.

The "nearest component for a GN label" rule lives here because it is a question
about the components index, and three domains ask it. It replaced walking the
source tree for the closest bundle.json: the index already records every
component's manifest path, and truncating that at the last '/' works for
ohos.build manifests too, which a bundle.json-only walk cannot see at all.
"""


def manifest_directories(index):
    """{manifest directory: component row} for a components index."""
    found = {}
    for row in (index or {}).values():
        manifest = row.get('manifest')
        if isinstance(manifest, str) and '/' in manifest:
            found[manifest.rsplit('/', 1)[0]] = row
    return found


def nearest_component(directories, label):
    """The component whose manifest directory is the longest prefix of a GN
    label's directory, or None."""
    if not isinstance(label, str) or not label.startswith('//'):
        return None
    parts = label[2:].split(':')[0].split('/')
    for depth in range(len(parts), 0, -1):
        found = directories.get('/'.join(parts[:depth]))
        if found is not None:
            return found
    return None


def bind_component(ctx, location, pointer, name, index):
    if index is None or name is None:
        return None
    part = index.get(name)
    if part is None:
        ctx.issue(location, 'COMPONENT_NOT_REGISTERED', pointer)
        return None
    return {key: part[key] for key in ('name', 'subsystem', 'manifest') if key in part}


def resolve_component(ctx, location, pointer, name, index):
    """Confirm a candidate component name exists, returning its row id or None.

    The normalised counterpart of bind_component: records store only the foreign
    key, and the published {name, subsystem, manifest} object is rebuilt by
    joining the components table on read. Keeping the copy in the row would go
    stale as soon as a single collector is re-run against an updated components
    table (see --reuse-upstream).
    """
    if index is None or name is None:
        return None
    if name not in index:
        ctx.issue(location, 'COMPONENT_NOT_REGISTERED', pointer)
        return None
    return index[name]['id']
