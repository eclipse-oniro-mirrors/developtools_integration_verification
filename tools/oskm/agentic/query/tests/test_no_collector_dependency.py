"""agentic 不许依赖采集器——这是独立发布的前提。

静态检查覆盖所有查询层源文件；动态探针在子进程里跑，避免 `sys.modules`
被前一条用例污染。实体 API 用小型合成库验证，不依赖本机是否存在 rk3568 DB。
"""
import json
import os
import re
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..', '..'))

from agentic.query.tests.fixture import create_fixture_db
from agentic.query.tests.testdb import DB

AGENTIC = Path(__file__).resolve().parents[2]
OSKM = AGENTIC.parent

PROBE = '''
import contextlib, io, json, sys
sys.path.insert(0, {root!r})
with contextlib.redirect_stdout(io.StringIO()):
{body}
loaded = sorted(m for m in sys.modules
                if m == "oskm" or m.startswith("oskm."))
print(json.dumps(loaded))
'''


def imported_oskm_modules(body):
    result = subprocess.run(
        [sys.executable, '-c', PROBE.format(root=str(OSKM), body=body)],
        capture_output=True, text=True, cwd=str(OSKM))
    if result.returncode:
        raise AssertionError(f'探针失败：{result.stderr.strip()[-800:]}')
    lines = result.stdout.strip().splitlines()
    return json.loads(lines[-1]) if lines else []


class StaticNoCollectorImports(unittest.TestCase):
    # 只认真正的 import 语句，不把解释历史的散文当成违规。
    IMPORT = re.compile(r'^\s*(?:from|import)\s+oskm(?:\.|\s|$)')

    def test_importing_the_cli_loads_no_collector(self):
        self.assertEqual(imported_oskm_modules('    from agentic import cli'), [])

    def test_source_tree_has_no_oskm_imports(self):
        offenders = []
        for source in sorted(AGENTIC.rglob('*.py')):
            if '__pycache__' in source.parts or source.name.startswith('test_'):
                continue
            for number, line in enumerate(
                    source.read_text(encoding='utf-8').splitlines(), 1):
                if self.IMPORT.match(line):
                    offenders.append(f'{source.relative_to(AGENTIC)}:{number}')
        self.assertEqual(offenders, [])


class EntityApiNoCollectorImports(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.db = create_fixture_db(Path(self.temp.name) / 'knowledge.db')

    def tearDown(self):
        self.temp.cleanup()

    def test_session_sql_and_entity_tools_load_no_oskm(self):
        body = f'''
    from agentic.query.session import SessionManager
    from agentic.query.tools import dispatch
    manager = SessionManager()
    manager.open({str(self.db)!r})
    calls = [
        ("get_component", {{"name": "ace_engine"}}),
        ("get_service", {{"cfg": "/etc/init/foo.cfg", "name": "foo"}}),
        ("get_install_module", {{"label": "//base/foo:foo"}}),
        ("owner_of", {{"dest": "system/lib/libfoo.so"}}),
        ("installed_at", {{"dest": "system/app/Bar/deep/file.txt"}}),
    ]
    for name, params in calls:
        result = dispatch(name, params, manager)
        if "error" in result:
            raise AssertionError((name, result))
    rows = manager.get_active().sql(
        "SELECT name FROM components WHERE scan_id = ?", (manager.get_active().scan_id,))
    if not rows:
        raise AssertionError("sql returned no rows")
    manager.close()
'''
        self.assertEqual(imported_oskm_modules(body), [])


@unittest.skipUnless(DB.is_file(), f'test database not found: {DB}')
class RealDatabaseNoCollectorImports(unittest.TestCase):
    def setUp(self):
        self.open = (
            '    from agentic.query.tools import dispatch\n'
            '    from agentic.query.session import SessionManager\n'
            f'    m = SessionManager(); m.open({str(DB)!r})')

    def test_opening_a_session_loads_no_oskm(self):
        self.assertEqual(imported_oskm_modules(self.open), [])

    def test_sql_query_loads_no_oskm(self):
        self.assertEqual(imported_oskm_modules(
            self.open + '\n    dispatch("sql_query", '
            '{"sql": "SELECT 1 AS n FROM components"}, m)'), [])

    def test_arkts_tools_load_no_oskm(self):
        self.assertEqual(imported_oskm_modules(
            self.open + '\n    dispatch("get_arkts_module", '
            '{"module_key": "api/@ohos.multimedia.image"}, m)'), [])

    def test_arch_overview_loads_no_oskm(self):
        self.assertEqual(imported_oskm_modules(
            f'    from agentic import cli\n'
            f'    cli.main(["--db", {str(DB)!r}, "arch", "overview"])'), [])


if __name__ == '__main__':
    unittest.main()
