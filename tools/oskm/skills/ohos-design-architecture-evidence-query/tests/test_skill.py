"""SKILL.md 的门禁：命令真跑、结构真校、索引真生成。

命令尽量在合成库上执行，只验证命令形态、运行成本和输出契约；真实知识库会随扫描
变化，不能作为 skill 测试的固定数据源。

为什么不止校"工具名存在"：**门禁能校工具名和计数，校不了"这个建议本身是坏的"。**
AGENTS.md 曾经推荐 `elf_dependencies(max_distance=3)`，工具名没错、参数也合法，
但那是一次 90 秒、1.27 MB 的调用——只有真跑才看得出来。
所以这里把 SKILL.md 里的每条命令都执行一遍，并盯住耗时与响应大小。
"""
# tests -> skill root（oskm_runtime）-> skills -> packages/oskm
# （oskm_schema、oskm_testing）-> packages/oskm/cli（oskm_cli）。
# `unittest discover` 把测试模块当顶层加载，所以这里手工补路径。
import sys as _sys
from pathlib import Path as _Path
_HERE = _Path(__file__).resolve().parent
_SKILL = _HERE.parent
_OSKM = _HERE.parents[2]
for _p in (str(_SKILL), str(_OSKM / 'cli'), str(_OSKM)):
    if _p not in _sys.path:
        _sys.path.insert(0, _p)
import io
import json
import os
import re
import shlex
import subprocess
import sys
import tempfile
import time
import contextlib
import unittest
from pathlib import Path

from oskm_cli import cli
from oskm_runtime import bootstrap
from oskm_testing.fixture import create_fixture_db

SKILL_ROOT = _SKILL
OSKM = _OSKM
SKILL = SKILL_ROOT / 'SKILL.md'
TOOLS_MD = SKILL_ROOT / 'references/tools.md'
BOOTSTRAP = SKILL_ROOT / 'bootstrap.py'
# 两类命令，两个执行者：
#   `python3 bootstrap.py …`  托管命令，走 bootstrap.main
#   `python3 $CLI …`          查询命令，走 CLI（$DB 换成合成库）
# 查询透传已于 2026-11-12 删除，所以 SKILL.md 里的查询示例直接调 CLI。
BOOTSTRAP_PREFIX = 'python3 bootstrap.py '
CLI_PREFIX = 'python3 $CLI '
# 托管命令（doctor / cli-path / validate-db …）在临时 runtime root 里跑，
# 绝不碰真实的 ~/.oskm——门禁不该在用户家目录里留痕。
_SANDBOX_ROOT = Path(tempfile.mkdtemp(prefix='oskm skill gate '))

# SKILL.md 里的命令带 $DB 占位；真跑时换成合成库。
SKIP = (
    '--db a.db',               # 文档里的示例库名，故意不存在
    'query.sql',               # 示例文件名
    '--scan-b 2',              # 合成库只有一个快照；参数位置由 CLI diff 测试覆盖
)
# 占位符一律跳过。先前是把 `<工具名>` 这种逐个列进 SKIP，结果每加一句
# 示范就漏一次——`<子命令>` 就是这么被门禁当成真命令跑了。改成按形状判。
PLACEHOLDER = re.compile(r'[<>]|\.\.\.|…')

# `install` / `download-db` / `update-cli` 会联网、会往 `~/.oskm` 写 19 MB，
# 不属于一条文档门禁该做的事。显式跳过，并在
# `test_mutating_commands_are_skipped_on_purpose` 里钉住数量——否则哪天有人
# 把 MUTATING 里的词删了，CI 会去写用户的家目录。
MUTATING = ('download-db', 'install', 'update-cli')


def commands(*, include_mutating=False):
    """``(kind, command)`` pairs parsed out of SKILL.md.

    ``kind`` 是 `'bootstrap'` 或 `'cli'`，决定 `run()` 用哪个执行者。
    """
    text = SKILL.read_text(encoding='utf-8')
    found = []
    for line in text.splitlines():
        line = line.strip()
        if any(token in line for token in SKIP) or PLACEHOLDER.search(line):
            continue
        for prefix, kind in ((BOOTSTRAP_PREFIX, 'bootstrap'),
                             (CLI_PREFIX, 'cli')):
            if not line.startswith(prefix):
                continue
            command = line.split('#')[0].strip()
            tokens = command[len(prefix):].split()
            if kind == 'bootstrap' and not include_mutating and \
                    any(token in MUTATING for token in tokens[:3]):
                break
            found.append((kind, command))
            break
    return found


