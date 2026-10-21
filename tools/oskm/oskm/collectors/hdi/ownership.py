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
"""Installation matches, not a simulation of dlopen or linker namespaces."""
import os
from pathlib import PurePosixPath
from collections import defaultdict
from .discovery import partitions
from ...core.framework import READ_ERRORS


class Ownership:
    """Locate each device node's driver library in the installed image.

    This walk is deliberately independent of the install manifest: finding the
    .so on disk and checking its ELF magic is a second source of truth about
    what the image actually contains. Who *installed* it is a different
    question, answered by the install index (link_installs below).
    """

    def __init__(self, ctx, records, components):
        self.ctx = ctx
        self.components = components
        self.files = defaultdict(list)
        self.complete = True
        self.cache = {}
        names = {r['moduleName'] for r in records if isinstance(
            r.get('moduleName'), str) and '/' not in r['moduleName']}
        if names:
            for partition in partitions(ctx):
                for dirname in ('lib', 'lib64'):
                    directory = partition / dirname
                    ctx.scan_directories.add(str(directory))
                    self.walk(directory, names)

    def walk(self, directory, names):
        ctx = self.ctx
        pending = [directory]
        while pending:
            current = pending.pop()
            ctx.check()
            try:
                # Directory links (including root/lib -> /system/lib) are outside
                # this physical installation inventory, not unreadable inputs.
                if current.is_symlink():
                    continue
                with os.scandir(current) as entries:
                    for entry in entries:
                        ctx.check()
                        path = current / entry.name
                        ctx.track((path,))
                        if entry.is_dir(follow_symlinks=False):
                            pending.append(path)
                        elif entry.is_symlink() and entry.is_dir():
                            continue
                        elif entry.name in names:
                            self.files[entry.name].append(path)
            except FileNotFoundError:
                if current != directory:
                    self.complete = False
                    ctx.issue(current, 'LIBRARY_DIRECTORY_UNREADABLE')
            except (OSError, RuntimeError):
                self.complete = False
                ctx.issue(current, 'LIBRARY_DIRECTORY_UNREADABLE')

    def library(self, record):
        ctx = self.ctx
        location, pointer = ctx.package / record['hcb'], record['node']
        name = record.get('moduleName')
        if not isinstance(name, str) or not name or any(
                c in name for c in '$\x00{}\\') or '..' in PurePosixPath(name).parts:
            ctx.issue(location, 'MODULE_PATH_INVALID', pointer)
            return None
        if name.startswith('/'):
            path = ctx.package / name.lstrip('/')
            hits = [path]
        elif '/' in name:
            ctx.issue(location, 'MODULE_PATH_UNSUPPORTED', pointer)
            return None
        elif not self.complete:
            ctx.issue(ctx.package, 'LIBRARY_INDEX_INCOMPLETE')
            return None
        else:
            hits = self.files.get(name, [])
        if len(hits) != 1:
            ctx.issue(location, 'LIBRARY_UNMATCHED' if not hits else 'LIBRARY_AMBIGUOUS', pointer)
            return None
        path = hits[0]
        ctx.track((path,))
        try:
            if not path.resolve().is_relative_to(ctx.package):
                raise ValueError('LIBRARY_PATH_INVALID')
            if not path.is_file():
                raise FileNotFoundError()
            with path.open('rb') as f:
                if f.read(4) != b'\x7fELF':
                    raise ValueError('LIBRARY_NOT_ELF')
        except (OSError, RuntimeError, ValueError) as exc:
            code = 'LIBRARY_UNMATCHED' if isinstance(
                exc, FileNotFoundError) else str(exc) if isinstance(
                exc, ValueError) else 'LIBRARY_UNREADABLE'
            ctx.issue(location, code, pointer)
            return None
        return path.relative_to(ctx.package).as_posix()

    def apply(self, record):
        library = self.library(record)
        if library:
            record['library'] = library


def link_installs(ctx, records):
    """Bind each device node to the module that installed its driver library.

    `library` is the exact image path the walk above resolved, so this is a
    direct lookup; the owning component and the GN label both come from the
    module, which resolved them once against the components index. HDI used to
    re-parse system_module_info.json and walk the source tree for the nearest
    bundle.json to answer the same question.
    """
    index = ctx.install_index()
    if index is False:
        return                  # deselected: this domain does no attribution
    if index is None:
        # The index exists but has holes, so "no module installs this" cannot be
        # distinguished from "we could not read it". Said once, not per record.
        ctx.issue(ctx.package, 'ORIGIN_INDEX_INCOMPLETE')
        return
    for record in records:
        library = record.get('library')
        if not isinstance(library, str):
            continue            # no library to attribute; already reported
        location = ctx.package / library
        found = index.at(library)
        if not found:
            ctx.issue(location, 'ORIGIN_UNMATCHED')
            continue
        if len({module['label'] for module in found}) != 1:
            ctx.issue(location, 'ORIGIN_LABEL_AMBIGUOUS')
            continue
        module = found[0]
        if module['label'] is None:
            ctx.issue(location, 'ORIGIN_LABEL_INVALID')
            continue
        record['install_module_id'] = module['id']
        if module['component_id'] is not None:
            record['component_id'] = module['component_id']
