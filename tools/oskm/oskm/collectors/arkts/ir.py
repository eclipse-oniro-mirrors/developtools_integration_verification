"""Typed IR validators, separate from subprocess transport and database projection.

Validation is registered per capability, matching the backend where each
extractor carries its own `validate`. Adding a fact means adding one function
and one registry entry on each side; neither the transport nor the envelope
check learns about API declaration kinds. Unknown profiles, unknown facts and
missing required fields all fail closed.
"""
from ...core.models import ScanFatalError
from .models import CAPABILITIES, CONDITIONS

# Capabilities that produce a fact partition. source.utf8_spans is a shared
# conversion, reported in coverage but never carrying facts of its own.
FACT_CAPABILITIES = tuple(name for name in CAPABILITIES if name != 'source.utf8_spans')


def _require(condition, code='BACKEND_PROTOCOL_INVALID'):
    if not condition:
        raise ScanFatalError(code)


class Evidence:
    """Shared span checking and the cross-fact state validators agree on."""

    def __init__(self, data, coverage):
        self.data = data
        self.coverage = coverage
        self.statements = set()     # kit.references spans, re-checked by condition.top_level

    def span(self, value, *, empty=False):
        _require(type(value) is list and len(value) == 2 and all(type(v) is int for v in value))
        start, end = value
        _require(0 <= start <= end <= len(self.data) and (empty or start < end))
        for offset in value:
            _require(offset == len(self.data) or self.data[offset] & 0xc0 != 0x80)

    def events(self, values, *, directives=False):
        _require(type(values) is list)
        for value in values:
            _require(type(value) is dict)
            if value.get('kind') in ('static_suffix', 'use_static') and not directives:
                _require(set(value) == {'kind', 'span'})
                if value['kind'] == 'use_static':
                    self.span(value['span'])
                else:
                    _require(value['span'] is None)
            else:
                _require(set(value) == {'kind', 'value', 'span', 'interior'})
                _require(value['kind'] in ('if', 'endif', 'else', 'elif') and type(value['value']) is str)
                _require(type(value['interior']) is bool)
                self.span(value['span'])


def _validate_header(header, evidence):
    _require(type(header) is dict and set(header) == {'status', 'span', 'tags', 'file_condition', 'condition_evidence'})
    _require(header['status'] in ('ok', 'no_tag', 'partial', 'failed'))
    _require(header['file_condition'] in CONDITIONS and type(header['condition_evidence']) is list)
    evidence.events(header['condition_evidence'])
    if evidence.coverage['file.header']['status'] == 'complete':
        _require(header['status'] in ('ok', 'no_tag'))
    evidence.span(header['span'], empty=True)
    _require(header['span'][0] == 0 and type(header['tags']) is list)
    for tag in header['tags']:
        _require(type(tag) is dict and set(tag) == {'name', 'value', 'span', 'evidence_state'})
        _require(tag['name'] in ('file', 'kit') and type(tag['value']) is str and len(tag['value'].encode()) <= 16384)
        _require(tag['evidence_state'] in ('confirmed', 'candidate'))
        evidence.span(tag['span'])
        _require(tag['span'][1] <= header['span'][1])


def _validate_kit_references(references, evidence):
    _require(type(references) is list and len(references) <= 20000)
    if evidence.coverage['kit.references']['status'] == 'failed':
        _require(not references)
    for reference in references:
        _require(type(reference) is dict and set(reference) == {
            'specifier', 'statement_kind', 'statement_span', 'target_span', 'evidence_state'})
        _require(reference['statement_kind'] in ('import_from', 'side_effect_import', 'export_from', 'unsupported'))
        _require(reference['evidence_state'] in ('confirmed', 'candidate'))
        evidence.span(reference['statement_span'])
        key = tuple(reference['statement_span'])
        _require(key not in evidence.statements)
        evidence.statements.add(key)
        if reference['statement_kind'] == 'unsupported':
            _require(reference['specifier'] is None and reference['target_span'] is None
                     and reference['evidence_state'] == 'candidate')
        else:
            _require(type(reference['specifier']) is str and len(reference['specifier'].encode()) <= 16384)
            evidence.span(reference['target_span'])
            _require(reference['statement_span'][0] <= reference['target_span'][0]
                     < reference['target_span'][1] <= reference['statement_span'][1])


