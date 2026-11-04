# 11.2 Enumeration with Explicit Base Type - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## Spec 覆盖

| 规则 | 用例 | |
|------|------|--|
| double/long/byte 显式基类 | 001 | ✅ |
| 非 int 基类无初始化器错误 | 002 | ✅ |
| 初始化器不兼容基类错误 | 003 | ✅ |
| string 基类 int 初始化器错误 | 004 | ✅ |
| string 基类声明+转换 | 005 | ✅ |
| byte/short/long/float/double | 006 | ✅ |
| Object 作基类错误 | 007 | ✅ |
| runtime 值 | 008 | ✅ |

## 跨语言差异

- ArkTS 是唯一支持 `enum: byte/short/long/float` 的语言
- Java 每个枚举值需构造器人工模拟
- Swift rawValue 仅限 Int/String/Double