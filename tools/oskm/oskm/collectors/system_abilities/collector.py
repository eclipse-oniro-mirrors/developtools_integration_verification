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
"""SA collector: installed SystemAbility profile declarations, joined to their
host service and owning component.

Both dependencies arrive through the database; neither is re-scanned.
"""
from .discovery import profile_paths, profile_elements
from .records import SHAPE
from .linking import link_services
from .ownership import Ownership, link_installs
from . import quality
from .models import SAScanRequest, SAResult
from ...core.framework import ElementCollector, ScanContext, register
from ...core.models import RequestError
from oskm_schema.sas import SAS

# column, declared key, how the column holds it. Keys resolve against the
# record first and its config bucket second, so one table covers both levels.
FIELDS = (('profile', 'profile', 'text'), ('sa_id', 'name', 'int'),
          ('libpath', 'libpath', 'text'),
          ('run_on_create', 'run-on-create', 'bool'),
          ('distributed', 'distributed', 'bool'),
          ('dump_level', 'dump_level', 'int'), ('auto_restart', 'auto-restart', 'bool'))


class SAContext(ScanContext):
    def setup(self):
        if not self.package.is_dir():
            raise RequestError('INPUT_ROOT_MISSING')
        self.directory = self.package / 'system/profile'
        # Initialised here, not in sources(): any path that returns before
        # reading profiles (a missing directory) still owes enrich() a states
        # map, and profile_elements() a denominator.
        self.states = {}
        self.total_profiles = 0
        # A product that installs no SA profiles is a scope difference, not a
        # bad request: degrade this domain and let the other collectors run.
        self.profile_available = self.directory.is_dir()
        if self.profile_available and (
                (self.package / 'system').is_symlink() or self.directory.is_symlink()):
            raise RequestError('PROFILE_DIRECTORY_SYMLINK')
        self.scan_directories = {str(self.directory)}


@register
class SACollector(ElementCollector):
    NAME = 'sas'
    DESCRIPTION = 'Extract OpenHarmony SystemAbility declarations'
    DEPENDS_ON = ('services', 'components', 'install_modules')
    SCHEMA_VERSION = '2.1.0'
    TABLES = (SAS,)
    CONTEXT_TYPE = SAContext
    REQUEST_TYPE = SAScanRequest
    REQUEST_TYPE_ERROR = 'EXPECTED_SA_SCAN_REQUEST'
    RESULT_TYPE = SAResult
    RESULT_FIELD = 'sas'
    COMPONENT_COLUMN = 'component_id'
    SERVICE_COLUMN = 'service_id'
    INSTALL_COLUMN = 'install_module_id'
    EXPORT_ORDER = 'position'
    SHAPE = SHAPE
    FIELDS = FIELDS
    LINK_COLUMNS = ('service_id', 'component_id', 'install_module_id')

    def sources(self, ctx):
        if not ctx.profile_available:
            # No installed profiles: record why this domain is empty and stay
            # degraded, so the rest of the scan (and its dependents) still run.
            ctx.issue(ctx.directory, 'SA_PROFILE_UNAVAILABLE',
                      details={'reason': 'missing'})
            return []
        paths = profile_paths(ctx)
        if not paths:
            # The directory is there and readable, it just installs nothing:
            # read perfectly, so advisory, and the scan stays complete.
            ctx.issue(ctx.directory, 'SA_PROFILE_UNAVAILABLE', severity='info',
                      advisory=True, details={'reason': 'empty'})
        return paths

    def elements(self, ctx, path):
        return profile_elements(ctx, path)

    def enrich(self, ctx, records):
        link_services(ctx, records, ctx.states)
        if not records:
            return
        # Explicit: an empty index means "ran, found nothing" and must still
        # report unregistered names; only False (deselected) becomes None.
        index = ctx.component_index(location=ctx.package)
        ownership = Ownership(ctx, None if index is False else index)
        for i, (record, pointer) in enumerate(records):
            ctx.progress('sa-ownership', i, len(records), record['profile'])
            ownership.apply(record, pointer)
        link_installs(ctx, records)

    def quality(self, ctx, records):
        quality.check(ctx, records)

    def scope(self, ctx):
        return ['system/profile']
