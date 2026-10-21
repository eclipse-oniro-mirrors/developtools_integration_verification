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
"""Recursive repo manifest parser: include chains, remotes and projects.

Includes are resolved relative to the manifests directory, not relative to
the file doing the include, matching the repo tool's resolution rule.
"""
import xml.etree.ElementTree as ET
from pathlib import Path


def parse(manifest_dir, entry='default.xml'):
    """Parse the manifest include chain, returning (projects, remotes).

    manifest_dir: path to .repo/manifests/
    entry: filename within manifest_dir to start from (default: default.xml)

    <default> attributes are inherited across includes: a sub-manifest
    that does not redeclare <default> keeps the parent's remote/revision.
    """
    projects = {}
    remotes = {}
    _parse(manifest_dir / entry, manifest_dir, {}, projects, remotes)
    return projects, remotes


def _parse(path, manifest_dir, inherited, projects, remotes):
    root = ET.parse(path).getroot()
    for r in root.findall('remote'):
        remotes[r.get('name')] = dict(r.attrib)
    default = root.find('default')
    default_attrs = dict(default.attrib) if default is not None else {}
    merged = {**inherited, **default_attrs}
    for inc in root.findall('include'):
        _parse(manifest_dir / inc.get('name'), manifest_dir, merged, projects, remotes)
    for p in root.findall('project'):
        attrs = dict(p.attrib)
        attrs.setdefault('remote', merged.get('remote'))
        attrs.setdefault('revision', merged.get('revision'))
        projects[attrs['name']] = attrs