# 文档示例使用 wukong100 的真实实体；门禁只验证命令形态，因此把它们映射到
# schema 完整的合成库。这样替换的是数据，不是命令结构。
_FIXTURE_TEMP = tempfile.TemporaryDirectory(prefix='oskm-skill-fixture-')
_FIXTURE_DB = create_fixture_db(Path(_FIXTURE_TEMP.name) / 'knowledge.db')
_FIXTURE_COMMAND_REPLACEMENTS = (
    ('system/lib64/module/multimedia/libimage.z.so',
     'system/lib/libfoo.so'),
    ('arch provides image_framework', 'arch provides ace_engine'),
    ('arch switch ace_engine_feature_asbng_path',
     'arch switch ace_engine_feature_a'),
    ('arch runtime foundation', 'arch runtime foo'),
    ('ask search_elf_modules --query libimage',
     'ask search_elf_modules --query libfoo'),
)


def run(pair):
    """Execute one SKILL.md command line; return (code, out, err, elapsed)."""
    kind, command = pair
    for documented, synthetic in _FIXTURE_COMMAND_REPLACEMENTS:
        command = command.replace(documented, synthetic)
    # 用 shlex 而不是 split()：`sql --sql "SELECT COUNT(*) …"` 里的引号
    # 一旦被按空白切开，argparse 会报 unrecognized arguments。
    prefix = BOOTSTRAP_PREFIX if kind == 'bootstrap' else CLI_PREFIX
    text = command[len(prefix):].replace('$DB', str(_FIXTURE_DB))
    argv = shlex.split(text)
    out, err = io.StringIO(), io.StringIO()
    start = time.time()
    # 托管命令跑在一个临时 runtime root 里，绝不碰真实的 ~/.oskm。
    if kind == 'bootstrap':
        argv = ['--runtime-root', str(_SANDBOX_ROOT)] + argv
    with contextlib.redirect_stdout(out), contextlib.redirect_stderr(err):
        try:
            code = (bootstrap if kind == 'bootstrap' else cli).main(argv)
        except SystemExit as exc:
            code = exc.code
    return code, out.getvalue(), err.getvalue(), time.time() - start


class SkillCommandsRun(unittest.TestCase):
    """SKILL.md 里的每条命令都在合成库上真跑一遍。

    文档里的真实实体名会按固定映射替换为 `create_fixture_db()` 中的实体，
    只保留命令结构与参数。真实数据库中的数量和实体分布不参与 skill 门禁。
    """

    def test_commands_were_found(self):
        """正则失效时整条断言会空转，先确认真的解析到了命令。"""
        found = commands()
        self.assertGreaterEqual(len(found), 10, found)
        kinds = {kind for kind, _ in found}
        self.assertIn('cli', kinds, 'SKILL.md 里没有解析到任何查询命令')

    def test_query_commands_go_to_the_cli_not_to_bootstrap(self):
        """透传删掉之后，SKILL.md 不该再教人用 `bootstrap.py` 查询。

        这条比看起来重要：文档是 Agent 唯一的输入，写错一个前缀，Agent 就会
        照着敲，然后拿到一句 `未知命令 arch`。
        """
        text = SKILL.read_text(encoding='utf-8')
        for line in text.splitlines():
            stripped = line.strip()
            if not stripped.startswith(BOOTSTRAP_PREFIX):
                continue
            body = stripped[len(BOOTSTRAP_PREFIX):].split()
            if body and body[0] in ('ask', 'arch', 'diff', 'sql'):
                self.fail(f'SKILL.md 仍用 bootstrap 跑查询: {stripped}')

    def test_mutating_commands_are_skipped_on_purpose(self):
        """会写盘/联网的托管命令必须被跳过，且**跳过的正是那几条**。

        门禁能校命令跑得通，校不了"这条命令该不该在这里跑"。`install` 会往
        `~/.oskm` 写 19 MB，`download-db` 会联网——都不属于一条文档门禁该做的
        事。

        这里**不钉条数**（SKILL.md 里的示例条数会变），而是独立地从文本里算出
        "哪些行真的会写盘/联网"，再断言被跳过的恰好是它们。这样：
          · 改示例数量不会误报；
          · 但谁把 `MUTATING` 里的词删了，那些行就会被执行 —— 这里立刻红。
        """
        everything = commands(include_mutating=True)
        executed = commands()
        skipped = [pair for pair in everything if pair not in executed]

        def is_mutating(pair):
            kind, command = pair
            if kind != 'bootstrap':
                return False
            return command[len(BOOTSTRAP_PREFIX):].split()[0] in (
                'install', 'download-db', 'update-cli')

        expected = [pair for pair in everything if is_mutating(pair)]
        self.assertTrue(expected, 'SKILL.md 里没有任何会写盘/联网的示例，这条门禁空转了')
        self.assertEqual(sorted(skipped), sorted(expected))
        self.assertEqual(set(MUTATING), {'install', 'download-db', 'update-cli'})

    def test_every_command_succeeds(self):
        for pair in commands():
            code, _, err, _ = run(pair)
            self.assertEqual(code, 0, f'{pair}\n{err}')

    def test_no_command_is_slow_or_huge(self):
        """盯住耗时与响应大小。

        90 秒 / 1.27 MB 那次就是这么漏出去的：命令本身合法，代价离谱。
        阈值定得宽松（5 秒 / 256 KB），只拦住明显失控的。
        """
        for pair in commands():
            _, out, _, elapsed = run(pair)
            self.assertLess(elapsed, 5.0, f'{pair} 耗时 {elapsed:.1f}s')
            self.assertLess(len(out), 256 * 1024,
                            f'{pair} 输出 {len(out)} 字符')


