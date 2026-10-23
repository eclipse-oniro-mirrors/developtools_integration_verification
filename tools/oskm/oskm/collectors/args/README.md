# args 采集器

通过 `gn args --list --json` 采集全量 GN 构建参数，每个 arg 记录名称、声明文件/行号、默认值、当前覆盖值、值类型、注释。

| 项目 | 内容 |
| --- | --- |
| 输入 | `prebuilts/build-tools/*/bin/gn` + `out/{product}/` 构建产物 |
| 依赖 | components（component_id 关联） |
| schema | 1.0.0 |
| 设计 | [design.md](./design.md) |
