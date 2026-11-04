# 3.21.8 Utility Type Private Fields - ArkTS vs Java vs Swift 对比报告

| Private 字段在 utility 类型中 | ArkTS | Java | Swift |
|----------------------------|-------|------|-------|
| private 字段保留但不可访问 | ✅ | ❌ | ❌ |
| 对象字面量不能包含 private 字段 | ✅ | N/A | N/A |

ArkTS 独有语义。