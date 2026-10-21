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
"""Device attributes are kept separately from host and installation metadata."""
from ...core.models import UNSET

PRIMARY_FIELDS = ('serviceName', 'moduleName', 'policy', 'preload')


def field_value(record, name):
    return record.get(name, UNSET) if name in PRIMARY_FIELDS else record.get('config', {}).get(name, UNSET)


def raw_hdi(record):
    return {**{k: record[k] for k in PRIMARY_FIELDS if k in record}, **record.get('config', {})}


def make_record(hcb, node, host, raw):
    result = dict(hcb=hcb, node=node, **{k: raw[k] for k in PRIMARY_FIELDS if k in raw})
    if 'hostName' in host:
        result['process'] = host['hostName']
    extra = {k: v for k, v in raw.items() if k not in PRIMARY_FIELDS}
    if extra:
        result['config'] = extra
    return result
