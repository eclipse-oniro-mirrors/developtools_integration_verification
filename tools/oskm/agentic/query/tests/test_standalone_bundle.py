"""Release checks for the collector-free oskm skill archive."""
from __future__ import annotations

import hashlib
import json
import os
import subprocess
import sys
import tarfile
import tempfile
import unittest
from pathlib import Path

from agentic.query.tests.fixture import create_fixture_db
from agentic.scripts import build_bundle as bundle_builder
from agentic.scripts.build_bundle import build_bundle, stage_bundle


class StandaloneBundleTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='oskm-bundle-test-')
        self.root = Path(self.temp.name)
        self.release = build_bundle(self.root / 'dist')
        self.archive = Path(self.release['archive'])

    def tearDown(self):
        self.temp.cleanup()

    @staticmethod
    def _package_env(package):
        env = os.environ.copy()
        env['PYTHONPATH'] = str(package)
        env['PYTHONNOUSERSITE'] = '1'
        return env

    def _run_python(self, package, *arguments, cwd=None):
        return subprocess.run(
            [sys.executable, *arguments],
            cwd=str(cwd or package),
            env=self._package_env(package),
            capture_output=True,
            text=True,
        )

    def test_archive_has_only_the_standalone_query_package(self):
        with tarfile.open(self.archive, 'r:gz') as tar:
            names = set(tar.getnames())

        self.assertIn('oskm/SKILL.md', names)
        self.assertIn('oskm/README.md', names)
        self.assertIn('oskm/agentic/.env.example', names)
        self.assertIn('oskm/agentic/cli.py', names)
        self.assertIn('oskm/oskm_schema/__init__.py', names)
        self.assertEqual({name.split('/', 1)[0] for name in names},
                         {'oskm'})
        self.assertNotIn('oskm/oskm', names)
        self.assertFalse(any(name == 'oskm/oskm' or
                             name.startswith('oskm/oskm/')
                             for name in names))
        self.assertFalse(any('collectors' in name for name in names))
        self.assertFalse(any('/agentic/query/tests' in name for name in names))
        self.assertFalse(any('__pycache__' in name or name.endswith('.pyc')
                             for name in names))

    def test_local_env_files_are_never_bundled(self):
        ignored = bundle_builder._ignore(
            bundle_builder.AGENTIC,
            ['.env', '.env.local', '.env.example', 'runtime.py'],
        )
        self.assertEqual(ignored, {'.env', '.env.local'})

    def test_archive_documents_unified_runtime_for_both_zones(self):
        with tarfile.open(self.archive, 'r:gz') as tar:
            skill = tar.extractfile('oskm/SKILL.md').read().decode('utf-8')
            readme = tar.extractfile('oskm/README.md').read().decode('utf-8')
            runtime = tar.extractfile(
                'oskm/agentic/runtime.py').read().decode('utf-8')

        for text in (skill, readme):
            normalized = ' '.join(text.split())
            for token in (
                'knowledge.tar.gz', 'knowledge.db', 'interface/sdk-js',
                'interface/sdk_c', 'OSKM_YELLOW_DB_BASE_URL',
                '~/.oskm/knowledge.db', '.claude/skills/oskm',
                '${CODEX_HOME:-$HOME/.codex}/skills/oskm', 'runtime install',
            ):
                self.assertIn(token, normalized)
            for removed in (
                'OSKM_YELLOW_SDK_BASE_URL', 'GitCode token',
                'CodeHub token', 'git clone', 'oskm-skill', 'oskm_skill',
            ):
                self.assertNotIn(removed, normalized)
        normalized_readme = ' '.join(readme.split())
        for token in (
            '~/.claude/skills/oskm', '<tool-skill-root>/oskm',
        ):
            self.assertIn(token, normalized_readme)
        for removed in (
            'PROXY_ENVIRONMENT_KEYS', 'http.proxy=', 'https.proxy=',
            'git clone', 'git fetch', 'git checkout',
        ):
            self.assertNotIn(removed, runtime)

    def test_checksum_matches_archive(self):
        digest = hashlib.sha256(self.archive.read_bytes()).hexdigest()
        checksum = Path(self.release['checksums']).read_text(encoding='utf-8')
        self.assertEqual(checksum, f'{digest}  {self.archive.name}\n')
        self.assertEqual(self.release['sha256'], digest)

    def test_release_uses_the_skill_name(self):
        self.assertEqual(bundle_builder.skill_name(), 'oskm')
        self.assertEqual(bundle_builder.ROOT_NAME, bundle_builder.skill_name())
        self.assertEqual(
            self.archive.name,
            f'{bundle_builder.ROOT_NAME}-{self.release["version"]}.tar.gz')

    def test_archive_build_is_reproducible(self):
        repeat = build_bundle(self.root / 'dist-reproducible')
        repeat_archive = Path(repeat['archive'])
        self.assertEqual(self.release['sha256'], repeat['sha256'])
        self.assertEqual(self.archive.read_bytes(), repeat_archive.read_bytes())
        self.assertEqual(
            Path(self.release['checksums']).read_text(encoding='utf-8'),
            Path(repeat['checksums']).read_text(encoding='utf-8'))

    def test_archive_member_metadata_is_normalized(self):
        with tarfile.open(self.archive, 'r:gz') as tar:
            members = list(tar)
        self.assertTrue(members)
        for member in members:
            self.assertEqual(member.mtime, 0)
            self.assertEqual(member.uid, 0)
            self.assertEqual(member.gid, 0)
            self.assertEqual(member.uname, '')
            self.assertEqual(member.gname, '')
            if member.isdir():
                self.assertEqual(member.mode, 0o755)
            else:
                self.assertIn(member.mode, {0o644, 0o755})

    def test_staged_package_runs_without_the_source_tree(self):
        package = stage_bundle(self.root / 'stage')
        self.assertFalse((package / 'oskm').exists())

        listed = self._run_python(package, '-m', 'agentic', 'ask', '--list')
        self.assertEqual(listed.returncode, 0, listed.stderr)
        self.assertIn('get_component', listed.stdout)

        doctor = self._run_python(
            package, '-m', 'agentic.runtime', 'doctor')
        self.assertEqual(doctor.returncode, 0, doctor.stderr)
        self.assertIn('Modules: agentic, oskm_schema (OK)', doctor.stdout)

        probe = self._run_python(
            package,
            '-c',
            'import agentic.cli, importlib.util, pathlib; '
            'print(pathlib.Path(agentic.cli.__file__).resolve()); '
            'print(importlib.util.find_spec("oskm"))',
        )
        self.assertEqual(probe.returncode, 0, probe.stderr)
        lines = probe.stdout.strip().splitlines()
        self.assertTrue(
            Path(lines[0]).is_relative_to(package.resolve()), lines[0])
        self.assertEqual(lines[-1], 'None')

    def test_extracted_archive_queries_a_database(self):
        extracted = self.root / 'extracted'
        extracted.mkdir()
        with tarfile.open(self.archive, 'r:gz') as tar:
            if hasattr(tarfile, 'data_filter'):
                tar.extractall(extracted, filter='data')
            else:
                tar.extractall(extracted)
        package = extracted / 'oskm'
        db = create_fixture_db(self.root / 'knowledge.db')

        body = f'''
import importlib.util, json
from agentic.query.session import SessionManager
from agentic.query.tools import dispatch

manager = SessionManager()
manager.open({str(db)!r})
calls = [
    ("get_component", {{"name": "ace_engine"}}),
    ("get_service", {{"cfg": "/etc/init/foo.cfg", "name": "foo"}}),
    ("get_install_module", {{"label": "//base/foo:foo"}}),
    ("owner_of", {{"dest": "system/lib/libfoo.so"}}),
    ("installed_at", {{"dest": "system/app/Bar/deep/file.txt"}}),
]
results = {{}}
for name, params in calls:
    result = dispatch(name, params, manager)
    if "error" in result:
        raise AssertionError((name, result))
    results[name] = result
manager.close()
assert importlib.util.find_spec("oskm") is None
print(json.dumps(results, ensure_ascii=False))
'''
        queried = self._run_python(package, '-c', body)
        self.assertEqual(queried.returncode, 0, queried.stderr)
        results = json.loads(queried.stdout)
        self.assertEqual(results['get_component']['name'], 'ace_engine')
        self.assertEqual(results['get_service']['name'], 'foo')
        self.assertEqual(
            results['get_install_module']['label'], '//base/foo:foo')
        self.assertEqual(results['owner_of']['component'], 'ace_engine')
        self.assertEqual(
            [item['label'] for item in results['installed_at']['modules']],
            ['//base/deep:deep'])


if __name__ == '__main__':
    unittest.main()
