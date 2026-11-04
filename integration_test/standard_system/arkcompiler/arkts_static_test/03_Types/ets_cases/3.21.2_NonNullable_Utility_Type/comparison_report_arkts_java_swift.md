# 3.21.2 NonNullable Utility Type - ArkTS vs Java vs Swift 对比报告

## 实测

| 语言 | 结果 |
|------|------|
| ArkTS | ✅ 9/9 |
| Java | ✅ pass=3 |
| Swift | ✅ pass=3 |

## 对比

| 编译期 null 移除 | ArkTS | Java | Swift |
|------------------|-------|------|-------|
| NonNullable\<T\> | ✅ | ❌ Optional 是运行时 | ❌ T? 是编译期语法，无泛型工具 |
| 类似用法 | `NonNullable<T\|null\|undefined>` | `Optional.ofNullable(x).orElseThrow()` | 赋值前判断 |

## 结论

`NonNullable<T>` 是 ArkTS 编译期工具类型，Java/Swift 无同类概念。Swift 的 `T?` 类似但非泛型 utility。