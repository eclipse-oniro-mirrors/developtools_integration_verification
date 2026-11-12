"""查询 CLI 的 SQL 只许引用 oskm_schema 里真实存在的表。

**为什么是门禁而不是结构性改造**：本想把 SQL 里的表名字面量换成
`{T.name}`，让改表名直接变成 ImportError。真写脚本做了两遍，三种损坏：

1. 正则扫源码——把 SQL 内部的 `'resolved'` 当成独立字符串，
   切坏了外层（`!='resolved'` 变成 `!='resolvedf'`）。
2. 改用 `ast` 取精确位置——隐式字符串拼接（相邻字面量自动相连）
   被当成一个节点，带占位符的尾部 `WHERE {' AND '.join(clauses)} ORDER BY …`
   整段被吃掉，8 个文件受损。
3. 修完又撞上引号嵌套：`f'… {' AND '.join(…)}'` 在 3.12 之前非法。

这些 SQL 之所以写成多段拼接、混用引号，本来就是为了绕开这些坑。
**机械改写它们的收益（ImportError 早于测试失败）远小于风险。**

所以改成门禁：表名仍是字面量，但**必须在 oskm_schema 里存在**。
改表名之后，旧名字不再属于 schema，这里立刻报出文件与行号。
与 f-string 方案的差别只是"测试期发现"而不是"导入期发现"——
两者都在到达使用者之前。
"""
# cli/tests -> cli (oskm_cli) / packages/oskm (oskm_schema, oskm_testing)。
# `unittest discover -s cli/tests` 把测试模块当顶层加载，所以这里手工补路径。
import sys as _sys
from pathlib import Path as _Path
_HERE = _Path(__file__).resolve().parent
for _p in (str(_HERE.parents[0]), str(_HERE.parents[1])):
    if _p not in _sys.path:
        _sys.path.insert(0, _p)
import ast
import os
import re
import sys
import unittest
from pathlib import Path

from oskm_testing.testdb import DB

# cli/tests -> cli -> packages/oskm
CLI = Path(__file__).resolve().parents[1] / 'oskm_cli'
OSKM = Path(__file__).resolve().parents[2]

# SQL 里 FROM/JOIN 后面的标识符。只在字符串字面量里找——
# 扫整行会把 `from oskm.core import x` 这种 Python 语句也算进来。
TABLE_REF = re.compile(r'\b(?:FROM|JOIN|INTO|UPDATE)\s+([a-z_][a-z0-9_]*)', re.I)

# 不是表：SQLite 内建、CTE 名、以及 SQL 里出现的占位符变量名。
NOT_A_TABLE = {'sqlite_master', 'closure', 'pragma'}

SQL_SHAPED = re.compile(r'\b(SELECT|INSERT|UPDATE|DELETE|WITH)\b', re.I)


def declared_tables():
    import oskm_schema
    import importlib
    names = set()
    for module in ('args', 'arkts', 'base', 'components', 'elf_modules', 'hdi',
                   'install_modules', 'links', 'ndk', 'repos', 'sas', 'services'):
        m = importlib.import_module(f'oskm_schema.{module}')
        for const in dir(m):
            obj = getattr(m, const)
            if const.isupper() and hasattr(obj, 'name') and hasattr(obj, 'columns'):
                names.add(obj.name)
    return names


def sql_table_refs():
    """(文件, 行, 表名)——只看字符串字面量里的。"""
    found = []
    for source in sorted(CLI.rglob('*.py')):
        if '__pycache__' in source.parts or source.name.startswith('test_'):
            continue
        tree = ast.parse(source.read_text(encoding='utf-8'))
        for node in ast.walk(tree):
            text = None
            if isinstance(node, ast.Constant) and isinstance(node.value, str):
                text = node.value
            elif isinstance(node, ast.JoinedStr):
                # 占位符换成哨兵，不能直接丢掉——`FROM {table} WHERE …` 一旦
                # 把 `{table}` 抹平就变成 `FROM  WHERE`，正则会把 WHERE 当表名。
                text = ''.join(p.value if isinstance(p, ast.Constant)
                               and isinstance(p.value, str) else '\x00'
                               for p in node.values)
            # 只看真正像 SQL 的字符串。散文里的 "ported from viewer/..." 
            # 和 "from workspace-relative paths" 都会被 FROM 的正则命中。
            if not text or not SQL_SHAPED.search(text):
                continue
            for name in TABLE_REF.findall(text):
                found.append((str(source.relative_to(CLI.parent)), node.lineno, name))
    return found


