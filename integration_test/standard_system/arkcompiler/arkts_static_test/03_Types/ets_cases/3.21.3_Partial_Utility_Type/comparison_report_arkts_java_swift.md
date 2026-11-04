# 3.21.3 Partial Utility Type - ArkTS vs Java vs Swift 对比报告

## 实测

| 语言 | 结果 |
|------|------|
| ArkTS | ✅ 9/10（1 个 spec 不一致保留） |
| Java | ✅ pass=2 N/A |
| Swift | ✅ pass=2 N/A |

## 对比

| Partial 字段可选 | ArkTS | Java | Swift |
|-----------------|-------|------|-------|
| compile-time Partial<T> | ✅ | ❌ Partial 不是 Java 类型 | ❌ 无 Partial |
| 类似方式 | `Partial<Interface>` | `Optional` / null 字段 | `T?` 可选属性 |

## 结论

Java/Swift 均无 `Partial<T>` 等价物。ArkTS 的 Partial 能编译期将 field 变 optional 并保留类型安全。