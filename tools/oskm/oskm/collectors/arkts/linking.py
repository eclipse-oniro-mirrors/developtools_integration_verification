"""Exact module matching, deliberately independent of compiler resolution.

Targets are logical modules, not files. A specifier names a module; which of
its declarations applies depends on the language variant being compiled, and
that is the consumer's question, not the scanner's. Resolving to files instead
made every dual-declared module ambiguous.
"""
import posixpath
import re
from .discovery import split
from .models import SUFFIXES


def resolve(specifier, source_path, modules, names, discovery_complete=True):
    result = dict(target_kind='module', resolution_status='not_found', resolution_method=None,
                  resolution_reason=None, candidate_keys=[])
    if specifier is None:
        return dict(result, target_kind='unknown', resolution_status='unsupported', resolution_reason='syntax_unsupported')
    if '\x00' in specifier or '\\' in specifier or specifier.startswith('/') or re.match(r'^[A-Za-z][\w+.-]*:', specifier):
        return dict(result, target_kind='unknown', resolution_status='unsupported', resolution_reason='invalid_path')
    if specifier.startswith('@kit.'):
        return dict(result, target_kind='kit', resolution_status='out_of_scope')
    if specifier.startswith(('@ohos.', '@system.', '@arkts.')):
        candidates = sorted(names.get(specifier, ()))
        result['resolution_method'] = 'named_exact'
    elif specifier.startswith(('./', '../')):
        target = posixpath.normpath(posixpath.join(posixpath.dirname(source_path), specifier))
        if target == '..' or target.startswith('../'):
            return dict(result, target_kind='unknown', resolution_status='unsupported', resolution_reason='outside_sdk')
        # A specifier may or may not spell the language suffix out; both forms
        # name the same module.
        if target.endswith(SUFFIXES):
            target = split(target)[0]
        candidates = [target] if target in modules else []
        result['resolution_method'] = 'relative_exact'
    else:
        return dict(result, target_kind='external', resolution_status='out_of_scope')
    result['candidate_keys'] = candidates
    if len(candidates) == 1:
        result.update(resolution_status='resolved', _module_key=candidates[0])
    elif len(candidates) > 1:
        result['resolution_status'] = 'ambiguous'
    elif not discovery_complete:
        result.update(resolution_status='unsupported', resolution_reason='discovery_incomplete')
    return result
