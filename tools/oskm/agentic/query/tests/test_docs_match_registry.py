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
"""
import os
import re
import sys
import unittest
from pathlib import Path

# 与同目录其它测试一致：`unittest discover -s agentic/query/tests` 会把模块当顶层
# 加载，相对 import 在那种调用下直接 ImportError。
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..', '..'))

from agentic.query.tools import REGISTRY, export

# tests/ -> query/ -> agentic/ -> oskm package root
OSKM = Path(__file__).resolve().parents[3]
# Source checkout keeps the short agent pointer at KnowledgeBase/AGENTS.md;
# the target package has no equivalent outer pointer.
ROOT = OSKM.parents[1]
HAS_SOURCE_ROOT_POINTER = (
    OSKM.parent.name == 'packages' and (ROOT / 'AGENTS.md').is_file())

DOCS = {
    'usage.md': OSKM / 'agentic/docs/usage.md',
    'spec/README.md': OSKM / 'agentic/docs/spec/README.md',
}
if HAS_SOURCE_ROOT_POINTER:
    DOCS['AGENTS.md'] = ROOT / 'AGENTS.md'


def _names():
    return {t['name'] for t in export()}


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
        minimum = 3 if HAS_SOURCE_ROOT_POINTER else 2
        self.assertGreaterEqual(
            checked, minimum, '没在文档里找到任何工具数声明，正则可能失效')

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
        这里要保证两件事：指得到 skill，以及**不再教人去挂一个已经删掉的
        MCP server**。
        """
        if 'AGENTS.md' not in DOCS:
            self.skipTest('target package has no outer agent pointer')
        text = DOCS['AGENTS.md'].read_text(encoding='utf-8')
        self.assertIn('oskm` skill', text)
        self.assertIn('oskm.py', text)
        self.assertNotIn('claude mcp add', text)
        self.assertLess(len(text.splitlines()), 40, 'AGENTS.md 又长回去了')


if __name__ == '__main__':
    unittest.main()


class DocumentLinksResolve(unittest.TestCase):
    """agentic 包内的文档相对链接不许悬空。

    这个包要能单独上架，所以内部链接必须在包内闭合。一次性删掉四份文档之后
    尤其要校——`spec/README.md` 就留了一条指向已删 `mcp-design.md` 的链接。
    """

    AGENTIC = Path(__file__).resolve().parents[2]

    def test_no_dangling_relative_links(self):
        dangling = []
        for markdown in sorted(self.AGENTIC.rglob('*.md')):
            for target in re.findall(r'\]\((\.{1,2}/[^)#]+)', markdown.read_text(encoding='utf-8')):
                if not (markdown.parent / target).resolve().exists():
                    dangling.append(f'{markdown.relative_to(self.AGENTIC)} → {target}')
        self.assertEqual(dangling, [])

    # 2026-10-29 随 MCP 一起删掉的四份文档。
    GONE = ('mcp-design.md', 'transport-stdio-vs-http.md',
            'cli-vs-mcp.md', 'tool-scenarios.md', 'progressive-disclosure.md')

    def test_no_links_to_deleted_docs(self):
        """只拦**链接**，不拦正文提及。

        第一版连散文里的名字一起拦，结果把 `skill-design.md` 那句
        "这几份已删、其中有效的结论收进了本文"也判成违规——
        那句话恰恰是读者需要的交代。真正会害人的是点下去 404 的链接。
        """
        offenders = []
        for markdown in sorted(self.AGENTIC.rglob('*.md')):
            text = markdown.read_text(encoding='utf-8')
            for target in re.findall(r'\]\(([^)#]+)', text):
                if any(target.endswith(name) for name in self.GONE):
                    offenders.append(f'{markdown.relative_to(self.AGENTIC)} → {target}')
        self.assertEqual(offenders, [])
