# ELF Modules 领域

通过读取 `install_modules` 已展开安装目标对应的物理 ELF 文件获取模块信息，提取 `DT_NEEDED` / `DT_SONAME`，并把同名依赖解析成 ELF 模块之间的直接边。

| 项目 | 内容 |
| --- | --- |
| 上游 | `component_links` / `services` / `hdi` / `sas`（它们分别补充 Inner API 关联与 SA/HDI 命中事实） |
| 物理输入 | `out/{product}/packages/phone/{install_targets.dest}` |
| 输出表 | `elf_modules`, `elf_module_dependencies` |
| 分类 | `api_type` 为 `public_api` / `inner_api` / `internal_api`；`category` 为有序 JSON 数组，可包含 `napi/ndk/ani/cangjie/extension/platform_sdk*/chipset_sdk*/sa/hdi/hdi_proxy/hdi_stub/anco/other` 中的一个或多个标签；`ndk` 命中后短路其它 public category，未命中 `ndk` 时 `ani` 与 `napi` 互斥 |
| 同名解析 | 只在 `system/`、`vendor/` 内按 deps_guard 目录顺序取首个命中；未命中时 `callee_id=NULL`，并写 advisory issue |
| 查询 | 按 dest/partition/file_name/soname/format/api_type/category/component/subsystem 过滤；直接依赖、反向依赖和可达闭包。`dest` 由 `install_target_id` JOIN 重建；viewer 列表、档案属性和依赖闭包均消费落库的 API 字段，不在前端重算 |
| 设计 | [design.md](design.md) |

间接依赖和 panorama 不落库物化；查询时沿直接边遍历，避免 legacy JSON 扫描器把同一闭包重复写进每个模块。
