# HDI 采集器设计

schema 2.0.0 | 依赖：components, install_modules, services

## 输入与范围

扫描各分区 `etc/hdfconfig/hdf_default.hcb`（HCB 0.7 二进制格式）。解析 `hdf_manager` 子树，按 host/device/node 三层结构提取设备服务声明。每条声明提取 serviceName、moduleName、policy、preload 等字段，hostName 作为 process。

### chip_prod 布局

`chip_prod` 存在两种形态，靠目录自身区分，不靠猜：

| 形态 | 识别 | 处理 |
|---|---|---|
| 单层分区（`chip_prod/etc`、`chip_prod/lib64`） | `chip_prod` 下直接有 `etc`/`lib`/`lib64` 等分区目录 | `chip_prod` 本身就是一个分区，整树扫描 |
| 两层容器（`chip_prod/<product>/etc`…） | 否则 | 镜像打包了全部芯片变体，但设备只装其中一个 |

两层容器下**只扫选中的变体**，选择顺序：

1. 显式指定优先：`ScanRequest.options['hdi']['chip_product']`（CLI 侧暂未暴露该开关）；
2. 默认规则：变体目录唯一时直接采用（`basis=single_variant`，即使它没装 HCB）；
   否则取 `etc/hdfconfig/hdf_default.hcb` **存在且体积最大**的变体——装机的那棵
   携带完整声明集，HCB 最大；多个变体里只有一个带 HCB 时即它；
3. 规则定夺不了就不猜：最大体积**并列**、或所有变体都**没有 HCB** 且变体多于一个时，
   记 `HDI_CHIP_PRODUCT_AMBIGUOUS`（error，本域为空、扫描 degraded），details 带各变体
   的 hcb 字节数；指定的变体不在镜像里记 `HDI_CHIP_PRODUCT_MISSING`。

无论按哪一步选中，都记一条 `HDI_CHIP_PRODUCT_SELECTED`（info/advisory）：details 带
`selected`（最终采用的 `$chip_product`）、`basis`（`requested` / `largest_hcb` /
`single_variant`）、`hcb_bytes`（各变体 HCB 字节数，即决策依据）与 `skipped`
（打包了但没装、按规则不看的变体）。一次扫描因此总能回答"这次 HDI 用的是哪个
chip product、为什么、漏了谁"。

注意这个取舍**只作用于 HDI**：`services` 全包 walk、`install_modules`/`elf_modules`
按安装清单收，仍会收录其余变体的 cfg 与产物。跨域去重是另一个课题，不在本采集器内假装完成。

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

1. **宿主 service**：`hdf_devhost -n hostName` 对应 services 表的 `hdf` 类型服务，按 process 匹配 → `service_id`。
   两层 chip_prod 布局下每个变体都带同名 host 的 `hdf_devhost.cfg`，全局匹配会全部
   `SERVICE_AMBIGUOUS`，因此**优先在同一安装树内**（`chip_prod/<product>`）匹配；同树没有时
   回退全局索引——扁平布局里"system 的 cfg 承载 vendor 的 HCB"是合法形态，收窄不能变成限制。
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
| 多个 chip 变体且默认规则定夺不了（hcb 体积并列 / 全无 hcb），也未指定 | `HDI_CHIP_PRODUCT_AMBIGUOUS`（details 列候选与字节数） |
| 指定的 chip 变体不在镜像 | `HDI_CHIP_PRODUCT_MISSING` |
| 本次采用的 chip 变体（含决策依据与被跳过者） | `HDI_CHIP_PRODUCT_SELECTED`（info/advisory） |
| hostName 与 service name 不一致 | `PROCESS_NAME_MISMATCH` |
