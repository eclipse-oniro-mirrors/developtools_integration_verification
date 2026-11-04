# 11 Enumerations - ArkTS vs Java vs Swift 对比报告

## 实测

| 语言 | 结果 |
|------|------|
| ArkTS | ✅ 16/16 |
| Java | ✅ pass=6 |
| Swift | ✅ pass=4 |

## 对比

| 枚举特性 | ArkTS | Java | Swift |
|---------|-------|------|-------|
| 显式基类 | ✅ | ❌（enum 不能指定 rawValue 类型） | ✅ rawValue: String/Int |
| 自动递增 | ✅ | ✅ ordinal | ❌ 无自动值 |
| int→数值转换 | ✅ | ❌ 必须 .ordinal() | ❌ |
| string→string | ✅ | ❌ 必须 .name() | ✅ .rawValue |
| const enum | ❌ 暂不支持 | ❌ | ❌ |
| values() | FixedArray<T> | T[] | CaseIterable.allCases |
| fromValue() | ✅ | ❌ | ❌ |
| getName() | ✅ | ✅ .name() | ✅ String(describing:) |

ArkTS enum 在隐式数值/string 转换上比 Java/Swift 更灵活。