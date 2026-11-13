"""托管运行时的刷新判定：什么时候算过期。

2026-11-12 拆分之后，`needs_refresh()` **只做廉价检查**（状态结构、日期、
文件存在、SDK 非空、SQLite 能打开且 `scans` 可读），不再跑
`PRAGMA integrity_check`。旧实现在这条路径上跑全量校验，于是每次查询都要
对 19 MB 库付 ~128 ms；而库是 `install` 校验通过后才原子落盘的，之后没有
任何代码路径会改它。完整的表/列契约校验仍在 `install` 落盘前与显式
`validate-db` 时执行，都由 CLI 的 `oskm_cli.database` 提供——**skill 里没有
第二份清单**。见 `docs/architecture/cli-skill-split.md` §5.3。

因此原本"当天日期但 schema 不兼容 → 需要刷新"的用例，改成了廉价检查
真能覆盖的等价情形：文件被截断、`scans` 表不在。

**调用方只有 `bootstrap.py refresh` 一处。** 早先还有一整套
`ensure_runtime()` + 15 分钟失败退避（`.oskm-refresh-retry`），那是查询透传
时代的产物：刷新挂在每条查询前面，端点挂掉时不退避就会每条命令都去试一次
下载。透传删除后刷新是用户**显式要求**的动作，退避没有意义，
`ensure_runtime` / `retry_path` / `refresh_retry_recent` /
`record_refresh_failure` / `clear_refresh_failure` / `state_source` 全部删除。
失败不破坏已有运行时这件事由 `_install_artifacts` 的回滚保证
（见 `test_runtime_install.py`）。
"""

import _path_setup
import json
import re
import sqlite3
import tempfile
import unittest
from pathlib import Path
from oskm_runtime import cli_install, install, state
from oskm_runtime.environment import OPENHARMONY_CI
from oskm_testing.fixture import create_schema

# tests -> skill root（oskm_runtime）-> skills -> packages/oskm
# （oskm_schema、oskm_testing）-> packages/oskm/cli（oskm_cli）。
# `unittest discover` 把测试模块当顶层加载，所以这里手工补路径。
_HERE = Path(__file__).resolve().parent
_SKILL = _HERE.parent
_OSKM = _HERE.parents[2]



