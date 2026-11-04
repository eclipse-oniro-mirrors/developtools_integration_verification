# 3.21.8 Utility Type Private Fields - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

| 行为 | 用例 | 结笴 |
|------|------|------|
| 实例含 private 赋给 Readonly | 001 | ✅ |
| 对象字面量含 private 字段名编译错误 | 002 | ✅ |
| 只有 public 字段的对象字面量合法 | 003 | ✅ |
| runtime public 字段可读 | 004 | ✅ |

Java/Swift 无 utility type private field 语义，标记 N/A。