class ToolIndexIsGenerated(unittest.TestCase):
    def test_reference_matches_the_generator(self):
        """`references/tools.md` 必须与 `ask --list --markdown` 逐字一致。

        手抄过的清单已经漂过四次（43/43/49/49，真值 50）。
        这里不比对"数量对不对"，直接比对全文。
        """
        self.assertTrue(TOOLS_MD.is_file(), f'缺少 {TOOLS_MD}')
        body = TOOLS_MD.read_text(encoding='utf-8')
        generated = cli.tool_index(markdown=True)
        self.assertIn(generated, body,
                      '索引与生成结果不一致，重新生成：\n'
                      '  python3.12 ~/.oskm/oskm-cli.pyz ask --list --markdown')

    def test_header_warns_against_hand_editing(self):
        body = TOOLS_MD.read_text(encoding='utf-8')
        self.assertIn('不要手改', body)
        self.assertNotIn('bootstrap.py ask', body)

    def test_spec_index_and_summary_match_the_registry(self):
        modules = {
            tool.handler.__module__.rsplit('.', 1)[-1]
            for tool in cli.REGISTRY
        }
        count = len(cli.REGISTRY)
        index = (SKILL_ROOT / 'references/spec/README.md').read_text(encoding='utf-8')
        self.assertIn(f'共 {len(modules)} 个模块、{count} 个工具', index)
        self.assertIn(f'{len(modules)} 份规格', SKILL.read_text(encoding='utf-8'))
        self.assertIn(f'{len(modules)} 模块 {count} 工具',
                      (SKILL_ROOT / 'README.md').read_text(encoding='utf-8'))


class EvalCoversRuntimeDistribution(unittest.TestCase):
    """eval 评的是分发流程，不是某个产品库的业务数据。"""

    EVAL = SKILL_ROOT / 'evals/evals.json'

    @classmethod
    def setUpClass(cls):
        cls.payload = json.loads(cls.EVAL.read_text(encoding='utf-8'))
        cls.text = cls.EVAL.read_text(encoding='utf-8')

    def test_eval_json_has_the_expected_shape(self):
        self.assertEqual(
            self.payload['skill_name'],
            'ohos-design-architecture-evidence-query')
        evals = self.payload['evals']
        self.assertGreaterEqual(len(evals), 8)
        self.assertEqual(len({item['id'] for item in evals}), len(evals))
        self.assertEqual(len({item['name'] for item in evals}), len(evals))
        for item in evals:
            for key in ('id', 'name', 'prompt', 'expected_output',
                        'assertions'):
                self.assertIn(key, item)
                self.assertTrue(item[key], f'{item.get("name")} 缺 {key}')
            self.assertIsInstance(item['assertions'], list)
            self.assertTrue(item['assertions'])
            for assertion in item['assertions']:
                self.assertIn(assertion['type'], ('contains', 'llm_judge'))
                self.assertTrue(assertion['text'])

    def test_eval_covers_the_skill_runtime_contract(self):
        normalized = ' '.join(self.text.split())
        for token in (
                'knowledge.tar.gz', 'knowledge.db', 'oskm-cli.pyz',
                'interface/sdk-js', 'interface/sdk_c',
                'install', 'refresh', 'bootstrap.py install',
                'OPENHARMONY_CI', 'HARMONYOS_CI', 'get_scan_info'):
            self.assertIn(token, normalized, f'eval 缺运行时分发场景：{token}')

    def test_eval_does_not_freeze_product_data(self):
        normalized = ' '.join(self.text.split())
        for stale in (
                '57 个子系统', 'arch impact media_foundation',
                'install_targets', 'wukong100 / arm64'):
            self.assertNotIn(stale, normalized,
                             f'eval 仍在冻结业务数据：{stale}')
        self.assertIn('不校验真实产品业务数据', normalized)


