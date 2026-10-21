# HDI 知识域

从 `hdf_default.hcb` 提取 HDI 设备服务声明，关联宿主 service 与归属部件。

| 项目 | 内容 |
| --- | --- |
| 输入 | `out/{product}/packages/phone/*/etc/hdfconfig/hdf_default.hcb` |
| 依赖 | components, install_modules, services |
| 查询 | 按 serviceName/moduleName/process/partition/component 过滤与聚合 |
| 设计 | [hdi-scanner-design.md](hdi-scanner-design.md) |
| 验收 | [implementation-validation.md](implementation-validation.md) |
