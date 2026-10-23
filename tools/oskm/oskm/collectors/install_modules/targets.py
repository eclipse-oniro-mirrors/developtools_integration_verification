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
"""dest expansion: one SMI row installs 0..N targets.

A dest is a path inside the image, relative and normalised. Ten of them on
rk3568 end in '/' -- those are HAP *directory* installs, where every file below
the directory belongs to the module, so exact-path lookup alone would miss them
(see modules_at()).
"""
import os
from pathlib import PurePosixPath

from ...core.shape import UNSET
from .records import field_value

# A directory install is a handful of entries (10 on rk3568), but the tree below
# one is unbounded in principle. Stop counting rather than walk forever; the
# caller reports what it hit.
DIR_ENTRY_CAP = 50_000


def resolve_link_target(dest, link_target):
    """Resolve a symlink's text to a full image-relative path.

    Symlink targets come in three forms on rk3568:
      bare name  'toybox'        → resolved as dirname(dest) + '/' + 'toybox'
      relative  '../lib/libx.so' → resolved by normpath against dirname(dest)
      absolute  '/system/...'   → stored as-is (without leading /)

    Returns the normalised path (same format as `dest`), or None.
    """
    if not isinstance(link_target, str) or not link_target:
        return None
    dest_dir = os.path.dirname(dest)
    # Strip leading './' if present (e.g. './ld-musl-arm.so.1')
    raw = link_target
    if raw.startswith('./'):
        raw = raw[2:]
    # normpath handles '../' and './' in the middle
    resolved = os.path.normpath(os.path.join(dest_dir, raw))
    # Strip any leading ./ or ../ that escaped (shouldn't happen on valid data)
    if resolved.startswith('..'):
        return None
    return resolved.replace('\\', '/')


def measure(ctx, dest):
    """What the package actually holds at `dest`.

    Returns (size, link_target, status):
      size         bytes this entry itself occupies, or None if it is not there
      link_target  the link's text when it is a symlink, else None
      status       'file' | 'link' | 'dir' | 'missing'

    **lstat, never stat.** Following a symlink would charge the target's bytes
    to the link as well, and the target is often installed in its own right --
    rk3568's single symlink points at a file that is, so a followed size would
    add 1.9 MB to the image total twice.

    This is an observation of the package, not a reading of the declaration:
    it is why `size` has a column but no place in `record`.
    """
    path = ctx.package / dest
    try:
        info = path.lstat()
    except OSError:
        return None, None, 'missing'

    if os.path.islink(path):
        return info.st_size, os.readlink(path), 'link'
    if not os.path.isdir(path):
        return info.st_size, None, 'file'

    total = seen = 0
    # followlinks=False: a symlinked directory inside the tree would otherwise
    # let the walk escape the package, and its bytes are charged where the real
    # directory is installed.
    for base, _, files in os.walk(path, followlinks=False):
        for name in files:
            try:
                total += os.lstat(os.path.join(base, name)).st_size
            except OSError:
                continue            # vanished mid-walk; the rest still counts
            seen += 1
            if seen >= DIR_ENTRY_CAP:
                return total, None, 'dir'
    return total, None, 'dir'


def normalize_dest(value):
    """Canonical image-relative path, or None if the declaration is unusable.

    Returns (path, is_directory): a trailing slash is the declaration's way of
    saying "the whole directory", and that distinction has to survive.
    """
    if not isinstance(value, str) or not value:
        return None
    if value.startswith('/') or '\\' in value or '\x00' in value:
        return None
    directory = value.endswith('/')
    parts = []
    for part in value.split('/'):
        if part in ('', '.'):
            continue
        if part == '..':
            return None
        parts.append(part)
    if not parts:
        return None
    return '/'.join(parts), directory


def expand(ctx, records, path):
    """Emit one install_targets row per entry this module puts in the image.

    Two declarations feed it: `dest[]` (the artifact) and `symlink_file[]`
    (links the module creates). See symlink-design.md -- the two keys point in
    opposite directions, but both land in the image, so both become rows.
    """
    seen = {}
    for position, (record, pointer) in enumerate(records):
        _expand_record(ctx, record, pointer, position, path, seen)
    _report_ambiguous(ctx, path, seen)


