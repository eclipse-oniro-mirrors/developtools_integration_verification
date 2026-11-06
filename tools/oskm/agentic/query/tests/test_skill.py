"""SKILL.md 的门禁：命令真跑、数字真算、索引真生成。

为什么不止校"工具名存在"：**门禁能校工具名和计数，校不了"这个建议本身是坏的"。**
AGENTS.md 曾经推荐 `elf_dependencies(max_distance=3)`，工具名没错、参数也合法，
但那是一次 90 秒、1.27 MB 的调用——只有真跑才看得出来。
所以这里把 SKILL.md 里的每条命令都执行一遍，并盯住耗时与响应大小。

同理，SKILL.md 里写的规模数字（56 个子系统、932 个模块有实现……）全部对真库复算。
写错一个数，使用者会据此做判断。
"""
import io
import json
import os
import re
import shlex
import sqlite3
import subprocess
import sys
import tempfile
import time
import contextlib
import unittest
from pathlib import Path

sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..', '..'))

from agentic import cli
from agentic.query.tests.testdb import DB, latest_scan, elf_dest, preferred_library_root
from agentic.query.tests.testdb import system_library_dests

# tests/ -> query/ -> agentic/ -> oskm/ -> packages/ -> KnowledgeBase/
AGENTIC = Path(__file__).resolve().parents[2]
OSKM = AGENTIC.parent
SKILL = AGENTIC / 'SKILL.md'
TOOLS_MD = AGENTIC / 'reference/tools.md'

# SKILL.md 里的命令带 $DB 占位；真跑时换成实库。
SKIP = (
    '--db a.db',               # 文档里的示例库名，故意不存在
    'query.sql',               # 示例文件名
    '--scan-b 2',              # rk3568 库只有一个快照，跨快照示例没法在这里真跑；
                               # 参数位置的正确性由 test_cli.py 的 diff 用例保证
)
# 占位符一律跳过。先前是把 `<工具名>` 这种逐个列进 SKIP，结果每加一句
# 示范就漏一次——`<子命令>` 就是这么被门禁当成真命令跑了。改成按形状判。
PLACEHOLDER = re.compile(r'[<>]|\.\.\.|…')


def commands():
    text = SKILL.read_text(encoding='utf-8')
    found = []
    for line in text.splitlines():
        line = line.strip()
        if not line.startswith('python3 -m agentic '):
            continue
        if any(token in line for token in SKIP) or PLACEHOLDER.search(line):
            continue
        found.append(line.split('#')[0].strip())
    return found


_ELF_SAMPLES = (
    'system/lib/module/multimedia/libimage.z.so',
    'system/lib/chipset-sdk-sp/libbeget_proxy.z.so',
    'system/lib/platformsdk/libace_engine_pa_ark.z.so',
)
_ELF_DEST_CACHE = {}


def sample_elf_dest(basename, db_path=None):
    """Resolve a SKILL.md rk3568 sample basename in the selected database.

    SKILL.md uses rk3568 examples (`system/lib`), but a yellow/arm64 database
    installs the same files under `system/lib64`. The command *shape* stays the
    same; only the sample path is replaced with the actual dest.
    """
    db_path = Path(db_path or DB)
    key = (str(db_path), basename)
    if key in _ELF_DEST_CACHE:
        return _ELF_DEST_CACHE[key]
    original = next(path for path in _ELF_SAMPLES if path.endswith('/' + basename))
    result = elf_dest(basename, db_path, fallback=original)
    _ELF_DEST_CACHE[key] = result
    return result


def run(command):
    # SKILL.md 的示例路径来自 rk3568；当前库可能是 yellow/arm64。按文件名
    # 找到实际 dest 再做替换，避免把测试绑定在某一种架构目录上。
    for sample in _ELF_SAMPLES:
        command = command.replace(sample, sample_elf_dest(sample.rsplit('/', 1)[-1]))
    # 先 $DB 后 $D：`$DB` 以 `$D` 开头，顺序反了会得到 `--db <path>B`。
    # 用 shlex 而不是 split()：`sql --sql "SELECT COUNT(*) …"` 里的引号
    # 一旦被按空白切开，argparse 会报 unrecognized arguments。
    text = (command.replace('python3 -m agentic ', '')
                   .replace('$DB', str(DB)).replace('$D', f'--db {DB}'))
    argv = shlex.split(text)
    out, err = io.StringIO(), io.StringIO()
    start = time.time()
    with contextlib.redirect_stdout(out), contextlib.redirect_stderr(err):
        try:
            code = cli.main(argv)
        except SystemExit as exc:
            code = exc.code
    return code, out.getvalue(), err.getvalue(), time.time() - start


