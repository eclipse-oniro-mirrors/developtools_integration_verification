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
"""ELF-module scan and query contracts."""
from dataclasses import dataclass

from ...core.models import FieldPredicate, ScanRequest, ScanResult


ElfModuleScanRequest = ScanRequest


@dataclass(frozen=True)
class ElfModuleResult(ScanResult):
    FIELD = 'elf_modules'
    QUERY = '.query:ElfModuleQuery'

    @property
    def elf_modules(self):
        return self.records


@dataclass(frozen=True)
class ElfModuleFilter:
    dests: tuple[str, ...] = ()
    partitions: tuple[str, ...] = ()
    file_names: tuple[str, ...] = ()
    sonames: tuple[str, ...] = ()
    formats: tuple[str, ...] = ()
    api_types: tuple[str, ...] = ()
    categories: tuple[str, ...] = ()
    components: tuple[str, ...] = ()
    subsystems: tuple[str, ...] = ()
    fields: tuple[FieldPredicate, ...] = ()
