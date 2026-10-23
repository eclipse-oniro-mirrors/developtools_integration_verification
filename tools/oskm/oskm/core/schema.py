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
"""Declarative table definitions and DDL generation for the SQLite store.

A collector declares its tables as `Table` objects; the framework derives CREATE
TABLE, CREATE INDEX and the per-scan deletion statements from that declaration.
No collector hand-writes DDL or cleanup SQL -- in the reference architecture every
collector re-implements its own delete_by_task_id(), which is both boilerplate and
a place to silently forget a table.

REAL columns are rejected on purpose: scans preserve JSON number literals exactly
(core/io.py parses them as Decimal), and IEEE-754 doubles would silently truncate
values like 1.1234567890123456789. Non-integer values belong in a JSON column,
which stores the original text.

The JSON type maps to TEXT storage deliberately -- do not "fix" it to a literal
JSON column type. SQLite has no JSON type, and a column declared `JSON` matches
none of INT/CHAR/CLOB/TEXT/BLOB/REAL/FLOA/DOUB, so it gets NUMERIC affinity: the
JSON document `3` would be stored as the integer 3 and `1.5` as a double, which
is exactly the precision loss the REAL ban exists to prevent. TEXT affinity keeps
the encoded document byte-for-byte.
"""
import re
from dataclasses import dataclass

IDENTIFIER = re.compile(r'[A-Za-z_][A-Za-z0-9_]*')

# Declared type -> SQLite storage type. REAL is deliberately absent; see module docstring.
TYPES = {'TEXT': 'TEXT', 'INTEGER': 'INTEGER', 'JSON': 'TEXT'}

SCAN_COLUMN = 'scan_id'


class SchemaError(Exception):
    pass


def _identifier(value, what):
    if not isinstance(value, str) or not IDENTIFIER.fullmatch(value):
        raise SchemaError(f'INVALID_{what}: {value!r}')
    return value


@dataclass(frozen=True)
class Column:
    name: str
    type: str = 'TEXT'
    nullable: bool = True
    default: str | None = None       # raw SQL literal, e.g. "''" or '0'
    check: str | None = None         # raw SQL predicate over this column
    references: str | None = None    # "table(column)"; always ON DELETE CASCADE
    on_delete: str = 'CASCADE'      # 'CASCADE' | 'SET NULL'; SET NULL requires nullable

    def __post_init__(self):
        _identifier(self.name, 'COLUMN_NAME')
        if self.type not in TYPES:
            raise SchemaError(f'INVALID_COLUMN_TYPE: {self.type!r} '
                              f'(allowed: {", ".join(sorted(TYPES))}')
        if self.on_delete not in ('CASCADE', 'SET NULL'):
            raise SchemaError(f'INVALID_ON_DELETE: {self.on_delete!r} '
                              f'(allowed: CASCADE, SET NULL)')
        if self.on_delete == 'SET NULL' and not self.nullable:
            raise SchemaError(f'SET_NULL_REQUIRES_NULLABLE: {self.name}')

    def ddl(self, *, force_not_null=False, inline_primary_key=False):
        parts = [self.name, TYPES[self.type]]
        if inline_primary_key:
            parts.append('PRIMARY KEY')
        if force_not_null or not self.nullable:
            parts.append('NOT NULL')
        if self.default is not None:
            parts.append('DEFAULT ' + self.default)
        if self.check is not None:
            parts.append(f'CHECK ({self.check})')
        if self.references is not None:
            parts.append(f'REFERENCES {self.references} ON DELETE {self.on_delete}')
        return ' '.join(parts)


@dataclass(frozen=True)
class Index:
    name: str
    columns: tuple[str, ...]
    unique: bool = False

    def __post_init__(self):
        _identifier(self.name, 'INDEX_NAME')
        if not self.columns:
            raise SchemaError(f'EMPTY_INDEX: {self.name}')
        for column in self.columns:
            _identifier(column, 'INDEX_COLUMN')

    def ddl(self, table):
        unique = 'UNIQUE ' if self.unique else ''
        return (f'CREATE {unique}INDEX IF NOT EXISTS {self.name} '
                f'ON {table}({", ".join(self.columns)})')


