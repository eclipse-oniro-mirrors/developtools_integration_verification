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
"""Advisory checks on component manifests that were read correctly.

Raised with advisory=True: the manifest parsed fine, but it declares a
dependency on a component this product does not build. Checked against the build
index, which is read before any manifest, so the finding lands on the manifest
and element that declared it rather than on the scan as a whole.
"""
from collections.abc import Mapping


def check_deps(ctx, component, record, path, prefix, known):
    deps = record.get('deps')
    refs = deps.get('components') if isinstance(deps, Mapping) else None
    if not isinstance(refs, (list, tuple)):
        return
    for index, ref in enumerate(refs):
        if isinstance(ref, str) and ref not in known:
            ctx.issue(path, 'COMPONENT_DEP_UNRESOLVED',
                      f'{prefix}/deps/components/{index}', severity='warning',
                      component=component, advisory=True, details=dict(unresolved=ref))