class SkillRuntimeContract(unittest.TestCase):
    """运行时契约：一个统一归档，内含 DB、CLI 与两套 SDK 源码。"""

    USAGE = SKILL_ROOT / 'references/usage.md'
    DESIGN = OSKM / 'docs/architecture/query-skill-design.md'

    def test_skill_positions_runtime_distribution_first(self):
        """skill 的主职责是装运行时并说明 CLI 用法，不是自带查询引擎。"""
        skill = SKILL.read_text(encoding='utf-8')
        usage = self.USAGE.read_text(encoding='utf-8')
        for token in ('核心职责', 'knowledge.db', 'interface/sdk-js',
                      'interface/sdk_c', 'oskm-cli.pyz', 'CLI'):
            self.assertIn(token, skill, f'SKILL.md 缺核心职责 token：{token}')
        self.assertIn('skill 不内置查询引擎', skill)
        self.assertIn('本 skill 的整体功能', usage)

    def test_examples_do_not_freeze_database_results(self):
        """示例教字段和判断方法，不把某个快照的结果写成常量。"""
        for path in sorted((SKILL_ROOT / 'examples').glob('*.md')):
            text = path.read_text(encoding='utf-8')
            for stale in ('wukong100', '20261111', '实测', '冻结记录'):
                self.assertNotIn(stale, text,
                                 f'{path.name} 仍冻结数据库结果：{stale}')

    def test_first_use_bootstrap_is_explicit(self):
        text = ' '.join(SKILL.read_text(encoding='utf-8').split())
        self.assertIn('~/.oskm/knowledge.db', text)
        self.assertIn('bootstrap.py install --runtime-root ~/.oskm', text)
        self.assertIn('不要对任意缺失的 `--db` 路径自动下载', text)

    def test_runtime_inputs_are_one_archive_with_database_cli_and_two_sdk_trees(self):
        text = SKILL.read_text(encoding='utf-8')
        for token in (
                'knowledge.tar.gz', 'knowledge.db', 'oskm-cli.pyz',
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
            'python3 bootstrap.py download-db',
            'python3 bootstrap.py install',
            'py -3 bootstrap.py download-db',
            'py -3 bootstrap.py install',
        ):
            self.assertIn(command, normalized)
        self.assertIn('Windows', normalized)
        self.assertIn('Python 3.10+', normalized)

    def test_dependency_doctor_and_platform_install_commands_are_documented(self):
        usage = ' '.join(self.USAGE.read_text(encoding='utf-8').split())
        skill = ' '.join(SKILL.read_text(encoding='utf-8').split())
        for token in (
            'python3 bootstrap.py doctor',
            'python3.12 bootstrap.py doctor',
            'py -3.12 bootstrap.py doctor',
            'brew install python@3.12',
            'sudo apt install python3.12',
            'winget install Python.Python.3.12',
        ):
            self.assertIn(token, usage)
        self.assertIn('python3 bootstrap.py doctor', skill)
        self.assertIn('不要求 Git', skill)

    def test_initialization_documents_both_sources_and_unified_archive_layout(self):
        text = self.USAGE.read_text(encoding='utf-8')
        self.assertIn('knowledge.tar.gz', text)
        self.assertIn('--source OPENHARMONY_CI', text)
        self.assertIn('--source HARMONYOS_CI', text)
        self.assertNotIn('--component', text)
        self.assertIn('interface/sdk-js', text)
        self.assertIn('interface/sdk_c', text)
        self.assertNotIn('└── interface/interface', text)

    def test_download_configuration_is_local_and_secret_free(self):
        documents = (
            SKILL,
            self.USAGE,
            SKILL_ROOT / 'README.md',
        )
        required = (
            'knowledge.tar.gz', 'interface/sdk-js', 'interface/sdk_c',
            'OSKM_DOWNLOAD_SOURCE',
            'OSKM_DOWNLOAD_ENDPOINT',
            'dayu600_7885_ai',
        )
        for document in documents:
            text = ' '.join(document.read_text(encoding='utf-8').split())
            for token in required:
                self.assertIn(token, text, f'{document.name} 缺少：{token}')
            for removed in (
                    'GitCode token', 'CodeHub token', 'git clone'):
                self.assertNotIn(removed, text, f'{document.name} 仍包含：{removed}')
        usage = self.USAGE.read_text(encoding='utf-8')
        self.assertIn('oskm_runtime/.env.example', usage)
        self.assertIn('真实 `.env` 已被', usage)

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

    def test_harmonyos_database_download_uses_the_date_endpoint(self):
        text = self.USAGE.read_text(encoding='utf-8')
        normalized = ' '.join(text.split())
        self.assertIn('$OSKM_DOWNLOAD_ENDPOINT/$date', normalized)
        self.assertIn('--source HARMONYOS_CI', normalized)
        self.assertIn('--output "$DB_OUT"', normalized)
        self.assertNotIn('/latest', text)
        self.assertIn('HARMONYOS_CI URL 为', normalized)

    def test_openharmony_database_download_posts_one_date_range_and_uses_obs_path(self):
        text = self.USAGE.read_text(encoding='utf-8')
        normalized = ' '.join(text.split())
        self.assertIn('OPENHARMONY_CI', text)
        self.assertIn('OSKM_DOWNLOAD_ENDPOINT', text)
        for field in ('startTime', 'endTime', 'buildStatus', 'component'):
            self.assertIn(field, text)
        self.assertIn('${date}00000000', text)
        self.assertIn('${date}235959', text)
        self.assertIn('.data.list.dataList[0].obsPath', text)
        self.assertIn('component 固定为 dayu600_7885_ai', normalized)
        self.assertNotIn('--component', normalized)
        self.assertIn('不是两个独立时间输入', normalized)

    def test_independent_download_checks_integrity_and_runtime_checks_schema(self):
        normalized = ' '.join(self.USAGE.read_text(encoding='utf-8').split())
        self.assertIn('PRAGMA integrity_check', normalized)
        self.assertIn('独立下载只校验 SQLite 完整性和结构', normalized)
        self.assertIn('托管运行时安装则校验当前 oskm 查询层', normalized)
        self.assertIn('不做列迁移，需要重新扫描', normalized)
        self.assertNotIn('staging', normalized)
        self.assertIn('scans.product', normalized)
        self.assertIn('scans.cpu_arch', normalized)
        self.assertIn('collector_tables', normalized)

    def test_sdk_and_refresh_use_native_python(self):
        """下载/解压/校验全走标准库；刷新是**显式**命令而不是查询副作用。

        `每次数据查询前` 这个 token 原来在这里——那是查询透传时代的语义。
        透传删掉之后，刷新只能由 `bootstrap.py refresh` 触发，文档必须跟着改，
        否则读者会以为查询会自动带上最新数据。
        """
        documents = (
            SKILL.read_text(encoding='utf-8') + '\n' +
            self.USAGE.read_text(encoding='utf-8')
        )
        normalized = ' '.join(documents.split())
        for token in (
            'Python 标准库', 'urllib.request', 'zipfile', 'tarfile',
            'bootstrap.py refresh', '廉价检查', '安全解压',
        ):
            self.assertIn(token, normalized)
        self.assertIn('Windows 不需要 Bash', normalized)
        self.assertIn('SDK 源码缺失', normalized)
        self.assertNotIn('每次数据查询前', normalized)

    def test_daily_runtime_state_is_documented(self):
        documents = (
            SKILL.read_text(encoding='utf-8') + '\n' +
            self.USAGE.read_text(encoding='utf-8')
        )
        normalized = ' '.join(documents.split())
        for token in (
            '.oskm-runtime.json', 'bootstrap.py refresh', '只覆盖最新一份',
            'scans.product', 'collector_tables',
        ):
            self.assertIn(token, normalized)
        self.assertIn('scans.cpu_arch', normalized)


