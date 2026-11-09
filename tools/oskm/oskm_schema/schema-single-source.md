# 表结构单一真相源：消除 collectors 与 agentic 的重复

日期：2026-10-30
目标：**改任何表、加任何表，采集侧与查询侧自动保持一致。**
前提：两边都未发布，不考虑兼容性，直接奔最终形态。
全部数字为实测，方法见 §8。

---

## 0. 结论

今天真正的重复**不是表定义有两份**（只有一份），而是
**agentic 用字符串字面量复述了那一份**：20 张真实表名、89 处硬编码，
外加 13 份手写的字段规格文档。改一个列名，采集侧照常跑，
查询侧在运行时才炸——而且只在恰好被调到的那条路径上炸。

四层措施，按"能不能从结构上保证"排序：

| # | 措施 | 保证强度 | 状态 |
|---|---|---|---|
| 1 | 全部 Table 定义进中立包 `oskm_schema/` | 结构性：一份定义，两边 import | ✅ |
| 2 | ~~SQL 插 `{T.name}`~~ → **表名门禁** | 测试期：改表名立刻点名文件行号 | ✅ 改了方案，见 §3 |
| 3 | 列名——**不做静态校验，做执行覆盖** | 见 §4 | 已有一半 |
| 4 | spec 字段表由 Table 定义生成 | 结构性：不再手抄 | 未做 |

**第 3 条是本文最想说清的一点**：直觉会想"写个检查器扫 SQL 里的
`表.列` 对照 schema"。我写了一个，**266 处引用报出 17 处不符，逐条看全是假阳性**
（单字母别名跨语句串了、`.ets` 是扩展名、`components.replace` 是 Python 方法）。
正则解析 SQL 不可靠，而上一个真正抓到 bug 的机制是**把每个工具真调一次**。

---

## 1. 现状：重复在哪

### 1.1 表定义只有一份，但位置不一致

| 定义在哪 | 表 | 行数 |
|---|---|---|
| `oskm_schema/arkts.py` | arkts 的 4 张 | 137 |
| 各 `collectors/*/collector.py` 内联 | 其余 16 张 | **333** |
| `oskm_schema/base.py` | 框架 4 张（scans / collector_runs / issues / collector_tables） | 276（含原语） |

arkts 已经提出来了（因为它的查询侧要用），**其余 10 个采集器还在 collector.py 里内联**。
这是历史分叉，不是设计。

### 1.2 agentic 用字面量复述表名：20 张 / 89 处

```
components 21  arkts_kit_relations 8  elf_modules 8  install_targets 7
arkts_sources 6  repos 5  collector_runs 4  install_modules 4  services 4
issues 3  scans 3  gn_args 3  elf_module_dependencies 3
features 2  hdis 2  sas 2  arkts_modules 1  syscaps 1  innerapis 1
component_links_run 1
```

改一个表名，采集侧一路绿，查询侧在**恰好被调到的那条路径上**运行时炸。
这正是 2026-10-29 那次的形态：`search_gn_args` / `search_sas` / `search_hdis` /
`get_hdi` 四个工具**从上线起就没成功过一次**，因为 WHERE 子句的列没带表别名，
而它们恰好没有任何测试调过。

### 1.3 spec 文档是第三份副本

13 份 `agentic/docs/spec/*.md` 里有逐列字段表（component.md 21 行、elf.md 13 行…），
全部手写。表加一列，文档不会自己跟上。

### 1.4 元数据已经不重复了

`collector_tables`（2026-10-30 落地）让查询层的表名白名单、
`component_column` / `service_column` 从库里读，不再 import 采集器。
**这一层已经是单一真相源**，本文不再改它。

---

## 2. 措施一：全部 Table 定义进 `oskm_schema/`

```
oskm_schema/
  base.py              原语（Column / Index / Table / SchemaError）+ 框架 4 张表
  args.py              gn_args
  arkts.py             arkts 的 4 张（已就位）
  arkts_records.py     行↔发布记录的投射（已就位）
  components.py        components / features / innerapis / syscaps
  elf_modules.py       elf_modules / elf_module_dependencies
  hdi.py               hdis
  install_modules.py   install_modules / install_targets / install_module_tags
  links.py             arkts_links_run / component_links_run
  repos.py             repos
  sas.py               sas
  services.py          services
```

