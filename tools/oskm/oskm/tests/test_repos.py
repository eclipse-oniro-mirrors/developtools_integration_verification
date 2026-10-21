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
"""Tests for the repos collector: manifest parsing, git metadata, and lookup."""
import os
import subprocess
import tempfile
import textwrap
import unittest
from pathlib import Path

from oskm.collectors.repos import manifest as manifest_parser
from oskm.collectors.repos.lookup import RepoIndex
from oskm.collectors.repos.git_info import collect


def _write(path, content):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(content)


def _init_git(workspace, path):
    repo = workspace / path
    repo.mkdir(parents=True, exist_ok=True)
    subprocess.check_call(['git', 'init', '--quiet'], cwd=repo)
    subprocess.check_call(['git', 'config', 'user.email', 'test@test.com'], cwd=repo)
    subprocess.check_call(['git', 'config', 'user.name', 'test'], cwd=repo)
    (repo / 'README.md').write_text('# test\n')
    subprocess.check_call(['git', 'add', '.'], cwd=repo)
    subprocess.check_call(['git', 'commit', '--quiet', '-m', 'init'], cwd=repo)


def _make_manifest(workspace, repos):
    manifests = workspace / '.repo' / 'manifests'
    manifests.mkdir(parents=True, exist_ok=True)
    _write(manifests / 'default.xml', textwrap.dedent('''\
        <manifest>
          <remote fetch="https://gitcode.com/openharmony" name="gitcode"/>
          <default remote="gitcode" revision="master"/>
          <include name="ohos.xml"/>
        </manifest>'''))
    project_xml = '<manifest>\n'
    for r in repos:
        groups = r.get('groups', 'default')
        project_xml += f'  <project name="{r["name"]}" path="{r["path"]}" groups="{groups}"/>\n'
    project_xml += '</manifest>\n'
    _write(manifests / 'ohos.xml', project_xml)
    _write(workspace / '.repo' / 'manifest.xml',
           '<manifest>\n  <include name="default.xml"/>\n</manifest>\n')
    project_list = workspace / '.repo' / 'project.list'
    _write(project_list, '\n'.join(r['path'] for r in repos) + '\n')
    return workspace / '.repo'


class ManifestTest(unittest.TestCase):
    def test_include_chain_and_default_inheritance(self):
        with tempfile.TemporaryDirectory() as tmp:
            workspace = Path(tmp)
            _make_manifest(workspace, [
                {'name': 'ability_base', 'path': 'foundation/ability/ability_base'},
                {'name': 'ace_engine', 'path': 'foundation/arkui/ace_engine'},
            ])
            projects, remotes = manifest_parser.parse(workspace / '.repo' / 'manifests')
            self.assertEqual(len(projects), 2)
            self.assertEqual(projects['ability_base']['remote'], 'gitcode')
            self.assertEqual(projects['ability_base']['revision'], 'master')
            self.assertIn('gitcode', remotes)

    def test_clone_depth(self):
        with tempfile.TemporaryDirectory() as tmp:
            workspace = Path(tmp)
            manifests = workspace / '.repo' / 'manifests'
            manifests.mkdir(parents=True, exist_ok=True)
            _write(manifests / 'default.xml', textwrap.dedent('''\
                <manifest>
                  <remote fetch="https://gitcode.com/openharmony" name="gitcode"/>
                  <default remote="gitcode" revision="master"/>
                  <project name="kernel" path="kernel/linux" clone-depth="1"/>
                </manifest>'''))
            _write(workspace / '.repo' / 'manifest.xml',
                   '<manifest>\n  <include name="default.xml"/>\n</manifest>\n')
            projects, _ = manifest_parser.parse(workspace / '.repo' / 'manifests')
            self.assertEqual(projects['kernel']['clone-depth'], '1')


class GitInfoTest(unittest.TestCase):
    def test_collect_returns_metadata(self):
        with tempfile.TemporaryDirectory() as tmp:
            workspace = Path(tmp)
            _init_git(workspace, 'foundation/ability/ability_base')
            repo = workspace / 'foundation/ability/ability_base'
            subprocess.check_call(['git', 'remote', 'add', 'gitcode',
                                   'https://gitcode.com/openharmony/ability_ability_base'], cwd=repo)
            info = collect(workspace, 'foundation/ability/ability_base')
            self.assertIsNotNone(info['head_commit'])
            self.assertIsNotNone(info['remote_url'])


class RepoIndexTest(unittest.TestCase):
    def setUp(self):
        self.repos = [
            {'name': 'vendor_rk3568', 'path': 'vendor/hihope/rk3568'},
            {'name': 'ability_base', 'path': 'foundation/ability/ability_base'},
            {'name': 'ace_engine', 'path': 'foundation/arkui/ace_engine'},
        ]

    def test_match_label_longest_path(self):
        index = RepoIndex(self.repos)
        r = index.match_label('//foundation/ability/ability_base:base')
        self.assertEqual(r['name'], 'ability_base')

    def test_match_label_nested(self):
        # Simulate nested repos: vendor/hihope contains vendor/hihope/rk3568
        nested = self.repos + [{'name': 'vendor_hihope', 'path': 'vendor/hihope'}]
        index = RepoIndex(nested)
        r = index.match_label('//vendor/hihope/rk3568/hdf_config:config')
        self.assertEqual(r['name'], 'vendor_rk3568')

    def test_match_path(self):
        index = RepoIndex(self.repos)
        r = index.match_path('foundation/ability/ability_base')
        self.assertEqual(r['name'], 'ability_base')

    def test_match_path_prefix(self):
        index = RepoIndex(self.repos)
        r = index.match_path('foundation/ability/ability_base/sub/dir')
        self.assertEqual(r['name'], 'ability_base')

    def test_match_path_nested_longest_wins(self):
        nested = self.repos + [{'name': 'vendor_hihope', 'path': 'vendor/hihope'}]
        index = RepoIndex(nested)
        r = index.match_path('vendor/hihope/rk3568')
        self.assertEqual(r['name'], 'vendor_rk3568')

    def test_locate_by_name(self):
        index = RepoIndex(self.repos)
        r = index.locate(name='ace_engine')
        self.assertEqual(r['name'], 'ace_engine')

    def test_locate_by_label(self):
        index = RepoIndex(self.repos)
        r = index.locate(label='//foundation/arkui/ace_engine:ace_engine')
        self.assertEqual(r['name'], 'ace_engine')

    def test_locate_fallback(self):
        index = RepoIndex(self.repos)
        r = index.locate(label='//nonexistent:target', path='foundation/arkui/ace_engine')
        self.assertEqual(r['name'], 'ace_engine')

    def test_no_match(self):
        index = RepoIndex(self.repos)
        self.assertIsNone(index.match_label('//nonexistent:target'))
        self.assertIsNone(index.match_path('nonexistent/path'))
        self.assertIsNone(index.locate(name='nonexistent'))


if __name__ == '__main__':
    unittest.main()
