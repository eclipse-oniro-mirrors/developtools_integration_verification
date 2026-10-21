# oskm 收集工具

oskm 收集工具用于在编译结束后（postTargetCompilation 阶段）从编译产物中收集 oskm 信息。

## 使用方式

该工具通过编译选项 `--enable-oskm-collect` 使能，在 `./build.sh` 编译流程的
postTargetCompilation 阶段（`deps_guard` 之后）被调用，无需单独运行。

```bash
./build.sh --product-name rk3568 --ccache --build-target make_all --enable-oskm-collect
```

## 扩展

在 `oskm_collect.py` 的 `oskm_collect(out_path, target_cpu, args=None)` 函数中
实现实际的收集逻辑。当前已实现 LSP 代码索引生成（见下）。

## LSP 代码索引（clangd .idx）

`oskm/lsp/` 提供一套基于 clangd 的代码索引工具链：流水线编译后自动生成
`.idx` 索引，开发/Agent 侧通过 MCP 消费，获得精确的调用链、引用、定义跳转
等语义查询能力。

### 索引生成在哪里

- **位置**：`out/<product>/.cache/clangd/index/`（约 17 万个 `.idx` shard，~2GB）
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
```

### 生成流程（build_index.py 自动完成）

1. **定位 clangd**：环境变量 `LSP_CLANGD_BIN` > `lsp/clangd/bin/clangd`（捆绑位）
   > `PATH` > OHOS prebuilts 自带（clangd 15，降级：无 outgoingCalls）
2. **校验/生成** `compile_commands.json`：优先使用构建自带的；缺失时自动通过
   `ninja -t compdb`（cxx/cc/asm 规则，约半分钟，~99% 源文件覆盖）生成
3. **musl nullptr_t 补丁**（`apply_musl_fix.py`）：修 libcxx-ohos 与 musl 的
   头文件错配，否则所有 C++ TU 解析降级（每次全量构建后需重新应用，自动完成）
4. **确保源码根 `.clangd`**：注入 libcxx-ohos include 路径（缺失时自动生成）
5. **CDB 切分 + 并行构建**：按源文件 crc32 切成 N 份，N 个 clangd 实例
   通过符号链接写同一索引目录（temp+rename 原子写，产物等价）
6. **断点续建**：已有 shard 按文件摘要校验跳过，增量构建只处理变更文件

### 依赖

| 依赖 | 说明 |
|---|---|
| clangd >= 20 | **已捆绑**（`lsp/clangd/bin/clangd`，21.1.7，~110MB，含内置头文件）；outgoingCalls 需要 20+。检测顺序：`LSP_CLANGD_BIN` > 捆绑 > PATH > OHOS prebuilts（15，降级） |
| Node.js >= 18 | 仅 MCP 消费侧需要 |
| compile_commands.json | OHOS 构建自动生成于 out 目录 |

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

### 目录结构

```
oskm/lsp/
├── build_index.py             # 索引构建编排器（流水线入口）
├── clangd_tools.py            # headless clangd 驱动（构建/查询）
├── apply_musl_fix.py          # musl stddef nullptr_t 补丁
├── .lsp-mcp.json.template     # 消费侧 MCP 配置模板
├── clangd/                    # 捆绑的 clangd 21.1.7（bin + 内置头，~110MB）
│   ├── bin/clangd
│   └── lib/clang/21/include/
└── mcp/                       # lsp-mcp-server（dist + 生产依赖）
    ├── dist/index.js          # MCP 服务入口
    ├── node_modules/          # 生产依赖（96 包，~27MB）
    └── SKILL.md               # Agent 工具使用指南
```