@dataclass(frozen=True)
class Table:
    """One physical table.

    scan_scoped tables (the default) automatically gain a leading scan_id column
    that references scans(id) ON DELETE CASCADE and becomes the first primary-key
    column, so every row is attributable to one scan and removable with it.
    """
    name: str
    columns: tuple[Column, ...]
    primary_key: tuple[str, ...] = ()
    indexes: tuple[Index, ...] = ()
    scan_scoped: bool = True
    surrogate: bool = False      # add an `id` rowid alias other tables can reference

    def __post_init__(self):
        _identifier(self.name, 'TABLE_NAME')
        if not self.columns:
            raise SchemaError(f'EMPTY_TABLE: {self.name}')
        names = [column.name for column in self.all_columns]
        duplicates = {n for n in names if names.count(n) > 1}
        if duplicates:
            raise SchemaError(f'DUPLICATE_COLUMN: {self.name}.{sorted(duplicates)[0]}')
        for key in self.key:
            if key not in names:
                raise SchemaError(f'UNKNOWN_PRIMARY_KEY_COLUMN: {self.name}.{key}')
        for index in self.indexes:
            for column in index.columns:
                if column not in names:
                    raise SchemaError(f'UNKNOWN_INDEX_COLUMN: {self.name}.{column}')

    @property
    def all_columns(self):
        """Declared columns, preceded by the implicit id and scan_id columns."""
        leading = ()
        if self.surrogate:
            leading += (Column('id', 'INTEGER', nullable=False),)
        if self.scan_scoped:
            leading += (Column(SCAN_COLUMN, 'INTEGER', nullable=False, references='scans(id)'),)
        return leading + tuple(self.columns)

    @property
    def key(self):
        """Effective primary key. A surrogate table is keyed by its rowid alias;
        the business key becomes a UNIQUE constraint instead (see unique_key)."""
        if self.surrogate:
            return ('id',)
        if self.scan_scoped and self.primary_key:
            return (SCAN_COLUMN,) + tuple(self.primary_key)
        return tuple(self.primary_key)

    @property
    def unique_key(self):
        """Business key of a surrogate table, still unique within one scan."""
        if not self.surrogate or not self.primary_key:
            return ()
        return ((SCAN_COLUMN,) if self.scan_scoped else ()) + tuple(self.primary_key)

    def ddl(self):
        key = self.key
        # A single INTEGER primary key must be inlined to alias rowid, which is
        # what makes it assignable automatically and referencable by other tables.
        inline = (len(key) == 1
                  and any(c.name == key[0] and c.type == 'INTEGER' for c in self.all_columns))
        body = [column.ddl(force_not_null=column.name in key,
                           inline_primary_key=inline and column.name == key[0])
                for column in self.all_columns]
        if key and not inline:
            body.append(f'PRIMARY KEY ({", ".join(key)})')
        if self.unique_key:
            body.append(f'UNIQUE ({", ".join(self.unique_key)})')
        return (f'CREATE TABLE IF NOT EXISTS {self.name} (\n    '
                + ',\n    '.join(body) + '\n)')

    def index_ddl(self):
        return tuple(index.ddl(self.name) for index in self.indexes)

    def delete_sql(self):
        """Statement removing one scan's rows. Scan-scoped tables only."""
        if not self.scan_scoped:
            raise SchemaError(f'NOT_SCAN_SCOPED: {self.name}')
        return f'DELETE FROM {self.name} WHERE {SCAN_COLUMN} = ?'


# ---- framework tables -------------------------------------------------------

SCANS = Table(
    'scans',
    columns=(
        Column('id', 'INTEGER', nullable=False),
        Column('product', nullable=False),
        Column('workspace_root', nullable=False),
        Column('started_at', nullable=False),
        Column('finished_at'),
    ),
    primary_key=('id',),
    scan_scoped=False,
)

# One row per collector per scan; replaces each domain's standalone snapshot dict.
# Not a duplicate of `scans`: a scan is one invocation, this is the per-collector
# outcome within it, and the three states a dependent must tell apart (not
# selected / ran and failed / ran normally) exist nowhere else. Timing is
# deliberately absent -- it is the scan's property, recorded once in `scans`.
COLLECTOR_RUNS = Table(
    'collector_runs',
    columns=(
        Column('collector', nullable=False),
        Column('schema_version', nullable=False),
        Column('status', nullable=False,
               check="status IN ('complete','degraded','failed')"),
        Column('scope', 'JSON'),
        Column('record_count', 'INTEGER', nullable=False),
        Column('error'),
    ),
    primary_key=('collector',),
)

# The primary key IS the issue dedup key, so the divergent per-domain _issue_key()
# conventions collapse into one database-enforced rule. Ordering is a query concern
# (ORDER BY), no longer a property of the stored artifact.
ISSUES = Table(
    'issues',
    columns=(
        Column('collector', nullable=False),
        Column('path', nullable=False),
        Column('pointer', nullable=False, default="''"),
        Column('code', nullable=False),
        Column('severity', nullable=False, default="'error'",
               check="severity IN ('info','warning','error')"),
        # Empty rather than NULL so the key stays strict: SQLite treats NULLs as
        # distinct in a primary key, which would let duplicates through.
        Column('component', nullable=False, default="''"),
        # 0: the scan could not read or resolve something. 1: it read everything
        # fine and the data itself is questionable. Only the former makes a scan
        # degraded or an inventory incomplete, so the two must be distinguishable
        # by a consumer reading the store, not just by the collector that found it.
        Column('advisory', 'INTEGER', nullable=False, default='0',
               check='advisory IN (0, 1)'),
        Column('details', 'JSON'),
    ),
    primary_key=('collector', 'component', 'path', 'pointer', 'code'),
    indexes=(Index('idx_issues_code', ('scan_id', 'code')),),
)

FRAMEWORK_TABLES = (SCANS, COLLECTOR_RUNS, ISSUES)
