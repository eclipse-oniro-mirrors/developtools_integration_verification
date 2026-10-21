# SystemAbility 采集器设计

schema 2.0.0 | 依赖：components, install_modules, services

## 输入与范围

扫描 `system/profile/*.json` 中的 `systemability[]` 数组。每条声明提取 name（saId）、process、libpath、run-on-create、distributed 等字段，其余保留在 record 中。

## 表结构

```sql
CREATE TABLE sas (
    id                INTEGER PRIMARY KEY,
    scan_id           INTEGER NOT NULL REFERENCES scans(id) ON DELETE CASCADE,
    position          INTEGER NOT NULL,
    profile           TEXT NOT NULL,
    sa_id             INTEGER,
    process           TEXT,           -- JSON
    libpath           TEXT,
    run_on_create     INTEGER,
    distributed       INTEGER,
    dump_level        INTEGER,
    auto_restart      INTEGER,
    service_id        INTEGER REFERENCES services(id) ON DELETE CASCADE,
    component_id      INTEGER REFERENCES components(id) ON DELETE CASCADE,
    install_module_id INTEGER REFERENCES install_modules(id) ON DELETE CASCADE,
    record            TEXT NOT NULL,
    UNIQUE (scan_id, position)
);
```

索引：sa_id、process、component_id、service_id、install_module_id。

## 关联链

1. **宿主 service**：`sa_main` 的 `args[0]` 指向 profile 文件路径，与 services 表的 `sa` 类型服务按 profile 路径匹配 → 得到 `service_id`
2. **安装模块**：SA 的 `libpath`（实现库）按文件名在 `install_targets.file_name` 匹配 → 得到 `install_module_id`
3. **归属部件**：`install_modules.component_id` → 得到 `component_id`

## 查询接口

```python
query.list_sas(filters=SAFilter(ids=(1601,), processes=('samgr',),
                                 parts=('samgr_standard',)))
query.aggregate_sas(group_by=('subsystem',))
```

## issue 规则

| 条件 | issue |
| --- | --- |
| profile 不是对象 | `PROFILE_NOT_OBJECT` |
| systemability 不是数组 | `SYSTEMABILITY_NOT_ARRAY` |
| SA 不是对象 | `SA_NOT_OBJECT` |
| saId 非法 | `SA_ID_INVALID` |
| saId 重复 | `SA_ID_DUPLICATE`（advisory） |
| process/libpath 缺失或非法 | `SA_FIELD_INVALID` |
| profile 无匹配 service | `SERVICE_UNMATCHED` / `SERVICE_AMBIGUOUS` |
| libpath 无安装模块 | `LIBRARY_UNMATCHED` |
