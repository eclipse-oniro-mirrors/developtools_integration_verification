# ArkTS 验证记录

范围：模块/Kit 解析核心、五表采集、NAPI/ArkUI 实现映射、双向查询、完整导出与 MCP 工具。
不含 API 成员、类型语义或使用指导——那些属于 P2—P4，均未实现。

当前 schema **7.0.0**；IR/adapter 为 1.0.0。模型见 [design.md](./design.md)，
解析核心见 [parser-core.md](./parser-core.md)。

源码基线：`interface/sdk-js` HEAD `56578925ba5f12dc8f7e28a50d495d908a851ccd`。
工作区文件另以完整内容摘要校验，**不以 Git HEAD 代替内容匹配证明**。

---

## 1. 实现与依赖

- Python 只用标准库；生产扫描用工程内 Node v18.20.1 与 ohos-typescript 4.9.5-r10
  （`ts.version=4.9.5`）。独立解析器另验证过 Node v20.19.2。
- [backend-lock.json](./node/backend-lock.json) 含 102 个包文件的 SHA-256，启动前逐项验证；
  Node 加载后再核验实际身份。不复制编译器二进制、不运行 npm install。
- profile 为 `module_kit_v1`，三个内置提取器提供文件头、Kit 引用和顶层条件；
  字节跨度转换是共用能力。
- 原文证据与 coverage、路径、条件、来源等派生元数据分开存储；**所有业务查询不启动 Node**。
- CLI 保持原入口参数，SDK/Node/编译器包路径均由 workspace root 拼接。
  七个 MCP 工具使总数由 43 增至 50。
- 实现映射来自随包的 `napi-map.json`（有独立生成器）。它是参考数据，版本绑定于**扫描器**
  而非被扫源码树，所以**不入库**——它不是 sdk-js 仓里的声明文件，混进声明文件清单会误导。
  其条目数与 sha256 记在 `collector_runs.scope.napi_map`
  （`{"entries": 586, "sha256": "02ec1a8c…"}`）并进入 `input_digest`，换一版映射表游标即失效。

## 2. 实测结果

| 指标 | 数量 |
|---|---:|
| 声明文件合计 | 1,567 |
| ├ 模块侧 | 1,517 |
| └ Kit 入口 | 50 |
| **逻辑模块** | **1,319** |
| ├ 仅动态声明 | 908 |
| ├ 仅静态声明 | 213 |
| └ 动/静双声明 | 198 |
| 可按名 import 的模块 | 643 |
| entry_backed Kit | 49 |
| label_only 分组 | 2 |
| 文件头归属证据 | 1,457 |
| import 来源引用 | 848 |
| export-from 来源引用 | 16 |
| 关系证据合计 | 2,321 |
| 唯一定位的入口引用 | **864** |
| 多候选入口引用 | **0** |
| 文件编码失败 | 1 |

50 份 Kit 入口的引用与条件覆盖状态均为 complete；1,517 份模块声明的正文引用能力均为
`not_requested`。1,566 份文件头完整处理，1 份因编码失败保留失败记录。
入口引用条件为 dynamic 78、static 249、both 89、unspecified 448。

`quality`：`discovery=complete`、`entry_references=complete`、`target_resolution=complete`、
`headers=partial`。

**本次扫描为 degraded，原因只有一条**：`api/@internal/ets/global.d.ts` 含非 UTF-8 字节
（首个非法字节在偏移 10,747）。保留路径、大小、完整摘要和 `encoding_failed`，不遗漏模块。
这是真实的输入缺陷，不为通过验收修改输入源码。

## 2.1 4.0.0—6.0.0：精简

三轮精简针对的是"同一个事实存了两遍"，不是"这个产品只有一个取值"——
后者是本输入未覆盖分支，删了换个产品就错，判据见
[data-model-review.md §5](./data-model-review.md)。

