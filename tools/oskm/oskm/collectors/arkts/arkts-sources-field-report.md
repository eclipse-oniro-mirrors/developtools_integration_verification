# `arkts_sources` 逐字段说明

日期：2026-10-25
对象：schema **6.0.0** 的 `arkts_sources`，15 列（13 业务列 + `id`/`scan_id`）/ 1,567 行。
数据基于 rk3568 全量扫描库，方法见 §5。

**这张表是什么**：扫描读过的每一份 SDK 声明文件，一行一份。
它回答"磁盘上有哪些声明文件、每份读得怎么样、它声明了什么"。
**模块**是另一张表（`arkts_modules`）——一个模块可以有两份声明文件，这正是分两张表的原因。

已删除四列（`kind`、`sha256`、`repo_id`、`references_status`）、停止把 `napi-map.json` 入库，
并把 `coverage` 扁平化。**19 列 → 15 列，库内 864 KB → 442 KB（−49%）**。取舍见 §4。

---

## 1. 三个最容易混淆的字段

这三个都和"动态/静态"有关，但问的是不同的问题。**先把它们分清，表才看得懂。**

```
文件名              @ohos.animator.static.d.ets
                            │
                            ├─ declaration_format = 'static.d.ets'   ← 后缀长什么样
                            └─ language_variant   = 'static'          ← 后缀说它是哪个语言版本

文件内容            'use static';
                    /** @file ... */
                            │
                            ├─ file_condition     = 'static'          ← 内容说它适用于哪种模式
                            └─ condition_evidence = [后缀证据, 指令证据+位置]  ← 凭什么这么判
```

### `declaration_format`——文件名后缀，语法事实

取值 `d.ts`(1,074) / `d.ets`(81) / `static.d.ets`(412)。就是文件名末尾那一段，没有解释成分。

### `language_variant`——后缀对应的 ArkTS 语言版本

取值 `dynamic`(1,155) / `static`(412)。规则是一张常量表（`models.VARIANTS`）：

```
.static.d.ets → static    （ArkTS 1.2）
.d.ets        → dynamic   （ArkTS 1.1）
.d.ts         → dynamic   （ArkTS 1.1）
```

**它始终是单值，不会"static + dynamic 同时"。** 一份文件只有一个后缀。

"两个版本都有"是**模块**的属性，不是文件的：`arkts_modules.language_coverage`
取 `dynamic`(908) / `static`(213) / **`both`(198)**。那 198 个模块各有两份声明文件，
每份文件自己仍然只有一个 `language_variant`。

### `file_condition`——文件内容声明它适用于哪种模式

**与后缀无关**。它来自 Node 的 header 提取器，规则只有一条：
扫描文件头，**找到任何条件标记就是 `static`，否则 `unspecified`**
（`header.cjs`：`conditions.length ? 'static' : 'unspecified'`）。

条件标记有两种来源：`.static.` 后缀，以及文件开头的 `'use static'` 指令。

所以它和 `language_variant` 在本产品上恰好一致（0 反例），但**这是巧合不是规则**：
一份普通 `.d.ts` 写上 `'use static'`，就会得到 `file_condition='static'` 而
`language_variant='dynamic'`。本产品里没有这种文件，换个 SDK 就可能有。

> 列的枚举写了五个值（`unspecified/dynamic/static/both/unknown`），
> 是为了和后端 IR 的契约一致；当前提取器只会产出前两个中的两种。

### `condition_evidence`——上面那个判断的依据

JSON 数组，记录**找到了哪些标记、在第几个字节**。实测五种形态：

| 条数 | 内容 | 读法 |
|---:|---|---|
| 1,155 | `[]` | 没有任何条件标记 → `unspecified` |
| 110 | `[{"kind":"static_suffix","span":null}]` | 只有后缀是证据。`span` 为 `null` 因为依据是**文件名**，不是文件里的某段字节 |
| 278 | `[{static_suffix}, {"kind":"use_static","span":[0,12]}]` | 后缀 + 第 0 字节起的 `'use static'` 指令 |
| 23 | 同上，`span":[1,13]` | 指令前有 1 字节（BOM 或空白） |
| 1 | 同上，`span":[2,14]` | 指令前有 2 字节 |

**它的作用**：让人能核对"为什么判成 static"，并定位到原文。
跨度不同是因为 BOM 和前导空白不同——这是 `file_condition` 这个结论本身推不出来的事实。

302 份文件显式写了 `'use static'`；去掉这一列就没法回答"哪些文件显式声明过、写在哪"。

---

## 2. 其余字段

### 2.1 身份

| 字段 | 作用 |
|---|---|
| `id` | 框架代理键，别的表的外键指它 |
| `scan_id` | 快照隔离，一次扫描一组数据 |
| `source_path` | **业务键**。文件在源码树里的位置，相对 workspace 根：`interface/sdk-js/api/@ohos.x.d.ts`。源码 URL 按它的最长前缀匹配到仓再拼出来 |

> `source_path` 用 **workspace** 相对路径，而 `arkts_modules.module_key` 用 **SDK** 相对路径。
> 两套坐标系是刻意的：import specifier 在 SDK 坐标系里解析，而定位仓内文件要 workspace 坐标系。
> 曾经统一成前者，仓匹配当场静默失效。

### 2.2 它声明了什么

| 字段 | 作用 |
|---|---|
| `module_id` | 这份文件声明的模块（1,517 行非空 → 1,319 个模块，差额就是双声明） |
| `kit_id` | 这份文件开启的 Kit（50 行非空 → 49 个 Kit，`@kit.ArkUI` 有两份入口） |
| `role` | `module`(1,517) / `kit_entry`(50)。**两个外键都为空时只有它能说明这是个 Kit 入口**——文件名不是合法 `@kit.<Name>` 的入口会落到这种状态（本产品 0 条，代码路径在） |

