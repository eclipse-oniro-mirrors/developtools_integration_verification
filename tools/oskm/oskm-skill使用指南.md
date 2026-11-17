# oskm skill 使用指南：

## Skill 开发背景：从“查架构”到“评估改动影响”

OpenHarmony 的产品架构事实并不集中在一份文档里，而是分散在构建清单、GN 配置、
安装规则、镜像内容、init/SA/HDI 配置、SDK 声明和代码仓映射等多个来源：

- `bundle.json`、子系统清单描述部件构成、声明依赖、SysCap 和 InnerAPI；
- GN 参数与 feature 决定产品如何裁剪、哪些能力会被编入；
- 安装模块和镜像路径描述构建产物最终落到哪里；
- init cfg、SA profile、HDI 配置描述运行态由哪些进程和服务承载；
- ELF 的 `DT_NEEDED` 记录二进制层面的真实依赖；
- ArkTS 声明、Native SDK 头文件和 `.so` 映射连接接口声明与实现；
- 代码仓、部件和安装模块之间的链路构成研发定位问题的技术“责任田”。

研发在评审需求、修改代码或定位现场问题时，往往需要同时跨过这些来源回答：
“这个模块属于谁”“它依赖谁、谁又依赖它”“改这里会影响哪些部件和接口”
“某个 `.so` 被替换后哪些二进制会受影响”。传统做法依赖全仓搜索、构建配置比对和
个人经验，存在耗时长、结论分散、反向依赖难查、不同产品结论不能复用等问题；
交给通用大模型时，又容易把“没采到”误说成“没有”，给出看似精确但不可追溯的答案。

`ohos-design-architecture-evidence-query` skill 面向的正是这一类研发期架构证据查询：
它负责运行时的下载安装、CLI 定位和使用指导；查询则基于采集侧为某个产品、某次
扫描生成的 `knowledge.db` 快照完成。

目标不是替代编译、运行时观测或人工评审，而是把分散事实组织成可追溯、可复核、
能明确表达证据边界的架构影响分析。

### oskm 的覆盖范围

oskm 以某个产品的一次扫描快照为边界，覆盖从**代码仓、构建配置、SDK 接口、安装模块**
到**镜像中的 ELF / `.so`、运行态服务**的架构证据链。核心对象和范围如下：

| 范围 | oskm 中的具体内容 | 可以回答的问题 |
|---|---|---|
| `interface/sdk-js`（SDK-JS） | `interface/sdk-js` 下的 ArkTS / Kit 声明文件、SDK 模块、Kit 归属、声明与实现关系 | 某个 SDK 模块由谁声明、属于哪个 Kit、由哪个部件或 `.so` 实现？ |
| `interface/sdk_c`（SDK-C） | `interface/sdk_c` 下的 Native SDK 头文件，以及头文件到 Native ELF 库的映射 | 某个 Native 库对外暴露哪些头文件？某个头文件对应哪个 `.so`？ |
| 子系统 | 产品中的子系统分类、子系统下部件分布及汇总关系 | 产品由哪些子系统构成？某个子系统包含哪些部件？ |
| 部件 | 部件名、所属子系统、`bundle.json`、归属 repo、SysCap、feature、InnerAPI 和依赖声明 | 这个部件是什么、属于谁、对外提供什么、声明依赖谁？ |
| 模块（三类） | SDK 模块、安装模块和 ELF 模块，分别对应接口组织、GN 安装目标和物理 `.so` | 某个 GN label 装到哪里？某个镜像文件来自哪个模块？某个 SDK 模块如何实现？ |
| 安装与镜像 | 安装模块、安装目标、镜像路径、分区、软链接关系和文件归属 | 某个文件是否被安装、落到哪个分区、属于哪个部件？ |
| 依赖 | 部件声明的正向/反向依赖、三方库、未解析依赖，以及 ELF 的 `DT_NEEDED` 直接边和查询期依赖闭包 | 谁依赖我、我依赖谁、是否存在未解析依赖、修改 `.so` 后影响范围多大？ |
| repo（代码仓） | manifest 中的代码仓名、工作区路径、remote URL、revision、groups、clone depth 和 HEAD | 某个部件或文件属于哪个代码仓？仓库地址和扫描版本是什么？ |
| 架构分类 | ELF 的 `api_type`（`public_api` / `inner_api` / `internal_api`）和多值 `category`（`napi`、`native`、`ani`、`sa`、`hdi`、`platform_sdk` 等），以及子系统/部件归属分类 | 某个 `.so` 属于哪类架构能力、是公开 SDK 还是内部实现？ |
| 运行态关联 | service、SA、HDI、init cfg / profile / HCB 与安装模块、部件、代码仓的关联 | 某个进程或服务承载哪些 SA / HDI，最终归属哪个部件？ |
| 产品与版本对比 | 同一产品或不同产品/快照间的部件、feature、服务、InnerAPI、GN 参数差异 | 两个版本之间架构发生了什么变化？ |

