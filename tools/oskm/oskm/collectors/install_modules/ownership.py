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
"""Attribution: which component owns each installed module.

Resolved entirely against the components table -- no source-tree reads. The
"nearest bundle" of a GN label is the component whose manifest directory is the
longest prefix of the label's directory, which the build index already knows.
Measured on rk3568: identical to walking the filesystem for bundle.json on 2673
of 2690 label directories, better on the other 17 (ohos.build components, which
a bundle.json-only walk cannot see), never different.
"""
from ...core.ownership import resolve_component
from ...core.provenance import strip_label


def directories(index):
    """{manifest directory: component row}. Truncating at the last '/' works for
    both bundle.json and ohos.build; stripping a literal '/bundle.json' would
    silently skip every ohos.build component."""
    found = {}
    for row in index.values():
        manifest = row.get('manifest')
        if isinstance(manifest, str) and '/' in manifest:
            found[manifest.rsplit('/', 1)[0]] = row
    return found


def nearest(label, by_directory):
    parts = label[2:].split(':')[0].split('/')
    for depth in range(len(parts), 0, -1):
        found = by_directory.get('/'.join(parts[:depth]))
        if found is not None:
            return found
    return None


def declared_part(value):
    """part_name as a single usable name, or None.

    A comma-separated value names several components; the scan does not pick a
    primary one, it reports the ambiguity and leaves the module unattributed.
    """
    return value if isinstance(value, str) and value and ',' not in value else None


def attribute(ctx, records, index, path):
    """Set record['component_id'] on every row it can resolve.

    The stripped label is deliberately *not* written back: `record` must stay
    the declaration verbatim so SHAPE.raw() reproduces the SMI row. The column
    derives it independently (see the collector's columns()), and the published
    record picks it up through OVERLAY at export.
    """
    by_directory = directories(index) if index else {}
    for record, pointer in records:
        raw_label = record.get('label')
        label = strip_label(raw_label) if raw_label is not None else None
        if raw_label is not None and label is None:
            ctx.issue(path, 'MODULE_LABEL_INVALID', f'{pointer}/label',
                      severity='warning', advisory=True)
        if index is None:
            continue
        owner = nearest(label, by_directory) if label is not None else None
        declared = declared_part(record.get('part_name'))
        if owner is not None and declared and owner['name'] != declared:
            # Both sources name a component and disagree. The label's bundle
            # wins -- it is where the target actually lives -- but the build
            # system's own claim is reported rather than discarded.
            ctx.issue(path, 'MODULE_COMPONENT_CONFLICT', f'{pointer}/part_name',
                      severity='warning', advisory=True, component=owner['name'],
                      details=dict(bundle=owner['name'], part_name=declared))
        name = owner['name'] if owner is not None else declared
        if name is None:
            code = ('MODULE_PART_AMBIGUOUS' if isinstance(record.get('part_name'), str)
                    and ',' in record['part_name'] else 'MODULE_COMPONENT_UNRESOLVED')
            ctx.issue(path, code, f'{pointer}/part_name', severity='warning',
                      advisory=True, details=dict(part_name=record.get('part_name')))
            continue
        identifier = resolve_component(ctx, path, f'{pointer}/part_name', name, index)
        if identifier is None:
            continue
        record['component_id'] = identifier
        subsystem = record.get('subsystem_name')
        owning = index[name].get('subsystem')
        if isinstance(subsystem, str) and subsystem and subsystem != owning:
            # SMI carries a third copy of the subsystem; the build index wins.
            # Reported, not stored: this is exactly why there is no column.
            ctx.issue(path, 'MODULE_SUBSYSTEM_DIFFERS', f'{pointer}/subsystem_name',
                      severity='info', advisory=True, component=name,
                      details=dict(declared=subsystem, component=owning))
