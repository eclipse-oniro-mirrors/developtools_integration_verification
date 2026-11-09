# `arkts_kit_relations` 逐字段说明与精简评估

日期：2026-10-25
对象：schema **6.0.0** 的 `arkts_kit_relations`，23 列 / 2,321 行。
数据基于 rk3568 全量扫描库 + 回读采集器源码，方法见 §6。

**这张表是什么**：Kit 与模块之间每一条关系的**一条证据**，一行一处出处。
它不记"A 属于 B"这个结论，而记"在哪个文件的第几字节读到了什么字样，由此判定 A 属于 B"。
所以行数（2,321）大于关系数——同一个模块可以在多处被同一个 Kit 提及。

它是 arkts 域里**最大的一张表**：表页 884,736 + 索引页 610,304 = **1,495,040 字节**，
占全域的 62%。因此精简它的收益比前两张表加起来还大。

**结论先行**：可无损去掉 **242,153 字符**（31%）且不动框架；
若框架支持复合业务键，再去 **155,678 字符 + 约 434 KB 索引**。
另有 81,557 字符属于"可由别的列算出但刻意物化"，建议保留，理由见 §4。

---

## 1. 两类关系

这张表混装两种来源完全不同的证据。**不先分清，逐列分析全是错的**——
很多列只对其中一类有意义。

```
declared_membership  1,457 行   模块文件头上写了 @kit ArkUI
   证据：/** @kit ArkUI */        ← 文件头注释里的一个标签
   方向：模块 → 声明自己属于哪个 Kit
   谁解析：file.header 提取器（只读文件头，不碰正文）

entry_reference        864 行   Kit 入口文件 import 了某个模块
   证据：import { X } from '@ohos.app.ability.UIAbility';
   方向：Kit 入口 → 引用哪些模块
   谁解析：kit.references 提取器（完整 AST）
```

两者**都**指向 (kit, module) 对，但可信度与粒度不同：`@kit` 标签是模块自己的声明，
import 是入口的实际组成。两条路径都保留，是因为它们会不一致——
一个模块可以写了 `@kit ArkUI` 却不被 `@kit.ArkUI.d.ts` import。

| | membership | entry_reference |
|---|---:|---:|
| 行数 | 1,457 | 864 |
| `statement_kind` | kit_tag 1,457 | import_from 848 / export_from 16 |
| `column` | 4（1,455）/ 5（2） | 1（864） |
| `record` 字符 | 22,705 | 72,004 |

`column=4` 是因为文件头注释里的标签固定缩进成 ` * @kit`；
两条 `column=5` 多一个空格。`column=1` 是顶层 import 语句顶格写。

---

## 2. 逐字段

### 2.1 身份与两端

| 字段 | 非空 | 唯一 | 含义 |
|---|---:|---:|---|
| `id` | 2,321 | 2,321 | 框架代理键 |
| `scan_id` | 2,321 | 1 | 快照隔离 |
| `evidence_key` | 2,321 | 2,321 | **业务键** = `canonical([SDK相对路径, relation_type, start, end])`。身份是"某文件某跨度的某类证据" |
| `kit_id` | 2,321 | 51 | 关系的 Kit 端。**NOT NULL**——没有 Kit 就不是这张表的行 |
| `module_id` | 2,321 | 1,271 | 关系的模块端。未解析时为 NULL（本产品 0 条） |
| `source_id` | 2,321 | 1,507 | 证据**所在文件**。NOT NULL：跨度只存在于文件里 |

三个外键的语义不同，不能互相替代：membership 行的 `source_id` 指向**模块自己的**声明
文件（跨度在它的文件头里），entry_reference 行的 `source_id` 指向 **Kit 入口**文件
（跨度在它的 import 语句上），而 `module_id` 指向被引用的模块——**那个模块的文件里
没有这条证据**。

### 2.2 这是什么样的陈述

| 字段 | 取值 | 含义 |
|---|---|---|
| `relation_type` | declared_membership(1,457) / entry_reference(864) | 两类关系，见 §1 |
| `statement_kind` | kit_tag(1,457) / import_from(848) / export_from(16) | 语法形态。枚举还有 side_effect_import、unsupported 两值未出现 |
| `evidence_state` | confirmed(2,321) | 这处证据本身是否确凿。枚举另有 candidate |