> oskm 的范围是**产品架构证据**，不是完整源码索引：不在范围内包括函数级调用图、
> 完整源码语义分析、实时设备运行状态、人员/团队联系人，以及未落盘构建产物的推断。
> 这些场景由 `oskm lsp` 和源码继续承接。

### 在整体知识体系中的定位

`oskm skill` 面向 Agent 提供 OpenHarmony 的**第一跳知识路由**，按研发问题分为两条主线：

- **应用开发 API**：从 SDK-JS / SDK-C 的模块、Kit、声明文件、Native 头文件、
  实现 `.so` 和部件归属出发，快速定位 API 所属模块 / Kit、声明、实现与依赖关系；
- **系统开发架构框架干线**：从子系统、部件、repo、安装模块、镜像落点、ELF 依赖、
  service / SA / HDI 等主干关系出发，快速定位模块归属和影响面。

`oskm skill` 只负责模块级及以上的快速知识路由，不试图替代代码级关系分析。Agent 通过
它触达具体模块后，再由 `oskm lsp` 和源码逐层下钻：

```text
应用开发 API 问题 ─┐
                   ├─> oskm skill：模块级知识路由
系统架构干线问题 ─┘          │
                            ├─> oskm lsp：语法 / 静态调用关系路由
                            │
                            └─> 源码：详细实现、签名、上下文与最终证据
```

| 知识层 | 主要职责 | 典型回答 |
|---|---|---|
| `oskm skill` | 应用 API 与系统架构干线路由；连接 SDK、部件、模块、repo、安装产物和运行态 | 这个 API 属于哪个模块 / Kit？这个部件 / `.so` 属于谁、依赖谁？改它可能影响哪些模块？ |
| `oskm lsp` | 代码语法、符号定义/引用和静态调用关系路由 | 这个符号在哪里定义、被谁引用、静态调用链是什么？ |
| 源码 | 提供模块内部的详细知识与最终事实支撑 | 具体实现是什么、调用条件是什么、边界和异常如何处理？ |
| Agent | 编排三层查询，按“架构定位 → 代码关系 → 源码核验”组织答案 | 从问题入口一路追到可复核的代码与架构证据 |

三层组合后，对外形成**架构知识路由 + 代码关系路由 + 源码详细知识**的完整知识体系。
`oskm skill` 的结构化结果同时用于：

- **真值表证据**：每条结论可关联到产品、`scan_id`、采集器状态、repo revision /
  HEAD、安装路径或源码位置，区分“已证实”“同一快照下不存在”和“当前证据不足”；
- **正向与反向反查**：支持模块 → 部件 → 子系统 → repo，以及 repo / 文件 / `.so` →
  模块 → 部件 → 运行态的反向追溯；
- **变化核对**：通过跨库或跨快照 `diff` 查看部件、feature、服务、InnerAPI、GN 参数
  等变化，避免把旧快照结论套到新构建上。

知识刷新遵循同一条证据链：

```text
代码 / OpenHarmony 构建产物
          │
          ├─> 扫描侧重建 knowledge.db
          │        │
          │        └─> oskm skill 安装 / 刷新 DB、SDK 与 CLI
          │
          └─> oskm lsp 刷新代码关系索引
                   │
                   └─> Agent 按需读取源码详细知识
```

因此，扫描侧随代码和产物构建重建架构快照，`oskm skill` 更新托管运行时，
`oskm lsp` 跟随源码刷新代码关系，Agent 再把两者与源码核验结果组合成最终回答。

