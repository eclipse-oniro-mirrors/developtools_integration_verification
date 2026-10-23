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
