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


# Directories a partition has and a variant container does not: their presence
# makes chip_prod a partition in its own right (single-level vendor layout).
FLAT_PARTITION_DIRS = ('etc', 'lib', 'lib64', 'bin', 'usr', 'chip_prod')


def chip_variants(root):
    """Product variant trees packed under chip_prod/, in a stable order."""
    try:
        with os.scandir(root) as entries:
            return sorted(e.name for e in entries if e.is_dir(follow_symlinks=False))
    except OSError:
        return []


def variant_hcb(root, variant):
    """The HCB a variant tree installs, i.e. the thing selection measures."""
    return root / variant / 'etc/hdfconfig/hdf_default.hcb'


def chip_product_decision(ctx):
    """Which chip_prod tree enters the inventory, and what is left out.

    Returns (selected variant name or None, skipped variants, issue code,
    info dict). None-as-selected means "chip_prod is a flat partition":
    single-level layouts (chip_prod/etc, chip_prod/lib64) install no
    per-product trees at all, and dropping chip_prod there would erase a real
    partition silently.

    Selection order: an explicit ``hdi.chip_product`` request option wins;
    otherwise the default rule is the variant whose installed
    ``etc/hdfconfig/hdf_default.hcb`` exists and is the largest -- the tree the
    device actually ships is the one carrying the full declaration set. With a
    single variant (or a single variant holding an HCB) there is nothing to
    decide. The rule refuses two inputs: equal-largest HCBs, and no HCB anywhere
    to measure. Both are reported as HDI_CHIP_PRODUCT_AMBIGUOUS with the byte
    sizes in details, because picking anyway would silently invent an inventory.
    """
    root = ctx.package / 'chip_prod'
    variants = chip_variants(root)
    requested = getattr(ctx, 'chip_product', None)
    # A flat chip_prod carries the partition directories itself (etc, lib64),
    # which is how a single-level layout tells itself apart from a container of
    # per-product trees.
    if not variants or any(v in FLAT_PARTITION_DIRS for v in variants):
        return None, (), None, {}
    if requested is not None:
        if requested in variants:
            return (requested, tuple(v for v in variants if v != requested),
                    None, dict(basis='requested', hcb_bytes=_hcb_sizes(root, variants)))
        return None, (), 'HDI_CHIP_PRODUCT_MISSING', dict(
            basis='requested', hcb_bytes=_hcb_sizes(root, variants))
    sizes = _hcb_sizes(root, variants)
    if len(variants) == 1:
        # Nothing to decide between; the library walk wants this tree even when
        # it installs no HCB at all.
        return variants[0], (), None, dict(basis='single_variant', hcb_bytes=sizes)
    if sizes:
        largest = max(sizes.values())
        tied = tuple(name for name in sorted(sizes) if sizes[name] == largest)
        if len(tied) == 1:
            return (tied[0], tuple(v for v in variants if v != tied[0]),
                    None, dict(basis='largest_hcb', hcb_bytes=sizes))
        return None, (), 'HDI_CHIP_PRODUCT_AMBIGUOUS', dict(
            basis='largest_hcb', hcb_bytes=sizes)
    return None, (), 'HDI_CHIP_PRODUCT_AMBIGUOUS', dict(
        basis='largest_hcb', hcb_bytes=sizes)


def _hcb_sizes(root, variants):
    """variant -> installed HCB size in bytes; variants without one are absent."""
    sizes = {}
    for name in variants:
        hcb = variant_hcb(root, name)
        try:
            if hcb.is_file():
                sizes[name] = hcb.stat().st_size
        except OSError:
            continue
    return sizes


def partitions(ctx):
    """Physical installation roots: package subdirectories, plus the selected
    chip_prod tree of the two-level layout (or chip_prod itself when flat).
    """
    try:
        with os.scandir(ctx.package) as entries:
            names = sorted(e.name for e in entries if e.is_dir(follow_symlinks=False))
    except OSError as exc:
        raise ScanFatalError('PACKAGE_UNREADABLE') from exc
    roots = []
    for name in names:
        root = ctx.package / name
        if name != 'chip_prod':
            roots.append(root)
            continue
        selected, skipped, code, info = chip_product_decision(ctx)
        ctx.chip_product_decision = (selected, skipped, code, info)
        if code is not None:
            ctx.issue(root, code, details=dict(
                requested=getattr(ctx, 'chip_product', None),
                variants=chip_variants(root), **info))
            continue
        if selected is not None:
            # One record-keeping issue per scan: which chip product HDI adopted,
            # on what basis, measured with which sizes, and what that left out.
            # info/advisory: a decision is not a defect -- it must not degrade
            # the scan nor count against inventory completeness.
            ctx.issue(root, 'HDI_CHIP_PRODUCT_SELECTED', severity='info', advisory=True,
                      details=dict(selected=selected, skipped=list(skipped), **info))
        roots.append(root if selected is None else root / selected)
    return roots


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
        ctx.issue(ctx.package, 'HCB_INPUT_MISSING')
        return []
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