查询和结论必须带上所依据的快照版本，不能把不同代码版本、产品构建或采集状态下的证据混用。

### 要解决的技术问题

| 技术问题 | 研发痛点 | skill / CLI 提供的能力 |
|---|---|---|
| 架构事实分散 | 需要在源码、构建系统、镜像和运行配置之间反复切换 | 以产品快照统一查询子系统、部件、代码仓、安装模块、服务和 SDK 模块 |
| 模块依赖查询 | 正向依赖容易看到，反向依赖和跨域依赖难以快速确认 | 查询部件正反向依赖；对 ELF 支持前向/反向依赖闭包，并返回距离、路径与截断状态 |
| 责任田定位 | 拿到一个文件、`.so`、进程、SA 或配置后，不知道对应哪个部件和仓 | 按镜像路径、服务名或 SA / HDI 标识反查安装模块、部件、子系统和代码仓，形成归属链 |
| 修改范围评估 | 改部件时依赖个人经验圈范围，容易漏掉上游部件和运行态承载者 | 以反向依赖为主，结合关联服务、SA、HDI、接口和编译开关收敛候选影响面 |
| 接口影响范围 | 接口声明、InnerAPI、SysCap、SDK 模块和实现 `.so` 的关系不直观 | 查询部件对外提供的能力、SDK 模块实现关系及 Native SDK 头文件映射 |
| ELF 文件修改影响 | 替换或修改 `.so` 后，直接/间接受影响模块难以人工穷举 | 从真实镜像路径查直接反向依赖，或按跳数查询反向依赖闭包 |
| 运行态责任链 | 现场只看到一个进程或服务，难以还原其构建与运行归属 | 查询 service → SA/HDI → 安装模块 → 部件 → 代码仓的关联证据 |
| 结论可信度与版本差异 | 不同产品、不同构建的答案可能不同，容易混用旧结论 | 先检查扫描状态与采集完整度，显式报告 `degraded`、计数为 0、`truncated` 等边界；支持跨库/跨快照对比 |

> “责任田”在这里指子系统、部件、代码仓和安装模块构成的技术归属关系，不包含
> 人员、团队或组织联系人信息。

### 面向研发的使用场景

| 使用场景 | 典型问题 | 常用查询入口与产出 |
|---|---|---|
| 新接手产品 / 模块 | 产品由哪些子系统构成？这个部件在哪个仓？这个文件属于谁？ | `arch overview`、`arch trace <镜像路径>`、`ask owner_of`、`ask get_component`、`ask git_url` |
| 模块与依赖治理 | 这个部件依赖谁？谁依赖这个部件？是否存在三方库或未解析依赖？ | `ask component_dependencies`、`ask component_dependents`、`arch impact` |
| 部件修改范围评估 | 修改 `ace_engine` 会影响哪些部件？哪些运行单元和接口可能被波及？ | `arch impact <部件>`，再结合 `component_attached`、`arch provides`、`arch runtime` |
| 接口 / SDK 影响分析 | 这个部件对外提供哪些 SysCap、InnerAPI 和 SDK 模块？接口由哪个 `.so` 实现？ | `arch provides`、`ask component_innerapis`、`ask component_syscaps`、ArkTS 模块查询、`ask get_native_headers` |
| ELF / `.so` 修改评估 | `libimage.z.so` 被谁直接依赖？反向依赖闭包有多大？是否发生结果截断？ | `arch trace` 定位归属；`arch impact <dest>` 查直接反向依赖；`ask elf_dependencies --direction reverse` 查多跳闭包 |
| 系统服务问题定位 | 某个进程托管哪些 SA / HDI？它们最终归属哪个部件和代码仓？ | `arch runtime <service>`、`ask get_service`、`ask service_hosted`、`ask get_sa`、`ask search_hdis` |
| 产品裁剪与编译开关分析 | 某个 GN 参数控制哪些 feature？当前产品取值是什么？ | `arch switch <gn_arg>`、`ask get_gn_arg`、`ask component_features` |
| 版本 / 产品差异分析 | 两个产品或两个快照之间，部件、feature、服务或 InnerAPI 有何变化？ | `oskm-cli diff --entity <实体名>`（components、features、services、innerapis、gn_args） |
| 测试与集成范围收敛 | 本次改动涉及哪些部件、运行单元、SDK 模块和二进制依赖，应重点验证什么？ | 组合上述影响查询，以反向依赖、关联运行单元和接口证据生成候选验证范围 |

