# AGENTS.md — oskm Agent 指南

## 工程概况

- 包名 `oskm`，Python 3.10+，仅标准库
- SQLite-only 存储，注册表框架自动发现采集器
- 7 个采集器按拓扑序执行：`repos → components → install_modules → elf_modules → services → hdi → sas`
- 依赖经数据库传递，不嵌套扫描

## 改代码前必读

- `BaseCollector` 是 ABC：必须实现 `collect()`、声明 `NAME`/`TABLES`/`SCHEMA_VERSION`
- `@register` 装饰器：放进 `collectors/<name>/collector.py` 即自动注册
- `DEPENDS_ON`：拓扑排序，依赖经数据库传递，读上游用 `ctx.upstream.rows()` / `ctx.upstream.records()`
- Record + 列投射：`record` 列存原始声明，列只是索引，导出时从 record 逆向重建
- `ElementCollector`：扁平数组型源文件的模板（`SHAPE` + `FIELDS` + `sources()` + `elements()`）
- 详见 `docs/architecture/sqlite-registry-architecture.md` 和 `docs/architecture/adding-a-collector.md`

## 目录结构

```
oskm/
├── __init__.py          # 版本号
├── cli.py               # 统一 CLI 入口
├── core/                # 框架
│   ├── framework.py     # BaseCollector, ElementCollector, ScanContext, register
│   ├── schema.py         # Table, Column, Index, DDL 生成
│   ├── shape.py          # RecordShape 双射
│   ├── db.py             # SQLite 连接与事务
│   ├── runner.py         # 采集器执行编排
│   ├── session.py        # 扫描会话
│   ├── export.py         # 行→发布记录
│   ├── io.py             # 有界读取 + JSON 解析
│   ├── models.py         # ScanRequest/ScanResult/异常
│   ├── provenance.py     # strip_label
│   ├── ownership.py      # 公共归属解析
│   ├── base_query.py     # BaseQuery
│   ├── base_context.py   # BaseContext
│   └── api.py            # 公共 API 入口
├── collectors/           # 各域采集器（每个含 README.md + design.md + validation.md）
│   ├── repos/
│   ├── components/
│   ├── install_modules/
│   ├── elf_modules/
│   ├── services/
│   ├── hdi/
│   └── system_abilities/
└── tests/                # 测试 + fixtures
```

## 验证命令

```bash
cd packages/oskm
python3 -m unittest discover -s oskm/tests -p "test_*.py"    # 全部单元测试
python3 oskm/tests/verify_rk3568.py --workspace-root /path/to/code
```

## 文档索引（只有这些文档有效）

| 需要什么 | 看哪里 |
|----------|--------|
| 框架架构 | `docs/architecture/sqlite-registry-architecture.md` |
| 新增采集器 | `docs/architecture/adding-a-collector.md` |
| ElementCollector 抽象 | `docs/architecture/element-collector-abstraction.md` |
| 统一模型与跨域关系 | `docs/architecture/unified-model.md` |
| 某域设计 | `oskm/collectors/<domain>/design.md` |
| 某域验收结果 | `oskm/collectors/<domain>/validation.md` |
| 某域概览 | `oskm/collectors/<domain>/README.md` |