| 版本 | 动作 | 依据 |
|---|---|---|
| 4.0.0 | `arkts_sources` 删 `kind`、`sha256`、`repo_id`；`napi-map.json` 不再入库 | 参考数据不是声明文件；`repo_id` 恒单值且源码 URL 按路径前缀匹配，不读它 |
| 5.0.0 | `coverage` 扁平成 `{能力: 状态}`；删 `references_status` | `extractor_version` 每行重复 4 次、全库一个值；`references_status` 是 `coverage['kit.references']` 的投射，0 反例 |
| 6.0.0 | `arkts_module_impls` 整表折叠成 `arkts_modules.impl_*` 四列 | 实测 932 行对 932 个模块，`count(*) = count(DISTINCT module_id)`，严格一对一 |
| 7.0.0 | `impl_so_path` 按扫描 `cpu_arch` 构造；`arkts_links` 改为完整路径精确关联，删除 `linked_by_arch_alias` | blue/arm 落 `system/lib/`，yellow/arm64 落 `system/lib64/`；旧库需重扫 |

| 体量 | 3.0.0 | 6.0.0 |
|---|---:|---:|
| `arkts_sources` 列数 | 19 | **15** |
| `arkts_sources` 表页 | 864,256 | **442,368** |
| `coverage` 字符 | 444,524 | **200,072** |
| 本域表数 | 5 | **4** |
| 本域表页合计 | 1,990,656 | **1,552,384** |

**代价已记账**：删 `sha256` 后，按 `header_span` 回源码切片时无法判断单份文件是否变过，
总摘要只能告诉你"整体变了"；删 `repo_id` 后档案页不再显示"所属仓"（源码链接不受影响，
它走路径前缀匹配）。两者都写在
[arkts-sources-field-report.md §4](./arkts-sources-field-report.md)。

折叠**不是结构保证**：若将来一个模块可由多个 .so 实现，得拆回子表。

## 2.2 3.0.0：实现映射与分类重设计

> 历史记录，保留当时的列名。`arkts_module_impls.{so_path, napi_module_name,
> impl_source, match_method, elf_module_id}` 在 6.0.0 已折叠为
> `arkts_modules.{impl_so_path, impl_napi_name, impl_match, impl_elf_id}`；
> 下面的数量结论不受影响，932 仍是 932。

| | |
|---|---:|
| `napi-map.json` 条目 | 586 |
| `module_name` 精确 / `declaration_path` / `name_suffix` | 501 / 17 / 7 |
| 合计命中 | **525** |
| 对不上任何模块（advisory） | 61 |
| ArkUI 模块（引擎实现） | 407 |
| `arkts_module_impls` 合计 | **932** |
| **解析到镜像内唯一 ELF 行** | **932 / 932** |
| 当时靠 `lib64→lib` 架构别名命中（历史模型） | **932** |
| 路径不在镜像 / 多命中 | 0 / 0 |

61 条未命中已逐条分类：**60 条在 SDK 扫描范围内无任何末段同名声明文件**
（ArkUI 内部控制器 6、Ability 运行时对象 12、内部/平台模块 42），
**1 条名字有歧义**（`serial`）。分类判据与反证见 [design.md §3.8.2](./design.md)。

映射表写的是 64 位路径，rk3568 是 32 位（3,513/3,517 的 ELF 为 ARM32，
镜像里 `system/lib64/` 下零个安装目标）。上表与本节命中率是历史模型（先保留参考路径、
关联时再做 `lib64→lib` 别名）的测值。当前模型在投影时就按 `scans.cpu_arch` 归一，
`impl_so_path` 在 blue/arm 下直接写 `system/lib/…`，`arkts_links` 与 `dest` 精确关联。

全路径也消解了同名歧义：按文件名匹配时有 14 个 `.so` 名在镜像中出现 2–3 次，
用全路径后全部唯一。

端到端抽查：`@ohos.app.ability.UIAbility` → `system/lib/module/app/ability/libuiability.z.so`
（ability_runtime）；`api/@internal/ets/button` → `system/lib/platformsdk/libace_engine_pa_ark.z.so`
（ace_engine）。反向 `libace_engine_pa_ark.z.so` ← 408 个 ArkUI 模块。

分类由单列 `source_category` 拆为 `declaration_scope` + `implementation_kind`，
因为目录是混的：`api_named` 下 505 napi / 26 arkui / 108 unknown，
`api_auxiliary` 下 238 arkui / 17 napi / 171 type_only，两者合计占 81%。

