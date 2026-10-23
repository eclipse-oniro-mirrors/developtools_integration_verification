# Repos 领域

解析 repo manifest，建立代码仓索引，支撑按仓名、路径、groups 查询及 label/path 最长前缀匹配。

| 项目 | 内容 |
| --- | --- |
| 输入 | `.repo/manifests/default.xml`（含 include 链）+ 每仓 `.git/HEAD`、`.git/config` |
| 依赖 | 无（根级采集器） |
| 查询 | 按 name/path/remote/revision/groups 过滤；label/path 最长前缀匹配 |
| 设计 | [repos-scanner-design.md](repos-scanner-design.md) |