`evidence_state` 与 `resolution_status` 回答的是**两个不同的问题**：前者是"这段字样读准了吗"
（孤立的 `@kit` 没有值 → candidate），后者是"它指的那个模块找到了吗"。
一条 confirmed 的证据完全可以 not_found。

### 2.3 证据在哪

| 字段 | 唯一 | 含义 |
|---|---:|---|
| `source_path` | 1,507 | 证据所在文件，workspace 相对路径 |
| `start_byte` / `end_byte` | 920 / 946 | 字节跨度，半开区间 |
| `line` / `column` | 235 / 3 | 1 起算的行列。**观测值**——由解析器在读文件时换算，不是存起来的算式 |

`line`/`column` 看着能从 `start_byte` 推出来，但那需要把文件重读一遍并逐字节数换行。
和 `install_targets.size` 一样属于"观测当时才拿得到"，不是冗余。

### 2.4 指向谁、找到没有

| 字段 | 取值 | 含义 |
|---|---|---|
| `target_text` | 659 种 | 证据里写的**原字样**：membership 是标签值 `ArkUI`，entry_reference 是 specifier `@ohos.multimedia.image` |
| `target_kind` | module(2,321) | 这个字样指的是什么。枚举另有 kit / external / unknown |
| `resolution_status` | resolved(2,321) | 五态：resolved / ambiguous / not_found / out_of_scope / unsupported |
| `resolution_method` | header_exact(1,457) / named_exact(864) | 怎么找到的。另有 relative_exact 未触发 |
| `resolution_reason` | 全 NULL | 没找到时的原因码（invalid_path / outside_sdk / discovery_incomplete / syntax_unsupported） |
| `candidate_keys` | 1,271 种 | 候选模块键数组 |

**`resolution_status` 的五态是这张表最该读懂的一列。** 它区分四种"没对上"：

| 值 | 含义 | 该怎么办 |
|---|---|---|
| `resolved` | 唯一命中 | — |
| `ambiguous` | 多个模块都叫这个名 | 采集器**不猜**，候选全列在 `candidate_keys` |
| `not_found` | 名字合法但 SDK 里没有 | 可能是 SDK 版本不匹配 |
| `out_of_scope` | 指向外部包或另一个 `@kit.X` | 本来就不该解析，不是缺陷 |
| `unsupported` | 语法不支持 / 路径非法 / 指向 SDK 之外 | 看 `resolution_reason` |

把后四者都渲染成空白单元格，等于把"查不到"和"没有"混为一谈。

### 2.5 条件与原文

| 字段 | 取值 | 含义 |
|---|---|---|
| `condition_state` | unspecified(1,504) / static(650) / both(89) / dynamic(78) | 这条证据在哪种 ArkTS 模式下生效 |
| `condition_evidence` | 52 种形态 | 上面那个判断的依据（后缀、`'use static'` 指令、`if arkts static` 块及其跨度） |
| `record` | 709 种 | 该跨度的**原文**，JSON 字符串 |

membership 行的条件来自**文件**（后缀 + `'use static'`），
entry_reference 行的条件来自**语句所在的条件块**（`if arkts static { ... }`）——
所以 entry_reference 这边 89 条 `both`、78 条 `dynamic`，membership 这边一条都没有。

`record` 是证据的原文，不是摘要：membership 存 `"@kit ArkUI"`，
entry_reference 存整条 `"import { AVCastPickerState, … } from '@ohos.multimedia.avCastPickerParam';"`。
它的作用是让人不回源码就能核对判断。

---

## 3. 可无损精简（建议做，242,153 字符 / 31%）

判据：**代码里就是把同一个值抄了一遍**，不是"本产品恰好只有一个取值"。
每条都附反例计数与代码出处。

### 3.1 `source_path` — 117,913 字符

它精确重复 `source_id` 指向那行的业务键，2,321/2,321 相等。

```sql
SELECT count(*) FROM arkts_kit_relations r
  JOIN arkts_sources s ON s.id = r.source_id AND s.scan_id = r.scan_id
 WHERE s.source_path <> r.source_path;            -- 0
```

