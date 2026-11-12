# OpenHarmony 系统知识扫描器

把一个 OpenHarmony 产品的构成事实——代码仓、部件、安装产物、ELF 依赖、
运行时服务、编译开关、SDK/NDK 接口——扫进一个 SQLite 库，
供人查看、供 Agent 查询。

Python 3.10+，查询层**仅标准库且无 pip 依赖**；运行时安装的 DB 与两套 SDK
来自同一个 `knowledge.tar.gz`，不要求 Git。从源码运行（ArkTS 扫描另用工程内的
Node 与 ohos-typescript）。
结果只存单个 SQLite 库，没有可选产物格式，也不产出 JSON 文件。

## 组件构成

```
tools/oskm/
  oskm/          ①  采集流水线：框架 + 12 个采集器，写库
  oskm_schema/   ②  表结构：25 张表的唯一定义，①③④ 共用
  cli/           ③  查询 CLI：独立产物，只读封装 knowledge.db
  skills/ohos-design-architecture-evidence-query/
                 ④  Agent skill：独立产物，装 DB/SDK/CLI 并教 Agent 怎么问
  viewer/        ⑤  可视化：静态站点，浏览器直接打开库
  lsp/           仓库本地扩展：clangd 索引与 MCP 集成
```

| 组件 | 职责 | 交付形态 | 入口文档 |
|---|---|---|---|
| **① `oskm/`** | 扫描源码树与构建产物，按拓扑序跑采集器，写入 SQLite | 源码 | [oskm/README.md](./oskm/README.md) —— 命令行、Python API、数据契约 |
| **② `oskm_schema/`** | 采集侧与查询侧**共用的唯一一份表定义** | 源码（打进 ③ 的 pyz） | [oskm_schema/README.md](./oskm_schema/README.md) —— 加表/改表怎么做 |
| **③ `cli/`** | `ask / arch / diff / sql / validate-db`，只读、不联网、不写盘 | `cli/dist/oskm-cli.pyz`（固定名，不带版本） | [cli/README.md](./cli/README.md) |
| **④ `skills/…`** | 下载并安装 DB / SDK / **CLI 本身**，维护 `~/.oskm`，按需刷新 | `skills/…/dist/ohos-design-architecture-evidence-query-<v>.tar.gz` | [SKILL.md](./skills/ohos-design-architecture-evidence-query/SKILL.md) 给 Agent · [usage.md](./skills/ohos-design-architecture-evidence-query/references/usage.md) 给人 |
| **⑤ `viewer/`** | 静态站点，在浏览器里浏览关联、看详情与证据 | 静态站点 | [viewer/README.md](./viewer/README.md) |

**③④ 是两个能各自发布、各自版本化的产物**（`oskm-cli 1.0.0` /
`skill 3.0.0`）：③ 是纯函数式的只读工具，给它一个库路径就出答案；
④ 是装配工。schema 契约只有 ③ 那一份，④ 的 `validate-db` 是转发。
③ 不 import 任何采集器，也不 import ④（都有门禁盯着）。

`lsp/` 是 integration_verification 仓库保留的本地扩展，不属于上述两个发布产物；
它负责构建和消费 clangd `.idx` 索引，详见后文。
拆分理由、职责边界与迁移记录见
[docs/architecture/cli-skill-split.md](./docs/architecture/cli-skill-split.md)。

## 快速上手

```bash
cd tools/oskm/skills/ohos-design-architecture-evidence-query

# ④ 安装运行时（DB + interface/sdk-js + interface/sdk_c + CLI）
cp oskm_runtime/.env.example oskm_runtime/.env
# OSKM_DOWNLOAD_SOURCE 选择 OPENHARMONY_CI（默认）或 HARMONYOS_CI；
# OSKM_DOWNLOAD_ENDPOINT 提供归档端点。归档里就是 DB + CLI + 两套 SDK，
# 没有单独的 CLI 下载端点。
python3 bootstrap.py doctor
python3 bootstrap.py install --runtime-root "$HOME/.oskm"

# ④ 查询：**直接调 CLI**，bootstrap 只负责装
CLI="$HOME/.oskm/oskm-cli.pyz"; DB="$HOME/.oskm/knowledge.db"
python3 "$CLI" --db "$DB" arch overview                  # 这个产品由什么构成
python3 "$CLI" --db "$DB" arch trace system/lib64/module/multimedia/libimage.z.so
python3 "$CLI" ask --list                                # 52 个查询工具

# ③ 不经 skill 直接用 CLI（它自己不下载任何数据）
cd ../.. && python3.12 cli/dist/oskm-cli.pyz --db "$HOME/.oskm/knowledge.db" arch overview

# ① 扫描：写出一个快照（12 个采集器）。**采集侧是另一个入口**，
#    两个产物没有共同命令——`oskm.py` 那个分派壳已于 2026-11-12 删除。
python3 -m oskm.cli scan --workspace-root <OH源码根> --product wukong100 \
    --db ../../artifacts/wukong100/knowledge.db

# ⑤ 浏览
cd viewer && npm install && npm run dev
```

