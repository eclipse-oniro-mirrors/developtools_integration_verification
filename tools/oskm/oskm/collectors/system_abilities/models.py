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
"""SA requests, immutable results and small query contracts."""
from dataclasses import dataclass
from ...core.models import FieldPredicate, ScanRequest, ScanResult

# Field-identical across domains, so the shared contract is used directly.
SAScanRequest = ScanRequest


@dataclass(frozen=True)
class SAResult(ScanResult):
    FIELD = 'sas'
    QUERY = '.query:SAQuery'

    @property
    def sas(self):
        return self.records


@dataclass(frozen=True)
class SAFilter:
    ids: tuple[int, ...] = ()
    processes: tuple[str, ...] = ()
    components: tuple[str, ...] = ()
    subsystems: tuple[str, ...] = ()
    profiles: tuple[str, ...] = ()
    service_names: tuple[str, ...] = ()
    fields: tuple[FieldPredicate, ...] = ()


@dataclass(frozen=True)
class SAAggregatePage:
    groups: tuple
    denominator: int
    matched_sa_count: int
    total_groups: int
    next_cursor: str | None
