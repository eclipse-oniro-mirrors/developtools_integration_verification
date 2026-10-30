# oskm — OpenHarmony System Knowledge Scanner

oskm 对一个**已构建的产品**做静态扫描，把散落在构建产物、镜像清单、init 配置、SA profile、HDF 配置里的事实，归并成一个 SQLite 知识库。只陈述事实，不做推断——每条记录都保留来源文件里的原始声明。

## 构建系统集成

oskm 作为后编译分析工具集成在 OpenHarmony 构建系统中，通过 `enable_oskm_collect` 构建选项触发：

```bash
./build.sh --product-name rk3568 --ccache --jobs 16 --build-target make_all --gn-args enable_oskm_collect=true
```

构建完成后输出：

```
out/rk3568/oskm/knowledge.db          # 知识库（SQLite）
out/rk3568/lsp-portable/             # LSP 可迁移索引、规范化 CDB 和 manifest
```

### 工作原理

1. GN 声明 `enable_oskm_collect`（`build/ohos_var.gni`，默认 `false`）
2. hb 构建驱动在 `postTargetCompilation` 阶段调用 resolver
3. resolver 调用 `oskm_collect(out_path, target_cpu, workspace_root, product)`
4. oskm 扫描源码树，采集 9 个维度的数据写入 SQLite
5. 扫描完成后，自动构建 clangd .idx 索引（失败不阻塞流水线）

### 调用链路

```
./build.sh --gn-args enable_oskm_collect=true
  → hb resolver: resolve_enable_oskm_collect()
    → oskm_collect(out_path, target_cpu, workspace_root, product)
      → oskm scan --workspace-root <root> --product <product> --db out/<product>/oskm/knowledge.db
      → lsp/build_index.py（非阻塞，构建 clangd 索引）
```

## 手动运行

```bash
# 扫描
python3 oskm.py scan --workspace-root /path/to/openharmony --product rk3568 --db out/oskm/knowledge.db

# 查看已有扫描
python3 oskm.py scans --db out/oskm/knowledge.db

# 列出已注册采集器
python3 oskm.py list --db out/oskm/knowledge.db
```

## 采集器

9 个采集器按拓扑序执行，依赖通过数据库传递：

| 顺序 | 采集器 | 数据来源 | 产出表 |
|------|--------|----------|--------|
| 1 | repos | repo manifest + git | repos |
| 2 | components | components.json + bundle.json | components, innerapis, features, syscaps |
| 3 | args | gn args --list --json | gn_args |
| 4 | install_modules | system_module_info.json | install_modules, install_targets, install_module_tags |
| 5 | elf_modules | install_targets 中的 ELF 文件 | elf_modules, elf_module_dependencies |
| 6 | services | init .cfg | services |
| 7 | hdi | HDF 配置 (.hcb/.hcs) | hdis |
| 8 | sas | SA profile (.json) | sas |
| 9 | component_links | (跨表关联) | features.gn_arg_id, innerapis.install_module_id |

## 依赖

- Python 3.10+
- 仅标准库（无第三方依赖）
- 预构建的 `gn` 工具（args 采集器使用，路径在 `prebuilts/build-tools/` 下自动发现）

## LSP 代码索引（clangd .idx）

`oskm/lsp/` 提供一套基于 clangd 的代码索引工具链：流水线编译后自动生成
`.idx` 索引，开发/Agent 侧通过 MCP 消费，获得精确的调用链、引用、定义跳转
等语义查询能力。

### 索引生成在哪里

- **默认位置**：`out/<product>/lsp-portable/.cache/clangd/index/`。
  `--index-mode native` 使用原位置 `out/<product>/.cache/clangd/index/`，仅供当前源码路径使用。
- **触发**：`--enable-oskm-collect` 编译选项 → `postTargetCompilation` 阶段 →
  `oskm_collect.py` → `lsp/build_index.py`
- **手动执行**：

