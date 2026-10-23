# Install Modules 领域

解析 `system_module_info.json`（SMI），建立安装模块与安装目标索引，支撑按 label、dest 路径、部件名查询，并确定归属部件。

| 项目 | 内容 |
| --- | --- |
| 输入 | `out/{product}/packages/phone/system_module_info.json` |
| 依赖 | components |
| 查询 | 按 label/dest/part_name/subsystem/type；dest 反查模块 |
| 边界 | 不读取物理 ELF；ELF 元信息与 `DT_NEEDED` 图见 `elf_modules` |
| 设计 | [design.md](design.md) |