**代码自己承认了这是副本**：`records.py:33` 为它开了一条特例，防止导出时
把同一个路径发布两份——

```python
# A relation already carries source_path as its own column, with the
# same value as the declaration it points at; do not publish twice.
```

改走 `source_id` join 即可。读者：`query.py` 几处、viewer 的 `lists.js` 一处。

### 3.2 `candidate_keys` 在 resolved 行恒为 `[module_key]` — 82,104 字符

```sql
SELECT count(*) FROM arkts_kit_relations r JOIN arkts_modules m
    ON m.id = r.module_id AND m.scan_id = r.scan_id
 WHERE r.resolution_status = 'resolved'
   AND r.candidate_keys <> json_array(m.module_key);   -- 0
```

**这是构造必然，不是数据巧合**：`linking.py` 里只有 `len(candidates) == 1` 时才
`resolution_status='resolved'` 并取 `candidates[0]` 当 `_module_key`；
`_membership()` 更是直接写死 `candidate_keys=[item.module_key]`。

这一列**只在 `ambiguous`（多候选）和 `not_found`（空）时携带信息**。
resolved 行改存 `[]`，语义更准确——"没有待定候选"。

目前**没有任何读者**：`query.py`、`records.py`、`export.py`、`lists.js`、
MCP 的 `arkts.py` 都不读它。

### 3.3 membership 行的 `condition_state` / `condition_evidence` 是文件级条件的复本 — 42,136 字符

```sql
-- 1,457 条 kit_tag 行
r.condition_evidence <> s.condition_evidence   -- 0 反例
r.condition_state    <> s.file_condition       -- 0 反例
```

`projection.py:147-148` 把 `row['file_condition']` 和 `row['condition_evidence']`
原样传进 `_relation()`——**就是复制**：

```python
self._relation('declared_membership', tag['span'], name, item, data, positions,
               row['file_condition'], row['condition_evidence'], …)
```

entry_reference 行不一样，那边的条件来自语句所在的 `if arkts …` 块，是独立事实
（60,071 字符的 `condition_evidence` 全在这 864 行里）。

**只对 membership 行留空**，读者 `COALESCE` 到 `arkts_sources` 即可。
风险在于 viewer 的证据列表要改成 join 取值，不能直接读列。

---

## 4. 可推导但建议保留（81,557 字符）

这三列都是别的列的纯函数，0 反例，但**删掉的代价大于收益**。

| 字段 | 推导式 | 反例 | 占用 | 为什么留 |
|---|---|---:|---:|---|
| `relation_type` | `kit_tag → declared_membership`，其余 → `entry_reference` | 0 | 40,643 | CHECK 约束**已经把这条规则写死**了，所以它确实是 1 bit 冗余。但它是 `evidence_key` 的组成部分、两个索引的列、MCP 工具的筛选参数、viewer 和 `query.py` 的分组键——删它要改七处，省 40 KB |
| `resolution_method` | `f(statement_kind, target_text)`：kit_tag→header_exact；`@ohos./@system./@arkts.`→named_exact；`./ ../`→relative_exact | 0 | 26,988 | 推导式是把 `linking.py` 的分支判断复写进 SQL。规则一改，库里的历史数据就解释错了——物化的意义正是**固化扫描当时的判定规则** |
| `target_kind` | 同上，由 specifier 前缀判定 | 0 | 13,926 | 同上 |

这和 `arkts_sources.language_variant` 保留的理由是同一条：
**推导式只要落在读者那边，每个读者都得复写一遍，而且无法表达"当时是这么判的"。**

`resolution_reason` 全为 NULL，占 **0 字符**——不占空间的列没有删的理由，
而它承载的是"没找到的原因"这个本产品未触发的分支。

---

## 5. 需要动框架才能做（155,678 字符 + 约 434 KB 索引）

### 5.1 `evidence_key` 是全表最贵的一列

它是 2,321 个互不相同的长字符串，而且**被索引放大了两次**：

| 对象 | 字节 | 说明 |
|---|---:|---|
| 表内 `evidence_key` | 155,678 字符 | 列本身 |
| `sqlite_autoindex_…_1` | 200,704 | `(scan_id, evidence_key)` 唯一约束 |
| `idx_arkts_rel_status` | 233,472 | `(scan_id, resolution_status, evidence_key)` |
| **合计** | **≈ 590 KB** | 占这张表全部开销（1,495,040）的 **39%** |

