# 11.4 Enumeration Methods - ArkTS vs Java vs Swift 对比报告

| 方法 | ArkTS | Java | Swift |
|------|-------|------|-------|
| values() / allCases | ✅ FixedArray<T> | ✅ T[] | ✅ CaseIterable |
| getValueOf / valueOf(name) | ✅ | ✅ valueOf | ❌ 需自定义 |
| fromValue(value) | ✅ | ❌ 需自定义 | ❌ 需自定义 |
| toString() | ✅ 值转 string | ✅ name | ✅ String(describing:) |
| valueOf() | ✅ 原始值 | ❌ 需 ordinal/自定义 | ✅ rawValue |
| getName() | ✅ 成员名 | ✅ name() | ✅ String(describing:) |
| 按值索引 Color[c] | ✅ | ❌ | ❌ |
| 同值后优先 | ✅ | ❌ | ❌ |