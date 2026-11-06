# ArkTS 模块与 Kit 知识采集

从 `interface/sdk-js` 采集 SDK 模块清单、Kit 清单及二者的关系。粒度止于模块，
不展开模块内部 API。

当前阶段：**第一阶段已实现**，schema 7.0.0，含解析核心、四表采集、NAPI/ArkUI 实现映射、
查询/导出和 7 个 MCP 工具。

| 文档 | 内容 |
|---|---|
| [design.md](./design.md) | **采集模型**：实体与身份规则、五表、关系语义、实现映射、框架接入、查询与导出 |
| [parser-core.md](./parser-core.md) | **解析核心**：进程边界、后端锁定、Python—Node 协议、提取器契约、[扩展路径](./parser-core.md#extensibility) |
| [data-model-review.md](./data-model-review.md) | **数据模型审视**：表依赖图、逐字段含义、冗余判定、实现映射与可达性 |
| [arkts-sources-field-report.md](./arkts-sources-field-report.md) | `arkts_sources` 逐字段说明：三个"动静态"字段的区别、能否精简 |
| [arkts-kit-relations-field-report.md](./arkts-kit-relations-field-report.md) | `arkts_kit_relations` 逐字段说明与精简评估：两类证据的区别、可无损去掉 31% |
| [validation.md](./validation.md) | 验证记录：实测数据、核验方法、已知限制 |
| [工具规格](../../../agentic/docs/spec/arkts.md) | MCP 工具参数与返回 |

## 模块与声明文件是两层

一个模块可以有两份声明：`X.d.ts`（或 `X.d.ets`）是 ArkTS 1.1 版本，`X.static.d.ets`
是 1.2 版本。它们是**同一个模块的两种语言形态**。

```
arkts_modules       1319   module_key = 去语言后缀的路径；643 个可按名 import
  ├ arkts_sources          声明文件 1567（参考数据不入库）
  （实现 .so 作为 impl_* 四列长在 arkts_modules 上 → elf_modules）
arkts_kits            51   49 个有入口，2 个只在模块标签中出现
  └ arkts_sources          同一张表，Kit 入口挂在这里
arkts_kit_relations 2321   归属声明 1457 + 入口引用 864
```

rk3568 实测：1,567 份声明文件归并为 1,319 个模块，其中 **198 个模块同时有动/静两份声明**。
早先以文件为模块主键时，这 198 个在 import 解析里表现为"多候选"，造成 142 条无法定位的
引用；改为模块主键后全部唯一解析。

`module_name`（可按裸标识符 import 的名字）只有 643 个模块有；其余 676 个是
`api/@internal` 组件、`api/` 子目录辅助声明和 `arkts/builtin`，只能按相对路径引用，
该列为 NULL。它们仍是 TypeScript 意义上的模块，只是不能具名 import。

两种关系含义不同，查询与统计保留区别：

- `declared_membership`——模块文件头的 `@kit` 声明归属
- `entry_reference`——Kit 入口的 import / 带来源的 export

**都不能据此断言模块的全部 API 由该 Kit 导出。**

## 模块 → 实现它的 .so

模块到实现的映射来自随采集器打包的 `napi-map.json`（NAPI 运行时名 → 镜像内路径），
ArkUI 声明则统一由引擎 `libace_engine_pa_ark.z.so` 实现。

rk3568 实测 **932 条映射全部解析到镜像内唯一 ELF 行**：

```
@ohos.app.ability.UIAbility  → system/lib/module/app/ability/libuiability.z.so   (ability_runtime)
api/@internal/ets/button     → system/lib/platformsdk/libace_engine_pa_ark.z.so  (ace_engine)
```

运行时名与 SDK 名不总一致，四条规则按强度排序（精确前缀 → `@`+名 → 路径 → 唯一后缀兜底），
用了哪条记在 `match_method`。586 条里 525 条命中，61 条未命中已逐条分类见
[design.md §3.8.2](./design.md)。

映射表是 64 位参考数据，但入库前会按 `scans.cpu_arch` 改写到目标库根：
blue/arm 落 `system/lib/`，yellow/arm64 落 `system/lib64/`。因此 `impl_so_path`
本身就是本次产品的镜像路径，`arkts_links` 直接与 `install_targets.dest` 精确比较，
不再依赖 `lib64→lib` 别名。

路径解析分两段：**arkts 产出 `.so` 路径，`arkts_links` 采集器把它解析成 `elf_module_id`**。
因为 arkts 排采集序第 2、elf_modules 排最后，直接依赖会成环。

第一阶段不采集类、函数、成员、签名、权限、API 版本或 SysCap。`arkts` 是领域名，
覆盖 `.d.ts`、`.d.ets`、`.static.d.ets`，不限于源码仓的 `arkts/` 子目录。

## 扫描

生产扫描使用工程内 Node **v18.20.1** 和 **ohos-typescript 4.9.5-r10**。所有路径由
workspace root 拼接：SDK 为 `interface/sdk-js`，后端包为
`interface/sdk-js/build-tools/node_modules/typescript`，Node 为
`prebuilts/build-tools/common/nodejs/node-v18.20.1-linux-x64/bin/node`。
**不依赖 PATH 中的 Node，不增加 ArkTS 入口参数。**
[backend-lock.json](./node/backend-lock.json) 锁定后端身份和 102 个包文件的摘要。

完整产品扫描无需任何 ArkTS 参数：

```bash
PKG=KnowledgeBase/packages/oskm
python3 "$PKG/oskm.py" scan --workspace-root "$PWD" --product rk3568 \
  --db KnowledgeBase/artifacts/rk3568/knowledge.db
```

只扫 SDK（在 `packages/oskm` 下运行，数据库父目录需已存在）：

```bash
python3 -m oskm.cli scan \
  --workspace-root /path/to/code --product sdk-source \
  --only arkts --without repos \
  --db /existing/directory/sdk-knowledge.db
```

移除 `--without repos` 可同时采集仓元数据，从而获得源码 URL。
`ScanRequest.options['arkts']` 只允许调整 `startup_seconds` / `file_seconds`，
未知选项拒绝。无 `--only` 时框架扫描所有已注册领域（包含 arkts），因此需要 SDK 和锁定后端；
用 `--without arkts` 可排除它。**注册和数据库查询都不启动 Node。**

## 查询与导出

```python
from oskm.core.db import Database
from oskm.core.session import ScanSession
from oskm.collectors.arkts import ArktsQuery, export_document

with ScanSession.open(Database('/path/to/sdk-knowledge.db')) as session:
    query = ArktsQuery(session)
    page = query.kit_modules('@kit.AbilityKit', relation_type='entry_reference')
    unresolved = query.kit_modules('@kit.AbilityKit', view='unresolved')
    dual = query.list_modules(language_coverage='both')        # 动/静双声明的模块
    napi = query.list_modules(implementation_kind='napi')      # 由 NAPI 实现的模块
    impls = query.get_module('api/@ohos.multimedia.image')['implementations']
    files = query.get_module('api/@ohos.arkui.UIContext')['declarations']
    document = export_document(session)
```

`module_key` 是**去掉语言后缀**的 SDK 相对路径（`api/@ohos.arkui.UIContext`，不带 `.d.ts`）；
声明文件的 `source_path` 是 workspace 相对路径。

完整文档含 `snapshot`、`modules`、`kits`、`sources`、`module_impls`、`kit_relations`，
按业务键排序，外键输出为业务键，不输出代理 id。`session.records('arkts')` 是框架主表
兼容接口，**只返回模块清单**。查询不依赖源码存在。

列表 limit 为 1..200；游标与扫描、输入摘要和过滤条件绑定。默认关系查询只计 confirmed 证据，
`include_candidates=True` 可显示候选归属；dynamic/static 过滤不把未声明条件当成支持，
除非显式 `include_unspecified=True`。

**文件头原文不入库。** rk3568 上 1,329,021 字符的头部 100% 是 Apache 许可证样板，
去重后只有 1,241 种；承载归属的 `@kit` 标签已作为关系原文保留。
`arkts_sources.header_span` 保留字节跨度，需要原文时按 `sha256` 回源码切片。
`collector_runs.scope` 同理只存 `files_digest`，不重复 1,567 条逐文件摘要——
那三项已经是 `arkts_sources` 的列。

## 验证

```bash
python3 -m unittest discover -s oskm/tests -p 'test_*.py'
node --test oskm/collectors/arkts/node/tests/core.test.cjs
python3 -m unittest discover -s agentic/query/tests -p 'test_*.py'
python3 oskm/tests/verify_arkts.py --workspace-root /path/to/code
```

`verify_arkts.py` 是独立核验：从磁盘独立推导模块清单、直接调用锁定编译器的
`createSourceFile` 逐条比对引用位置、检查零 ambiguous 和外键一致性，
**不复用生产适配器或提取器**。

集成测试按工程目录布局构造夹具，调用真实 `oskm.py` 并清空 PATH 以验证路径自动推导。
Node 测试需要工程内 Node；缺依赖时 Python 真实后端测试标为 skipped，不算解析验收通过。
