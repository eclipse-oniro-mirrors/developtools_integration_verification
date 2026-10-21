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
            result = (None, [dict(code='MANIFEST_JSON', pointer=ptr,
                                  details=dict(reason='DUPLICATE_JSON_KEY')) for ptr in duplicates]) if duplicates else (obj, None)
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
    if bundle:
        source = obj.get('component')
    else:
        parts = obj.get('parts')
        if not isinstance(parts, dict):
            inputs.issue(path, 'MANIFEST_SHAPE', '/parts', component=name)
            return
        if name not in parts:
            inputs.issue(path, 'COMPONENT_NAME_MISMATCH', prefix, component=name)
            return
        source = parts[name]
    if not isinstance(source, dict):
        inputs.issue(path, 'MANIFEST_SHAPE', prefix, component=name)
        return
    if bundle and source.get('name') != name:
        inputs.issue(path, 'COMPONENT_NAME_MISMATCH', prefix + '/name', component=name)
        return
    subsystem = source.get('subsystem') if bundle else obj.get('subsystem')
    location = '/component/subsystem' if bundle else '/subsystem'
    if not isinstance(subsystem, str) or not subsystem:
        inputs.issue(path, 'SOURCE_FIELD_TYPE', location, component=name)
    elif 'subsystem' in record and subsystem != record['subsystem']:
        # Advisory: both files were read perfectly, they simply disagree. The
        # index wins, and the disagreement is a fact about the product.
        inputs.issue(path, 'SUBSYSTEM_DIFFERS', location, severity='info', component=name,
                     advisory=True,
                     details=dict(index_value=record['subsystem'], source_value=subsystem))
    locations = {}
    if bundle:
        # The whole component object is kept verbatim; the projections below are
        # only an index over it. ohos.build keeps the historical minimal subset:
        # that format is being retired, so it is not worth preserving in full.
        record['source'] = source
        for key in RAW_KEYS:
            if key in source:
                record[key] = source[key]
                locations[key] = prefix + '/' + key
    else:
        if 'deps' in source:
            record['deps'] = source['deps']
            locations['deps'] = prefix + '/deps'
        build = {key: source[key] for key in BUILD_KEYS if key in source}
        if build:
            record['build'] = build
            locations['build'] = prefix
        for field, native in (('features', 'feature_list'), ('syscap', 'system_capabilities')):
            key = native if native in source else field
            if key in source:
                record[field] = source[key]
                locations[field] = prefix + '/' + key
            if native in source and field in source and not equal(source[native], source[field]):
                inputs.issue(path, 'FIELD_ALIAS_CONFLICT', prefix + '/' + field, component=name)
        # Same column as the bundle.json path, holding the minimal subset this
        # retired format is kept at, so no field needs a column of its own.
        basic = {key: record[key] for key in RAW_KEYS if key in record}
        if basic:
            record['source'] = basic
    check_fields(record, locations, lambda code, ptr: inputs.issue(path, code, ptr, component=name))