class SkillStaysSmall(unittest.TestCase):
    def test_body_is_within_budget(self):
        """Tier 1 预算 180 行。

        原来是 150。2026-11 组织发布《OpenHarmony Agent Skill 实践指导书》，
        §3.4.3 把正文骨架从"作者自由组织"改成**七节固定职责**
        （Task and Boundaries / Trigger Signals / Initial Checks /
        Execution Strategy / Prohibited Practices / Exceptions and Fallbacks /
        References），其中 References 必须逐条登记每份参考文件的读取条件。
        仅是七个小标题 + 一张 14 行的参考路由表就有固定成本，150 行不足以
        同时容纳"判断依据"（指导书 §3.5.1 要求正文优先写决策顺序、取舍标准、
        典型误判、边界与止损）与骨架。

        放宽是**有对价的**：同一批改动新增了
        `SkillMatchesOrgGuide`（七节齐全 + 参考文件全部可达 + 正文无平台专有
        依赖），净结果是更严而不是更松。超预算仍然要往 spec 挪。
        """
        lines = SKILL.read_text(encoding='utf-8').splitlines()
        self.assertLessEqual(len(lines), 180, f'SKILL.md {len(lines)} 行')

    def test_frontmatter_has_the_required_keys(self):
        head = SKILL.read_text(encoding='utf-8').split('---')[1]
        for key in ('name:', 'description:', 'metadata:', 'author:', 'version:'):
            self.assertIn(key, head)
        self.assertRegex(
            head,
            r'(?m)^name:\s*ohos-design-architecture-evidence-query\s*$')
        self.assertRegex(head, r'(?m)^  author:\s*["\']oskm team["\']\s*$')
        self.assertRegex(head, r'(?m)^  version:\s*["\']3\.0\.0["\']\s*$')
        self.assertNotRegex(head, r'(?m)^author:')
        self.assertNotRegex(head, r'(?m)^version:')

    def test_description_covers_installation_and_the_six_questions(self):
        """description 是 Tier 0 的全部，该用时想不起来就白做了。"""
        head = SKILL.read_text(encoding='utf-8').split('---')[1]
        for trigger in ('安装', 'CLI', '子系统', '部件', '代码仓', '影响',
                        'SysCap', '编译'):
            self.assertIn(trigger, head, f'description 缺触发词：{trigger}')

    def test_does_not_promise_things_it_cannot_do(self):
        head = SKILL.read_text(encoding='utf-8').split('---')[1]
        self.assertIn('只读', head)
        self.assertIn('不编译', head)


