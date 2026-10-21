"""GN label parsing shared by declaration collectors.

The nearest-bundle walk that used to live here is gone: ownership is resolved
against the components index instead (core/ownership.py: nearest_component),
which needs no source-tree reads and also sees ohos.build components.
"""
import re

LABEL = re.compile(r'^(//[^():\s]*:[^():\s]+)(?:\((//[^():\s]*:[^():\s]+)\))?$')

def strip_label(value):
    if not isinstance(value, str) or any(c in value for c in '\\\x00'):
        return None
    match = LABEL.fullmatch(value)
    if not match:
        return None
    for label in filter(None, match.groups()):
        directory = label[2:].split(':')[0]
        if directory and any(p in ('', '.', '..') for p in directory.split('/')):
            return None
    return match[1]

