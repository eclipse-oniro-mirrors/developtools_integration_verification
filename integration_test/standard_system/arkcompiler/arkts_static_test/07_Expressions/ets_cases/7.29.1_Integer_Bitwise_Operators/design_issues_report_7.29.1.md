# 7.29.1 Integer Bitwise Operators — ArkTS 与 Java/Swift 行为差异及规范一致性报告

**报告日期：** 2026-07-30
**测试用例数：** 13（7 compile-pass + 2 compile-fail + 4 runtime）
**通过率：** 100%（13/13，0 unexpected）

## 一、已验证规范一致行为

| 行为 | 验证方式 | 结果 |
|------|---------|------|
| int & ^ \| 基本位运算 | 001 PASS + 010 RUNTIME | ✅ |
| long & ^ \| 64 位位运算 | 002 PASS + 011 RUNTIME | ✅ |
| byte/short 提升为 int | 003 PASS | ✅ |
| 混合整数类型 | 004 PASS | ✅ |
| float/double 截断后位运算 | 005 PASS + 013 RUNTIME | ✅ |
| bigint 位运算 | 006 PASS + 012 RUNTIME | ✅ |
| & > ^ > \| 优先级 | 007 PASS | ✅ |
| bigint+数值混合编译错误 | 008 FAIL | ✅ |
| bigint+float 混合编译错误 | 009 FAIL | ✅ |

## 二、跨语言对比

| 特性 | ArkTS | Java | Swift | 说明 |
|------|:-----:|:----:|:-----:|------|
| int & ^ \| | ✅ | ✅ | ✅ | 三者一致 |
| long & ^ \| | ✅ | ✅ | ✅ | 三者一致（Swift Int 为 64-bit）|
| byte/short 提升 | 自动提升 | 自动提升 | 需显式转换 | Swift 设计差异 |
| bigint & ^ \| | ✅ 原生 | BigInteger 方法 | ❌ 无 bigint | ArkTS 优势 |
| float/double 截断 | int/long 截断 | 需显式 cast | 需显式 Int() | 三者实现一致 |

## 三、D 类异常

无。13 个用例全部通过，实现与 spec 一致。
