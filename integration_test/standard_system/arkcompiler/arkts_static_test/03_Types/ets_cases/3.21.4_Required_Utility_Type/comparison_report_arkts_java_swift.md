# 3.21.4 Required Utility Type - ArkTS vs Java vs Swift 对比报告

## 实测

| 语言 | 结果 |
|------|------|
| ArkTS | ✅ 8/9（1 个 spec 不一致保留） |
| Java | ✅ N/A pass=1 |
| Swift | ✅ N/A pass=1 |

## 对比

| Required 字段必填 | ArkTS | Java | Swift |
|------------------|-------|------|-------|
| compile-time Required<T> | ✅ | ❌ | ❌ |
| 模拟方式 | `Required<Interface>` | 无对应 | `let x: T` 非 optional |

## 结论

Java/Swift 均无 `Required<T>` 等价物。