这些查询既可以由研发直接用 CLI 执行，也可以由 Codex / OpenCode 根据自然语言问题
自动选择 `arch`、`ask` 或 `diff`。影响分析给出的是**架构级候选范围**，不是编译器级
调用图、运行态流量或完整代码变更清单；最终修改范围仍需结合源码评审、构建和测试确认。

> 本文只介绍两种 Agent 的安装和使用方式：
>
> 1. Codex
> 2. OpenCode
>
> 本文范围：在 OpenHarmony 源码树目录下使用 `ohos-design-architecture-evidence-query` skill，下载 / 安装运行时，并用 CLI 查询架构信息。
>
> 备注：oskm skill 在 OpenHarmony skills 命名规则下叫：`ohos-design-architecture-evidence-query`。

## 0. 核心边界

1. **skill 与 CLI 是两个产物**
   - skill：`ohos-design-architecture-evidence-query`
   - CLI：`oskm-cli.pyz`
   - skill 负责下载、安装、指导使用；CLI 负责只读查询。
2. **bootstrap 只负责安装，不负责查询**
   - 安装 / 下载 / 刷新 / 校验：`bootstrap.py`
   - 查询：直接调用 `~/.oskm/oskm-cli.pyz`
3. **DB、CLI、两套 SDK 来自同一个 `knowledge.tar.gz`**
   - 归档内容：
     ```text
     knowledge.tar.gz
     ├── knowledge.db
     ├── oskm-cli.pyz
     └── interface/
         ├── sdk-js/
         └── sdk_c/
     ```
   - 没有单独的 DB / CLI / SDK 下载端点。
   - `install` 一次下载并安装全部四项。

---

# 1. 在 OpenHarmony 源码树中使用

## 1.1 前提

“源码目录”指 **OpenHarmony 源码树根目录**，或其任意子目录。

OpenHarmony 源码树根目录必须同时存在：

```text
<OH_ROOT>/
├── .gn
├── interface/
│   ├── sdk-js/
│   └── sdk_c/
└── out/
```

这四个条件用于识别可复用的 OpenHarmony 源码根。`artifacts/` 和 `cli/dist/` **不是源码根识别条件**。

本地 DB 会被自动探测的位置是：

```text
<OH_ROOT>/out/<product>/oskm/knowledge.db
<OH_ROOT>/out/<abi>/<device>/oskm/knowledge.db
```

其中最常见的是：

```text
<OH_ROOT>/out/<product>/oskm/knowledge.db
```

例如：

```text
<OH_ROOT>/out/wukong100/oskm/knowledge.db
```

本地 CLI 会被探测的位置包括：

```text
<OH_ROOT>/oskm-cli.pyz
<OH_ROOT>/cli/dist/oskm-cli.pyz
<OH_ROOT>/packages/oskm/cli/dist/oskm-cli.pyz
<DB 所在目录>/oskm-cli.pyz
```

注意：

- `.gn`、`interface/sdk-js/`、`interface/sdk_c/`、`out/` 是识别源码根的必要条件。
- DB 不是源码根识别条件，而是安装时从 `out/`中探测。
- CLI 可放在 DB 同目录，也可放在源码根的几个固定候选位置。
- 如果没有本地 DB，需要先执行扫描生成 DB。
- 如果没有本地 CLI，需要先构建 CLI 并放到上述候选位置。
- 本地 DB、CLI、两套 SDK 都可用时，才会优先安装本地运行时；否则回退下载。

skill 的 `bootstrap.py install` 在 OpenHarmony 源码树内执行时，会优先复用本地 DB、SDK 和 CLI。

## 1.2 进入源码树

```bash
OH_ROOT=/path/to/OpenHarmony
cd "$OH_ROOT"
codex --yolo | opencode --auto
```

也可以在任意子目录执行：

```bash
cd "$OH_ROOT/build"
codex --yolo | opencode --auto
```

`bootstrap.py` 会从当前目录向上查找最近的 OpenHarmony 源码根。

---

# 2. Codex 安装和使用

## 2.1 推荐安装位置

Codex 支持多个 skill 位置。这里推荐两种：