@unittest.skipUnless(DB.is_file(), f'test database not found: {DB}')
class SkillCommandsRun(unittest.TestCase):
    def test_commands_were_found(self):
        """正则失效时整条断言会空转，先确认真的解析到了命令。"""
        self.assertGreaterEqual(len(commands()), 10, commands())

    def test_every_command_succeeds(self):
        for command in commands():
            code, _, err, _ = run(command)
            self.assertEqual(code, 0, f'{command}\n{err}')

    def test_no_command_is_slow_or_huge(self):
        """盯住耗时与响应大小。

        90 秒 / 1.27 MB 那次就是这么漏出去的：命令本身合法，代价离谱。
        阈值定得宽松（5 秒 / 256 KB），只拦住明显失控的。
        """
        for command in commands():
            _, out, _, elapsed = run(command)
            self.assertLess(elapsed, 5.0, f'{command} 耗时 {elapsed:.1f}s')
            self.assertLess(len(out), 256 * 1024,
                            f'{command} 输出 {len(out)} 字符')


@unittest.skipUnless(DB.is_file(), f'test database not found: {DB}')
class SkillNumbersAreCurrent(unittest.TestCase):
    """SKILL.md 里的规模数字对真库复算。"""

    @classmethod
    def setUpClass(cls):
        cls.text = SKILL.read_text(encoding='utf-8')
        _, out, _, _ = run('python3 -m agentic --db $DB arch overview')
        cls.overview = json.loads(out)
        if cls.overview.get('product') != 'rk3568':
            raise unittest.SkipTest('SKILL.md 的规模数字是 rk3568 基线')

    def assertStated(self, number, label):
        self.assertRegex(self.text, rf'{number:,}|{number}',
                         f'SKILL.md 里找不到 {label} 的实测值 {number}')

    def test_counts_match_the_database(self):
        counts = self.overview['counts']
        for table, label in (('repos', '代码仓'), ('components', '部件'),
                             ('install_modules', '安装模块'),
                             ('install_targets', '镜像文件'),
                             ('elf_modules', 'ELF'), ('services', '服务'),
                             ('sas', 'SA'), ('hdis', 'HDI'),
                             ('gn_args', '编译参数'),
                             ('arkts_modules', 'SDK 模块'), ('arkts_kits', 'Kit')):
            self.assertStated(counts[table], label)

    def test_subsystem_count_matches(self):
        self.assertStated(self.overview['subsystems'], '子系统')

    def test_dependency_hop_counts_match(self):
        """"依赖闭包从 1 跳起"那条的 26/169/297/387 必须是真的。

        这条是防止使用者一上来就要 3 跳的唯一依据，数字错了这条建议就塌了。
        """
        expected = []
        for hops in (1, 2, 3):
            _, out, _, _ = run('python3 -m agentic --db $DB ask elf_dependencies '
                               '--dest system/lib/platformsdk/libace_engine_pa_ark.z.so '
                               f'--max_distance {hops}')
            expected.append(json.loads(out)['total'])
        _, out, _, _ = run('python3 -m agentic --db $DB ask elf_dependencies '
                           '--dest system/lib/platformsdk/libace_engine_pa_ark.z.so')
        expected.append(json.loads(out)['total'])
        self.assertEqual(expected, [26, 169, 297, 387])
        for number in expected:
            self.assertIn(str(number), self.text)

    def test_degraded_collector_count_matches(self):
        _, out, _, _ = run('python3 -m agentic --db $DB ask get_scan_info')
        info = json.loads(out)
        collectors = info.get('collectors') or []
        degraded = [c for c in collectors if c.get('status') == 'degraded']
        self.assertEqual(len(collectors), 12)
        self.assertEqual(len(degraded), 4)
        self.assertIn('12 个采集器里 4 个', self.text)