class ReleaseChecklist(unittest.TestCase):
    """上库前可机检的命名、目录、评估报告和编号门禁。"""

    def test_skill_name_is_unique_in_this_repository(self):
        names = []
        for path in OSKM.parents[1].rglob('SKILL.md'):
            match = re.search(r'(?m)^name:\s*([^\s]+)\s*$',
                              path.read_text(encoding='utf-8'))
            if match:
                names.append(match.group(1))
        self.assertEqual(names.count('ohos-design-architecture-evidence-query'), 1,
                         f'仓库内重名: {names}')
        self.assertEqual(len(names), len(set(names)), f'仓库内 skill 重名: {names}')

    def test_skill_name_matches_the_ohos_naming_pattern(self):
        text = SKILL.read_text(encoding='utf-8')
        match = re.search(r'(?m)^name:\s*([^\s]+)\s*$', text)
        self.assertIsNotNone(match)
        name = match.group(1)
        self.assertRegex(name, r'^ohos-design-architecture-evidence-query$')
        self.assertLessEqual(len(name), 64)
        self.assertEqual(SKILL_ROOT.name, name)
        self.assertIn('evidence-query', name)

    def test_release_evaluation_reports_exist(self):
        for name in ('release-checklist.md', 'with-skill-report.md',
                     'without-skill-report.md', 'skill-judge-report.md'):
            path = SKILL_ROOT / 'evals' / name
            self.assertTrue(path.is_file(), f'缺少上库评估报告: {name}')
            self.assertIn(path.name, SKILL.read_text(encoding='utf-8'))
        with_skill = (SKILL_ROOT / 'evals' / 'with-skill-report.md').read_text(
            encoding='utf-8')
        self.assertIn('**8/8 通过**', with_skill)
        judge = (SKILL_ROOT / 'evals' / 'skill-judge-report.md').read_text(
            encoding='utf-8')
        self.assertIn('**Total Score**: 109/120 (90.8%)', judge)
        self.assertIn('**Grade**: A', judge)
        self.assertIn('followed its five-step evaluation protocol', judge)

    def test_initial_check_numbering_is_sequential(self):
        lines = SKILL.read_text(encoding='utf-8').splitlines()
        start = next(i for i, line in enumerate(lines)
                     if line.startswith('## 3. 首要判断'))
        end = next(i for i, line in enumerate(lines[start + 1:], start + 1)
                   if line.startswith('## 4. '))
        numbers = [int(line.split('.', 1)[0]) for line in lines[start:end]
                   if re.match(r'^\d+\.\s+\*\*', line)]
        self.assertEqual(numbers, list(range(1, len(numbers) + 1)),
                         f'首要判断编号不连续: {numbers}')


