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
"""HDI requests, immutable results and small query contracts."""
from dataclasses import dataclass
from ...core.models import FieldPredicate, ScanRequest, ScanResult

# Field-identical across domains, so the shared contract is used directly.
HDIScanRequest = ScanRequest


@dataclass(frozen=True)
class HDIResult(ScanResult):
    FIELD = 'hdis'
    QUERY = '.query:HDIQuery'

    @property
    def hdis(self):
        return self.records


@dataclass(frozen=True)
class HDIFilter:
    names: tuple[str, ...] = ()
    modules: tuple[str, ...] = ()
    processes: tuple[str, ...] = ()
    components: tuple[str, ...] = ()
    subsystems: tuple[str, ...] = ()
    hcbs: tuple[str, ...] = ()
    libraries: tuple[str, ...] = ()
    service_names: tuple[str, ...] = ()
    fields: tuple[FieldPredicate, ...] = ()


@dataclass(frozen=True)
class HDIAggregatePage:
    groups: tuple
    denominator: int
    matched_hdi_count: int
    total_groups: int
    next_cursor: str | None
