# 3.21.6 Record Utility Type - ArkTS vs Java vs Swift 对比报告

## 实测

| 语言 | 结果 |
|------|------|
| ArkTS | ✅ 10/10 |
| Java | ✅ pass=2 |
| Swift | ✅ pass=1 |

## 对比

| 编译期 Record | ArkTS | Java | Swift |
|-------------|-------|------|-------|
| Record<K,V> | ✅ compile-time | ❌ 仅运行时 Map | ❌ 仅运行时 Dictionary |
| Key 类型限制 | ✅ 编译期检查 | ❌ 运行时才容错 | ❌ 字典键值编译期检查不明显 |