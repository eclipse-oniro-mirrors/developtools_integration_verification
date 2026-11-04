# 7.27.1 Numeric Relational Operators — ArkTS 与 Java/Swift 行为差异及规范一致性报告

**报告日期：** 2026-07-30
**测试用例数：** 19（6 compile-pass + 5 compile-fail + 8 runtime）
**通过率：** 100%（19/19，0 unexpected）
**编译器：** es2panda + ark VM (WSL)

## 一、已验证规范一致行为

| 行为 | 验证方式 | 结果 |
|------|---------|------|
| int/long/float/double 四种比较 | 001~006 PASS | ✅ |
| 非数值类型编译错误 | 007~011 FAIL | ✅ |
| int 边界值比较 | 013 RUNTIME | ✅ |
| IEEE 754 (NaN, ±Inf, ±0) | 017 RUNTIME | ✅ |
| 混合类型提升 | 018 RUNTIME | ✅ |
| byte/short 自动提升 | 005 PASS + 019 RUNTIME | ✅ |

## 二、跨语言对比

数值关系运算符在 ArkTS/Java/Swift 中行为完全一致（均遵循 IEEE 754 标准），无差异。

## 三、D 类异常

无。19 个用例全部通过，实现与 spec 一致。
