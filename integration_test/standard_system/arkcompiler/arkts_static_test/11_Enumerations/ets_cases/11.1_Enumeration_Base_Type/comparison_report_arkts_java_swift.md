# 11.1 Enumeration Base Type - ArkTS vs Java vs Swift 对比报告

## 实测

| 语言 | 文件 | 结果 |
|------|------|------|
| ArkTS | TYP_03_21_01_001~011 | ✅ 8/8 |
| Java | `cross_lang_verify/JavaEnumBaseType.java` | ✅ pass=3 |
| Swift | `cross_lang_verify/SwiftEnumBaseType.swift` | ✅ pass=3 |

## 对比

| 基类推断 | ArkTS | Java | Swift |
|---------|-------|------|-------|
| int 自动递增 | ✅ ordinal + int 隐式 | ✅ ordinal（int 仅成员次序） | ✅ rawValue: Int（需显式） |
| string 基类 | ✅ `A="a"` 隐式转换 | ❌ 需 .name() / 自定义 | ✅ rawValue: String |
| int+string 混合错误 | ✅ 编译错误 | N/A | N/A |
| 多数值基类（byte/short/long/float/double） | ✅ 到 11.2 | ❌ | ❌ |