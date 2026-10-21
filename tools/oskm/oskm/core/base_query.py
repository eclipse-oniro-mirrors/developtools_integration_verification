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
"""Shared lifecycle and fingerprint logic for read-only domain query classes."""
from .io import canonical, digest
from .models import QueryError


class BaseQuery:
    def __init__(self, result):
        self._result = result
        self._fingerprint = digest(canonical(result.to_dict()))

    def _check(self):
        if self._result is None:
            raise QueryError('RESULT_CLOSED')

    @property
    def snapshot(self):
        self._check()
        return self._result.snapshot

    def __enter__(self):
        self._check()
        return self

    def __exit__(self, *_):
        self.close()

    def close(self):
        self._result = None