### 2.3 读得怎么样

四个状态列回答四个不同问题，**不能互相替代**：

| 字段 | 回答的问题 | 取值 |
|---|---|---|
| `read_status` | 文件本身读到了吗 | `ok`(1,566) / `encoding_failed`(1) / `unreadable` / `limit_exceeded` / `path_invalid` |
| `header_status` | 文件头解释得怎么样 | `ok`(1,507，有确认的 @kit) / `no_tag`(59，读完但没标签) / `partial` / `failed`(1) |
| `coverage` | 四个提取能力各自跑成什么样 | JSON，`{能力: 状态}` |

**`no_tag` 与 `failed` 是两件事**：前者是"读完了，这份文件确实没写 @kit"，
后者是"没读成，不知道有没有"。混为一谈就会把采集失败说成源码事实。

**`coverage` 为什么模块行的后两项恒为 `not_requested`**：profile 定义的。
`module_kit_v1` 的 module 角色**根本不请求** `kit.references` 与 `condition.top_level`
（见 `profiles.cjs`）。这不是"分析过且没有引用"，是"没分析正文"。

原先还有一列 `references_status`，**它完全是 `coverage['kit.references']` 的投射**
（0 反例，代码里就是从它算出来的），已整列删除。

### 2.4 大小与定位

| 字段 | 作用 |
|---|---|
| `byte_size` | 实际读取的字节数。观测值 |
| `header_span` | 文件头的字节跨度 `[start, end]`。**原文不入库**——1,517 份文件头去重后只有 1,241 种、100% 是 Apache 许可证样板，承载归属的 `@kit` 标签已经作为关系原文保留。要看原文就按这个跨度回源码切片。空值 ⟺ 读取失败（0 反例） |

---

## 3. 还能精简什么

| 字段 | 判定 |
|---|---|
| `coverage` | **已改编码**：`{能力: 状态}` 扁平映射，去掉逐行重复四遍的 `extractor_version`（它在 `scope.backend.capabilities` 里，全库一个值）。444,524 → 200,576 字符。**没有拆成固定列**，见下 |
| `references_status` | **已删除**——它是 `coverage['kit.references']` 的投射 |
| `declaration_format` / `language_variant` | 构造上 `source_path` → 后缀 → 语言版本是纯函数链。保留，因为语法列与语义列各自要能直接过滤，代价 20 KB |
| `role` / `file_condition` / `condition_evidence` | **不能删**，理由见 §1 与 §2.2——都是"本产品恰好单值"而非"结构上冗余" |
| 其余 | 各自携带独立信息 |

**为什么 `coverage` 没有拆成四个固定列**（那样能到 ~56 KB，更省）：
拆列会把表结构钉死在当前这四个能力上，新增一个提取器就得改表。
而解析核心的扩展契约是"加一个事实 = 加一个提取器 + 一条注册，不动四表"
（见 [parser-core.md](./parser-core.md#extensibility)）。
扁平 JSON 多一个键就行，省了 55% 又不违约——这一条推翻了本报告上一版的建议。

---

## 4. 本轮删掉的字段及其代价

| 删除 | 原因 | 失去了什么 |
|---|---|---|
| `kind` + `napi-map.json` 行 | 映射表是**采集过程用的参考数据**，不是 sdk-js 仓里的文件，混进"声明文件"清单会误导 | 实现关系不再有指向输入文件的外键。映射表的摘要改记在 `collector_runs.scope.napi_map`，复现性不受影响 |
| `sha256` | 逐文件摘要入库 1,567 行，而输入身份已由 `scope.files_digest` 一个总摘要锁住 | **失去逐文件的内容校验**：按 `header_span` 回源码切片时，无法判断这份文件是否已经变过。总摘要只能告诉用户"整体变了"，指不出是哪一份。如果将来要做"证据原文可离线复算"，这一列得加回来 |
| `references_status` | 它完全是 `coverage['kit.references']` 的投射（0 反例） | 没有损失。查询改读 coverage |
| `coverage` 里的 `extractor_version` | 全库一个值，已在 `scope.backend.capabilities` | 没有损失 |
| `repo_id` | 取值恒为单值（arkts 只扫 `interface/sdk-js` 一个根）；源码 URL 按路径前缀匹配，不读它 | arkts 失去到 `repos` 的外键边，档案页的关联区不再显示"所属仓"。源码链接不受影响 |

摘要仍在扫描过程中逐文件计算，只是不落库——`files_digest` 照常由它们算出，
改一个字节 `input_digest` 就变，游标随之失效。

---

## 5. 测量方法

- **逐列统计**：`count(列)`、`count(DISTINCT 列)`、`sum(length(列))`；页字节用 `dbstat`
- **可推导性**：每个假设一条 `SELECT count(*) WHERE 实际值 IS NOT (推导式)`，反例为 0 才记可推导。
  JSON 列必须用 canonical 形式比较——库里无空格，比较串多一个空格会造出 412 个假反例（本次踩过）
- **构造 vs 巧合**：回读 `projection.py` 的 `declare()`、`node/extractors/header.cjs`
  与 `node/profiles.cjs`，确认哪些等式是代码里的纯函数、哪些只是本输入未触发别的分支
- **`language_variant` 是否可能并存**：读 `models.VARIANTS`（后缀 → 单值的常量字典）
  与 `discovery.split()`；再查库确认列的取值集合为 `{dynamic, static}`，
  `both` 只出现在 `arkts_modules.language_coverage`
- **`condition_evidence` 的独立性**：`GROUP BY condition_evidence` 看全部形态，
  并按 `language_variant` 交叉
