# ELF Modules 采集器设计

schema 3.0.0 | 依赖：`component_links, services, hdi, sas`

## 职责边界

`install_modules` 是安装清单的唯一来源：SMI 声明、`dest[]` 展开、部件归属和重复 dest 报告都在那里完成。本采集器的语义是“通过 ELF 文件获取模块信息”：只消费已落库的 `install_targets`，再读取物理安装文件。

这消除了旧 `modules` 扫描器与 `install_modules` 的重复部分：

- 不再第二次读取 `system_module_info.json`；
- 不再展开 / 规范化 `dest[]`；
- 不再推导 part / subsystem / component；
- 不再提供独立 JSON 产物或独立 CLI；
- 只保留物理 ELF 元信息和依赖图这两个新增事实。

## 表结构

```sql
CREATE TABLE elf_modules (
    id INTEGER PRIMARY KEY,
    scan_id INTEGER NOT NULL REFERENCES scans(id),
    position INTEGER NOT NULL,
    install_target_id INTEGER NOT NULL REFERENCES install_targets(id),
    install_module_id INTEGER NOT NULL REFERENCES install_modules(id),
    component_id INTEGER REFERENCES components(id),
    partition TEXT NOT NULL,
    file_name TEXT NOT NULL,
    soname TEXT,
    format TEXT,
    api_type TEXT NOT NULL CHECK (api_type IN ('public_api', 'inner_api', 'internal_api')),
    category JSON NOT NULL CHECK (json_valid(category) AND json_type(category) = 'array'),
    type TEXT,
    machine INTEGER,
    dynamic INTEGER NOT NULL,
    needed JSON NOT NULL,
    UNIQUE (scan_id, install_target_id)
);

CREATE TABLE elf_module_dependencies (
    id INTEGER PRIMARY KEY,
    scan_id INTEGER NOT NULL REFERENCES scans(id),
    caller_id INTEGER NOT NULL REFERENCES elf_modules(id),
    needed_ordinal INTEGER NOT NULL,
    needed_name TEXT NOT NULL,
    callee_id INTEGER REFERENCES elf_modules(id),
    PRIMARY KEY (scan_id, caller_id, needed_ordinal)
);
```

`elf_modules` 是发布记录主表；`elf_module_dependencies` 是直接边子表。闭包、反向闭包和 panorama 由 `ElfModuleQuery.reachable()` 在查询期计算。

`api_type` 与 `category` 是独立输出：先按直接事实和依赖图生成多值 `category`，再按 public category → Inner API → 其余的优先级生成三值 `api_type`。`category` 的规范顺序为 `napi`、`ndk`、`ani`、`cangjie`、`extension`、`platform_sdk`、`platform_sdk_indirect`、`chipset_sdk`、`chipset_sdk_indirect`、`sa`、`hdi`、`hdi_proxy`、`hdi_stub`、`anco`、`other`。

public 直接分类的实际优先级为：`ndk` 最高，命中后不再匹配 `napi`、`ani`、`cangjie`、`extension`；未命中 `ndk` 时，`ani` 优先于 `napi`。非 public 标签（SA/HDI/anco 等）与依赖传播标签不受该短路影响。

`dest` 不在 `elf_modules` 里重复保存：发布记录和 viewer 通过 `install_target_id → install_targets.dest` 重建。`callee_dest` 同理，通过 `callee_id → elf_modules.install_target_id → install_targets.dest` 重建。`engine` 是内置解析器的固定 provenance 值，不再作为每行事实落库；解析器身份由代码与 schema 版本表达。

## 输入选择

1. 经 `ctx.upstream.rows('install_targets')` 读取非 directory 目标。
2. 同一 `dest` 有多条声明时只保留一条物理 ELF 记录；`install_modules` 已保留所有声明并报告 advisory。镜像组装阶段后声明覆盖先声明，因此选择目标 id 最大者。
3. 只把实际存在且魔数为 ELF 的文件写入 `elf_modules`；普通配置、脚本、缺失文件不构成错误。SMI `type=app/etc` 是已知非 ELF 目标，直接跳过；物理缺失或物理目录已由 `install_modules` 报告，也不在这里重复报错。
4. ELF 读取使用内置解析器，只读 header / program headers / dynamic table / section header / `.dynsym` / 字符串，并计入框架的文件与总量预算。

## 同名依赖解析

候选集与 `deps_guard` 的可见范围一致：只有 `system/` 与 `vendor/` 下的 ELF 和软链别名参与同名匹配，因为 `ELFWalker` 只遍历 `packages/phone/system` 和 `packages/phone/vendor`。`updater/`、`ramdisk/` 等分区的 ELF 仍然进 `elf_modules`（模块信息是安装清单的事实），但不作为被依赖目标；`ramdisk/lib/chipset-sdk-sp/libc++.so` 这类镜像外副本因此不会再抢走 `system/lib/chipset-sdk-sp/libc++.so` 的命中。

匹配键先取安装文件 basename。`install_targets` 中的 symlink 通过 `link_target_id` 变成真实 ELF 的解析别名：依赖按软链 basename 命中，边仍指向真实 ELF，软链本身不生成第二条 ELF 记录。取不到 basename 时再用 ELF `SONAME` 兜底，保证没有同名文件的库继续按文件名解析。

目录 rank 与 `ElfFileMgr.__get_library_order` 一致，稳定排序公式与 `__reorder_library` 一致：

```text
(directory rank, original candidate index)
```

64 位与非 64 位路径使用 deps_guard 的两份分支列表，未知目录 rank 为 1000；候选先按 dest 排序再套用上式，同 rank 的取值因此稳定可复现。排序后的第一个候选就是运行时实际加载的那个 so，直接边只保留这一个结果：

