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
"""The install index as other collectors consume it.

A domain knows one installed artifact per record -- a cfg path, a driver
library, an SA implementation -- and wants the module that put it there. The
lookup is built once per scan from the already-committed rows, so no consumer
re-parses the manifest and the directory-install rule lives in one place.
"""
from .targets import modules_at


class InstallIndex:
    """Read-only view over one scan's install_modules / install_targets."""

    def __init__(self, modules, targets):
        self._modules = {module['id']: module for module in modules}
        self._targets = targets
        self._by_label = {}
        for module in modules:
            if module['label']:
                self._by_label.setdefault(module['label'], []).append(module)
        self._by_name = {}
        for target in targets:
            self._by_name.setdefault(target['file_name'], []).append(target)

    def __len__(self):
        return len(self._modules)

    def at(self, dest):
        """Modules installing an exact image path, with the directory fallback."""
        if not isinstance(dest, str) or not dest:
            return ()
        return tuple(self._modules[t['module_id']] for t in modules_at(self._targets, dest))

    def named(self, file_name):
        """Modules installing a file with this name, anywhere in the image.

        For callers that only know a bare file name (an SA's libpath names the
        library, not where it lands). Names are near-unique but not unique, so
        an ambiguous answer is returned in full rather than guessed at.
        """
        if not isinstance(file_name, str) or not file_name:
            return ()
        found = {t['module_id'] for t in self._by_name.get(file_name, ())}
        return tuple(self._modules[i] for i in sorted(found))

    def labelled(self, label):
        """Modules built by a GN label.

        Usually one, but a target built for two toolchains strips to the same
        label, so the answer is a tuple and the caller decides what ambiguity
        means for it.
        """
        return tuple(self._by_label.get(label, ()))

    def unique(self, modules):
        """The single module in a result, or None when absent or ambiguous."""
        return modules[0] if len(modules) == 1 else None

    def locate(self, *, label=None, path=None, name=None):
        """The one module matching the first key that resolves, or None.

        Keys are tried in descending order of evidence: a GN label names the
        target outright, an install path says where the artifact landed, and a
        bare file name is a last resort because names are near-unique but not
        unique. A key that matches several modules does not fall through to a
        weaker one -- ambiguity is an answer, not a miss.

        Callers pass whatever they hold: a cfg path, a resolved driver library,
        an SA's libpath (which may be either a path or a bare name).
        """
        for found in (self.labelled(label) if label else (),
                      self.at(path) if path else (),
                      self.named(name) if name else ()):
            if found:
                return self.unique(found)
        return None
