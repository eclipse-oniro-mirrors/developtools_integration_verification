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
"""Shared scan context: request validation, lifecycle, diagnostics, tracking.

Subclasses customize through four class attributes (REQUEST_TYPE, REQUEST_TYPE_ERROR,
LIMITS_TYPE, REQUIRES_RESOLVE_COMPONENT) and one override point (_resolve_inputs),
instead of re-implementing __init__. issue()/degraded() are overridable for domains
whose quality model differs from "any issue means degraded" (see components).
"""
from pathlib import Path
from dataclasses import fields
from .io import read_bytes, parse_json, valid_product, InputFailure
from .models import RequestError, ScanFatalError, ScanCancelled, ScanProgress, freeze

READ_ERRORS = (InputFailure, ValueError, UnicodeError, RecursionError)


class BaseContext:
    INPUT_LIMIT_CODE = 'INPUT_COUNT_LIMIT'

    # Subclasses declare these; see services/hdi/system_abilities/components context.py.
    REQUEST_TYPE = None
    REQUEST_TYPE_ERROR = 'EXPECTED_SCAN_REQUEST'
    LIMITS_TYPE = None
    REQUIRES_RESOLVE_COMPONENT = False

    def __init__(self, request, progress, diagnostic, cancelled):
        if not isinstance(request, self.REQUEST_TYPE):
            raise RequestError(self.REQUEST_TYPE_ERROR)
        if not valid_product(request.product):
            raise RequestError('INVALID_PRODUCT')
        if not isinstance(request.limits, self.LIMITS_TYPE) or any(
                type(getattr(request.limits, f.name)) is not int or getattr(request.limits, f.name) <= 0
                for f in fields(self.LIMITS_TYPE)):
            raise RequestError('INVALID_LIMITS')
        if self.REQUIRES_RESOLVE_COMPONENT and type(request.resolve_component) is not bool:
            raise RequestError('INVALID_RESOLVE_COMPONENT')
        try:
            self.workspace = Path(request.workspace_root).resolve()
            if not self.workspace.is_dir():
                raise ValueError()
        except (TypeError, ValueError, OSError, RuntimeError) as exc:
            raise RequestError('INPUT_ROOT_MISSING') from exc
        self.request = request
        self.on_progress, self.on_diagnostic, self.cancelled = progress, diagnostic, cancelled
        self.issues, self.inputs, self.scan_directories = {}, set(), set()
        self._resolve_inputs(request)

    def _resolve_inputs(self, request):
        """Compute self.package (and any domain-specific roots), validating them.
        Must raise RequestError (not return a value) on an invalid/missing root."""
        raise NotImplementedError

    # ---- lifecycle ----
    def call(self, callback, *args):
        if callback is not None:
            try:
                return callback(*args)
            except Exception as exc:
                raise ScanFatalError('CALLBACK_FAILED') from exc

    def check(self):
        if self.call(self.cancelled):
            raise ScanCancelled('CANCELLED')

    def progress(self, phase, completed, total=None, path=None):
        self.check()
        self.call(self.on_progress, ScanProgress(phase, completed, total, path))

    # ---- issues ----
    def issue(self, path, code, pointer=None, **extra):
        relative = Path(path).relative_to(self.workspace).as_posix()
        row = dict(path=relative, code=code)
        if pointer is not None:
            row['pointer'] = pointer
        row.update(extra)
        key = self._issue_key(row)
        if key not in self.issues:
            self.issues[key] = row
            self.call(self.on_diagnostic, freeze(row))

    def _issue_key(self, row):
        return (row['path'], row.get('pointer', ''), row['code'])

    def degraded(self):
        """Any recorded issue means degraded; severity-aware subclasses override."""
        return bool(self.issues)

    # ---- input tracking / budget ----
    def track(self, paths):
        self.inputs.update(str(p) for p in paths)
        self._enforce_input_budget()

    def _enforce_input_budget(self):
        if len(self.inputs) > self.request.limits.input_files:
            raise ScanFatalError(self.INPUT_LIMIT_CODE)

    def read_json(self, path, limit, root):
        self.check()
        self.track((path,))
        obj, duplicates = parse_json(read_bytes(path, limit, root))
        if duplicates:
            raise InputFailure('DUPLICATE_JSON_KEY', path)
        return obj