- `needed_name`
- `callee_id`

未命中时 `callee_id` 为 NULL，并额外写入 `ELF_DEPENDENCY_UNRESOLVED` advisory issue；不在边上重复保存 resolution 状态。

不再冻结候选数量与同名歧义标记：deps_guard 自身也只用 `dep_elf[0]`，而“这个名字在镜像里有几份”随时可由 `ElfModuleQuery.list_elf_modules(file_names=...)` 查出来，无需在每条边上重复存一遍。

## API 类型与分类判定

### 直接事实

```text
napi:        dest 位于 system/lib/module/ 或 system/lib64/module/，
             且排除 system/lib{64}/module/ani/
ndk:         安装 ELF basename 命中 SDK sysroot .so 清单
ani:         .dynsym 中存在已定义的精确符号 ANI_Constructor
cangjie:     section header 中存在 .cjmetadata
extension:   dest 位于 system/lib{64}/extensionability/
sa:          sas.install_module_id 命中
hdi:         hdis.install_module_id 命中
hdi_proxy:   install_modules.shlib_type = hdi_proxy
hdi_stub:    install_modules.shlib_type = hdi_stub
anco:        归属部件 subsystem = virt_service，
             或 vendor 分区且 dest 位于 vendor/anco_spec/
other:       以上全部未命中时的兜底标签
```

`ndk` 是 public category 的最高优先级：安装 ELF basename 命中 SDK `.so` 清单后，不再继续匹配 `napi`、`ani`、`cangjie`、`extension`。未命中 `ndk` 时，`ani` 与 `napi` 互斥：只要 ELF 导出 `ANI_Constructor`，即使安装路径位于 `system/lib{64}/module/`，也只保存 `ani`，不再叠加 `napi`。

直接分类的执行顺序等价于：

```text
if basename ∈ sdk_so_names:
    save ndk
else:
    if ANI_Constructor exported:
        save ani
    elif dest ∈ system/lib{64}/module/ and dest ∉ system/lib{64}/module/ani/:
        save napi
    if .cjmetadata section exists:
        save cangjie
    if dest ∈ system/lib{64}/extensionability/:
        save extension
```

SDK sysroot 不固定版本目录。优先读取 `ScanRequest` 中 `elf_modules.ndk_sysroot_lib_dir` 的完整库目录；未配置时在 `prebuilts/ohos-sdk/linux/*/native/sysroot/usr/lib/x86_64-linux-ohos` 中自动发现，多版本按数值感知规则取最高版本（`26.0.1 > 9.0.0`），并列最高版本时报告 `SDK_INDEX_AMBIGUOUS`。清单只收 `.so`，显式忽略 `.o` 与 `.a`，且每个候选文件计入输入 provenance。

### 依赖传播

1. public 集合是命中 `napi / ndk / ani / cangjie / extension` 的 ELF。
2. public ELF 直接依赖的 system 分区非 public ELF 标记 `platform_sdk`；`platform_sdk` 的传递闭包标记 `platform_sdk_indirect`。
3. `platform_sdk_indirect` 从全部直接 `platform_sdk` 种子沿依赖边闭包计算，并扣除所有种子；因此直接种子不会同时携带 direct 与 indirect 标签。闭包中的 public ELF 可以携带 `platform_sdk_indirect`，但 `api_type` 仍为 `public_api`。
4. vendor 分区 ELF 直接依赖的 system 分区 ELF 标记 `chipset_sdk`；`chipset_sdk` 的传递闭包标记 `chipset_sdk_indirect`，并同样扣除全部直接种子。
5. 传播不改变 public 集合，也不物化闭包表；`category` 为空时才补 `other`。

### API 优先级

```text
public_api    category 命中 napi / ndk / ani / cangjie / extension
inner_api     public 未命中，且 innerapis.install_module_id 命中
internal_api  其余 ELF
```

public 判定优先于 Inner API 关联；`platform_sdk*` 与 `chipset_sdk*` 只是 category，不再推导为 `inner_api`。

### Viewer 呈现

ELF 列表查询直接带出 `api_type` 与 `category`：API 类型用 badge 展示，Category 解析 JSON 数组后用 tags 展示，并支持 API 类型单选与 Category 多选（任一命中）筛选，筛选状态写入 URL。档案页属性表消费同一列目录；依赖闭包节点带出并展示 API 类型 badge 与 Category 次级文本。viewer 不重新计算分类，只消费采集端落库结果。

## issue 规则

| 条件 | issue | 影响 |
| --- | --- | --- |
| `install_modules` 被显式跳过 | `INSTALL_INDEX_NOT_SELECTED` | degraded |
| `install_modules` 失败或清单不完整 | `INSTALL_INDEX_INCOMPLETE` | degraded |
| ELF 存在但无法解析 | `ELF_PARSE_FAILED` | degraded |
| `DT_NEEDED` 在 `system/`、`vendor/` 内无同名 ELF 或软链别名 | `ELF_DEPENDENCY_UNRESOLVED` | advisory warning；边保留 `callee_id=NULL` |
| SDK sysroot 目录缺失 | `SDK_INDEX_UNAVAILABLE` | advisory；本次不命中 `ndk` |
| SDK 最高版本目录并列歧义 | `SDK_INDEX_AMBIGUOUS` | advisory；本次不命中 `ndk` |
| 显式配置的 SDK 目录不在 workspace 内 | `SDK_INDEX_OUTSIDE_WORKSPACE` | advisory；本次不命中 `ndk` |

重复 dest、部件归属冲突等属于 `install_modules` 的 advisory，不在这里重复报告。
