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
"""Only manager/host/device/node in installed default HCBs enters inventory."""
import os
from ...core.framework import READ_ERRORS
from .hcb import read_hcb, HCBError
from .records import make_record
from ...core.io import pointer
from ...core.models import ScanFatalError


def partitions(ctx):
    try:
        with os.scandir(ctx.package) as entries:
            return sorted(ctx.package / e.name for e in entries if e.is_dir(follow_symlinks=False))
    except OSError as exc:
        raise ScanFatalError('PACKAGE_UNREADABLE') from exc


def discover(ctx):
    paths = []
    for partition in partitions(ctx):
        directory = partition / 'etc/hdfconfig'
        if any(p.is_symlink() for p in (partition / 'etc', directory)):
            continue
        ctx.scan_directories.add(str(directory))
        try:
            with os.scandir(directory) as entries:
                for entry in entries:
                    if entry.name == 'hdf_default.hcb':
                        paths.append(directory / entry.name)
                        ctx.track((paths[-1],))
        except FileNotFoundError:
            continue
        except OSError:
            ctx.issue(directory, 'HCB_DIRECTORY_UNREADABLE')
    if not paths:
        raise ScanFatalError('HCB_INPUT_MISSING')
    return sorted(paths)


def extract(root, hcb):
    managers = []

    def visit(node, path):
        path = path + '/' + pointer(node.name)
        if node.attributes.get('match_attr') == 'hdf_manager':
            managers.append((node, path))
        for child in node.children:
            visit(child, path)
    visit(root, '')
    if len(managers) != 1:
        raise HCBError('HCB_MANAGER_COUNT')
    manager, path = managers[0]
    records = []
    for host in manager.children:
        for device in host.children:
            for node in device.children:
                if node.children:
                    raise HCBError('HCB_DEVICE_STRUCTURE')
                location = path + '/' + '/'.join(pointer(n.name) for n in (host, device, node))
                records.append(make_record(hcb, location, host.attributes, node.attributes))
    return records


def read_records(ctx, paths):
    records = []
    for i, path in enumerate(paths):
        hcb = path.relative_to(ctx.package).as_posix()
        ctx.progress('hdi-parse', i, len(paths), hcb)
        try:
            limits = ctx.limits
            root = read_hcb(ctx.read_bytes(path, ctx.package),
                            depth=limits.tree_depth, items=limits.tree_items, cancelled_check=ctx.check)
            records.extend(extract(root, hcb))
        except READ_ERRORS as exc:
            ctx.issue(path, str(exc) if isinstance(exc, HCBError) else 'HCB_' + getattr(exc, 'code', 'INVALID'))
    return records