def _validate_conditions(condition, evidence):
    _require(type(condition) is dict and set(condition) == {'directives', 'references'})
    _require(type(condition['directives']) is list and type(condition['references']) is list)
    evidence.events(condition['directives'], directives=True)
    mapped = set()
    for item in condition['references']:
        _require(type(item) is dict and set(item) == {'statement_span', 'condition_state', 'condition_evidence'})
        _require(item['condition_state'] in CONDITIONS and type(item['condition_evidence']) is list)
        evidence.events(item['condition_evidence'])
        key = tuple(item['statement_span'])
        # Every condition must attach to a statement kit.references reported.
        _require(key in evidence.statements and key not in mapped)
        mapped.add(key)
    if evidence.coverage['condition.top_level']['status'] in ('complete', 'partial'):
        _require(mapped == evidence.statements)


FACT_VALIDATORS = {'file.header': _validate_header, 'kit.references': _validate_kit_references,
                   'condition.top_level': _validate_conditions}


def _validate_module_kit(result, request, data):
    """Validate evidence boundaries before a result can reach a projection."""
    _require(type(result) is dict and set(result) == {
        'type', 'id', 'path', 'sha256', 'profile', 'ir_schema_version', 'coverage',
        'facts', 'diagnostics', 'diagnostic_count', 'diagnostics_omitted'})
    for key in ('id', 'path', 'sha256', 'profile', 'ir_schema_version'):
        _require(result[key] == request[key])
    _require(result['type'] == 'result' and type(result['id']) is int)
    coverage, facts = result['coverage'], result['facts']
    _require(type(coverage) is dict and set(coverage) == set(CAPABILITIES))
    _require(type(facts) is dict and not set(facts) - set(FACT_CAPABILITIES))
    for feature, value in coverage.items():
        _require(type(value) is dict and set(value) == {'status', 'extractor_version'})
        _require(value['status'] in ('complete', 'partial', 'failed', 'unsupported', 'not_requested'))
        _require(value['extractor_version'] == '1.0.0')
        if value['status'] == 'not_requested':
            _require(feature not in facts)
        elif feature in FACT_CAPABILITIES and value['status'] in ('complete', 'partial'):
            _require(feature in facts)
    if request['file_role'] == 'module':
        _require(all(coverage[f]['status'] == 'not_requested' for f in ('kit.references', 'condition.top_level')))
    _require(coverage['source.utf8_spans']['status'] == 'complete')

    def walk(value):
        if isinstance(value, dict):
            for key, child in value.items():
                if key == 'span' or key.endswith('_span'):
                    if child is not None:
                        evidence.span(child, empty=True)
                else:
                    walk(child)
        elif isinstance(value, list):
            for child in value:
                walk(child)
    evidence = Evidence(data, coverage)
    walk(result)
    # Declaration order, so a fact that cross-checks an earlier one sees it.
    for feature in FACT_CAPABILITIES:
        if feature in facts:
            FACT_VALIDATORS[feature](facts[feature], evidence)
    _require(type(result['diagnostics']) is list and len(result['diagnostics']) <= 100)
    _require(type(result['diagnostic_count']) is int and type(result['diagnostics_omitted']) is int)
    _require(result['diagnostic_count'] == len(result['diagnostics']) + result['diagnostics_omitted']
             and result['diagnostics_omitted'] >= 0)
    for diagnostic in result['diagnostics']:
        _require(type(diagnostic) is dict and set(diagnostic) == {
            'code', 'category', 'feature', 'extractor_id', 'message', 'span', 'details'})
        _require(all(type(diagnostic[k]) is str for k in ('code', 'category', 'feature', 'extractor_id', 'message')))
        _require(diagnostic['feature'] in CAPABILITIES and type(diagnostic['details']) is dict)
        _require(diagnostic['extractor_id'] == diagnostic['feature'] and diagnostic['category'] in ('info', 'warning', 'error'))
    return result


PROFILE_VALIDATORS = {'module_kit_v1': _validate_module_kit}


def validate_result(result, request, data):
    validator = PROFILE_VALIDATORS.get(request['profile'])
    _require(validator is not None, 'PROFILE_UNSUPPORTED')
    return validator(result, request, data)