判定按证据强度排序、napi 优先：`@arkts.collections` 与 `@ohos.arkui.uiExtension`
都有实测 napi 实现（`module/arkts/libcollections.z.so`、
`module/arkui/libuiextension_napi.z.so`），因此归 napi 而非按名字前缀归类。

`arkts_declarations` 更名 `arkts_sources` 并加 `kind`，使 `napi-map.json` 能作为
`reference_data` 行登记摘要，供实现行 FK 引用。

新增 `arkts_links` 采集器（`DEPENDS_ON=('arkts','elf_modules')`）回填 `elf_module_id`——
arkts 排采集序第 2、elf_modules 排最后，直接依赖会抛 `DEPENDENCY_CYCLE`。

### 2.1.1 实施中捕获的缺陷

- **`ctx.issue()` 路径越界**：未匹配告警原先锚在 `napi-map.json` 上，而该文件在包内、
  未必位于被扫 workspace 下。真实扫描恰好能跑（包在 workspace 里），夹具用 /tmp 立即暴露。
  改为锚在 `sdk_root`，映射表摘要放进 details。
- **通用排序假设失效**：`arkts_module_impls` 是复合业务键，`primary_key[0]` 是
  `module_id`，而 emit 前只有临时键 `_module_key`。排序收回 `Projection.rows()`。

## 3. 2.0.0 重建模：实体由声明文件改为模块

1.0.0 以**声明文件**为模块主键，于是 `X.d.ts`（ArkTS 1.1）与 `X.static.d.ets`（1.2）
成了两个模块。后果是 import 无法唯一定位：142 条入口引用被判为 ambiguous，
`target_resolution` 停在 partial。

逐条展开这 142 条，**142/142 是同一种形状**——候选去掉语言后缀后同名。
那不是歧义，是同一个模块的两份声明。

2.0.0 把主键改为去语言后缀的路径，声明文件降为子表 `arkts_declarations`。这与
`arkts_kits` ← Kit 入口文件（`@kit.ArkUI` 本来就有动/静两份，49 个 Kit 对 50 份入口）
是同一种形状——**该形状代码里已经存在，只是模块侧没有套用**。

| | 1.0.0 | 2.0.0 |
|---|---:|---:|
| 主表行数 | 1,517（文件） | **1,319（模块）** |
| ambiguous 入口引用 | 142 | **0** |
| `target_resolution` | partial | **complete** |
| 关系证据 | 2,321 | 2,321（逐条守恒） |
| `arkts_modules.record` | 1,329,021 字符 | 列已移除 |
| `evidence_bytes` | 1,452,411 | **89,782** |
| `collector_runs.scope` | 182,714 字节 | **2,150 字节** |
| 临时 SQLite | 5,050,368 字节 | 3,239,936 字节 |

**旁证**（不是"换了算法所以数字变好"）：

- 这 142 条解析后指向的模块，逐条核对磁盘上动/静两份文件均存在且与 `module_key` 同名
  （149/149，含同一模块被多次引用）。
- 864 条入口引用的来源字符串与起止字节位置，由直接调用锁定编译器 `createSourceFile` 的
  独立遍历逐条比对一致——该遍历不复用生产适配器或提取器。
- 关系证据总数 2,321 与 1.0.0 完全相同，`statement_kind` 分布（kit_tag 1,457 /
  import_from 848 / export_from 16）也相同：**证据一条没丢，只是指向的实体变了**。

### 3.1 `record` 与 `scope.files` 的移除

依据是同一条：同一事实不留第二份拷贝。

- 1,517 份文件头去重后只有 1,241 种、100% 含 Apache 许可证样板，差异主要是版权年份；
  承载归属的 `@kit` 标签已作为关系原文保留。改为只存 `header_span`，按 `sha256` 回源码切片。
- `scope.files` 的 `(路径, sha256, 读取状态)` 三项已经是 `arkts_sources`（当时名为 `arkts_declarations`）的列，
  改为一个 `files_digest`。

可复现性判据不变：改一个字节仍然换一个 `input_digest`（有专项测试改写声明文件后断言
`files_digest` 变化）。代价是**数据库无法离线还原未采集的正文**，
后续解析正文必须重新读取摘要相同的源码。

