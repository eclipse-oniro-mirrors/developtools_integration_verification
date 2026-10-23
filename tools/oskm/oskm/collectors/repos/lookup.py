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
"""Label and path to repo matching, with longest-path-first for nesting.

A repo workspace can contain nested repos: one repo's path is a prefix of
another's. The canonical example is a device-specific repo inside a vendor
tree. The rule is simple: the longest matching path wins, because a shorter
prefix would describe a coarser repo that happens to contain the nested one.
"""
from ...core.provenance import strip_label


class RepoIndex:
    """Read-only view over one scan's repos, with longest-prefix matching."""

    def __init__(self, repos):
        self._by_name = {r['name']: r for r in repos}
        self._by_path = []
        for r in repos:
            path = r.get('path')
            if path:
                self._by_path.append((path, r))
        self._by_path.sort(key=lambda pair: len(pair[0]), reverse=True)

    def __len__(self):
        return len(self._by_name)

    def by_name(self, name):
        return self._by_name.get(name)

    def by_path(self, path):
        """Exact path match."""
        for repo_path, r in self._by_path:
            if repo_path == path:
                return r
        return None

    def match_label(self, label):
        """The repo whose path is the longest prefix of the label's directory.

        Label format: //dir/sub:target — the directory is dir/sub (after
        stripping // and splitting on :). The longest repo path that is a
        prefix of this directory is the owning repo.
        """
        stripped = strip_label(label)
        if stripped is None:
            return None
        directory = stripped[2:].split(':')[0]
        return self._match_directory(directory)

    def match_path(self, path):
        """The repo whose path is the longest prefix of the given path.

        Supports both absolute workspace paths and repo-relative paths.
        """
        if not path:
            return None
        if path.startswith('//'):
            return self.match_label(path)
        return self._match_directory(path)

    def _match_directory(self, directory):
        """Longest-path-first prefix match."""
        for repo_path, r in self._by_path:
            if directory == repo_path or directory.startswith(repo_path + '/'):
                return r
        return None

    def locate(self, *, label=None, path=None, name=None):
        """The one repo matching the first key that resolves, or None.

        Keys are tried in descending order of specificity: a GN label names
        the target outright, a path narrows by directory prefix, and a bare
        repo name is an exact match.
        """
        if label:
            r = self.match_label(label)
            if r is not None:
                return r
        if path:
            r = self.match_path(path)
            if r is not None:
                return r
        if name:
            return self.by_name(name)
        return None
