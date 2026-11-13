"""文档里的工具清单必须与 REGISTRY 一致。

这组断言的由来：工具数在四个地方被手抄过，实测全部过期——
`AGENTS.md` 写 43、`tool-scenarios.md` 写 43、`usage.md` 写 49、
`spec/README.md` 写 49，而实际是 50。更糟的是 `AGENTS.md` 还写着
「已配置并自动连接」，但仓内外都没有 `mcpServers` 配置，那句话从来没真过。
（`tool-scenarios.md` 已随 MCP 一起删除，这里只剩三份要校。）

手抄的清单一定会漂。能自动校的就别靠人盯：
  1) 任何「N 个工具」的说法 == len(REGISTRY)
  2) spec/README.md 的逐模块表 == 各模块实际注册数
  3) 文档里形如 `tool_name(` 的引用都得是真工具（抓改名/删除，比数字过期更坏）

相对链接是否悬空由 skill 侧的 `tests/test_docs_links.py` 负责——那组断言跨
两个产物与仓库文档，放在任何一侧都不合适，就跟着「文档主要归 skill 管」放过去了。
"""
# cli/tests -> cli (oskm_cli) / packages/oskm (oskm_schema, oskm_testing)。
# `unittest discover -s cli/tests` 把测试模块当顶层加载，所以这里手工补路径。
import sys as _sys
from pathlib import Path as _Path
_HERE = _Path(__file__).resolve().parent
for _p in (str(_HERE.parents[0]), str(_HERE.parents[1])):
    if _p not in _sys.path:
        _sys.path.insert(0, _p)
import os
import re
import sys
import unittest
from pathlib import Path

from oskm_cli.query.tools import REGISTRY, export

# cli/tests -> cli -> packages/oskm -> packages -> KnowledgeBase/
OSKM = Path(__file__).resolve().parents[2]
ROOT = OSKM.parents[1]
SKILL_ROOT = OSKM / 'skills' / 'ohos-design-architecture-evidence-query'

DOCS = {
    'AGENTS.md': ROOT / 'AGENTS.md',
    'usage.md': SKILL_ROOT / 'references/usage.md',
    'spec/README.md': SKILL_ROOT / 'references/spec/README.md',
}


def _names():
    return {t['name'] for t in export()}


def _agents_section():
    """返回根 AGENTS.md 中的 oskm 常驻路由段。

    KnowledgeBase 的根 AGENTS.md 整份就是 oskm 路由；集成仓库的根 AGENTS.md
    还承载 CI、smoke test 等仓库级约束，因此只限制 oskm 路由段的长度。
    """
    text = DOCS['AGENTS.md'].read_text(encoding='utf-8')
    marker = '## oskm 知识库'
    if marker in text:
        return marker + text.split(marker, 1)[1]
    return text


class DocsMatchRegistry(unittest.TestCase):
    # 「50 个工具」「50 个只读工具」都要认。第一版只写了 `个工具`，结果
    # AGENTS.md 的「50 个只读工具」漏网，整条断言对它空转——是注入 43 做
    # 反证时才发现的。定语留 0–4 字的余量。
    _COUNT = re.compile(r'(\d+)\s*个[^\s，。、]{0,4}?工具')

    def test_tool_counts_are_current(self):
        total = len(REGISTRY)
        checked = 0
        for label, path in DOCS.items():
            if not path.exists():
                continue
            for claimed in self._COUNT.findall(path.read_text(encoding='utf-8')):
                checked += 1
                self.assertEqual(int(claimed), total,
                                 f'{label} 写了 {claimed} 个工具，实际 {total}')
        # 一条都没匹配上说明正则又瞎了，而不是"文档都没提工具数"。
        self.assertGreaterEqual(checked, 3, '没在文档里找到任何工具数声明，正则可能失效')

    def test_per_module_table_is_current(self):
        """spec/README.md 的逐模块表。

        这张表实测是对的（逐行与 handler.__module__ 一致），恰恰说明表格比
        标题里那个孤零零的总数更不容易错——但它一样要校，否则加一个工具
        就会同时出现"总数对、分项不对"。
        """
        actual = {}
        for tool in REGISTRY:
            module = tool.handler.__module__.rsplit('.', 1)[-1]
            actual[module] = actual.get(module, 0) + 1
        text = DOCS['spec/README.md'].read_text(encoding='utf-8')
        rows = dict((m, int(n)) for m, n in
                    re.findall(r'^\|\s*([a-z_]+)\s*\|\s*(\d+)\s*\|', text, re.M))
        self.assertTrue(rows, '没在 spec/README.md 里找到逐模块表')
        self.assertEqual(rows, actual)
        self.assertEqual(sum(rows.values()), len(REGISTRY))

    def test_documented_tool_names_exist(self):
        """文档里调用式写法 `foo(` 引用的工具必须真实存在。

        只收 `name(` 这种调用式，不收裸 `name`——后者在这些文档里也用来写字段名
        （component_id、scan_id…），全收会把字段名误判成不存在的工具。
        """
        have = _names()
        for label, path in DOCS.items():
            if not path.exists():
                continue
            referenced = set(re.findall(r'`([a-z][a-z0-9_]{3,})\(', path.read_text(encoding='utf-8')))
            missing = sorted(n for n in referenced if n not in have)
            self.assertEqual(missing, [], f'{label} 引用了不存在的工具: {missing}')

    def test_agents_md_points_at_the_skill(self):
        """AGENTS.md 只做一条指针，不再内联工具清单。

        它曾经是 72 行常驻引导，而且内容过期（工具数 43、"MCP 已自动连接"
        ——仓内外从来没有过 mcpServers 配置）。内容搬进 skill 之后，
        这里要保证：指得到 skill、指得到**当前真实存在的**入口，
        以及不再教人去挂一个已经删掉的 MCP server。
        """
        text = _agents_section()
        self.assertIn('ohos-design-architecture-evidence-query` skill', text)
        self.assertIn('bootstrap.py', text)          # skill 入口
        self.assertIn('-m oskm.cli', text)           # 采集侧入口
        self.assertNotIn('claude mcp add', text)
        self.assertLess(len(text.splitlines()), 40, 'AGENTS.md 又长回去了')

    def test_agents_md_names_no_removed_entry_point(self):
        """root AGENTS.md 是常驻上下文，写错一个命令的代价最高。

        三个都已删除：`agentic.runtime`（2026-11-12 拆分）、`-m agentic`
        （同上）、`oskm.py`（2026-11-12 删除；它要在外面手抄一份查询侧
        子命令清单，漂了会把命令送去扫描侧，报一句
        "invalid choice: <你的 --db 路径>"）。
        """
        text = _agents_section()
        for removed in ('oskm.py', '-m agentic', 'agentic.runtime',
                        'build_bundle'):
            self.assertNotIn(removed, text, f'AGENTS.md 仍在教人用 {removed}')


if __name__ == '__main__':
    unittest.main()