class SkillSamplePathSelection(unittest.TestCase):
    @staticmethod
    def write_fixture(db_path, cpu_arch):
        connection = sqlite3.connect(db_path)
        connection.executescript("""
            CREATE TABLE scans (
                id INTEGER PRIMARY KEY, finished_at TEXT,
                product TEXT, zone TEXT, cpu_arch TEXT
            );
            CREATE TABLE install_targets (
                id INTEGER PRIMARY KEY, scan_id INTEGER, dest TEXT
            );
            CREATE TABLE elf_modules (
                id INTEGER PRIMARY KEY, scan_id INTEGER,
                install_target_id INTEGER, file_name TEXT
            );
        """)
        connection.execute(
            "INSERT INTO scans VALUES (1, 'done', 'test-product', ?, ?)",
            ('yellow' if cpu_arch == 'arm64' else 'blue', cpu_arch))
        connection.executemany(
            'INSERT INTO install_targets VALUES (?, 1, ?)',
            ((1, 'system/lib/module/multimedia/libimage.z.so'),
             (2, 'system/lib64/module/multimedia/libimage.z.so')))
        connection.executemany(
            'INSERT INTO elf_modules VALUES (?, 1, ?, ?)',
            ((1, 1, 'libimage.z.so'), (2, 2, 'libimage.z.so')))
        connection.commit()
        connection.close()

    def resolve(self, cpu_arch):
        with tempfile.TemporaryDirectory() as temp:
            db_path = Path(temp) / 'knowledge.db'
            self.write_fixture(db_path, cpu_arch)
            _ELF_DEST_CACHE.pop((str(db_path), 'libimage.z.so'), None)
            return sample_elf_dest('libimage.z.so', db_path)

    def test_blue_arm_prefers_lib(self):
        self.assertEqual(self.resolve('arm'),
                         'system/lib/module/multimedia/libimage.z.so')

    def test_yellow_arm64_prefers_lib64(self):
        self.assertEqual(self.resolve('arm64'),
                         'system/lib64/module/multimedia/libimage.z.so')

    def test_yellow_arm64_gate_rejects_mixed_library_roots(self):
        with tempfile.TemporaryDirectory() as temp:
            db_path = Path(temp) / 'knowledge.db'
            self.write_fixture(db_path, 'arm64')
            wrong = [dest for dest in system_library_dests(db_path)
                     if not dest.startswith(preferred_library_root(db_path))]
        self.assertEqual(wrong, ['system/lib/module/multimedia/libimage.z.so'])

    def test_old_database_without_scan_metadata_is_rejected(self):
        with tempfile.TemporaryDirectory() as temp:
            db_path = Path(temp) / 'knowledge.db'
            connection = sqlite3.connect(db_path)
            connection.execute(
                'CREATE TABLE scans (id INTEGER PRIMARY KEY, product TEXT, finished_at TEXT)')
            connection.commit()
            connection.close()
            with self.assertRaisesRegex(RuntimeError, 'rescan'):
                latest_scan(db_path)


@unittest.skipUnless(DB.is_file(), f'test database not found: {DB}')
class SelectedDatabasePathsMatchCpuArch(unittest.TestCase):
    """The selected database must not mix the two system library layouts."""

    @classmethod
    def setUpClass(cls):
        cls.scan = latest_scan(DB)
        if not cls.scan:
            raise unittest.SkipTest('selected database has no finished scan')
        cls.root = preferred_library_root(DB)

    def test_scan_metadata_is_available(self):
        self.assertIn(self.scan['zone'], ('blue', 'yellow'))
        self.assertIn(self.scan['cpu_arch'], ('arm', 'arm64'))

    def test_scan_metadata_selects_the_expected_library_root(self):
        expected = 'system/lib64/' if self.scan['cpu_arch'] == 'arm64' else 'system/lib/'
        self.assertEqual(self.root, expected)

    def test_system_install_destinations_use_the_expected_root(self):
        dests = system_library_dests(DB)
        if not dests:
            self.skipTest('selected database has no system library destinations')
        # musl 动态链接器（ld-musl-*.so.1）固定装在 system/lib/，不随 cpu_arch
        # 走 lib64/——这是唯一合法的跨根例外（黄区 arm64 实测仅此一例）。
        wrong = [dest for dest in dests
                 if not dest.startswith(self.root)
                 and not dest.rsplit('/', 1)[-1].startswith('ld-musl-')]
        self.assertEqual(wrong, [],
                         f'{self.scan["zone"]}/{self.scan["cpu_arch"]} 库出现错误路径: '
                         f'{wrong[:10]}')


