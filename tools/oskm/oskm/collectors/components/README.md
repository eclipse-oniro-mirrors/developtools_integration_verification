# Components 知识域

扫描产品部件索引及源码清单，建立部件与 inner API 索引，确定归属仓。

| 项目 | 内容 |
| --- | --- |
| 输入 | `out/{product}/build_configs/parts_info/components.json` + 源码 `bundle.json`/`ohos.build` |
| 依赖 | repos |
| 查询 | 按 name/subsystem/depends_on 过滤；反向依赖查询 |
| 设计 | [components-scanner-design.md](components-scanner-design.md) |
| 验收 | [implementation-validation.md](implementation-validation.md) |