### 3.2 一并修正的问题

- **投射层的位置耦合**：`zip(TABLES, (...))`、`zip(('modules','kits',...), TABLES)`
  两处靠元组顺序对齐，`records.py` 一处写死 FK→业务键字面量。现改为按表名取行、
  按表名派生文档字段、从 `Table.primary_key` 推导外键映射。
- **IR 校验的扩展单位与后端不一致**：Node 侧 `validate` 挂在每个提取器上，Python 侧
  只有一个按 profile 分发的 115 行单体函数。现按 capability 注册 `FACT_VALIDATORS`，
  与 Node 的提取器一一对应。
- **`collect()` 149 行**（项目第二长 50 行，中位数约 35）。编排留在 `collect()` 共 24 行，
  逐文件的读取/解析/投射移入 `projection.py`。
- **`source_path` 口径**：`module_key` 用 SDK 相对路径，`source_path` 用 workspace 相对路径。
  重构中一度统一成前者，**导致仓匹配静默失效**——`--without repos` 的验证掩盖了它，
  由带 repos 的回归捕获并修复。修复后 1,567/1,567 行 `repo_id` 命中，
  两份声明各自生成正确的源码 URL。

## 4. 核验方法与结果

| 检查 | 结果 |
|---|---|
| `python3 -m unittest discover -s oskm/tests -p 'test_*.py'` | 259 项通过，无跳过 |
| `node --test oskm/collectors/arkts/node/tests/core.test.cjs`（工程内 v18.20.1） | 16 项通过 |
| `python3 -m unittest discover -s agentic/query/tests -p 'test_*.py'` | 111 项通过（含 CLI 与 skill 门禁） |
| `python3 oskm/tests/verify_arkts.py --workspace-root …` | 通过（含实现映射独立重算） |
| `python3 -m oskm.cli list` | 自动注册 arkts，依赖仅 repos；其他领域注册不要求 Node |
| `python3 -m compileall -q oskm/collectors/arkts agentic/query/tools/arkts.py` | 通过 |
| `PRAGMA integrity_check` / `foreign_key_check` | ok / 无违规 |
| `git diff --check` | 通过 |

`verify_arkts.py` 是独立核验，不复用生产适配器或提取器：

1. 从磁盘递归清点声明文件，与 `arkts_sources` 对照；
2. **从磁盘独立推导模块清单**（文件名去语言后缀求集合），与 `arkts_modules` 对照——
   这一项直接验证重建模本身，而不是验证实现与自己一致；
3. 直接调用锁定编译器的 `createSourceFile` 遍历 50 份 Kit 入口，对 864 条引用逐条比较
   来源字符串和起止字节位置；
4. 断言**零 ambiguous**；
5. 断言双声明模块暴露两份文件且语言版本分别为 dynamic/static；
6. 逐条校验关系原文与原始字节切片一致、文件头跨度落在字符边界上；
7. `PRAGMA foreign_key_check` 及显式跨 scan / 证据归属 JOIN 检查；
8. **从 `napi-map.json` 独立重算实现映射**：逐行核对 `impl_source` 与
   `implementation_kind` 一致、napi 行的 `so_path` 确在按扫描 `cpu_arch` 归一后的
   映射表取值集合中、napi/arkui 模块各有且仅有一行、已解析链接的 `dest` 必须与
   `impl_so_path` 逐字相等。

该脚本以 `--only arkts --without repos` 运行，`arkts_links` 不参与，
因此报告里 `implementations.resolved` 为 0——链接解析由全量扫描覆盖。

人工指定样本另外确认 UIAbility→AbilityKit、button→ArkUI。小型夹具覆盖多标签、空 Kit、
孤立标签、相对路径、外部引用和条件语义，**避免只用 AST 对照 AST**。

### 4.1 扩展契约验收