class SqlReferencesRealTables(unittest.TestCase):
    def test_refs_were_found(self):
        """正则失效时整条断言会空转，先确认真的解析到了引用。"""
        self.assertGreater(len(sql_table_refs()), 50)

    def test_every_table_name_exists_in_schema(self):
        """改表名之后，旧名字会在这里被点名——带文件和行号。"""
        known = declared_tables() | NOT_A_TABLE
        unknown = sorted({f'{f}:{ln} → {t}' for f, ln, t in sql_table_refs()
                          if t not in known})
        self.assertEqual(unknown, [])

    @staticmethod
    def _live_tables():
        import sqlite3
        return {r[0] for r in sqlite3.connect(DB).execute(
            "SELECT name FROM sqlite_master WHERE type='table' "
            "AND name NOT LIKE 'sqlite_%'")}

    def test_schema_covers_the_live_database(self):
        """`oskm_schema` 的表名集合要与真库一致——少一张说明有表没搬过来。"""
        if not DB.is_file():
            self.skipTest(f'no database: {DB}')
        self.assertEqual(self._live_tables() - declared_tables(), set(),
                         '库里有表不在 oskm_schema')

    def test_required_columns_covers_the_live_database(self):
        """`REQUIRED_COLUMNS` 的表集合必须覆盖真库。

        这条与上面那条**不是重复**：上面校的是 `declared_tables()`（本文件里
        第三份手抄的模块清单），这条校的是 `oskm_cli.database.REQUIRED_COLUMNS`
        ——也就是 `validate-db` 真正依据的那份契约。

        缺了它会怎样：往 `oskm_schema/` 加一个域模块（比如 `permissions.py`）
        却忘了加进 `database.py` 的 `SCHEMA_MODULES`，`REQUIRED_COLUMNS` 就少
        几张表，于是 **`validate-db` 会放过一个缺表的库**。而这正是拆分之后
        "schema 契约只有 CLI 一处"这句话的全部意义。
        """
        if not DB.is_file():
            self.skipTest(f'no database: {DB}')
        from oskm_cli.database import REQUIRED_COLUMNS
        self.assertEqual(self._live_tables() - set(REQUIRED_COLUMNS), set(),
                         '库里有表不在 REQUIRED_COLUMNS；'
                         '检查 cli/oskm_cli/database.py 的 SCHEMA_MODULES')
        # 反向也要校：契约里不该有库里不存在的表，否则 validate-db 永远失败。
        self.assertEqual(set(REQUIRED_COLUMNS) - self._live_tables(), set(),
                         'REQUIRED_COLUMNS 里有真库没有的表')


class SchemaLivesInTheNeutralPackage(unittest.TestCase):
    def test_collectors_declare_no_tables(self):
        """表定义全部在 oskm_schema，采集器里不许再有 `X = Table(`。"""
        collectors = OSKM / 'oskm/collectors'
        offenders = []
        for source in sorted(collectors.rglob('*.py')):
            if '__pycache__' in source.parts:
                continue
            for number, line in enumerate(source.read_text(encoding='utf-8').splitlines(), 1):
                if re.match(r'^[A-Z_]+ = Table\(', line) or re.search(r'\breturn Table\(', line):
                    offenders.append(f'{source.relative_to(collectors)}:{number}')
        self.assertEqual(offenders, [])


if __name__ == '__main__':
    unittest.main()