class ToolIndexIsGenerated(unittest.TestCase):
    def test_reference_matches_the_generator(self):
        """`reference/tools.md` 必须与 `ask --list --markdown` 逐字一致。

        手抄过的清单已经漂过四次（43/43/49/49，真值 50）。
        这里不比对"数量对不对"，直接比对全文。
        """
        self.assertTrue(TOOLS_MD.is_file(), f'缺少 {TOOLS_MD}')
        body = TOOLS_MD.read_text(encoding='utf-8')
        generated = cli.tool_index(markdown=True)
        self.assertIn(generated, body,
                      '索引与生成结果不一致，重新生成：\n'
                      '  python3 oskm.py ask --list --markdown')

    def test_header_warns_against_hand_editing(self):
        body = TOOLS_MD.read_text(encoding='utf-8')
        self.assertIn('不要手改', body)


class SkillRuntimeContract(unittest.TestCase):
    """运行时契约：一个统一归档，内含 DB 与两套 SDK 源码。"""

    USAGE = AGENTIC / 'docs/usage.md'
    DESIGN = AGENTIC / 'docs/skill-design.md'

    def test_first_use_bootstrap_is_explicit(self):
        text = ' '.join(SKILL.read_text(encoding='utf-8').split())
        self.assertIn('~/.oskm/knowledge.db', text)
        self.assertIn('runtime install --runtime-root ~/.oskm', text)
        self.assertIn('不要对任意缺失的 `--db` 路径自动下载', text)

    def test_runtime_inputs_are_one_archive_with_database_and_two_sdk_trees(self):
        text = SKILL.read_text(encoding='utf-8')
        for token in (
                'knowledge.tar.gz', 'knowledge.db',
                'interface/sdk-js', 'interface/sdk_c'):
            self.assertIn(token, text)
        self.assertNotIn('不读源码', text,
                         'SDK 源码是运行时输入；应允许按 DB 证据路径读取，而不是一律禁止')

    def test_design_document_uses_the_same_runtime_contract(self):
        text = self.DESIGN.read_text(encoding='utf-8')
        for token in ('knowledge.db', 'sdk-js', 'sdk_c'):
            self.assertIn(token, text)
        self.assertNotIn('不读源码', text)

    def test_python_runtime_cli_is_primary_on_unix_and_windows(self):
        text = self.USAGE.read_text(encoding='utf-8')
        normalized = ' '.join(text.split())
        for command in (
            'python3 -m agentic.runtime download-db',
            'python3 -m agentic.runtime install',
            'py -3 -m agentic.runtime download-db',
            'py -3 -m agentic.runtime install',
        ):
            self.assertIn(command, normalized)
        self.assertIn('Windows', normalized)
        self.assertIn('Python 3.10+', normalized)

    def test_dependency_doctor_and_platform_install_commands_are_documented(self):
        usage = ' '.join(self.USAGE.read_text(encoding='utf-8').split())
        skill = ' '.join(SKILL.read_text(encoding='utf-8').split())
        for token in (
            'python3 -m agentic.runtime doctor',
            'python3.12 -m agentic.runtime doctor',
            'py -3.12 -m agentic.runtime doctor',
            'brew install python@3.12',
            'sudo apt install python3.12',
            'winget install Python.Python.3.12',
        ):
            self.assertIn(token, usage)
        self.assertIn('python3 -m agentic.runtime doctor', skill)
        self.assertIn('不要求 Git', skill)

    def test_initialization_documents_both_zones_and_unified_archive_layout(self):
        text = self.USAGE.read_text(encoding='utf-8')
        self.assertIn('knowledge.tar.gz', text)
        self.assertIn('--zone blue', text)
        self.assertIn('--zone yellow', text)
        self.assertIn('interface/sdk-js', text)
        self.assertIn('interface/sdk_c', text)
        self.assertNotIn('└── interface/interface', text)

    def test_yellow_zone_configuration_is_local_and_secret_free(self):
        documents = (
            SKILL,
            self.USAGE,
            AGENTIC / 'scripts/bundle_README.md',
        )
        required = (
            'knowledge.tar.gz', 'interface/sdk-js', 'interface/sdk_c',
            'OSKM_YELLOW_DB_BASE_URL',
        )
        for document in documents:
            text = ' '.join(document.read_text(encoding='utf-8').split())
            for token in required:
                self.assertIn(token, text, f'{document.name} 缺少：{token}')
            for removed in (
                    'OSKM_YELLOW_SDK_BASE_URL', 'GitCode token',
                    'CodeHub token', 'git clone'):
                self.assertNotIn(removed, text, f'{document.name} 仍包含：{removed}')
        usage = self.USAGE.read_text(encoding='utf-8')
        self.assertIn('agentic/.env.example', usage)
        self.assertIn('真实 `.env` 已被', usage)
        self.assertIn('OSKM_DEFAULT_ZONE', usage)

    def test_unified_archive_and_historical_db_download_compatibility(self):
        text = self.USAGE.read_text(encoding='utf-8')
        for suffix in ('.zip', '.tar', '.tar.gz', '.tgz', '.tar.xz', '.txz'):
            self.assertIn(suffix, text, f'归档后缀缺失：{suffix}')
        normalized = ' '.join(text.split())
        self.assertIn('统一归档', normalized)
        self.assertIn('download-db', normalized)
        self.assertIn('只读取其中的 `knowledge.db`', normalized)
        self.assertNotIn('Git clone', normalized)
        self.assertNotIn('extract_sdk', text)
        self.assertNotIn('interface_sdk-js.zip', text)

    def test_yellow_database_download_uses_the_date_endpoint(self):
        text = self.USAGE.read_text(encoding='utf-8')
        normalized = ' '.join(text.split())
        self.assertIn('$OSKM_YELLOW_DB_BASE_URL/$date', normalized)
        self.assertIn('--zone yellow', normalized)
        self.assertIn('--output "$DB_OUT"', normalized)
        self.assertNotIn('/latest', text)
        self.assertIn('黄区 URL 为', normalized)

    def test_blue_database_download_posts_one_date_range_and_uses_obs_path(self):
        text = self.USAGE.read_text(encoding='utf-8')
        normalized = ' '.join(text.split())
        self.assertIn(
            'https://dcp.openharmony.cn/api/daily_build/build/list/component',
            text,
        )
        for field in ('startTime', 'endTime', 'buildStatus', 'component'):
            self.assertIn(field, text)
        self.assertIn('${date}00000000', text)
        self.assertIn('${date}235959', text)
        self.assertIn('.data.list.dataList[0].obsPath', text)
        self.assertIn('蓝区必须指定 --component', normalized)
        self.assertIn('不是两个独立时间输入', normalized)

    def test_independent_download_checks_integrity_and_runtime_checks_schema(self):
        normalized = ' '.join(self.USAGE.read_text(encoding='utf-8').split())
        self.assertIn('PRAGMA integrity_check', normalized)
        self.assertIn('独立下载只校验 SQLite 完整性和结构', normalized)
        self.assertIn('托管运行时安装额外校验当前 oskm 查询层 schema', normalized)
        self.assertIn('scans.zone', normalized)
        self.assertIn('collector_tables', normalized)

    def test_sdk_and_automatic_refresh_use_native_python(self):
        documents = (
            SKILL.read_text(encoding='utf-8') + '\n' +
            self.USAGE.read_text(encoding='utf-8')
        )
        normalized = ' '.join(documents.split())
        for token in (
            'Python 标准库', 'urllib.request', 'zipfile', 'tarfile',
            '运行时检查', '每次数据查询前', '安全解压',
        ):
            self.assertIn(token, normalized)
        self.assertIn('Windows 不需要 Bash', normalized)
        self.assertIn('SDK 源码缺失', normalized)

    def test_daily_runtime_state_is_documented(self):
        documents = (
            SKILL.read_text(encoding='utf-8') + '\n' +
            self.USAGE.read_text(encoding='utf-8')
        )
        normalized = ' '.join(documents.split())
        for token in (
            '.oskm-runtime.json', '每次数据查询前', '只覆盖最新一份',
            'scans.zone', 'scans.cpu_arch', 'collector_tables',
        ):
            self.assertIn(token, normalized)