两侧都 `from oskm_schema.components import COMPONENTS, FEATURES`。

**为什么是中立第三包，而不是软链或依赖倒置**：已在
[agentic/docs/standalone-packaging.md §5](../agentic/docs/standalone-packaging.md) 实测过——
软链会让同一份 schema 以两个模块名加载，产生**两份 Table 实例**，
而代码里有 `if table is KITS` 这类身份比较，跨模块恒为 `False`、**不报错**。
中立包只有一个模块名，一份实例。

> 顺带：`is` 比较已全部改成按 `table.name`。身份比较本来就脆，
> 换载体只是让它暂时不犯。

搬家量 **333 行**，机械操作：从 `collector.py` 剪出 `X = Table(...)` 块，
`collector.py` 改成一行 import。

## 3. 措施二：表名门禁（原计划是插 `{T.name}`，实施后改了）

### 3.1 原计划，以及为什么放弃

计划是把 `'… FROM components …'` 改成 `f'… FROM {COMPONENTS.name} …'`，
让改表名直接变成 ImportError。**写脚本做了两遍，三种损坏**：

1. **正则扫源码**——把 SQL 内部的 `'resolved'` 当成独立字符串，
   切坏了外层：`!='resolved'` 变成 `!='resolvedf'`。
2. **改用 `ast` 取精确位置**——Python 的**隐式字符串拼接**（相邻字面量自动相连）
   被当作一个节点，带占位符的尾部
   `WHERE {' AND '.join(clauses)} ORDER BY … LIMIT ?` 整段被吃掉，
   **8 个文件受损**。
3. 修完又撞上**引号嵌套**：`f'… {' AND '.join(…)}'` 在 3.12 之前非法。

这些 SQL 之所以写成多段拼接、混用引号，本来就是为了绕开这些坑。
**机械改写它们的收益远小于风险**——而收益只是"ImportError 早于测试失败"。

> 这一条和 §4 是同一个教训的两面：**SQL 字符串既不好静态分析，也不好机械改写。**
> 本文初稿只对"分析"下了这个结论，"改写"是实施时才撞到的。

### 3.2 实际做法：表名门禁

表名仍是字面量，但**必须存在于 `oskm_schema`**——
`test_schema_consistency.py` 用 `ast` 取出所有字符串字面量（含 f-string 的常量段），
挑出像 SQL 的那些，抽 `FROM/JOIN/INTO/UPDATE` 后的标识符，逐个对照 schema。

改表名之后旧名字不再属于 schema，门禁立刻点名：

```
query/arkts/query.py:186 → components
query/tools/component.py:21 → components
...
```

与 f-string 方案的差别只是**测试期发现**而不是**导入期发现**，
两者都在到达使用者之前。

**门禁自身也调了两轮**，都是"散文被当成 SQL"：
f-string 的占位符被抹平后 `FROM {table} WHERE` 变成 `FROM  WHERE`，
正则把 `WHERE` 当表名（改为用哨兵占位）；
`gitlink.py` 文档字符串里的 "ported **from** viewer/..." 也被命中
（改为只看含 SELECT/INSERT/UPDATE/DELETE/WITH 的字符串）。

## 4. 措施三：列名靠执行覆盖，不靠静态校验

### 4.1 静态校验这条路实测走不通

写了一个检查器：抽 `FROM/JOIN <表> <别名>` 建别名映射，
再扫 `别名.列` 对照 `PRAGMA table_info`。

```
检查 266 处引用，报出 17 处"对不上"——逐条看，全是假阳性
  install_targets.kit_key / .module_name / .origin …   ← 单字母别名在同一文件里跨语句串了
  arkts_sources.ets / .ts                              ← 是文件扩展名字符串
  components.replace                                   ← Python 的 str.replace
```

要消掉假阳性就得真正解析 SQL（别名作用域、CTE、子查询），
那是在写一个 SQL 解析器。**代价远超收益，而且解析器本身会有 bug。**

### 4.2 真正有效的是"每条 SQL 都被执行过"

上一轮抓到四个死工具的，是 `test_every_tool_runs.py`——
按 `REGISTRY` 名单逐个真调，不许出现 `INTERNAL`。
SQL 写错在 SQLite 的 prepare 阶段就抛，**执行一次胜过静态扫一百次**。