wukong100 实测（`date=20261111`，`cpu_arch=arm64`）：527 仓 · 57 子系统 ·
385 部件 · 5,936 安装模块 · 7,025 镜像落点 · 3,687 ELF（32,076 条依赖边）·
171 服务 + 166 SA + 59 HDI · 3,004 编译参数 · 1,385 特性 · 310 SysCap ·
1,763 InnerAPI · 50 Kit · 1,328 SDK 模块（935 个定位到实现 `.so`）·
444 条 NDK 头文件映射。库 19.0 MB。

> `cpu_arch=arm64`，所以实现路径是 `system/lib64/…` 而不是 `system/lib/…`；
> 以 `ask get_scan_info` 的 `cpu_arch` 和真实 `dest` 为准，不要凭路径猜。

## 数据怎么流动

```
源码树 + 构建产物
      │  ① oskm/  —— 采集器按拓扑序执行，依赖经数据库传递
      ▼
 knowledge.db  ←── ② oskm_schema/ 定义了里面每一张表
      │
      ├─ ③ cli/       oskm-cli（pyz）        → Agent 沿架构链精确查询
      │        ▲
      │        └── ④ skills/…  bootstrap.py 装 DB/SDK/CLI，再透传查询
      └─ ⑤ viewer/    静态站点              → 人工浏览与评审
```

一次扫描 = 一个快照；同一个库可存多个快照，查询时按 `scan_id` 隔离。
每个快照在 `scans` 中记录产品、`cpu_arch`、工作区和起止时间；`cpu_arch`
默认 `arm64`。构建布局根据 `out/` 下 `product` 的相对路径自动探测，
与 CPU 架构无关。
**③④⑤ 读同一张库，不各存一份。**

## 构建与验证

```bash
cd tools/oskm
export OSKM_TEST_DB="$HOME/.oskm/knowledge.db"   # 真库（wukong100）

python3.12 -m unittest discover -s oskm/tests -p "test_*.py"     # ①② 采集与表结构
python3.12 -m unittest discover -s cli/tests -p "test_*.py"      # ③ 查询层 + 边界门禁
python3.12 -m unittest discover \
    -s skills/ohos-design-architecture-evidence-query/tests -p "test_*.py"   # ④
cd viewer && npm run verify                                      # ⑤

# 两个产物互不依赖，构建先后顺序无所谓；产物各自落在自己目录的 dist/
python3.12 cli/scripts/build_cli.py                                 # → cli/dist/oskm-cli.pyz
python3.12 skills/ohos-design-architecture-evidence-query/scripts/build_skill.py
```

> 本机 `python3` 可能是 3.9（macOS Command Line Tools 就是），跑不了本仓——
> `oskm_schema/base.py` 用了 `str | None`。**一律用 `python3.12`。**

产品级验收需要真实 OpenHarmony 代码树，见 [oskm/README.md](./oskm/README.md) 末节。

## LSP 代码索引（clangd .idx）

`lsp/` 在流水线编译完成后构建 clangd `.idx` 索引，默认输出到
`out/<product>/lsp-portable/`；portable 模式包含可迁移索引、规范化 CDB 和
manifest。索引可通过 `lsp/mcp/` 内的 MCP 服务消费，获得调用链、引用和定义跳转。

```bash
# 手动构建（在 OpenHarmony 源码根执行）
python3 developtools/integration_verification/tools/oskm/lsp/build_index.py -i out/<product>

# LSP 回归（在 integration_verification 仓库根执行）
LSP_TEST_CLANGD="$PWD/tools/oskm/lsp/clangd/bin/clangd" \
  python3 tools/oskm/lsp/test_portable_index.py -v
```

MCP 配置与 29 个 `lsp_*` 工具的说明见
[lsp/mcp/README.md](./lsp/mcp/README.md) 和 [lsp/mcp/SKILL.md](./lsp/mcp/SKILL.md)。

## Agent 指南

改这个工程的代码前先读 [AGENTS.md](./AGENTS.md)。
用这个库回答架构问题，走 `ohos-design-architecture-evidence-query` skill
（[SKILL.md](./skills/ohos-design-architecture-evidence-query/SKILL.md)）。