### 用户级

```bash
~/.codex/skills/ohos-design-architecture-evidence-query
```

适合本机所有项目都使用。

### 仓库级

```bash
$REPO_ROOT/.codex/skills/ohos-design-architecture-evidence-query
```

适合随仓库共享。

也可以继续兼容使用：

```bash
${CODEX_HOME:-$HOME/.codex}/skills/ohos-design-architecture-evidence-query
```

Codex 支持符号链接，会跟随链接读取目标目录。

---

## 2.2 安装 skill

### 方式 A：使用发布包

```bash
ARCHIVE=/path/to/ohos-design-architecture-evidence-query-3.0.2.tar.gz
SKILL_PARENT="$HOME/.agents/skills"

mkdir -p "$SKILL_PARENT"

rm -rf "$SKILL_PARENT/ohos-design-architecture-evidence-query"

tar -xzf "$ARCHIVE" -C "$SKILL_PARENT"

SKILL_DIR="$SKILL_PARENT/ohos-design-architecture-evidence-query"
```

仓库级安装：

```bash
cd /path/to/your-repo

SKILL_PARENT="$PWD/.agents/skills"
ARCHIVE=/path/to/ohos-design-architecture-evidence-query-3.0.2.tar.gz

mkdir -p "$SKILL_PARENT"

rm -rf "$SKILL_PARENT/ohos-design-architecture-evidence-query"

tar -xzf "$ARCHIVE" -C "$SKILL_PARENT"
```

### 方式 B：从 KnowledgeBase 源码仓软链

```bash
KB=/Users/song/Workspace/KnowledgeBase
SKILL_PARENT="$HOME/.agents/skills"

mkdir -p "$SKILL_PARENT"

ln -sfn "$KB/packages/oskm/skills/ohos-design-architecture-evidence-query" \
  "$SKILL_PARENT/ohos-design-architecture-evidence-query"
```

软链优点：

- 只保留一份 `SKILL.md`
- 源码更新后无需复制
- Codex 支持跟随符号链接

### 重启 Codex

安装或修改 skill 后，Codex 通常会自动发现。如果没出现，重启 Codex。

---

## 2.3 在 Codex 中触发 skill

Codex 支持：

1. **隐式触发**
   - 直接提出架构问题，例如：
     ```text
     查一下 wukong100 的产品架构。
     ```
   - Codex 会根据 skill 的 `description` 自动选择。

2. **显式触发**
   - 使用 `$` 提到 skill：
     ```text
     $ohos-design-architecture-evidence-query 查询这个产品的架构信息
     ```
   - 或运行：
     ```text
     /skills
     ```
     在 skill 选择器中手动选择。

---

## 2.4 下载 / 安装运行时

在 OpenHarmony 源码树内执行：

```bash
cd "$OH_ROOT"

PY=python3.12
RUNTIME_ROOT="$HOME/.oskm"
SKILL_DIR="$HOME/.agents/skills/ohos-design-architecture-evidence-query"

python3.12 "$SKILL_DIR/bootstrap.py" install \
  --runtime-root "$RUNTIME_ROOT"
```

也可以在子目录执行：

```bash
cd "$OH_ROOT/build"

python3.12 "$SKILL_DIR/bootstrap.py" install \
  --runtime-root "$RUNTIME_ROOT"
```

由于当前目录已经在 OpenHarmony 源码树内，不需要 `--source-root`。

`install` 会：

1. 从当前目录向上查找 OpenHarmony 源码根
2. 检查本地 DB、CLI、SDK 是否完整
3. 如果完整，复制到 `$RUNTIME_ROOT`
4. 如果不完整，回退下载 `knowledge.tar.gz`
5. 校验 DB 和 CLI
6. 原子安装到 `$RUNTIME_ROOT`

---

## 2.5 安装后验证

```bash
python3.12 "$SKILL_DIR/bootstrap.py" doctor
python3.12 "$SKILL_DIR/bootstrap.py" cli-path
python3.12 "$SKILL_DIR/bootstrap.py" validate-db "$RUNTIME_ROOT/knowledge.db"
```

安装后的目录：

```text
~/.oskm/
├── knowledge.db
├── oskm-cli.pyz
├── .oskm-runtime.json
└── interface/
    ├── sdk-js/
    └── sdk_c/
```

