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
"""Service-specific scan contracts; shared primitives remain in core.models."""
from dataclasses import dataclass, field
from ...core.models import FieldPredicate, PageRequest, ScanRequest, ScanResult

BASIC_FIELDS = ('name', 'uid', 'gid', 'start-mode', 'ondemand')


# Field-identical across domains, so the shared contract is used directly.
ServiceScanRequest = ScanRequest


@dataclass(frozen=True)
class ServiceResult(ScanResult):
    FIELD = 'services'
    QUERY = '.query:ServiceQuery'

    @property
    def services(self):
        return self.records


@dataclass(frozen=True)
class ServiceFilter:
    cfgs: tuple[str, ...] = ()
    partitions: tuple[str, ...] = ()
    types: tuple[str, ...] = ()
    components: tuple[str, ...] = ()
    subsystems: tuple[str, ...] = ()
    fields: tuple[FieldPredicate, ...] = ()


@dataclass(frozen=True)
class ServiceAggregateRequest:
    filters: ServiceFilter = field(default_factory=ServiceFilter)
    group_by: tuple[str, ...] = ('partition',)
    grain: str = 'service'
    resource_field: str | None = None
    page: PageRequest = field(default_factory=PageRequest)


@dataclass(frozen=True)
class ServiceAggregatePage:
    groups: tuple
    denominator: int
    matched_service_count: int
    total_groups: int
    next_cursor: str | None