class SkillMatchesOrgGuide(unittest.TestCase):
    """按《OpenHarmony Agent Skill 实践指导书》检查 SKILL.md 的结构。

    指导书 §3.4.3 规定了七节职责（标题可调整，职责不得缺失），§3.3 要求
    "参考文件必须能从 SKILL.md 直接按条件定位，不得成为无人加载的孤儿文档"，
    §3.5.3 要求正文与平台解耦。这三条是**可机检**的，所以做成门禁——
    靠人盯的话，下一篇参考文件一加就又变成孤儿。
    """

    # 七节职责 → 中文标题里的关键词（标题本身可调整，职责不能缺）
    SECTIONS = {
        'Task and Boundaries': '任务与边界',
        'Trigger Signals': '触发信号',
        'Initial Checks': '首要判断',
        'Execution Strategy': '执行策略',
        'Prohibited Practices': '禁止做法',
        'Exceptions and Fallbacks': '异常与回退',
        'References': '参考文件',
    }

    # §3.5.3：正文不该绑平台专有的目录约定或调用机制。
    PLATFORM_SPECIFIC = ('Claude', 'Codex', 'CODEX_HOME', '.claude/',
                         'cursor', 'Gemini')

    def test_all_seven_responsibilities_are_present(self):
        text = SKILL.read_text(encoding='utf-8')
        missing = [name for name, zh in self.SECTIONS.items()
                   if f'## ' not in text or zh not in text]
        self.assertEqual(missing, [], f'SKILL.md 缺这几节职责: {missing}')
        # 七节各自还必须是二级标题，不能只是正文里提了一句。
        headings = [line for line in text.splitlines() if line.startswith('## ')]
        self.assertEqual(len(headings), len(self.SECTIONS), headings)

    def test_every_reference_file_is_reachable(self):
        """§3.3：参考文件必须能从 SKILL.md 按条件定位，不许有孤儿。"""
        text = SKILL.read_text(encoding='utf-8')
        orphans = []
        for path in sorted(SKILL_ROOT.rglob('*.md')):
            if path.name in ('SKILL.md', 'README.md'):
                continue                       # README 是给人看的入口
            if any(part in ('tests', 'dist') for part in path.parts):
                continue
            if path.name not in text:
                orphans.append(str(path.relative_to(SKILL_ROOT)))
        self.assertEqual(orphans, [], f'这些参考文件没在 SKILL.md 里登记: {orphans}')

    def test_body_is_platform_neutral(self):
        """§3.5.3：正文不绑特定 Agent 平台的目录约定或调用机制。

        宿主安装目录（`.claude/skills/…`、`${CODEX_HOME}/skills/…`）写在
        `README.md` 里——那是给**人**看的部署说明；`SKILL.md` 是给 Agent 的
        指令，写死某个平台的目录会让它在别的宿主上做出错误假设。
        """
        text = SKILL.read_text(encoding='utf-8')
        offenders = [token for token in self.PLATFORM_SPECIFIC if token in text]
        self.assertEqual(offenders, [], f'SKILL.md 绑定了平台专有名词: {offenders}')

    def test_frontmatter_passes_skill_creator_rules(self):
        """等价于 `skill-creator` 的 `scripts/quick_validate.py`。

        那个脚本 `import yaml`，而本机三个 Python（3.9 / 3.12 / 3.13）都没装
        PyYAML——按《实践指导书》§3.2「若所在平台暂不支持 skill-creator，应当
        说明并由评审人补做等价检查」，这里把它的规则**原样**搬成门禁，这样
        每条规则每次跑测试都被校，而不是评审时跑一次就忘了。

        规则取自 `quick_validate.py`（2026-11 版本）：
          · frontmatter 以 `---` 开头、有闭合 `---`
          · 顶层键只许 name / description / license / allowed-tools / metadata
          · name：字符串、`^[a-z0-9-]+$`、不以下划线或连字符开头结尾、无连续
            连字符、≤64 字符
          · description：字符串、非空、不以 `[TODO:` 开头、不含 `<` 或 `>`、
            ≤1024 字符
          · 正文（代码块外）不许留 `[TODO: …]` 占位
        """
        text = SKILL.read_text(encoding='utf-8')
        self.assertTrue(text.startswith('---'), '没有 YAML frontmatter')
        match = re.match(r'^---\n(.*?)\n---', text, re.DOTALL)
        self.assertIsNotNone(match, 'frontmatter 格式不对')
        block = match.group(1)

        # 极简解析：只认本 skill 用到的 `key: value` 与一层缩进（metadata）。
        top, section = {}, None
        for line in block.splitlines():
            if not line.strip() or line.lstrip().startswith('#'):
                continue
            indent = len(line) - len(line.lstrip(' '))
            key, sep, raw = line.strip().partition(':')
            self.assertTrue(sep, f'frontmatter 行没有冒号: {line!r}')
            value = raw.strip().strip('"\'')
            if indent == 0:
                section = key
                top[key] = value if value else {}
            elif isinstance(top.get(section), dict):
                top[section][key] = value

        allowed = {'name', 'description', 'license', 'allowed-tools', 'metadata'}
        self.assertEqual(set(top) - allowed, set(), 'frontmatter 有不允许的键')

        name = top.get('name')
        self.assertIsInstance(name, str)
        self.assertRegex(name, r'^[a-z0-9-]+$')
        self.assertEqual(name, name.strip('-'), 'name 首尾不能是连字符')
        self.assertNotIn('--', name)
        self.assertLessEqual(len(name), 64)

        description = top.get('description')
        self.assertIsInstance(description, str)
        self.assertTrue(description.strip(), 'description 为空')
        self.assertFalse(description.strip().startswith('[TODO:'), 'description 是 TODO')
        self.assertNotIn('<', description)
        self.assertNotIn('>', description)
        self.assertLessEqual(len(description), 1024,
                             f'description {len(description)} 字符，上限 1024')

        body = text[match.end():]
        fences, inside = [], False
        for line in body.splitlines():
            if re.match(r'^[ \t]*(?:[-+*]|\d+[.)])?[ \t]*(`{3,}|~{3,})', line):
                inside = not inside
                continue
            if not inside and re.match(r'^[ ]{0,3}\[TODO:', line):
                self.fail(f'正文还有未完成的 TODO: {line.strip()}')

    def test_the_description_stays_trigger_focused(self):
        """§3.4.1：description 以适用条件为中心，不复述完整流程。

        两条可机检的下限：它必须点出触发场景词（不只说"查询数据"），
        而且不能长出正文摘要——超过 400 字符基本就是在复述流程了。
        """
        block = re.match(r'^---\n(.*?)\n---', SKILL.read_text(encoding='utf-8'),
                         re.DOTALL).group(1)
        description = next(line.split(':', 1)[1].strip().strip('"')
                           for line in block.splitlines()
                           if line.startswith('description:'))
        for trigger in ('子系统', '部件', '镜像文件', '影响', 'SysCap', 'GN'):
            self.assertIn(trigger, description, f'description 缺触发词 {trigger}')
        self.assertLessEqual(len(description), 400,
                             f'description {len(description)} 字符，像是在复述正文')

    def test_every_section_has_actual_content(self):
        """防空转：七个小标题下面不能是空的。"""
        lines = SKILL.read_text(encoding='utf-8').splitlines()
        starts = [i for i, line in enumerate(lines) if line.startswith('## ')]
        for n, start in enumerate(starts):
            end = starts[n + 1] if n + 1 < len(starts) else len(lines)
            body = [line for line in lines[start + 1:end] if line.strip()]
            self.assertGreaterEqual(len(body), 3, lines[start])