| 编号 | 已验证证据 |
|---|---|
| E-01 | Node 测试追加 `test.fact` 注册、schema 与 profile；engine/bridge/四表无需业务分支；与 P1 并存时 P1 事实和 coverage 不变 |
| E-02 | 缺能力握手、重复提供者、依赖环、未知 profile、IR 不兼容均明确拒绝 |
| E-03 | 模块解析上下文的 `ast()` 被替换为抛错函数仍可处理文件头；静态注解正文、内部 import、权限标签不形成 API 事实 |
| E-04 | Kit 语法失败拒收恢复 AST 的引用，头部保留；单提取器限额失败传播给依赖能力，不冒充 complete |
| E-05 | 同输入重扫导出相同、游标可继续；源码、有效配置或发现范围变化使游标失效；包身份不符启动失败；旧快照纯数据库可查询 |
| E-06 | 错 id/hash、未知事实分区、错误跨度、UTF-8 非字符边界、未知必需字段/版本均被拒绝 |

其他测试覆盖：stderr 填满同时发送大请求、无换行超大帧、输出污染/截断、超时/取消进程回收、
SQLite 插入中途失败回滚、跨扫描隔离、输入移走后导出、符号链接范围、编码/文件预算、
精确匹配与歧义保留、双向查询与多证据去重、过滤条件绑定游标、MCP 参数拒绝与查询不启动进程。

### 4.2 测试环境依赖的修正

`test_arkts.py` 中三处 `Backend(BACKEND)` 原先回退到 PATH 上的 Node，而锁定清单只接受
v18.20.1/v20.19.2——换台机器（本机 PATH 为 v22.20.0）必然失败。它们验证的是协议与身份校验、
不是 Node 发现，已固定为工程内 Node。

`test_e2e.py` 的工具总数由 49 改为 50（新增 `list_arkts_declarations`），
并补一条重名断言——重复注册会静默覆盖处理函数，仅凭计数发现不了。

## 5. 入口完整验证

在真实 OpenHarmony 工程根执行入口命令，不加 ArkTS 参数，不用 `--only/--without` 缩小范围：

```bash
PKG=KnowledgeBase/packages/oskm
python3 "$PKG/oskm.py" scan --workspace-root "$PWD" --product rk3568 --db <db>
```

退出码 4（degraded），`gate_passed=true`。**11 个采集器**全部落库：

| 采集器 | 记录数 | 状态 |
|---|---:|---|
| repos | 525 | complete |
| arkts | 1,319 | degraded |
| arkts_links | 1 | complete |
| components | 382 | degraded |
| args | 0 | complete |
| install_modules | 5,501 | complete |
| component_links | 1 | complete |
| services | 164 | degraded |
| hdi | 57 | degraded |
| sas | 165 | complete |
| elf_modules | 3,517 | complete |

`PRAGMA integrity_check` 返回 ok，`foreign_key_check` 无违规。

arkts 由 1,517 行降为 1,319 行是**实体口径变化（文件→模块），不是采集缺失**：
声明文件 1,567 份一份不少，落在 `arkts_sources`。

入口 README 明确将退出码 4 定义为"已落库但数据不完整"，**不为获得 0 而隐藏质量问题**。
components/services/hdi 的 degraded 是它们各自的源码/关联问题，本次不修改这些事实。

生产 Node 固定在 `prebuilts/build-tools/common/nodejs/node-v18.20.1-linux-x64/bin/node`，
编译器包固定在 `interface/sdk-js/build-tools/node_modules/typescript`。集成测试调用真实
`oskm.py`、清空 PATH 后仍完成 ArkTS 扫描；移除工程 Node 时明确失败，**不自动改用系统 Node**。
`scan --help` 只显示原有参数。

### 5.1 产品级回归脚本仍未全绿

```bash
python3 oskm/tests/verify_rk3568.py --workspace-root /path/to/code
```

该脚本完成全量扫描，`verify_arkts.verify_domain` 作为第一项核验**通过**，
随后在既有 `verify_install_modules()` 失败：

```
assert not duplicates and isinstance(rows, list) and len(rows) == 5506
AssertionError          # system_module_info.json 实际为 5,501 条
```

这是对输入文件独立计数的旧硬编码基线，**与 arkts 无关**，失败点在 arkts 核验之后。
没有修改该基线或放宽检查，因此该脚本剩余步骤和最后的 CLI gate 不记为通过。

## 6. 资源观察

非性能承诺，单 Node 串行模式，未做长期压力测试。