---

## 2.6 查询架构信息

查询直接调用 CLI，不走 `bootstrap.py`。

```bash
CLI="$RUNTIME_ROOT/oskm-cli.pyz"
DB="$RUNTIME_ROOT/knowledge.db"

python3.12 "$CLI" --db "$DB" ask get_scan_info
python3.12 "$CLI" --db "$DB" --format table arch overview
```

常用查询：

```bash
# 产品总体构成
python3.12 "$CLI" --db "$DB" --format table arch overview

# 镜像文件归属
python3.12 "$CLI" --db "$DB" arch trace \
  system/lib64/module/multimedia/libimage.z.so

# 修改某个部件影响谁
python3.12 "$CLI" --db "$DB" arch impact init

# 某个部件对外提供什么
python3.12 "$CLI" --db "$DB" arch provides image_framework

# 某个 GN 编译开关控制什么
python3.12 "$CLI" --db "$DB" arch switch ace_engine_feature_asbng_path

# 某个服务托管哪些 SA / HDI
python3.12 "$CLI" --db "$DB" arch runtime <service>

# 52 个查询工具
python3.12 "$CLI" --db "$DB" ask --list
```

---

# 3. OpenCode 安装和使用

## 3.1 推荐安装位置

OpenCode 自动搜索以下位置：

1. `.opencode/skills`
2. `.agents/skills`
3. `~/.config/opencode/skills`

其中：

- 项目级推荐：
  ```bash
  .opencode/skills/ohos-design-architecture-evidence-query
  ```
- 用户级推荐：
  ```bash
  ~/.config/opencode/skills/ohos-design-architecture-evidence-query
  ```

OpenCode 会按优先级加载同名 skill，项目级优先于用户级。

---

## 3.2 安装 skill

### 方式 A：使用发布包

项目级安装：

```bash
cd /path/to/your-project

ARCHIVE=/path/to/ohos-design-architecture-evidence-query-3.0.2.tar.gz
SKILL_PARENT="$PWD/.opencode/skills"

mkdir -p "$SKILL_PARENT"

rm -rf "$SKILL_PARENT/ohos-design-architecture-evidence-query"

tar -xzf "$ARCHIVE" -C "$SKILL_PARENT"
```

用户级安装：

```bash
ARCHIVE=/path/to/ohos-design-architecture-evidence-query-3.0.2.tar.gz
SKILL_PARENT="$HOME/.config/opencode/skills"

mkdir -p "$SKILL_PARENT"

rm -rf "$SKILL_PARENT/ohos-design-architecture-evidence-query"

tar -xzf "$ARCHIVE" -C "$SKILL_PARENT"
```

### 方式 B：从 KnowledgeBase 源码仓软链

```bash
KB=/Users/song/Workspace/KnowledgeBase
SKILL_PARENT="$HOME/.config/opencode/skills"

mkdir -p "$SKILL_PARENT"

ln -sfn "$KB/packages/oskm/skills/ohos-design-architecture-evidence-query" \
  "$SKILL_PARENT/ohos-design-architecture-evidence-query"
```

---

## 3.3 在 OpenCode 中触发 skill

OpenCode 支持：

1. **隐式触发**
   - 直接提出架构问题，例如：
     ```text
     查一下 wukong100 的产品架构。
     ```
   - OpenCode 会根据 skill 的 `description` 自动选择。

2. **显式触发**
   - 在 prompt 中使用：
     ```text
     @ohos-design-architecture-evidence-query 查询这个产品的架构信息
     ```
   - OpenCode 会通过 `skill` tool 按这个 ID 加载 skill。

如果 skill 没有被自动发现，确认：

```bash
SKILL_MD="$SKILL_PARENT/ohos-design-architecture-evidence-query/SKILL.md"
test -f "$SKILL_MD" && echo "OK"
```

---

## 3.4 下载 / 安装运行时

在 OpenHarmony 源码树内执行：

```bash
cd "$OH_ROOT"

PY=python3.12
RUNTIME_ROOT="$HOME/.oskm"
SKILL_DIR="$HOME/.config/opencode/skills/ohos-design-architecture-evidence-query"

python3.12 "$SKILL_DIR/bootstrap.py" install \
  --runtime-root "$RUNTIME_ROOT"
```