class SkillStaysSmall(unittest.TestCase):
    def test_body_is_within_budget(self):
        """Tier 1 的预算是 150 行。超了就往 spec 挪，不往正文堆。"""
        lines = SKILL.read_text(encoding='utf-8').splitlines()
        self.assertLessEqual(len(lines), 150, f'SKILL.md {len(lines)} 行')

    def test_frontmatter_has_the_required_keys(self):
        head = SKILL.read_text(encoding='utf-8').split('---')[1]
        for key in ('name:', 'description:', 'version:'):
            self.assertIn(key, head)
        self.assertRegex(head, r'(?m)^name:\s*oskm\s*$')

    def test_description_covers_the_six_questions(self):
        """description 是 Tier 0 的全部，该用时想不起来就白做了。"""
        head = SKILL.read_text(encoding='utf-8').split('---')[1]
        for trigger in ('子系统', '部件', '代码仓', '影响', 'SysCap', '编译'):
            self.assertIn(trigger, head, f'description 缺触发词：{trigger}')

    def test_does_not_promise_things_it_cannot_do(self):
        head = SKILL.read_text(encoding='utf-8').split('---')[1]
        self.assertIn('只读', head)
        self.assertIn('不编译', head)


class RuntimeEntrypointScripts(unittest.TestCase):
    INSTALL = AGENTIC / 'scripts/install_runtime.sh'
    DOWNLOAD = AGENTIC / 'scripts/download_db.sh'

    def test_scripts_are_executable_and_have_valid_shell_syntax(self):
        for script in (self.INSTALL, self.DOWNLOAD):
            with self.subTest(script=script.name):
                self.assertTrue(script.is_file(), f'缺少 {script}')
                self.assertTrue(os.access(script, os.X_OK), f'{script.name} 不可执行')
                result = subprocess.run(
                    ['bash', '-n', str(script)],
                    text=True,
                    capture_output=True,
                    check=False,
                )
                self.assertEqual(result.returncode, 0, result.stderr)

    def test_scripts_only_wrap_python_runtime_module(self):
        cases = (
            (self.INSTALL, 'install'),
            (self.DOWNLOAD, 'download-db'),
        )
        for script, subcommand in cases:
            with self.subTest(script=script.name):
                text = script.read_text(encoding='utf-8')
                self.assertIn('PYTHONPATH', text)
                self.assertIn(
                    f'exec "${{PYTHON:-python3}}" -m agentic.runtime {subcommand} "$@"',
                    text,
                )
                for implementation_token in (
                    'curl ', 'unzip ', 'tar -', 'git clone', 'date +',
                    'mktemp ', 'jq ',
                ):
                    self.assertNotIn(implementation_token, text)

    def test_python_help_is_exposed_through_the_wrappers(self):
        env = os.environ.copy()
        env['PYTHON'] = sys.executable
        cases = (
            (self.INSTALL,
             ('blue', 'yellow', '--skip-db', '--skip-sdk')),
            (self.DOWNLOAD,
             ('blue', 'yellow', '--date', '--output', '--component')),
        )
        for script, tokens in cases:
            with self.subTest(script=script.name):
                result = subprocess.run(
                    ['bash', str(script), '--help'],
                    text=True,
                    capture_output=True,
                    check=False,
                    env=env,
                )
                self.assertEqual(result.returncode, 0, result.stderr)
                for token in tokens:
                    self.assertIn(token, result.stdout)


if __name__ == '__main__':
    unittest.main()
