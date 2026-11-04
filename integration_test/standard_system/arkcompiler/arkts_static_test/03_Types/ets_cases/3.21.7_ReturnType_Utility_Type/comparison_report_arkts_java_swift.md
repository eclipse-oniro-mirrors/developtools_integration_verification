# 3.21.7 ReturnType Utility Type - ArkTS vs Java vs Swift 对比报告

| 编译期返回类型提取 | ArkTS | Java | Swift |
|------------------|-------|------|-------|
| ReturnType<T> | ✅ | ❌ | ❌ |
| 类似方式 | `ReturnType<()=>T>` | `Method.getReturnType()` 反射 | 无 |

ArkTS 独有编译期 ReturnType。