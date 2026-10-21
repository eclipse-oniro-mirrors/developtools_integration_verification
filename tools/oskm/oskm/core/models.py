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
"""Small immutable scan and query primitives genuinely shared by every domain.

Domain-specific Request/Result/Filter contracts live in each collector's own
models.py (oskm/collectors/<domain>/models.py), not here. This module only
holds what every one of services/components/hdi/system-abilities needs
identically: exceptions, the UNSET sentinel, (de)serialization helpers,
progress/artifact/predicate/pagination shapes.
"""
from dataclasses import dataclass, field, fields, is_dataclass
from pathlib import Path
from collections.abc import Mapping
from types import MappingProxyType


class ScanError(Exception):
    pass


class RequestError(ScanError):
    pass


class ScanFatalError(ScanError):
    pass


class ScanCancelled(ScanError):
    pass


class PublishError(ScanError):
    pass


class QueryError(ScanError):
    pass


class ResultError(ScanError):
    pass


class Unset:
    def __repr__(self):
        return 'UNSET'


UNSET = Unset()


def freeze(value):
    if isinstance(value, Mapping):
        return MappingProxyType({k: freeze(v) for k, v in value.items()})
    if isinstance(value, (list, tuple)):
        return tuple(freeze(v) for v in value)
    return value


def thaw(value):
    if is_dataclass(value):
        return {f.name: thaw(getattr(value, f.name)) for f in fields(value) if not f.name.startswith('_')}
    if isinstance(value, Mapping):
        return {k: thaw(v) for k, v in value.items()}
    if isinstance(value, (list, tuple)):
        return [thaw(v) for v in value]
    return value


@dataclass(frozen=True)
class ScanProgress:
    phase: str
    completed: int
    total: int | None = None
    current_input: str | None = None


@dataclass(frozen=True)
class PublishedArtifact:
    path: Path
    size_bytes: int


@dataclass(frozen=True)
class ValidationReport:
    valid: bool
    issues: tuple = ()


@dataclass(frozen=True)
class ReaderLimits:
    artifact_bytes: int = 512 * 1024 * 1024


@dataclass(frozen=True)
class FieldPredicate:
    name: str
    op: str
    value: object = UNSET
    pointer: str = ''


@dataclass(frozen=True)
class PageRequest:
    limit: int = 100
    cursor: str | None = None


@dataclass(frozen=True)
class Page:
    items: tuple
    positions: tuple[int, ...]
    total: int
    next_cursor: str | None


@dataclass(frozen=True)
class ScanLimits:
    """One global budget, replacing the per-domain Limits classes whose fields had
    drifted apart (HDI and SA passed different cfg byte caps for the same files).

    file_bytes caps any single read; total_bytes caps the whole scan (components'
    cumulative budget, generalised to every domain); input_files caps how many
    distinct files one collector may touch.
    """
    file_bytes: int = 128 * 1024 * 1024
    total_bytes: int = 2 * 1024 * 1024 * 1024
    input_files: int = 100_000
    tree_depth: int = 128
    tree_items: int = 100_000


@dataclass(frozen=True)
class ScanResult:
    """Immutable scan output. Subclasses name the record collection via FIELD and
    expose it under that name; everything else (freezing, to_dict, query) is the
    same for every domain and lives here."""
    FIELD = 'records'
    QUERY = None                 # "module:ClassName", imported lazily

    snapshot: Mapping
    records: tuple[Mapping, ...]
    _input_paths: tuple[str, ...] = ()
    _scan_directories: tuple[str, ...] = ()

    def __post_init__(self):
        object.__setattr__(self, 'snapshot', freeze(self.snapshot))
        object.__setattr__(self, 'records', freeze(self.records))

    def to_dict(self):
        return {'snapshot': thaw(self.snapshot), type(self).FIELD: thaw(self.records)}

    def query(self):
        import importlib
        module, _, name = type(self).QUERY.partition(':')
        # Relative to the subclass's own package, not to core.
        package = type(self).__module__.rpartition('.')[0]
        return getattr(importlib.import_module(module, package), name)(self)


@dataclass(frozen=True)
class ScanRequest:
    """Shared across collectors. Domain-specific switches go in `options`, keyed by
    collector name, so adding one does not change this contract."""
    workspace_root: Path
    product: str
    package_root: Path | None = None
    limits: ScanLimits = field(default_factory=ScanLimits)
    resolve_component: bool = True
    options: Mapping = field(default_factory=dict)

    def __post_init__(self):
        object.__setattr__(self, 'options', freeze(self.options))

    def option(self, collector, name, default=None):
        return self.options.get(collector, {}).get(name, default)
