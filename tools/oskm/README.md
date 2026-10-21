# oskm — OpenHarmony System Knowledge Scanner

oskm 对一个**已构建的产品**做静态扫描，把散落在构建产物、镜像清单、init 配置、SA profile、HDF 配置里的事实，归并成一个 SQLite 知识库。只陈述事实，不做推断——每条记录都保留来源文件里的原始声明。

## 构建系统集成

oskm 作为后编译分析工具集成在 OpenHarmony 构建系统中，通过 `enable_oskm_collect` 构建选项触发：

```bash
./build.sh --product-name rk3568 --ccache --jobs 16 --build-target make_all --gn-args enable_oskm_collect=true
```

构建完成后，知识库输出到：

```
out/rk3568/oskm/knowledge.db
```

### 工作原理

1. GN 声明 `enable_oskm_collect`（`build/ohos_var.gni`，默认 `false`）
2. hb 构建驱动在 `postTargetCompilation` 阶段调用 resolver
3. resolver 调用 `oskm_collect(out_path, target_cpu, workspace_root, product)`
4. oskm 扫描源码树，采集 9 个维度的数据写入 SQLite

### 调用链路

```
./build.sh --gn-args enable_oskm_collect=true
  → hb resolver: resolve_enable_oskm_collect()
    → oskm_collect(out_path, target_cpu, workspace_root, product)
      → oskm scan --workspace-root <root> --product <product> --db out/<product>/oskm/knowledge.db
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
├── README.md
└── AGENTS.md
```

## 运行测试

```bash
cd developtools/integration_verification/tools/oskm
python3 -m unittest discover -s oskm/tests -p "test_*.py"
```
