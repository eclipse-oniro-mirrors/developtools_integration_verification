# SystemAbility 知识域

从 `system/profile/*.json` 提取 SA 声明，关联宿主 service 与归属部件。

| 项目 | 内容 |
| --- | --- |
| 输入 | `out/{product}/packages/phone/system/profile/*.json` |
| 依赖 | components, install_modules, services |
| 查询 | 按 sa_id/process/part/subsystem/profile/service 过滤与聚合 |
| 设计 | [sa-scanner-design.md](sa-scanner-design.md) |
| 验收 | [implementation-validation.md](implementation-validation.md) |
