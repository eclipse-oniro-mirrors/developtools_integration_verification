# pylint: disable=wrong-import-position  # tests adjust sys.path before local imports
"""文档相对链接不许悬空，也不许指向已删除的文档。

原来这组断言住在 `test_docs_match_registry.py` 里，而且写在文件中部那句
`if __name__ == '__main__': unittest.main()` **之后**——`unittest discover`
下能跑到，直接 `python3 test_docs_match_registry.py` 就跑不到。同一份文件里
两种可见性，是个只会坑下一个人的陷阱，所以拆出来单独成文件。

它跨两个产物与仓库文档，因此放在 skill 侧（文档主要归 skill 管），
但检查范围包含 `cli/README.md` 与 `docs/architecture/`。
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
import re
import unittest
from pathlib import Path

SKILL_ROOT = _SKILL
OSKM = _OSKM
ROOT = OSKM.parents[1]


class DocumentLinksResolve(unittest.TestCase):

    @staticmethod
    def _label(path):
        try:
            return str(path.relative_to(ROOT))
        except ValueError:
            return str(path)


    @classmethod
    def _markdowns(cls):
        paths = set(SKILL_ROOT.rglob('*.md'))
        paths.update((OSKM / 'docs' / 'architecture').rglob('*.md'))
        paths.update((
            ROOT / 'AGENTS.md',
            OSKM / 'AGENTS.md',
            OSKM / 'README.md',
            OSKM / 'cli' / 'README.md',
            OSKM / 'oskm_schema/README.md',
            OSKM / 'oskm_schema/schema-single-source.md',
            OSKM / 'oskm/collectors/arkts/README.md',
            OSKM / 'oskm/collectors/arkts/design.md',
        ))
        found = sorted(path for path in paths if path.is_file())
        # 门禁空转比误报更坏：一份都没扫到就说明路径推导错了。
        assert len(found) > 15, found
        return found


    def test_no_dangling_relative_links(self):
        dangling = []
        for markdown in self._markdowns():
            for target in re.findall(
                    r'\]\((\.{1,2}/[^)#]+)',
                    markdown.read_text(encoding='utf-8')):
                if not (markdown.parent / target).resolve().exists():
                    dangling.append(f'{self._label(markdown)} → {target}')
        self.assertEqual(dangling, [])


    # 2026-10-29 随 MCP 一起删掉的四份文档。
    GONE = ('mcp-design.md', 'transport-stdio-vs-http.md',
            'cli-vs-mcp.md', 'tool-scenarios.md', 'progressive-disclosure.md')

    def test_no_links_to_deleted_docs(self):
        """只拦**链接**，不拦正文提及。

        第一版连散文里的名字一起拦，结果把 `query-skill-design.md` 那句
        "这几份已删、其中有效的结论收进了本文"也判成违规——那句话恰恰是读者
        需要的交代。真正会害人的是点下去 404 的链接。
        """
        offenders = []
        for markdown in self._markdowns():
            text = markdown.read_text(encoding='utf-8')
            for target in re.findall(r'\]\(([^)#]+)', text):
                if any(target.endswith(name) for name in self.GONE):
                    offenders.append(f'{self._label(markdown)} → {target}')
        self.assertEqual(offenders, [])


    def test_no_links_into_the_removed_agentic_tree(self):
        """`agentic/` 已经不存在了；指向它的链接一定是死的。

        历史文档里**提到**它没问题（横幅就是这么写的），但**链接**过去就是 404。
        """
        offenders = []
        for markdown in self._markdowns():
            text = markdown.read_text(encoding='utf-8')
            for target in re.findall(r'\]\(([^)#\s]+)', text):
                if 'agentic' in target:
                    offenders.append(f'{self._label(markdown)} → {target}')
        self.assertEqual(offenders, [])


    def test_no_document_tells_the_reader_to_run_a_removed_command(self):
        """已删除的查询透传不能重新出现在用户文档里。"""
        offenders = []
        for markdown in self._user_facing():
            text = markdown.read_text(encoding='utf-8')
            for number, line in enumerate(text.splitlines(), 1):
                removed_agentic = '-m agentic' in line or 'agentic.runtime' in line
                removed_query = bool(re.search(
                    r'bootstrap\.py(?:\s+--\S+(?:\s+\S+)?)?\s+'
                    r'(?:ask|arch|diff|sql)\b', line))
                if removed_agentic or removed_query:
                    offenders.append(f'{self._label(markdown)}:{number}: {line.strip()}')
        self.assertEqual(offenders, [])


    # 只查**面向使用者**的文档。`docs/architecture/` 里的
    # `standalone-packaging.md` / `query-skill-design.md` / `cli-skill-split.md`
    # 是维护者的历史记录，它们**必须**能引用旧入口来解释"改了什么"；
    # 把历史文档一起拦，只会逼人把解释删掉，那才是真的损失。
    USER_FACING = (SKILL_ROOT, OSKM / 'cli', ROOT / 'AGENTS.md',
                   OSKM / 'AGENTS.md', OSKM / 'README.md',
                   OSKM / 'oskm_schema')

    def _user_facing(self):
        found = []
        for base in self.USER_FACING:
            if base.is_file():
                found.append(base)
            elif base.is_dir():
                found.extend(sorted(base.rglob('*.md')))
        return sorted(set(found))



if __name__ == '__main__':
    unittest.main()
