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
"""Basename resolution using deps_guard's library-directory ordering."""
from collections import defaultdict
from pathlib import PurePosixPath


# These lists intentionally mirror ElfFileMgr.__get_library_order in
# developtools/integration_verification/tools/deps_guard. The bitness-specific
# index matters: /system/lib and /system/lib64 are both rank zero in their own
# branches, then the original candidate order breaks the tie.
LIB64_DIRECTORY_ORDER = (
    "/system/lib64",
    "/vendor/lib64",
    "/vendor/lib64/chipsetsdk",
    "/system/lib64/ndk",
    "/system/lib64/chipset-pub-sdk",
    "/system/lib64/chipset-sdk",
    "/system/lib64/platformsdk",
    "/system/lib64/priv-platformsdk",
    "/system/lib64/priv-module",
    "/system/lib64/module",
    "/system/lib64/module/data",
    "/system/lib64/module/multimedia",
    "/system/lib",
    "/vendor/lib",
    "/system/lib/ndk",
    "/system/lib/chipset-pub-sdk",
    "/system/lib/chipset-sdk",
    "/system/lib/platformsdk",
    "/system/lib/priv-platformsdk",
    "/system/lib/priv-module",
    "/system/lib/module",
    "/system/lib/module/data",
    "/system/lib/module/multimedia",
    "/lib64",
    "/lib",
    "/usr/local/lib",
    "/usr/lib",
)
LIB_DIRECTORY_ORDER = (
    "/system/lib",
    "/vendor/lib",
    "/vendor/lib/chipsetsdk",
    "/system/lib/ndk",
    "/system/lib/chipset-pub-sdk",
    "/system/lib/chipset-sdk",
    "/system/lib/platformsdk",
    "/system/lib/priv-platformsdk",
    "/system/lib/priv-module",
    "/system/lib/module",
    "/system/lib/module/data",
    "/system/lib/module/multimedia",
    "/lib",
    "/usr/local/lib",
    "/usr/lib",
)
LIB64_ORDER_INDEX = {path: index for index, path in enumerate(LIB64_DIRECTORY_ORDER)}
LIB_ORDER_INDEX = {path: index for index, path in enumerate(LIB_DIRECTORY_ORDER)}
UNKNOWN_LIBRARY_ORDER = 1000

# ELFWalker only walks packages/phone/system and packages/phone/vendor, so a
# library installed anywhere else is a name deps_guard can never hit.
MATCH_PARTITIONS = ("system", "vendor")


def library_order(dest):
    """Directory rank for one image-relative install path."""
    path = "/" + dest
    order = LIB64_ORDER_INDEX if path.find("/lib64/") > 0 else LIB_ORDER_INDEX
    slash = path.rfind("/")
    if slash < 0:
        return UNKNOWN_LIBRARY_ORDER
    return order.get(path[:slash], UNKNOWN_LIBRARY_ORDER)


def reorder_library(candidates):
    """Apply deps_guard's stable (directory rank, original index) ordering."""
    ranked = sorted(enumerate(candidates),
                    key=lambda item: (library_order(item[1]["dest"]), item[0]))
    return [candidate for _, candidate in ranked]


def candidate_index(modules, symlinks=()):
    """Match name -> modules, limited to deps_guard's walked partitions.

    The installed basename remains authoritative: deps_guard resolves a
    DT_NEEDED value through an image file (or symlink) with that name.  A
    symlink is an alias for the real ELF at its ``link_target_id``; it must not
    become another ELF module, but it can make that target resolvable under the
    symlink's basename.  SONAME remains a fallback for ELF files without a
    matching basename.
    """
    by_file_name = defaultdict(list)
    by_soname = defaultdict(list)
    by_install_target_id = {module['install_target_id']: module
                            for module in modules
                            if 'install_target_id' in module}
    for module in modules:
        if module["partition"] in MATCH_PARTITIONS:
            by_file_name[module["file_name"]].append(module)
            if module["soname"] is not None:
                by_soname[module["soname"]].append(module)
    for symlink in symlinks:
        if symlink["partition"] not in MATCH_PARTITIONS:
            continue
        module = by_install_target_id.get(symlink["link_target_id"])
        if module is None:
            continue
        alias = dict(module)
        alias.update(dest=symlink["dest"], partition=symlink["partition"],
                     file_name=symlink["file_name"])
        by_file_name[alias["file_name"]].append(alias)

    index = dict(by_file_name)
    for name, candidates in by_soname.items():
        index.setdefault(name, candidates)
    return index


def resolve_needed(name, candidates_by_name):
    """Resolve one DT_NEEDED value to the single module deps_guard would load."""
    wanted = PurePosixPath(name).name
    candidates = candidates_by_name.get(wanted, ())
    if not candidates:
        return None
    return reorder_library(candidates)[0]
