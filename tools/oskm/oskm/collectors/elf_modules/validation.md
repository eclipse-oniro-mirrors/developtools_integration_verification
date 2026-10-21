# ELF Modules 验证记录

## 单元验证

- 注册顺序包含 `elf_modules`，且在 `component_links`、`services`、`hdi`、`sas` 之后执行。
- 内置解析器读取 SONAME / DT_NEEDED。
- `napi` 命中 `system/lib{64}/module/` 且排除 `module/ani/`。
- `ndk` 优先于其它 public category：basename 命中 SDK `.so` 清单后不再叠加 `napi`、`ani`、`cangjie`、`extension`。
- `ani` 优先于 `napi`：导出 `ANI_Constructor` 的 ELF 不再同时保存 `napi`。
- `ndk` 按安装 ELF basename 与动态发现的最高版本 SDK sysroot `.so` 清单匹配，忽略 `.o` / `.a`，不固定 `26.0.1`。
- `ani` 通过 `.dynsym` 中已定义的精确 `ANI_Constructor` 符号判定；`cangjie` 通过真实 `.cjmetadata` section 判定，不做字符串搜索。
- `extension`、`sa`、`hdi`、`hdi_proxy`、`hdi_stub`、`anco` 按安装路径、collector 命中、`shlib_type`、部件 subsystem 与 `vendor/anco_spec/` 直接判定。
- public 直接依赖与间接依赖分别传播为 `platform_sdk` / `platform_sdk_indirect`；vendor 直接依赖与间接依赖分别传播为 `chipset_sdk` / `chipset_sdk_indirect`。
- `api_type` 按 public category → `innerapis.install_module_id` → 其余的顺序判定为 `public_api` / `inner_api` / `internal_api`。
- `/system/lib` 与 `/system/lib64` 使用 deps_guard 的分支 rank。
- 未列入 deps_guard 顺序的 `chipset-sdk-sp` 落后于 `system/lib/module`。
- 同名匹配只取 `system/`、`vendor/` 内的 ELF 与软链别名候选：`ramdisk/lib/chipset-sdk-sp/libsec.z.so` 不再抢走 `system/lib/chipset-sdk-sp/libsec.z.so`，只装在 `updater/` 的库判为 unresolved。
- 匹配键先取安装文件 basename，取不到时用 ELF `SONAME` 兜底；basename 优先，保证无 `SONAME` 的库仍能按文件名解析。
- 安装软链作为解析别名：依赖按软链 basename 命中，边指向 `link_target_id` 对应的真实 ELF，软链不生成重复 ELF 记录。
- `elf_modules` 不落库 `dest` / `engine`，依赖边不落库 `callee_dest`；发布记录和 viewer 均通过外键 JOIN 重建展示值。
- 直接边只记一个 callee；未命中由 `callee_id=NULL` 表达，并写 `ELF_DEPENDENCY_UNRESOLVED` advisory issue。
- 直接 / 反向依赖查询不物化闭包；可达查询返回距离与一条路径。
- 重复物理 dest 只生成一条 ELF，并选择后一个安装声明。
- 坏 ELF 报 `ELF_PARSE_FAILED`，不中断其他文件。
- SMI `type=app/etc` 的 HAP / 配置文件不进入 ELF 读取；物理缺失或目录目标不重复报 `ELF_PARSE_FAILED`。
- 无 program header 的可重定位 ELF（如 eBPF `.o`）保留为 `dynamic=false` 元数据。
- 上游 `install_modules` 被跳过时报告 `INSTALL_INDEX_NOT_SELECTED`，不回退重扫 SMI。
- `category` 为空时才写 `other`；所有标签按规范顺序保存为 JSON 数组。

当前专项单元测试：`oskm.tests.test_elf_modules`（20 个用例）。OSKM 全量测试为 235 个用例。

## rk3568 实测

使用 `code/out/rk3568/packages/phone` 的真实构建产物执行全量 SQLite 扫描，并用独立 `readelf -d` oracle 复核全部 ELF：

| 指标 | 值 |
| --- | ---: |
| elf_modules | 3,520 |
| DT_NEEDED 边 | 33,367 |
| resolved direct edges | 33,367 |
| unresolved direct edges | 0 |
| ELF_PARSE_FAILED | 0 |

### API 类型与分类分布

| 字段 / 标签 | 数量 |
| --- | ---: |
| public_api | 1,103 |
| inner_api | 1,265 |
| internal_api | 1,152 |
| napi | 626 |
| ndk | 133 |
| ani | 305 |
| cangjie | 0 |
| extension | 39 |
| platform_sdk | 514 |
| platform_sdk_indirect | 252 |
| chipset_sdk | 44 |
| chipset_sdk_indirect | 28 |
| sa | 157 |
| hdi | 46 |
| hdi_proxy | 118 |
| hdi_stub | 107 |
| anco | 0 |
| other | 1,260 |

互斥与组合验证：

| 关系 | 数量 |
| --- | ---: |
| `napi` ∩ `ani` | 0 |
| `ndk` ∩ `napi` | 0 |
| `ndk` ∩ `ani` | 0 |
| `ndk` ∩ `cangjie` | 0 |
| `ndk` ∩ `extension` | 0 |
| `public_api` ∩ `platform_sdk` | 0 |
| `public_api` ∩ `platform_sdk_indirect` | 29 |

`public_api` 可携带 `platform_sdk_indirect` 是设计内组合：public 类型由直接 public 事实决定，indirect 标签只表达它被 `platform_sdk` 传递依赖。

命中结果由 `oskm/tests/verify_rk3568.py` 的独立 `readelf -d` oracle 按同一 rank 公式逐边复核，并额外断言每个 callee 都落在 `system/` 或 `vendor/`。把匹配范围从“全部分区”收敛到 deps_guard 的遍历范围后，5,433 条边改判为运行时真正加载的那一份（5,431 条原指向 `ramdisk/lib/chipset-sdk-sp/`，2 条原指向 `updater/`）。`libc.so -> ld-musl-arm.so.1` 与 `librga.so.2 -> librga.z.so` 通过 `SONAME` 兜底解析；`libappspawn_module_engine.so`、`libinit_module_engine.so`、`libnative_drawing.so` 的 20 条边通过安装软链解析到真实 ELF。间接闭包不物化，扫描耗时约 3 秒、峰值 RSS 约 82 MiB。
