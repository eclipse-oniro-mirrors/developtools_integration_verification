# Service 采集器设计

schema 3.0.0 | 依赖：components, install_modules

## 输入与范围

扫描 `out/{product}/packages/phone/*/etc/init/**/*.cfg` 中的 `services[]` 数组。每条声明提取 name、path（拆为 executable/args）、uid、gid、start-mode、ondemand 等提升字段，其余保留在 record 中。

服务类型由 `path[0]` 判定：`sa_main` → `sa`，`hdf_devhost` → `hdf`，其余 → `default`。

## 表结构

```sql
CREATE TABLE services (
    id                INTEGER PRIMARY KEY,
    scan_id           INTEGER NOT NULL REFERENCES scans(id) ON DELETE CASCADE,
    position          INTEGER NOT NULL,
    cfg               TEXT NOT NULL,
    name              TEXT,
    type              TEXT,           -- sa | hdf | default
    executable        TEXT,
    uid               TEXT,
    start_mode        TEXT,
    ondemand          INTEGER,
    args              TEXT,           -- JSON
    gid               TEXT,           -- JSON
    secon             TEXT,
    sandbox           INTEGER,
    importance        INTEGER,
    component_id      INTEGER REFERENCES components(id) ON DELETE CASCADE,
    install_module_id INTEGER REFERENCES install_modules(id) ON DELETE CASCADE,
    record            TEXT NOT NULL,  -- cfg 原始 service 声明全集
    UNIQUE (scan_id, position)
);
```

索引：cfg+name、type、component_id、install_module_id。

## 归属链

1. `cfg` 路径精确匹配 `install_targets.dest` → 得到 `install_module_id`
2. `install_modules.component_id` → 得到 `component_id`

不读源码树，全部经数据库 JOIN。

## 查询接口

```python
query.list_services(filters=ServiceFilter(cfgs=('system/etc/init/foundation.cfg',),
                                            types=('sa',),
                                            partitions=('system',)))
query.aggregate_services(request=AggregateRequest(group_by=('type',)))
```

## issue 规则

| 条件 | issue |
| --- | --- |
| cfg 不是对象或 services 不是数组 | `CFG_STRUCTURE_INVALID` |
| service 不是对象 | `SERVICE_NOT_OBJECT` |
| name/path 缺失 | `FIELD_MISSING` |
| 字段值非法 | `FIELD_INVALID` |
| dest 无安装模块 | `ORIGIN_UNMATCHED` |
| dest 有多个不同 label | `ORIGIN_LABEL_AMBIGUOUS` |