```bash
python3 developtools/integration_verification/tools/oskm/lsp/build_index.py \
    -i out/rk3568
# 常用选项
#   --instances 4          并行 clangd 实例数（默认按 CPU 自动）
#   --jobs-per-instance 32 每实例线程数（默认自动）
#   --timeout-hours 6      超时中止，进度保留、下次增量续建
#   --dry-run              只打印计划不执行
#   --index-mode portable  默认：生成可迁移索引（需要 bwrap）
#   --index-mode native    原生路径索引
```

### 生成流程（build_index.py 自动完成）

1. **定位 clangd**：环境变量 `LSP_CLANGD_BIN` > `lsp/clangd/bin/clangd`（捆绑位）
   > `PATH` > OHOS prebuilts 自带（clangd 15，降级：无 outgoingCalls）
2. **校验/生成** `compile_commands.json`：优先使用构建自带的；缺失时自动通过
   `ninja -t compdb`（cxx/cc/asm 规则，约半分钟，~99% 源文件覆盖）生成
3. **musl nullptr_t 补丁**（`apply_musl_fix.py`）：仅 native 模式临时应用。
   portable 模式使用下一步的 include 顺序修复，避免临时 shim 恢复后改变头文件摘要
4. **确保源码根 `.clangd`**：注入 libcxx-ohos include 路径（缺失时自动生成），
   并按 sysroot 重排 include 顺序（libcxx 置前、musl 目录显式排后、移除抢位的
   `--sysroot`），根治 musl stddef.h 劫持 libc++ 头链的 nullptr_t 级联错误；
   配置层修复对交互会话同样生效，不依赖索引构建期打的 musl shim
5. **CDB 切分 + 并行构建**：按源文件 crc32 切成 N 份，N 个 clangd 实例
   通过符号链接写同一索引目录（temp+rename 原子写，产物等价）
6. **断点续建**：已有 shard 按文件摘要校验跳过，增量构建只处理变更文件

### 依赖

| 依赖 | 说明 |
|---|---|
| clangd >= 20 | **已捆绑**（`lsp/clangd/bin/clangd`，21.1.7，~110MB，含内置头文件）；outgoingCalls 需要 20+。检测顺序：`LSP_CLANGD_BIN` > 捆绑 > PATH > OHOS prebuilts（15，降级） |
| Node.js >= 18 | 仅 MCP 消费侧需要 |
| compile_commands.json | OHOS 构建自动生成于 out 目录 |
| Linux + bubblewrap (`bwrap`) | portable 模式构建和消费都需要；需允许创建用户/挂载命名空间 |

### 流水线分发与多套代码

portable 模式在每个 clangd 的私有挂载命名空间内，把当前源码根映射为
`/tmp/ohos-clangd-workspace`，并生成固定路径的规范化 CDB。消费时通过 clangd
路径映射把跳转结果还原为本机路径，不改写下载的 CDB，不创建机器全局软链接。
多套代码即使同时运行，也分别映射到各自的源码和缓存，不会互相覆盖。

分发时保留 `out/<product>/lsp-portable/` 整个目录，包括隐藏的 `.cache/`，
同时提供匹配的源码、SDK、生成头文件和源码根 `.clangd`，保持树内相对目录结构。
源码树之外的编译依赖仍需在本机可用。生成的 `lsp/lsp-mcp.json` 和源码根
`.lsp-mcp.json` 软链也应一并分发；其中启动参数使用相对路径，从本机源码根启动 MCP。
原有索引需要重新生成一次 portable 基线，不能仅改 CDB 前缀实现旧分片迁移。

`portable-index.json` 记录格式、虚拟根、产品目录、clangd 完整版本、CDB 校验和、
构建状态和可选的 `LSP_SNAPSHOT_ID`。消费前校验这些信息及分片存在性；校验失败
明确报错，不静默回退为本地全量构建。相同快照可复制到多套工作区，各自独立增量更新；
不同源码版本或产品分别生成对应产物，避免多个工作区共写一个缓存目录。

回归验证（从 integration_verification 仓库根执行）：

```bash
LSP_TEST_CLANGD="$PWD/tools/oskm/lsp/clangd/bin/clangd" \
  python3 tools/oskm/lsp/test_portable_index.py -v
```

