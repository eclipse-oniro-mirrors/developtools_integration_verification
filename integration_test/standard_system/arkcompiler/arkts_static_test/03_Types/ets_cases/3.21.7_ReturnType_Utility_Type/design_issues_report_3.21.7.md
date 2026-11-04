# 3.21.7 ReturnType Utility Type - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

| 行为 | 用例 | 结果 |
|------|------|------|
| `ReturnType<() => string>` → string | 001 | ✅ |
| `ReturnType<() => int\|string>` → int\|string | 002 | ✅ |
| `ReturnType<() => void>` → void | 003 | ✅ |
| `ReturnType<(a,b) => int>` → int | 004 | ✅ |
| `ReturnType<never>` → never | 005 | ✅ |
| `ReturnType<string>` 编译错误 | 006 | ✅ |
| 泛型默认参数 | 007 | ✅ |
| runtime 值正确 | 008,009 | ✅ |

Java/Swift 均无编译期 ReturnType，标记 N/A。