缺口是它只覆盖"探针走到的那条路径"。补法：

| 门禁 | 作用 |
|---|---|
| 已有：每个工具至少真调一次 | 主路径 |
| **新增：每个工具的每个可选参数至少被传一次** | 带 `if params.get(x)` 的分支 SQL |
| **新增：SQL 字符串覆盖率** | 用 `trace` 统计 `session.sql()` 调用点，未被执行过的报出来 |

第三条是关键：它把"哪些 SQL 从没跑过"变成一个可见的数字，
而不是等某天有人照文档调用才发现。

> **这条不是理论**：那四个死工具正是"列在文档里、从没人调过"。
> 覆盖率门禁会在它们写出来的当天就报出来。

## 5. 措施四：spec 字段表生成

13 份 spec 里的逐列表改为由 Table 定义生成，手写部分只保留**解释**
（"这个字段为什么存在"、"空值的几种含义"）——那些是 schema 里没有的。

做法与已落地的 `reference/tools.md` 相同：生成 + 比对门禁。
生成块用标记包起来，门禁重新生成后逐字比对。

```markdown
<!-- generated: components.COMPONENTS -->
| 列 | 类型 | 约束 |
|---|---|---|
...
<!-- /generated -->

**为什么 `repo_id` 可以为空**：三方部件没有对应的 OpenHarmony 仓。   ← 手写，保留
```

## 6. 新增一张表时会发生什么

这是验收这套设计的唯一标准。

| 步骤 | 今天 | 改后 |
|---|---|---|
| 定义表 | 写进 `collector.py` | 写进 `oskm_schema/<domain>.py` |
| 建表 | 框架自动（`TABLES`） | 不变 |
| 查询层知道它存在 | ✅ `collector_tables` 自动 | 不变 |
| 泛型查询可用 | ✅ `list_entities` / `sql_query` 自动 | 不变 |
| 专用工具 | 人写，SQL 里硬编码表名 | 人写，但从 `oskm_schema` import 表对象 |
| 字段文档 | 手抄进 spec | 生成 |
| 写错列名 | 运行时 INTERNAL，可能很久没人发现 | 测试覆盖率门禁当天报出 |

**加表这件事今天已经是自动的**（`collector_tables` + 泛型工具）。
真正要治的是**改表**：改名、改列、删列。改后这三件事都会在
import 期或测试期暴露，而不是运行期。

## 7. 分期

| 期 | 内容 | 验收 |
|---|---|---|
| 1 ✅ | 333 行 Table 定义搬进 `oskm_schema/`，两侧改 import | 已完成：`grep "= Table(" oskm/collectors/` 为空，门禁盯着 |
| 2 ✅ | ~~改 `{T.name}`~~ → 表名门禁 | 已完成：改一张表名，门禁点名 19 处引用 |
| 3 | 可选参数覆盖 + SQL 覆盖率门禁 | 注入一条没测过的 SQL 分支能被报出 |
| 4 | spec 字段表生成 + 比对门禁 | 手改生成块会失败 |

约 2 人天。**第 1 期最大但最机械，第 3 期最有价值**——
它针对的是这个仓已经发生过两次的故障形态（死工具、过期建议）。

**每期都要做反证**：加完门禁要注入对应的错误确认它变红。
上一轮的教训是第一版正则写成 `个工具`，而文案是"50 个**只读**工具"，
整条断言对那份文档空转，是注入错值才发现的。

## 8. 测量方法

- **表名字面量**：正则抽 `FROM|JOIN|UPDATE|INTO <标识符>`，与库里
  `sqlite_master` 的表名求交——只统计真实存在的表，排除 `__future__`、
  `oskm` 这类误匹配
- **表 → 采集器归属**：读 `framework` 注册表的 `TABLES`，不靠 grep 猜
  （先用 grep 试过，把 `components` 判给了 `elf_modules`，因为后者的 SQL 里提到它）
- **Table 定义行数**：按括号配平从 `^[A-Z_]+ = Table\(` 起算到闭合，
  不按行数估
- **静态列校验的可行性**：**真写一个再看假阳性率**——266 处报 17 处，
  逐条核对全错。不实现一遍就会以为这条路能走
- **spec 副本**：统计 `spec/*.md` 里形如 `| \`列名\` |` 的表格行数