class BootstrapEntrypoint(unittest.TestCase):
    """`bootstrap.py` 是**唯一**入口，所以它自己得站得住。

    旧实现有两个 Unix `.sh` 包装器（`install_runtime.sh` / `download_db.sh`），
    2026-11-12 随拆分一起删掉了：它们要求 Bash，而 skill 的承诺是
    "Windows 上 `py -3` 也能用"。一个只在两个平台上能跑的入口，
    等于在第三个平台上没有入口。
    """

    def test_bootstrap_is_executable_with_a_python_shebang(self):
        self.assertTrue(BOOTSTRAP.is_file(), f'缺少 {BOOTSTRAP}')
        self.assertTrue(os.access(BOOTSTRAP, os.X_OK), 'bootstrap.py 不可执行')
        first = BOOTSTRAP.read_text(encoding='utf-8').splitlines()[0]
        self.assertEqual(first, '#!/usr/bin/env python3')

    def test_bootstrap_works_from_any_working_directory(self):
        """自举 sys.path，而不是要求使用者先 cd 或设 PYTHONPATH。

        skill 会被解压到宿主工具决定的任意目录，任何"先 cd 到某处"的前提
        都会在某个宿主上失效。
        """
        with tempfile.TemporaryDirectory() as temp:
            result = subprocess.run(
                [sys.executable, str(BOOTSTRAP), 'cli-path'],
                cwd=temp, capture_output=True, text=True,
                env={'PATH': os.environ.get('PATH', ''),
                     'HOME': os.environ.get('HOME', str(Path.home())),
                     'PYTHONNOUSERSITE': '1'})
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertTrue(result.stdout.strip())

    def test_the_module_form_works_too(self):
        result = subprocess.run(
            [sys.executable, '-m', 'oskm_runtime', 'cli-path'],
            cwd=str(SKILL_ROOT), capture_output=True, text=True,
            env={**os.environ, 'PYTHONPATH': str(SKILL_ROOT),
                 'PYTHONNOUSERSITE': '1'})
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertTrue(result.stdout.strip())

    def test_no_shell_wrapper_is_left_behind(self):
        self.assertEqual(sorted(SKILL_ROOT.rglob('*.sh')), [])

    def test_help_lists_every_managed_command_and_points_at_the_cli(self):
        """help 必须列全托管命令，并且**明确说查询不归它管**。

        后半句是删掉透传之后新加的：使用者敲 `bootstrap.py arch overview`
        会得到"未知命令"，help 里必须直接告诉他该敲什么，否则他只能去翻文档。
        """
        result = subprocess.run(
            [sys.executable, str(BOOTSTRAP), '--help'],
            cwd=str(SKILL_ROOT), capture_output=True, text=True)
        self.assertEqual(result.returncode, 0, result.stderr)
        for command in ('doctor', 'install', 'refresh', 'update-cli',
                        'download-db', 'validate-db', 'cli-path'):
            self.assertIn(command, result.stdout)
        self.assertIn('不负责查', result.stdout)
        self.assertIn('oskm-cli.pyz', result.stdout)

    def test_skill_md_documents_the_managed_commands(self):
        text = ' '.join(SKILL.read_text(encoding='utf-8').split())
        for command in ('doctor', 'install', 'refresh', 'update-cli',
                        'download-db', 'validate-db', 'cli-path'):
            self.assertIn(command, text, f'SKILL.md 没提 {command}')

    def test_skill_md_mentions_the_cli_is_a_separate_artifact(self):
        """拆分之后最容易误解的两点：归档里没有查询引擎；它**不带版本号**。"""
        text = SKILL.read_text(encoding='utf-8')
        self.assertIn('独立产物', text)
        self.assertIn('oskm-cli.pyz', text)
        self.assertIn('不记版本', text)
        # 文档里不许再出现带版本号的文件名——那会让每条命令在下次发版时变坏。
        self.assertNotRegex(text, r'oskm-cli-\d+\.\d+\.\d+\.pyz')


if __name__ == '__main__':
    unittest.main()