也可以在子目录执行：

```bash
cd "$OH_ROOT/build"

python3.12 "$SKILL_DIR/bootstrap.py" install \
  --runtime-root "$RUNTIME_ROOT"
```

不需要 `--source-root`。

---

## 3.5 安装后验证

```bash
python3.12 "$SKILL_DIR/bootstrap.py" doctor
python3.12 "$SKILL_DIR/bootstrap.py" cli-path
python3.12 "$SKILL_DIR/bootstrap.py" validate-db "$RUNTIME_ROOT/knowledge.db"
```

---

## 3.6 查询架构信息

查询直接调用 CLI，不走 `bootstrap.py`。

```bash
CLI="$RUNTIME_ROOT/oskm-cli.pyz"
DB="$RUNTIME_ROOT/knowledge.db"

python3.12 "$CLI" --db "$DB" ask get_scan_info
python3.12 "$CLI" --db "$DB" --format table arch overview
```

常用查询：

```bash
# 产品总体构成
python3.12 "$CLI" --db "$DB" --format table arch overview

# 镜像文件归属
python3.12 "$CLI" --db "$DB" arch trace \
  system/lib64/module/multimedia/libimage.z.so

# 修改某个部件影响谁
python3.12 "$CLI" --db "$DB" arch impact init

# 某个部件对外提供什么
python3.12 "$CLI" --db "$DB" arch provides image_framework

# 某个 GN 编译开关控制什么
python3.12 "$CLI" --db "$DB" arch switch ace_engine_feature_asbng_path

# 某个服务托管哪些 SA / HDI
python3.12 "$CLI" --db "$DB" arch runtime <service>

# 52 个查询工具
python3.12 "$CLI" --db "$DB" ask --list
```


---

# 4. viewer 查看 DB 内容

viewer 位于：

```text
/Users/song/Workspace/KnowledgeBase/packages/oskm/viewer
```

它是纯静态站点，使用 `sql.js` 在浏览器里打开 SQLite，没有服务端，也不会修改 DB。

## 4.1 启动 viewer

```bash
cd /Users/song/Workspace/KnowledgeBase

KB="$PWD"
VIEWER="$KB/packages/oskm/viewer"
RUNTIME_ROOT="$HOME/.oskm"

npm --prefix "$VIEWER" install

# viewer 默认从站点根目录找 knowledge.db
ln -s "$RUNTIME_ROOT/knowledge.db" "$VIEWER/knowledge.db"

npm --prefix "$VIEWER" run dev
```

浏览器打开：

```text
http://localhost:5173/?db=knowledge.db#/runtime
```

也可以打开首页后，点右上角 **选择 .db**，手动选择本地 `knowledge.db` 文件。

## 4.2 主要视图

| 路由 | 内容 |
|---|---|
| `#/` | 首页：概念模型与总体能力 |
| `#/runtime` | 运行视图：进程、服务、SA、HDI 等运行单元 |
| `#/build` | 构建视图：部件、依赖、入度排序 |
| `#/image` | 镜像视图：镜像文件路径树与归属 |
| `#/sdk/native-headers` | Native SDK 头文件映射 |
| `#/lookup?q=...` | 反查：路径 / so 名 / 进程名 / label |
| `#/findings` | 扫描质量问题 |
| `#/e/<table>/<id>` | 实体档案页 |
| `#/data/<table>` | 调测用原始表视图 |

---

# 5. 黄区 / 内网环境注意事项

## 5.1 修改环境变量

推荐写入：

```bash
~/.oskm/.env
```

示例：

```dotenv
OSKM_DOWNLOAD_SOURCE=INTERNAL_CI
OSKM_DOWNLOAD_ENDPOINT=https://<黄区内部CI归档前缀>
```

也可以临时导出：

```bash
export OSKM_DOWNLOAD_SOURCE='INTERNAL_CI'
export OSKM_DOWNLOAD_ENDPOINT='https://<黄区内部CI归档前缀>'
```

然后执行：

```bash
python3.12 "$SKILL_DIR/bootstrap.py" doctor
python3.12 "$SKILL_DIR/bootstrap.py" install \
  --source INTERNAL_CI \
  --runtime-root "$HOME/.oskm" \
  --date 20261116
```