覆盖真实构建入口和 MCP 自动预热、响应文件/生成头文件、双目录同时加载、
跨文件定义跳转、迁移后分片内容和修改时间不变，以及本地源码变更后的独立增量更新。
构建进度默认每 60 秒输出，可通过 `LSP_INDEX_INTERVAL` 调整。

### MCP 配置（消费侧）

MCP 服务本体在 `lsp/mcp/dist/index.js`（已含生产依赖，无需 npm install）。

1. **配置文件零手工**：索引构建完成时，`build_index.py` 按本次构建的真实参数
   （产品 out 目录、实际使用的捆绑 clangd）生成 `lsp/lsp-mcp.json`，并在
   **源码树根目录创建软链** `.lsp-mcp.json` 指向它——开发侧无需任何配置。
   （`lsp/.lsp-mcp.json.template` 仅供未执行过构建时手工参考）
2. 在 opencode 的 `~/.config/opencode/opencode.json` 注册 MCP（一次性）：

```json
{
  "mcp": {
    "lsp": {
      "type": "local",
      "command": ["node", "<源码树绝对路径>/developtools/integration_verification/tools/oskm/lsp/mcp/dist/index.js"],
      "timeout": 30000,
      "enabled": true
    }
  }
}
```

3. **必须从源码树根目录启动 opencode**（`.lsp-mcp.json` 相对路径按启动目录解析）

### 提供的功能（29 个 lsp_* 工具）

| 能力 | 工具 |
|---|---|
| **双向调用链** | `lsp_call_hierarchy`（谁调用它 incoming / 它调用谁 outgoing）|
| 定义跳转 | `lsp_goto_definition` / `lsp_goto_type_definition` |
| 引用查找 | `lsp_find_references`（编译器级精确，全库）|
| 符号搜索 | `lsp_workspace_symbols` / `lsp_find_symbol` |
| 类型信息 | `lsp_hover` / `lsp_type_hierarchy`（继承树）|
| 文件结构 | `lsp_document_symbols` / `lsp_file_imports` / `lsp_related_files` |
| 诊断 | `lsp_diagnostics` / `lsp_workspace_diagnostics` |

注：函数指针/注册表调用（如 ANI 方法）无静态调用边，属静态分析边界。

### Agent 使用

- **opencode**：配置完成后直接用自然语言指派，例如
  "用 lsp_call_hierarchy 查 <文件> 第 50 行第 37 列的函数调用了哪些函数"
  （行/列 **1 基**；位置偏差 ±2 行内自动纠正）
- **冷启动**：clangd 首次拉起后约 2.5 分钟完成全量索引内存装载
  （`warmup` 配置项已在 MCP 启动时自动触发，无需等待手动操作）；
  `idleTimeout` 默认 8 小时保活
- **详细工具指南**：见 `lsp/mcp/SKILL.md`

## 目录结构

```
oskm/
├── oskm_collect.py          ← 构建系统入口（由 hb resolver 调用）
├── oskm.py                  ← CLI 入口
├── oskm/                    ← Python 包
│   ├── cli.py               ← CLI 子命令
│   ├── core/                ← 框架（framework, db, schema, runner, ...）
│   ├── collectors/          ← 9 个采集器
│   │   ├── repos/
│   │   ├── components/
│   │   ├── args/
│   │   ├── install_modules/
│   │   ├── elf_modules/
│   │   ├── services/
│   │   ├── hdi/
│   │   ├── system_abilities/
│   │   └── component_links/
│   └── tests/               ← 单元测试
├── lsp/                     ← LSP 代码索引工具链
│   ├── build_index.py       ← 索引构建编排器
│   ├── clangd_tools.py      ← headless clangd 驱动
│   ├── apply_musl_fix.py    ← musl nullptr_t 补丁
│   ├── .lsp-mcp.json.template
│   ├── clangd/              ← 捆绑 clangd 21.1.7（bin + 内置头）
│   └── mcp/                 ← lsp-mcp-server（dist + 生产依赖）
├── README.md
└── AGENTS.md
```

## 运行测试

```bash
cd developtools/integration_verification/tools/oskm
python3 -m unittest discover -s oskm/tests -p "test_*.py"
```
