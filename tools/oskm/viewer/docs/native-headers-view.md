# Native SDK headers viewer 设计

## 目标

回答应用开发者最常问的三个问题：

1. 一个 `interface/sdk_c` 头文件由哪个镜像里的 Native SDK 库提供；
2. 一个 Native SDK 库要用哪些头文件描述；
3. 这条映射是 BUILD.gn 声明、`@library` 标签，还是符号兜底推断出来的。

## 归属

视图放在 **SDK 接口** 分组，而不是“系统文件”。读者心智是“应用开发者看到的 C API 面”；
虽然数据左端是镜像中的 ELF，但表的主语是 SDK 头文件。

## 数据边界

- `native_headers` 只保存 `(elf_module_id, header_path, match_strategy)`，不冗余部件、SONAME 或路径。
- 列表用一条 SQL JOIN `elf_modules`、`install_targets`、`components`、`install_modules` 取出展示字段。
- `sourceUrl` 用 `header_path` 匹配最长仓路径前缀生成。公开托管仓用扫描时提交号拼 blob 链接；内部镜像仓的 host 以 `szv-` 开头时，展示链接去掉该前缀，并用分支名拼 `files?ref=&filePath=&isFile=true` 链接。该规则在通用 `fileSource` 中实现，声明文件也复用同一套拼法；公开仓拼法不动。
- 档案页沿 `elf_module_id` 作为父链，能自然回链到 ELF 与部件；表本身不新增外键。

## 列设计

| 列 | 组 | 说明 |
|----|----|------|
| 源码头文件 | 头文件 | 主键级事实，固定列 |
| 源码 | 头文件 | 跳到扫描提交下的头文件 |
| 镜像库路径 / SONAME / 文件名 / 分区 | Native SDK 库 | 库的识别与实际位置 |
| 匹配方式 | 匹配方式 | 证据强度，支持筛选 |
| 归属部件 / 子系统 / 安装模块 | 归属 | 经 ELF JOIN 得到 |

默认排序为头文件路径，便于把同一 API 目录下的多个头文件放在一起。
筛选状态写入 URL：`strategy` 与 `subsystem`。

## 交互

- 路由：`#/sdk/native-headers`，兼容 `#/data/native_headers` 重定向。
- 行点击打开通用 `native_headers` 档案抽屉；库、部件、安装模块列提供各自实体的内链。
- 首页 SDK 段显示映射数与库数，避免把 441 个映射误读成 441 个独立能力。
