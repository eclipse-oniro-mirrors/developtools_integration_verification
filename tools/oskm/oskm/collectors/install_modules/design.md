# Install Modules 采集器设计

schema 1.0.0 | 依赖：components

## 输入

`out/{product}/packages/phone/system_module_info.json` 是构建系统产出的安装清单。每条声明包含 GN label、dest 安装路径列表、part_name、subsystem_name、type 等字段。一行可多 dest（一对多）。

本域只负责声明清单与归属，不读取物理 ELF 文件；实际 ELF 元信息和 `DT_NEEDED` 依赖边由下游 `elf_modules` 基于 `install_targets.dest` 采集。

## 表结构

```sql
CREATE TABLE install_modules (
    id            INTEGER PRIMARY KEY,
    scan_id       INTEGER NOT NULL REFERENCES scans(id) ON DELETE CASCADE,
    ordinal       INTEGER NOT NULL,      -- SMI 数组下标
    label         TEXT,                  -- strip_label 后的 GN label
    label_name    TEXT,
    type          TEXT,                  -- lib/etc/bin/sa_info/app/unknown
    source        TEXT,
    install_enable INTEGER,
    component_id  INTEGER REFERENCES components(id) ON DELETE CASCADE,
    record        TEXT NOT NULL,        -- SMI 原始声明全集
    UNIQUE (scan_id, ordinal)
);
CREATE TABLE install_targets (
    id          INTEGER PRIMARY KEY,
    scan_id     INTEGER NOT NULL REFERENCES scans(id) ON DELETE CASCADE,
    module_id    INTEGER NOT NULL REFERENCES install_modules(id) ON DELETE CASCADE,
    dest_index   INTEGER NOT NULL,
    dest         TEXT NOT NULL,          -- 镜像内相对路径
    directory    INTEGER NOT NULL DEFAULT 0,  -- dest 以 / 结尾时为 1
    partition    TEXT,                  -- dest 第一段
    file_name    TEXT,                  -- dest 的文件名部分
    UNIQUE (scan_id, module_id, dest_index)
);
CREATE TABLE install_module_tags (
    id           INTEGER PRIMARY KEY,
    scan_id      INTEGER NOT NULL REFERENCES scans(id) ON DELETE CASCADE,
    module_id    INTEGER NOT NULL REFERENCES install_modules(id) ON DELETE CASCADE,
    source_index INTEGER NOT NULL,
    value        TEXT NOT NULL           -- innerapi_tags 展开
);
```

索引：label、type、component_id（install_modules）；dest、partition、file_name（install_targets）；value、module_id（install_module_tags）。

## 归属规则

通过 components 表的 `manifest` 路径做最长前缀匹配确定 `component_id`。不读源码树、不调 `nearest_bundle`。

## 查询接口

```python
# 按精确 dest 反查模块（消费方核心查询）
index = InstallIndex(modules, targets)
index.at('system/etc/init/foundation.cfg')       # → 安装该文件的模块列表
index.labelled('//foundation/ability:base')       # → 按 label 查
index.named('libbase.z.so')                       # → 按文件名查
index.locate(label='//...', path='system/...', name='libbase.z.so')

# 消费方一次 JOIN
rows = ctx.upstream.rows('install_targets', dest=cfg)
```

## issue 规则

| 条件 | issue |
| --- | --- |
| SMI 不可读 | `MODULE_INFO_UNAVAILABLE` |
| SMI 不是数组 | `MODULE_INFO_NOT_ARRAY` |
| 行不是对象 | `MODULE_ROW_INVALID` |
| strip_label 失败 | `MODULE_LABEL_INVALID` |
| dest 重复且 label 不同 | `INSTALL_DEST_AMBIGUOUS`（advisory） |
| 归属部件未在 components 注册 | `COMPONENT_NOT_REGISTERED` |

---

## 安装目标的 size 与 link_target（2026-10-19）

`install_targets` 增两列：

| 列 | 含义 |
| --- | --- |
| `size` | 这个条目在镜像里**自己**占的字节数；包里没有则为 NULL |
| `link_target` | 是软链接时的链接文本，否则 NULL |

### 为什么是 lstat 而不是 stat

跟随软链接会**把同一份字节算两遍**。rk3568 上唯一的软链接
`system/etc/etsstdlib.abc → ../framework/etsstdlib_bootabc.abc`，
它指向的文件**自己也是一条安装目标**（已验证）。若 size 跟随链接，
这 1.9 MB 会同时记在链接和目标上，按分区/部件求和就虚高。

所以 `size` 一律取 `lstat`：普通文件是文件大小，软链接是链接文本的长度（34 字节），
整目录安装是目录下的合计（`os.walk(followlinks=False)`，防止走出包外）。

`is_symlink` 由 `link_target` 是否为空推导，不另开一列——同一事实不要第三份拷贝。

### 为什么 size 有列却不进 `record`

`record` 是**声明的逐字保留**，size 是对**产物的观测**——
system_module_info.json 里没有这个字段。把观测值写进 record 会让
"record 是原始全集"这条不变量失真。先例：`repos.head_commit` 同样是观测值。
有一条单测专门钉住这件事。

### 两个新的 advisory 问题码

| 码 | 条件 | rk3568 |
| --- | --- | ---: |
| `TARGET_MISSING` | 声明要装的路径在包里不存在 | 1 |
| `TARGET_DIRECTORY_UNDECLARED` | 声明末尾没有 `/`，包里却是目录 | 1 |

后者不只是写法问题：`modules_at()` 只对**声明为目录**的条目做前缀回退，
所以该目录下的文件追不回它们所属的模块。

### 实测

5804 条安装目标：5792 个普通文件、11 个目录、1 个软链接、1 个缺失。
全量 `stat` 耗时 68 ms，扫描总时长无可察觉变化。
镜像总计 1259.9 MB（system 1150.3 / vendor 65.5 / updater 37.5 / ramdisk 4.7）。

### 测试夹具跟着改了

`manifest()` 现在会**把声明的每个 dest 都在合成包里建出来**。
size 是观测值，夹具只声明不建文件就成了"产品不一致"（TARGET_MISSING），
而不再是中性的桩。要测缺失场景的用例自己删文件。
