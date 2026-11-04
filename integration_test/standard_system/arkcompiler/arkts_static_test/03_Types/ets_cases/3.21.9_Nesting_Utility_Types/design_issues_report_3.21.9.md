# 3.21.9 Nesting Utility Types - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

| 行为 | 用例 | 结果 |
|------|------|------|
| Required<Readonly<Issue>> | 001 | ✅ |
| Required<Readonly> 写入拒绝 | 002 | ✅ |
| Readonly<Partial<>> | 003 | ✅ |
| Partial<Readonly<>> | 004 | ✅ |
| Required 缺字段拒绝 | 005 | ✅ |
| runtime 值正确 | 006 | ✅ |

Java/Swift 均无嵌套 utility types，N/A。