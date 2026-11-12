# oskm_schema — 表结构中立包

采集侧（`oskm/collectors/`）与查询侧（`cli/oskm_cli/`）**共用的唯一一份表定义**。

```
oskm_schema/
  base.py              原语 Column / Index / Table + 框架四表
                       （scans / collector_runs / issues / collector_tables）
  args.py              gn_args
  arkts.py             arkts_modules / arkts_kits / arkts_sources / arkts_kit_relations
  arkts_records.py     行 ↔ 发布记录的投射，由表定义推出，两侧都用
  components.py        components / features / innerapis / syscaps
  elf_modules.py       elf_modules / elf_module_dependencies
  hdi.py               hdis
  install_modules.py   install_modules / install_targets / install_module_tags
  links.py             arkts_links_run / component_links_run
  ndk.py               ndk_headers
  repos.py             repos
  sas.py               sas
  services.py          services
```

共 **25 张表**（21 张采集器表 + 4 张框架表）。`base.py` 是纯叶子——只 import `re` 与 `dataclasses`，
不依赖 `oskm` 也不依赖 `cli/oskm_cli`，所以这个包两边都能单独带走。

## 为什么单独一个顶层包

`cli/oskm_cli/`（查询层 + skill）要能独立发布，但表结构是两侧共用的。三种放法实测过
（详见 [schema-single-source.md](./schema-single-source.md) 与
[../docs/architecture/standalone-packaging.md §5](../docs/architecture/standalone-packaging.md)）：

- **软链** —— 不行。同一文件经两个模块名加载会产生**两份 Table 实例**，
  而 `runner.py` 有 `if table.name == collector.TABLES[0].name` 这类判别；
  早先写成 `is` 比较时跨模块恒为 `False` 且**不报错**，分支静默失效。
- **依赖倒置**（采集器反过来 import `cli/oskm_cli`）—— 可行但方向别扭。
- **中立第三包** —— 一个模块名、一份实例、不倒置。就是这里。

## 加表 / 改表

1. 表定义写进 `oskm_schema/<域>.py`，**不要写在 `collector.py` 里**
   （有门禁盯着：`cli/tests/test_schema_consistency.py`）
2. 采集器 `from oskm_schema.<域> import X`，声明进 `TABLES`
3. 查询层若要专用工具，同样从这里 import；表名出现在 SQL 里时，
   门禁会校验它确实存在于本包

改表名之后，`cli/oskm_cli` 里引用旧名的 SQL 会被门禁逐处点名（带文件行号）。
完整的一致性设计与仍待做的部分见 [schema-single-source.md](./schema-single-source.md)。

## 两条建表硬约束

**禁止 `REAL` 列**（声明即 `SchemaError`）；**JSON 列必须用 `'JSON'` 类型声明**
——它映射到 TEXT 存储。写成字面量 `JSON` 会得到 NUMERIC affinity，
把裸数字文档转成数字。理由见 `base.py` 顶部注释。