而它完全可由现有列重建：

```sql
SELECT count(*) FROM arkts_kit_relations
 WHERE evidence_key <> json_array(
   replace(source_path, 'interface/sdk-js/', ''), relation_type, start_byte, end_byte);  -- 0
```

更省的办法：`(source_id, start_byte)` **已经唯一**（重复组数 0），
两个整数就能当业务键。

### 5.2 为什么现在不能做

框架只支持**单列**业务键：

- `runner.py:85-87` —— `business = table.primary_key[0]`，拿它建 业务键→id 映射
- `framework.py:611` —— 同样取 `primary_key[0]`

`schema.py` 那边已经按 tuple 写了（`tuple(self.primary_key)`），所以改动面是
上面两处取 `[0]` 的地方，不是整套重写。**但这是框架改动，会影响全部采集器**，
不该夹在 arkts 的精简里顺手做。

收益（约 590 KB，全域的 24%）足以单独立项。

### 5.3 顺带：`idx_arkts_rel_status` 当前没用上

索引前缀是 `resolution_status`，而本产品 2,321 行全是 `resolved`——
区分度为 1，等于退化成 `(scan_id, evidence_key)`。`query.py:192` 用的还是
`resolution_status != 'resolved'`（否定条件，本来就难走索引）。

**但不建议删**。换一个解析质量差的 SDK，unresolved 会是主要查询路径，
那时这个索引就是对的。把"本次数据只有一个取值"当成"索引无用"，
和把它当成"字段冗余"是同一个错误。

---

## 6. 汇总与建议顺序

| # | 动作 | 省 | 风险 | 建议 |
|---|---|---:|---|---|
| 1 | `candidate_keys` 在 resolved 时存 `[]` | 82,104 字符 | **无读者**，改一处投射 | 先做 |
| 2 | 删 `source_path`，走 `source_id` join | 117,913 字符 | `query.py` 几处 + `lists.js` 一处改 join；`records.py` 的特例可一并删掉 | 做 |
| 3 | membership 行不复制 `condition_*` | 42,136 字符 | 读者要 COALESCE 到 `arkts_sources` | 做 |
| 4 | 删 `evidence_key`，改 `(source_id, start_byte)` 复合键 | 155,678 字符 + ~434 KB 索引 | **要改框架两处 `primary_key[0]`，影响全部采集器** | 单独立项 |
| 5 | 删 `relation_type` / `resolution_method` / `target_kind` | 81,557 字符 | 把判定规则复写进每个读者，且丢失"当时怎么判的" | **不做**，理由见 §4 |

1–3 合计 **242,153 字符（31%）**，全部是"同一个值存了两遍"，没有语义损失。

---

## 7. 测量方法

- **逐列统计**：`count(列)`、`count(DISTINCT 列)`、`sum(length(列))`，并按 `relation_type`
  分开统计——两类关系混在一起看，列的分布全是假象
- **页字节**：`dbstat` 虚表，表页与**每个索引**分别统计。
  `evidence_key` 的真实成本只有分开统计才看得见（表内 155 KB，索引里另有 434 KB）
- **可推导性**：每个假设一条 `SELECT count(*) WHERE 实际值 IS NOT (推导式)`，
  反例为 0 才记可推导。用 `IS NOT` 而非 `<>`，否则 NULL 行会被静默跳过
- **构造 vs 巧合**：回读 `projection.py` 的 `_membership()`/`_entry()`/`_relation()`、
  `linking.py` 的 `resolve()`、`tables.py` 的 CHECK 约束，
  确认哪些等式是代码里的常量赋值、哪些只是本输入未触发别的分支
- **读者清点**：对每个候选列 grep `query.py`、`records.py`、`export.py`、
  `viewer/src/model/lists.js`、`agentic/query/tools/arkts.py`，
  **没有读者的列删起来才是真便宜**
- **框架约束**：grep `primary_key` 确认 `runner.py`/`framework.py` 只取 `[0]`，
  据此判定复合键改动的影响面