class RuntimeRefreshPolicy(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.root = Path(self.temp.name)
        self.write_db()
        (self.root / 'interface/sdk-js').mkdir(parents=True)
        (self.root / 'interface/sdk_c').mkdir(parents=True)
        (self.root / 'interface/sdk-js/api.d.ts').write_text(
            'declare const api: string;', encoding='utf-8')
        (self.root / 'interface/sdk_c/api.h').write_text(
            '#pragma once', encoding='utf-8')

    def write_db(self, *, legacy=False):
        path = self.root / 'knowledge.db'
        path.unlink(missing_ok=True)
        connection = sqlite3.connect(path)
        if legacy:
            connection.execute(
                'CREATE TABLE scans (id INTEGER PRIMARY KEY, product TEXT, '
                'workspace_root TEXT, started_at TEXT, finished_at TEXT)')
        else:
            create_schema(connection)
            connection.execute(
                'INSERT INTO scans '
                '(id, product, workspace_root, started_at, finished_at) '
                'VALUES (1, ?, ?, ?, ?)',
                ('test', '/src',
                 '2026-11-02T00:00:00Z', '2026-11-02T00:00:01Z'))
        connection.commit()
        connection.close()

    def tearDown(self):
        self.temp.cleanup()

    def write_state(self, db_date, sdk_date, *, source=OPENHARMONY_CI,
                    version=state.STATE_VERSION, **extra):
        document = {
            'version': version,
            'source': source,
            'date': db_date,
            'db': {'date': db_date, 'path': 'knowledge.db'},
            'sdk': {
                'date': sdk_date,
                'sdk-js': {'path': 'interface/sdk-js'},
                'sdk_c': {'path': 'interface/sdk_c'},
            },
        }
        document.update(extra)
        if source == 'local':
            document['source_root'] = str(self.root.resolve())
        (self.root / state.STATE_NAME).write_text(
            json.dumps(document), encoding='utf-8')

    # ------------------------------------------------------------ 廉价刷新判定

    def test_current_date_and_present_files_do_not_refresh(self):
        self.write_state('20261102', '20261102')
        self.assertFalse(state.needs_refresh(
            self.root / 'knowledge.db', current_date='20261102'))

    def test_previous_date_refreshes_both_artifacts(self):
        self.write_state('20261101', '20261101')
        self.assertTrue(state.needs_refresh(
            self.root / 'knowledge.db', current_date='20261102'))

    def test_previous_date_local_source_does_not_refresh_by_date(self):
        self.write_state('20261101', '20261101', source='local')
        self.assertFalse(state.needs_refresh(
            self.root / 'knowledge.db', current_date='20261102'))

    def test_incomplete_local_source_still_refreshes(self):
        self.write_state('20261102', '20261102', source='local')
        for child in (self.root / 'interface/sdk_c').iterdir():
            child.unlink()
        self.assertTrue(state.needs_refresh(
            self.root / 'knowledge.db', current_date='20261102'))

    def test_missing_sdk_refreshes_even_on_the_same_date(self):
        self.write_state('20261102', '20261102')
        for child in (self.root / 'interface/sdk_c').iterdir():
            child.unlink()
        self.assertTrue(state.needs_refresh(
            self.root / 'knowledge.db', current_date='20261102'))

    def test_missing_database_file_refreshes(self):
        self.write_state('20261102', '20261102')
        (self.root / 'knowledge.db').unlink()
        self.assertTrue(state.needs_refresh(
            self.root / 'knowledge.db', current_date='20261102'))

    def test_truncated_database_refreshes(self):
        """廉价检查仍然抓得住"文件在但已经不是库了"。"""
        self.write_state('20261102', '20261102')
        (self.root / 'knowledge.db').write_bytes(b'SQLite format 3\x00truncated')
        self.assertTrue(state.needs_refresh(
            self.root / 'knowledge.db', current_date='20261102'))

    def test_database_without_scans_refreshes(self):
        self.write_state('20261102', '20261102')
        connection = sqlite3.connect(self.root / 'knowledge.db')
        connection.execute('DROP TABLE scans')
        connection.commit()
        connection.close()
        self.assertTrue(state.needs_refresh(
            self.root / 'knowledge.db', current_date='20261102'))

    def test_legacy_schema_alone_does_not_refresh(self):
        """**故意的行为变更**：schema 不兼容不再触发刷新。

        完整契约校验是 `install` / `validate-db` 的职责；把它们塞进每次查询
        的必经之路，就是旧实现那 128 ms 的来源。这里把这条边界钉住，
        免得以后有人"顺手加回去"。
        """
        self.write_db(legacy=True)
        self.write_state('20261102', '20261102')
        self.assertFalse(state.needs_refresh(
            self.root / 'knowledge.db', current_date='20261102'))
        # 但显式校验仍然报得出来——而且是 CLI 报的，不是 skill 自己。
        with self.assertRaisesRegex(ValueError, '不兼容'):
            install.default_validator()(self.root / 'knowledge.db')

    def test_missing_cli_section_does_not_force_a_redownload(self):
        """version 2 的老状态文件（没有 `cli` 段）不该触发 DB/SDK 重新下载。

        CLI 由 `cli_install.ensure_cli()` 单独补齐；把它算进 `needs_refresh`
        会让所有 2.5.6 用户在升级后第一次查询就撞一次注定失败的下载。
        """
        self.write_state('20261102', '20261102', version=2)
        self.assertFalse(state.needs_refresh(
            self.root / 'knowledge.db', current_date='20261102'))

    def test_unmanaged_database_is_not_refreshed(self):
        self.assertFalse(state.needs_refresh(
            self.root / 'knowledge.db', current_date='20261102'))

    # ------------------------------------------------------------ schema 契约

    def test_schema_gate_rejects_missing_entity_table(self):
        """契约来自 CLI；skill 只是转发（`install.default_validator`）。"""
        self.write_db()
        connection = sqlite3.connect(self.root / 'knowledge.db')
        connection.execute('DROP TABLE elf_modules')
        connection.commit()
        connection.close()

        database = cli_install.load_database()
        problem = database.schema_problem(self.root / 'knowledge.db')
        self.assertIsNotNone(problem)
        self.assertIn('elf_modules', problem)
        with self.assertRaisesRegex(ValueError, '不兼容'):
            install.default_validator()(self.root / 'knowledge.db')

    # 只认真正的 import 与赋值，不把解释历史的散文当成违规——
    # `oskm_runtime/__init__.py` 里就写着"历史上 REQUIRED_COLUMNS 是第二份"，
    # 那句话恰恰是读者需要的交代。
    LOCAL_CONTRACT = re.compile(
        r'^\s*(?:from|import)\s+oskm_schema\b|^\s*REQUIRED_COLUMNS\s*=', re.M)

    def test_the_validator_is_the_cli_not_a_local_copy(self):
        """钉住"只有一份清单"：skill 里没有 schema 契约的副本。"""
        self.assertIs(install.default_validator(),
                      cli_install.load_database().validate_db)
        runtime_dir = Path(install.__file__).resolve().parent
        offenders = []
        for source in sorted(runtime_dir.glob('*.py')):
            for number, line in enumerate(self.LOCAL_CONTRACT.findall(
                    source.read_text(encoding='utf-8')), 1):
                offenders.append(f'{source.name}:{number}: {line.strip()}')
        self.assertEqual(offenders, [])


class StateFileRoundTrip(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.root = Path(self.temp.name)

    def tearDown(self):
        self.temp.cleanup()

    def test_write_state_is_readable_and_versioned(self):
        path = self.root / state.STATE_NAME
        state.write_state(path, {'version': state.STATE_VERSION, 'date': '20261112'})
        self.assertEqual(
            json.loads(path.read_text(encoding='utf-8'))['version'],
            state.STATE_VERSION)

    def test_update_state_merges_without_touching_other_sections(self):
        db = self.root / 'knowledge.db'
        state.write_state(self.root / state.STATE_NAME, {
            'version': 2, 'source': OPENHARMONY_CI, 'date': '20261111',
            'db': {'path': 'knowledge.db'},
        })
        updated = state.update_state(db, cli={'path': 'oskm-cli.pyz'})
        self.assertEqual(updated['cli'], {'path': 'oskm-cli.pyz'})
        self.assertEqual(updated['db'], {'path': 'knowledge.db'})
        self.assertEqual(updated['version'], 2)

    def test_update_state_is_a_noop_for_unmanaged_runtimes(self):
        self.assertIsNone(state.update_state(self.root / 'knowledge.db', cli={}))

    def test_broken_state_file_is_reported_not_swallowed(self):
        (self.root / state.STATE_NAME).write_text('{not json', encoding='utf-8')
        with self.assertRaisesRegex(ValueError, '不可读'):
            state.load_state(self.root / 'knowledge.db')

    def test_state_file_that_is_not_an_object_is_rejected(self):
        (self.root / state.STATE_NAME).write_text('[]', encoding='utf-8')
        with self.assertRaisesRegex(ValueError, '格式错误'):
            state.load_state(self.root / 'knowledge.db')


if __name__ == '__main__':
    unittest.main()