| 指标 | 1.0.0 | 2.0.0 | 6.0.0 |
|---|---:|---:|---:|
| 实际输入字节 | 43,678,765 | 43,678,765 | 43,678,765 |
| 最大单文件字节 | 1,116,502 | 1,116,502 | 1,116,502 |
| 保存的证据字节 | 1,452,411 | **89,782** | 89,782 |
| 临时 SQLite 大小 | 5,050,368 | 3,239,936 | **3,178,496** |
| 采集时间 | 18.168 s | 19.334 s | 20.271 s |
| 子进程峰值 RSS | 119,824 KiB | 135,224 KiB | 136,304 KiB |

RSS 来自 Linux `getrusage`；子进程值是解析器/独立对照进程的最大值，不是进程树同时占用之和。
1.0.0 那次用 Node v20.19.2 测得，2.0.0 用工程内 v18.20.1，**两列的耗时差不能单独归因于改动**。

6.0.0 比 2.0.0 多做了 NAPI 匹配，耗时多出约 0.9 s；库小了 61 KB，是精简的净效果
（表页 −438 KB 被索引与 freelist 吃掉一部分）。**三列不是同一轮测的，
耗时差不能单独归因于改动**。

`input_digest`：1.0.0 为
`267b25521b5ae53508d3be2cfbe3ae572f46960cacce0909fc8c7b939a301679`，
2.0.0 为 `9e34d013872d5cfe3451293cb7636fb21d7fa357af76e17897bdb9d151c56e37`，
6.0.0 为 `ab6e88987f544a6d309629718a9659afbbe2a01c6f923d89648d97527430f1c9`
（变化来自 `napi_map` 摘要与投射代码摘要进入输入身份）。
摘要包含源码内容、发现状态、后端身份、解析核心与投射代码摘要、profile 和有效预算；
仅修改文档不改变该值。

## 7. 已知限制与未完成项

- **1 份非 UTF-8 声明文件**导致本域 degraded，见 §2。这是输入缺陷，保留不掩盖。
- **`verify_rk3568.py` 未全绿**，见 §5.1。原因是既有的 install_modules 硬编码基线。
- ~~**`args` 采集器本次 0 条**（`GN_ARGS_PARSE_FAILED`）~~ —— 已查明并修复：`gn` 从
  工作目录向上找 `.gn` 定位源码根，采集器调 `subprocess.run` 时没传 `cwd`，
  从仓外调用 CLI 时 gn 0.3 秒就带着 `BUILDCONFIG.gn: Not allow import other gni` 退出。
  现出 2,952 条。与 arkts 无关，但同一次扫描里顺手修了。
- **P2—P4 未实现。** 当前 ohos-typescript 对部分静态 ArkTS 全文语法仍有诊断；
  第一阶段通过只扫模块头部维持边界。后续必须用方言覆盖清单验收，
  **不能把本次模块/Kit 成功当作全属性解析能力的证明**。
- **arkts 已部分接入全库关联图**：`arkts_modules.impl_elf_id` 把 932 个模块
  连到 `elf_modules`，进而到 `install_targets` 和 `components`。
  `@syscap` 建桥仍未做（SDK 里 `@syscap` 出现 84,005 次、273 个名字，与库内 `syscaps`
  交集 253 个，可连通 115/130 个部件）。
- **61 条 napi 条目对不上任何模块**，记为 advisory，已逐条分类（60 条无声明、
  1 条名字歧义）。`serial` 的消歧需要引入 .so 目录段作为信号，尚未实施。
- **108 个模块 `implementation_kind='unknown'`**：有模块名但无任何实现证据，保持 unknown，
  不强行归类。
- **`class_to_so` 未接入**（按要求暂缓）。其 821 条是去重后的结果：SDK 实证 `Options`
  在 13 个文件里声明、`Config`/`Context`/`Callback` 各 3 个，而映射表每名只有 1 条，
  生成时丢弃了碰撞项。将来要做必须先解决这一点。
- Node/编译器离线包由运行环境提供，包文件清单已锁定；运行时没有自动下载或降级。
  查询和完整导出不依赖该运行时。需要精确重解析正文时必须取得相同内容摘要的源码——
  当前四表不存模块正文。
