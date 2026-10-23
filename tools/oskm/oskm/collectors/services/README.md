# Service 元数据知识域

从 init cfg 的 `services[]` 声明中提取服务元数据，关联安装模块与归属部件。

| 项目 | 内容 |
| --- | --- |
| 输入 | `out/{product}/packages/phone/*/etc/init/**/*.cfg` |
| 依赖 | components, install_modules |
| 查询 | 按 cfg/name/type/partition/component 过滤与聚合 |
| 设计 | [services-scanner-design.md](services-scanner-design.md) |
| 验收 | [implementation-validation.md](implementation-validation.md) |
