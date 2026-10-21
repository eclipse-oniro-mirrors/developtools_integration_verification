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
"""Install-module scan contracts; field-identical to the shared ones."""
from dataclasses import dataclass

from ...core.models import FieldPredicate, ScanRequest, ScanResult

InstallModuleScanRequest = ScanRequest


@dataclass(frozen=True)
class InstallModuleResult(ScanResult):
    FIELD = 'install_modules'
    QUERY = '.query:InstallModuleQuery'

    @property
    def install_modules(self):
        return self.records


@dataclass(frozen=True)
class InstallModuleFilter:
    """components / subsystems filter on the joined component, never on SMI's
    own part_name / subsystem_name -- those disagree with the build index."""
    labels: tuple[str, ...] = ()
    types: tuple[str, ...] = ()
    partitions: tuple[str, ...] = ()
    dests: tuple[str, ...] = ()
    tags: tuple[str, ...] = ()
    components: tuple[str, ...] = ()
    subsystems: tuple[str, ...] = ()
    fields: tuple[FieldPredicate, ...] = ()


@dataclass(frozen=True)
class InstallModuleAggregatePage:
    groups: tuple
    denominator: int
    matched_module_count: int
    total_groups: int
    next_cursor: str | None