def _expand_record(ctx, record, pointer, position, path, seen):
    """Process one module record and emit its install target rows."""
    dests = record.get('dest')
    if not isinstance(dests, list):
        ctx.issue(path, 'MODULE_ROW_INVALID', f'{pointer}/dest')
        return
    links = field_value(record, 'symlink_file')
    links = None if links is UNSET else links
    if links is not None and not isinstance(links, list):
        ctx.issue(path, 'MODULE_ROW_INVALID', f'{pointer}/symlink_file')
        links = None
    plan = [('dest', dests)] + ([('symlink_file', links)] if links else [])
    ordinal = 0
    placed = set()
    for field, values in plan:
        for index, value in enumerate(values):
            ordinal, placed = _emit_target(
                ctx, value, field, index, pointer, position, ordinal,
                placed, path, seen)


def _emit_target(ctx, value, field, index, pointer, position,
                 ordinal, placed, path, seen):
    """Normalize, validate, and emit a single install target. Returns updated ordinal."""
    normalized = normalize_dest(value)
    if normalized is None:
        code = ('MODULE_DEST_INVALID' if field == 'dest'
                else 'MODULE_SYMLINK_INVALID')
        ctx.issue(path, code, f'{pointer}/{field}/{index}')
        return ordinal, placed
    dest, directory = normalized
    if dest in placed:
        return ordinal, placed
    placed.add(dest)
    size, link_target, status = measure(ctx, dest)
    _check_target_status(ctx, dest, field, status, directory, index,
                         pointer, path)
    ctx.track((ctx.package / dest,))
    ctx.emit('install_targets', dict(
        module_position=position, dest_index=ordinal, dest=dest,
        directory=int(directory and field == 'dest'),
        partition=dest.split('/')[0],
        file_name=PurePosixPath(dest).name,
        size=size,
        link_target_path=(resolve_link_target(dest, link_target)
                          if link_target else None)))
    ordinal += 1
    seen.setdefault(dest, []).append((position, pointer))
    return ordinal, placed


def _check_target_status(ctx, dest, field, status, directory, index,
                         pointer, path):
    """Report issues based on the target's status in the package."""
    if status == 'missing':
        ctx.issue(path, 'TARGET_MISSING', f'{pointer}/{field}/{index}',
                  severity='warning', advisory=True, details=dict(dest=dest))
    elif field == 'symlink_file' and status != 'link':
        ctx.issue(path, 'SYMLINK_NOT_A_LINK', f'{pointer}/{field}/{index}',
                  severity='warning', advisory=True,
                  details=dict(dest=dest, found=status))
    elif status == 'dir' and not directory:
        ctx.issue(path, 'TARGET_DIRECTORY_UNDECLARED',
                  f'{pointer}/{field}/{index}',
                  severity='warning', advisory=True, details=dict(dest=dest))


def _report_ambiguous(ctx, path, seen):
    """Report destinations claimed by multiple modules."""
    for dest, places in seen.items():
        if len(places) > 1:
            declarations = [p for _, p in places]
            for _, pointer in places:
                ctx.issue(path, 'INSTALL_DEST_AMBIGUOUS',
                          f'{pointer}/dest',
                          severity='warning', advisory=True,
                          details=dict(dest=dest,
                                       declarations=declarations))


def modules_at(rows, dest):
    """Rows installing `dest`: exact match first, then the longest directory
    install covering it. Directory installs are a handful, so the fallback scan
    is cheaper than maintaining a prefix index."""
    exact = [row for row in rows if row['dest'] == dest]
    if exact:
        return exact
    covering = [row for row in rows
                if row['directory'] and dest.startswith(row['dest'] + '/')]
    if not covering:
        return []
    longest = max(len(row['dest']) for row in covering)
    return [row for row in covering if len(row['dest']) == longest]
