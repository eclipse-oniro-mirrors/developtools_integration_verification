# HDI 采集器设计

schema 2.0.0 | 依赖：components, install_modules, services

## 输入与范围

扫描各分区 `etc/hdfconfig/hdf_default.hcb`（HCB 0.7 二进制格式）。解析 `hdf_manager` 子树，按 host/device/node 三层结构提取设备服务声明。每条声明提取 serviceName、moduleName、policy、preload 等字段，hostName 作为 process。

## 表结构

```sql
CREATE TABLE hdis (
    id                INTEGER PRIMARY KEY,
    scan_id           INTEGER NOT NULL REFERENCES scans(id) ON DELETE CASCADE,
    position          INTEGER NOT NULL,
    hcb               TEXT NOT NULL,
    node              TEXT NOT NULL,     -- 树内指针
    service_name      TEXT,              -- serviceName
    module_name       TEXT,              -- moduleName
    process           TEXT,              -- JSON, hostName
    library           TEXT,              -- 安装库路径
    policy            INTEGER,
    preload           INTEGER,
    device_match_attr TEXT,
    permission        INTEGER,
    priority          INTEGER,
    service_id        INTEGER REFERENCES services(id) ON DELETE CASCADE,
    component_id      INTEGER REFERENCES components(id) ON DELETE CASCADE,
    install_module_id  INTEGER REFERENCES install_modules(id) ON DELETE CASCADE,
    record            TEXT NOT NULL,
    UNIQUE (scan_id, position)
);
```

索引：service_name、module_name、process、component_id、service_id、install_module_id。

## 关联链

1. **宿主 service**：`hdf_devhost -n hostName` 对应 services 表的 `hdf` 类型服务，按 process 匹配 → `service_id`
2. **安装模块**：`moduleName` 对应的 `.so` 库在各分区 `lib/lib64` 下查找，按文件名匹配 `install_targets.file_name` → `install_module_id`
3. **归属部件**：`install_modules.component_id` → `component_id`

## 查询接口

```python
query.list_hdis(filters=HDIFilter(service_names=('audio_render',),
                                    processes=('audio_host',),
                                    parts=('audio_framework',)))
query.aggregate_hdis(group_by=('subsystem',))
```

## issue 规则

| 条件 | issue |
| --- | --- |
| HCB 头部不支持 | `HCB_HEADER_UNSUPPORTED` |
| HCB 长度不匹配 | `HCB_LENGTH` |
| manager 数量不是 1 | `HCB_MANAGER_COUNT` |
| moduleName 非法 | `MODULE_PATH_INVALID` |
| 库未找到 | `LIBRARY_UNMATCHED` / `LIBRARY_AMBIGUOUS` |
| 库不是 ELF | `LIBRARY_NOT_ELF` |
| 宿主无匹配 service | `SERVICE_UNMATCHED` / `SERVICE_AMBIGUOUS` |
| hostName 与 service name 不一致 | `PROCESS_NAME_MISMATCH` |
