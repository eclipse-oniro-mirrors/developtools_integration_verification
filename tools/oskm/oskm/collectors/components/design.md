# Components 采集器设计

schema 2.1.0 | 依赖：repos

## 输入与范围

读取 `out/{product}/build_configs/parts_info/components.json`（构建系统生成的部件索引），按每个索引条目的 `path` 定位源码 `bundle.json` 或 `ohos.build`，提取 subsystem、deps、build（含 inner_kits/conditions）、features、syscap 等声明。

## 表结构

```sql
CREATE TABLE components (
    id          INTEGER PRIMARY KEY,
    scan_id     INTEGER NOT NULL REFERENCES scans(id) ON DELETE CASCADE,
    name        TEXT NOT NULL,
    subsystem   TEXT,
    manifest    TEXT,
    repo_id     INTEGER REFERENCES repos(id) ON DELETE CASCADE,
    deps        TEXT,           -- JSON
    record      TEXT,           -- bundle.json component 对象全集（含 features/syscap 原始数组）
    UNIQUE (scan_id, name)
);
CREATE TABLE innerapis (
    id                INTEGER PRIMARY KEY,
    scan_id           INTEGER NOT NULL REFERENCES scans(id) ON DELETE CASCADE,
    component_id      INTEGER NOT NULL REFERENCES components(id) ON DELETE CASCADE,
    field             TEXT NOT NULL,    -- inner_kits | inner_api
    source_index      INTEGER NOT NULL,
    name              TEXT NOT NULL,    -- 原始 GN label（声明时已不带 toolchain 后缀）
    external_name     TEXT,             -- external_deps 引用名
    install_module_id INTEGER REFERENCES install_modules(id) ON DELETE SET NULL,  -- component_links 填
    record            TEXT NOT NULL
);
CREATE TABLE syscaps (
    id            INTEGER PRIMARY KEY,
    scan_id       INTEGER NOT NULL REFERENCES scans(id) ON DELETE CASCADE,
    component_id  INTEGER NOT NULL REFERENCES components(id) ON DELETE CASCADE,
    source_index  INTEGER NOT NULL,
    value         TEXT NOT NULL
);
CREATE TABLE features (
    id            INTEGER PRIMARY KEY,
    scan_id       INTEGER NOT NULL REFERENCES scans(id) ON DELETE CASCADE,
    component_id  INTEGER NOT NULL REFERENCES components(id) ON DELETE CASCADE,
    source_index  INTEGER NOT NULL,
    value         TEXT NOT NULL,                          -- feature 名
    gn_arg_id     INTEGER REFERENCES gn_args(id) ON DELETE SET NULL  -- component_links 填
);
```

索引：subsystem、repo_id（components）；external_name、component_id、install_module_id（innerapis）；value、component_id（syscaps/features）；gn_arg_id（features）。

2.0.0 → 2.1.0 变更：移除 components 表的 `features`/`syscap` JSON 冗余列（record 已存原始数组，值在 features/syscaps 表）；innerapis 加 `install_module_id`；features 加 `gn_arg_id`。后两列由 [component_links](../component_links/design.md) 在 post_insert 阶段 UPDATE 填充，components emit 时填 NULL。

## 归属仓

`components.manifest` 路径与 `repos.path` 最长前缀匹配 → `repo_id`。

## 查询接口

```python
query.get_part('bundle_framework')
query.list_parts(filters=ComponentFilter(subsystems=('ability',), depends_on=('ace_engine',)))
query.list_dependents('bundle_framework')   # 反向依赖
query.count_by_subsystem()
```

## issue 规则

| 条件 | issue |
| --- | --- |
| 索引条目不是对象 | `INDEX_ENTRY_TYPE` |
| subsystem 缺失 | `INDEX_FIELD_TYPE` |
| manifest 路径非法 | `SOURCE_PATH_INVALID` |
| manifest 不存在 | `MANIFEST_MISSING` |
| manifest 有多个候选 | `MANIFEST_AMBIGUOUS` |
| syscap/feature 重复 | `*_DUPLICATE`（advisory） |
| innerapi external_name 重复 | `INNERAPI_EXTERNAL_NAME_CONFLICT`（advisory） |

## 关联列（由 component_links 填充）

`features.gn_arg_id` 与 `innerapis.install_module_id` 是 components schema 2.1.0 新增的预留列：components emit 时填 NULL，由后处理采集器 [component_links](../component_links/design.md) 在 `post_insert` 阶段 UPDATE 填值。

- 关联列定义归 components（本文件），UPDATE 算法、issue 规则、re-run 语义归 [component_links/design.md](../component_links/design.md)
