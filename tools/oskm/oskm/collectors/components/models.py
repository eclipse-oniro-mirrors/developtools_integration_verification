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
"""Small immutable component scan contracts; storage remains independent."""
from dataclasses import dataclass
from ...core.models import FieldPredicate, ScanRequest, ScanResult


# Field-identical across domains, so the shared contract is used directly.
ComponentScanRequest = ScanRequest


@dataclass(frozen=True)
class ComponentResult(ScanResult):
    FIELD = 'components'
    QUERY = '.query:ComponentQuery'

    @property
    def components(self):
        return self.records


@dataclass(frozen=True)
class ComponentFilter:
    names: tuple[str, ...] = ()
    subsystems: tuple[str, ...] = ()
    depends_on: tuple[str, ...] = ()
    fields: tuple[FieldPredicate, ...] = ()
