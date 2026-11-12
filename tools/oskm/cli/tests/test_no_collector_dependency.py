"""两个产物的依赖边界——这是它们能各自独立发布的前提。

三条边界，都有静态 + 动态双查：

1. **CLI 不许 import `oskm.collectors`。** 它只读一个已经建好的库；
   一旦拉进采集器，pyz 就得带上半个源码树。
2. **CLI 不许 import skill 侧（`oskm_runtime`）。** 方向只能是 skill → CLI。
   反过来的依赖会让"只要查询能力"的人被迫吃下下载器，正是拆分要消灭的问题。
3. **skill 运行时也不许 import `oskm.collectors`。**

静态检查覆盖所有源文件；动态探针在子进程里跑，避免 `sys.modules` 被前一条
用例污染。实体 API 用小型合成库验证，不依赖本机是否存在 wukong100 DB。
"""
# cli/tests -> cli (oskm_cli) / packages/oskm (oskm_schema, oskm_testing)。
# `unittest discover -s cli/tests` 把测试模块当顶层加载，所以这里手工补路径。
import sys as _sys
from pathlib import Path as _Path
_HERE = _Path(__file__).resolve().parent
for _p in (str(_HERE.parents[0]), str(_HERE.parents[1])):
    if _p not in _sys.path:
        _sys.path.insert(0, _p)
import json
import re
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

from oskm_testing.fixture import create_fixture_db
from oskm_testing.testdb import DB, sample_arkts_module

# cli/tests -> cli -> packages/oskm
CLI = _HERE.parents[0]
OSKM = _HERE.parents[1]
CLI_PACKAGE = CLI / 'oskm_cli'
SKILL_ROOT = OSKM / 'skills' / 'ohos-design-architecture-evidence-query'
SKILL_PACKAGE = SKILL_ROOT / 'oskm_runtime'

# 探针要能同时 import oskm_cli（在 cli/）与 oskm_schema（在 packages/oskm/）。
PROBE = '''
import contextlib, io, json, sys
sys.path.insert(0, {cli!r})
sys.path.insert(0, {root!r})
with contextlib.redirect_stdout(io.StringIO()):
{body}
loaded = sorted(m for m in sys.modules
                if m == "oskm" or m.startswith("oskm.")
                or m == "oskm_runtime" or m.startswith("oskm_runtime."))
print(json.dumps(loaded))
'''


def imported_forbidden_modules(body):
    """Run ``body`` in a clean interpreter and report what it dragged in."""
    result = subprocess.run(
        [sys.executable, '-c',
         PROBE.format(cli=str(CLI), root=str(OSKM), body=body)],
        capture_output=True, text=True, cwd=str(OSKM))
    if result.returncode:
        raise AssertionError(f'探针失败：{result.stderr.strip()[-800:]}')
    lines = result.stdout.strip().splitlines()
    return json.loads(lines[-1]) if lines else []


class StaticBoundaries(unittest.TestCase):
    # 只认真正的 import 语句，不把解释历史的散文当成违规。
    OSKM_IMPORT = re.compile(r'^\s*(?:from|import)\s+oskm(?:\.|\s|$)')
    RUNTIME_IMPORT = re.compile(r'^\s*(?:from|import)\s+oskm_runtime(?:\.|\s|$)')

    @staticmethod
    def _sources(root):
        for source in sorted(root.rglob('*.py')):
            if '__pycache__' in source.parts or source.name.startswith('test_'):
                continue
            yield source

    def _offenders(self, root, pattern):
        found = []
        for source in self._sources(root):
            for number, line in enumerate(
                    source.read_text(encoding='utf-8').splitlines(), 1):
                if pattern.match(line):
                    found.append(f'{source.relative_to(root.parent)}:{number}')
        return found

    def test_cli_has_no_oskm_imports(self):
        self.assertEqual(self._offenders(CLI_PACKAGE, self.OSKM_IMPORT), [])

    def test_cli_has_no_skill_runtime_imports(self):
        """方向只能是 skill → CLI；反过来就把下载器焊回查询层了。"""
        self.assertEqual(self._offenders(CLI_PACKAGE, self.RUNTIME_IMPORT), [])

    def test_skill_runtime_has_no_oskm_imports(self):
        if not SKILL_PACKAGE.is_dir():
            self.skipTest(f'no skill runtime package: {SKILL_PACKAGE}')
        self.assertEqual(self._offenders(SKILL_PACKAGE, self.OSKM_IMPORT), [])

    def test_the_static_scan_actually_saw_sources(self):
        """门禁空转比门禁误报更坏：先确认真的扫到了文件。"""
        self.assertGreater(len(list(self._sources(CLI_PACKAGE))), 20)


class DynamicBoundaries(unittest.TestCase):
    def test_importing_the_cli_loads_neither_collector_nor_runtime(self):
        self.assertEqual(
            imported_forbidden_modules('    from oskm_cli import cli'), [])

    def test_importing_validate_db_loads_no_collector(self):
        self.assertEqual(imported_forbidden_modules(
            '    from oskm_cli.database import REQUIRED_COLUMNS\n'
            '    assert REQUIRED_COLUMNS'), [])


class EntityApiNoCollectorImports(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.db = create_fixture_db(Path(self.temp.name) / 'knowledge.db')

    def tearDown(self):
        self.temp.cleanup()

    def test_session_sql_and_entity_tools_load_no_oskm(self):
        body = f'''
    from oskm_cli.query.session import SessionManager
    from oskm_cli.query.tools import dispatch
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
        self.assertEqual(imported_forbidden_modules(body), [])


@unittest.skipUnless(DB.is_file(), f'test database not found: {DB}')
class RealDatabaseNoCollectorImports(unittest.TestCase):
    def setUp(self):
        self.open = (
            '    from oskm_cli.query.tools import dispatch\n'
            '    from oskm_cli.query.session import SessionManager\n'
            f'    m = SessionManager(); m.open({str(DB)!r})')

    def test_opening_a_session_loads_no_oskm(self):
        self.assertEqual(imported_forbidden_modules(self.open), [])

    def test_sql_query_loads_no_oskm(self):
        self.assertEqual(imported_forbidden_modules(
            self.open + '\n    dispatch("sql_query", '
            '{"sql": "SELECT 1 AS n FROM components"}, m)'), [])

    def test_arkts_tools_load_no_oskm(self):
        # module_key 从库里现取。写死一个的话，换个库这条会"通过"得毫无意义
        # ——工具直接返回 NOT_FOUND，根本走不到 arkts 查询侧那段代码。
        module = sample_arkts_module(DB)
        if not module:
            self.skipTest('selected database has no arkts_modules')
        self.assertEqual(imported_forbidden_modules(
            self.open + '\n    dispatch("get_arkts_module", '
            f'{{"module_key": "{module}"}}, m)'), [])

    def test_arch_overview_loads_no_oskm(self):
        self.assertEqual(imported_forbidden_modules(
            f'    from oskm_cli import cli\n'
            f'    cli.main(["--db", {str(DB)!r}, "arch", "overview"])'), [])


if __name__ == '__main__':
    unittest.main()