---

## 5.2 两种下载方式

### OPENHARMONY_CI

```dotenv
OSKM_DOWNLOAD_SOURCE=OPENHARMONY_CI
OSKM_DOWNLOAD_ENDPOINT=https://<CI API 地址>
```

行为：

- 向 `$OSKM_DOWNLOAD_ENDPOINT` POST
- component 固定为 `dayu600_7885_ai`
- 成功后从响应里的 OBS 地址下载归档

### INTERNAL_CI

```dotenv
OSKM_DOWNLOAD_SOURCE=INTERNAL_CI
OSKM_DOWNLOAD_ENDPOINT=https://<归档前缀>
```

行为：

- 请求：
  ```text
  $OSKM_DOWNLOAD_ENDPOINT/<YYYYMMDD>
  ```
- 响应应为 `knowledge.tar.gz`

---

## 5.3 `.env` 查找顺序

```text
真实环境变量
> <runtime-root>/.env
> skill 目录 oskm_runtime/.env
```

推荐：

```text
~/.oskm/.env
```

只允许这些配置项：

```text
OSKM_DOWNLOAD_SOURCE
OSKM_DOWNLOAD_ENDPOINT
OSKM_CLI
OSKM_RUNTIME_ROOT
```

特别注意：

```text
OSKM_CLI_ENDPOINT 不存在
```

CLI 随 `knowledge.tar.gz` 一起发布，没有独立下载端点。

---

## 5.4 代理

嫁入配置了黄区代理：

```bash
export HTTP_PROXY='http://<proxy-host>:<proxy-port>'
export HTTPS_PROXY='http://<proxy-host>:<proxy-port>'
```

内部 CI 不应该走代理，需要把内部地址加到NO_PROXY：

```bash
export NO_PROXY='<internal-ci-host>'
```

排查：

```bash
env | grep -E '^(OSKM_|HTTP_PROXY|HTTPS_PROXY|NO_PROXY)='
```

---

## 5.5 离线查询

一旦 `~/.oskm/knowledge.db` 已经安装好，查询不需要网络：

```bash
CLI="$HOME/.oskm/oskm-cli.pyz"
DB="$HOME/.oskm/knowledge.db"

python3.12 "$CLI" --db "$DB" arch overview
python3.12 "$CLI" --db "$DB" ask get_scan_info
```

查询 CLI：

- 不读 `OSKM_DOWNLOAD_SOURCE`
- 不读 `OSKM_DOWNLOAD_ENDPOINT`
- 不读 `.env`
- 不自动刷新
- 不自动下载

---

## 附：常用排错口径

| 现象 | 处理 |
|---|---|
| `database not found` / 退出码 3 | 先执行 `bootstrap.py install`，不要随便换别的库 |
| `doctor` 提示 endpoint 未配置 | 只影响下载 / 刷新，不影响已有 DB 查询 |
| `status=degraded` | 不等于失败，继续看对应采集器 `record_count` |
| 某采集器 `record_count=0` | 该领域证据不可用，不能给依赖数量等结论 |
| `truncated=true` | 提高查询 limit，或按 `total` 汇报 |
| 下载失败但已有运行时 | 原运行时会保留，可继续离线查询 |
| 源码根本地候选不完整 | `install` 会回退下载；补齐 DB、CLI、SDK 后重新 install |
| OpenCode 没发现 skill | 检查 `.opencode/skills/<skill-id>/SKILL.md` 或 `~/.config/opencode/skills/<skill-id>/SKILL.md` |
| Codex 没发现 skill | 检查 `.agents/skills/<skill-id>/SKILL.md` 或 `~/.agents/skills/<skill-id>/SKILL.md`，必要时重启 |

---

## 主要参考

- `packages/oskm/README.md`
- `packages/oskm/skills/ohos-design-architecture-evidence-query/SKILL.md`
- `packages/oskm/skills/ohos-design-architecture-evidence-query/README.md`
- `packages/oskm/skills/ohos-design-architecture-evidence-query/references/usage.md`
- `packages/oskm/viewer/README.md`
- OpenCode Skills 文档：https://opencode.ai/docs/skills
- OpenAI Codex Skills 文档：https://learn.chatgpt.com/docs/build-skills
