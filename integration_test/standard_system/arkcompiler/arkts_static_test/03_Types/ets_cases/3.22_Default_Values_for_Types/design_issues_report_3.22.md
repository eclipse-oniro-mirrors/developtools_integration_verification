# 3.22 Default Values for Types - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

| 行为 | 用例 | 结果 |
|------|------|------|
| int/byte/short/long 默认 0 | 001 | ✅ |
| float/double 默认 0.0 | 001 | ✅ |
| boolean 默认 false | 001 | ✅ |
| Any/void/undefined 默认 undefined | 002 | ✅ |
| 类字段 T\|undefined 默认 undefined | 003 | ✅ |
| 引用类型无默认值 | 004 | ✅ |
| 未初始化引用类型使用拒绝 | 005 | ✅ |

## 跨语言对比

| 默认值 | ArkTS | Java（实测） | Swift |
|--------|-------|-------------|-------|
| int 默认 0 | ✅ | ✅ field | N/A（必须初始化）|
| boolean 默认 false | ✅ | ✅ field | N/A |
| 引用类型默认 | ❌（无默认）| ❌（null field）| N/A |
| 本地变量默认值 | ❌（必须赋值后使用）| ❌（必须赋值后使用）| ❌（必须初始化）|