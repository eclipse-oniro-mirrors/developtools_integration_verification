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
"""Source-only bundle/ohos.build adapters, retaining declarations verbatim."""
from ...core.io import InputFailure, parse_json, pointer
from ...core.query import equal

BUILD_KEYS = ('module_list', 'inner_kits', 'inner_api', 'test_list', 'conditions')
RAW_KEYS = ('deps', 'build', 'features', 'syscap')


def read_manifest(inputs, path):
    key = path.resolve()
    if key not in inputs.cache:
        inputs.check()
        try:
            data = inputs.read_source(path)
            obj, duplicates = parse_json(data)
            result = (
                None, [
                    dict(
                        code='MANIFEST_JSON', pointer=ptr, details=dict(
                            reason='DUPLICATE_JSON_KEY')) for ptr in duplicates]) if duplicates else (
                obj, None)
        except InputFailure as exc:
            result = (None, [dict(code='MANIFEST_LIMIT' if exc.code == 'SIZE_LIMIT' else 'MANIFEST_UNREADABLE')])
        except (ValueError, UnicodeError, RecursionError):
            result = (None, [dict(code='MANIFEST_JSON')])
        inputs.cache[key] = result
    return inputs.cache[key]


def string_array(value):
    return isinstance(value, list) and all(isinstance(item, str) for item in value)


def check_fields(record, locations, issue):
    for key in RAW_KEYS:
        if key not in record:
            continue
        value = record[key]
        valid = isinstance(value, dict) if key in ('deps', 'build') else string_array(value)
        if not valid:
            issue('SOURCE_FIELD_TYPE', locations[key])
            continue
        if key == 'deps':
            for field in ('components', 'third_party'):
                if field in value and not string_array(value[field]):
                    issue('SOURCE_FIELD_TYPE', locations[key] + '/' + field)
        if key == 'build':
            for field, raw in value.items():
                valid = True
                if field in ('sub_component', 'modules', 'module_list', 'test', 'test_list'):
                    valid = string_array(raw)
                elif field == 'group_type':
                    valid = isinstance(raw, dict) and all(string_array(items) for items in raw.values())
                elif field in ('inner_kits', 'inner_api'):
                    valid = isinstance(raw, list) and all(
                        isinstance(item, dict) and isinstance(item.get('name'), str) for item in raw)
                elif field == 'conditions':
                    valid = isinstance(raw, dict)
                if not valid:
                    issue('SOURCE_FIELD_TYPE', locations[key] + '/' + pointer(field))


def extract(inputs, record, path):
    """Extract component declarations from a manifest file."""
    name = record['name']
    record['manifest'] = path.relative_to(inputs.workspace).as_posix()
    obj, error = read_manifest(inputs, path)
    if error:
        for diagnostic in error:
            inputs.issue(path, component=name, **diagnostic)
        return
    if not isinstance(obj, dict):
        inputs.issue(path, 'MANIFEST_SHAPE', component=name)
        return
    bundle = path.name == 'bundle.json'
    prefix = '/component' if bundle else '/parts/' + pointer(name)
    source = _resolve_source(inputs, obj, name, path, bundle, prefix)
    if source is None:
        return
    _check_subsystem(inputs, record, source, obj, name, path, bundle, prefix)
    locations = _project_fields(inputs, record, source, name, path,
                                 bundle, prefix)
    check_fields(record, locations,
                  lambda code, ptr: inputs.issue(path, code, ptr,
                                                 component=name))


def _resolve_source(inputs, obj, name, path, bundle, prefix):
    """Find the source object in the manifest. Returns None on error."""
    if bundle:
        source = obj.get('component')
    else:
        parts = obj.get('parts')
        if not isinstance(parts, dict):
            inputs.issue(path, 'MANIFEST_SHAPE', '/parts',
                         component=name)
            return None
        if name not in parts:
            inputs.issue(path, 'COMPONENT_NAME_MISMATCH', prefix,
                         component=name)
            return None
        source = parts[name]
    if not isinstance(source, dict):
        inputs.issue(path, 'MANIFEST_SHAPE', prefix, component=name)
        return None
    if bundle and source.get('name') != name:
        inputs.issue(path, 'COMPONENT_NAME_MISMATCH',
                     prefix + '/name', component=name)
        return None
    return source


def _check_subsystem(inputs, record, source, obj, name, path, bundle,
                      prefix):
    """Verify the subsystem field against the index."""
    subsystem = (source.get('subsystem') if bundle
                 else obj.get('subsystem'))
    location = ('/component/subsystem' if bundle else '/subsystem')
    if not isinstance(subsystem, str) or not subsystem:
        inputs.issue(path, 'SOURCE_FIELD_TYPE', location,
                     component=name)
    elif 'subsystem' in record and subsystem != record['subsystem']:
        inputs.issue(path, 'SUBSYSTEM_DIFFERS', location,
                     severity='info', component=name, advisory=True,
                     details=dict(index_value=record['subsystem'],
                                  source_value=subsystem))


def _project_fields(inputs, record, source, name, path, bundle, prefix):
    """Copy declared fields into the record. Returns locations dict."""
    locations = {}
    if bundle:
        record['source'] = source
        for key in RAW_KEYS:
            if key in source:
                record[key] = source[key]
                locations[key] = prefix + '/' + key
    else:
        if 'deps' in source:
            record['deps'] = source['deps']
            locations['deps'] = prefix + '/deps'
        build = {key: source[key] for key in BUILD_KEYS
                 if key in source}
        if build:
            record['build'] = build
            locations['build'] = prefix
        for field, native in (('features', 'feature_list'),
                              ('syscap', 'system_capabilities')):
            key = native if native in source else field
            if key in source:
                record[field] = source[key]
                locations[field] = prefix + '/' + key
            if (native in source and field in source
                    and not equal(source[native], source[field])):
                inputs.issue(path, 'FIELD_ALIAS_CONFLICT',
                             prefix + '/' + field, component=name)
        basic = {key: record[key] for key in RAW_KEYS
                 if key in record}
        if basic:
            record['source'] = basic
    return locations
