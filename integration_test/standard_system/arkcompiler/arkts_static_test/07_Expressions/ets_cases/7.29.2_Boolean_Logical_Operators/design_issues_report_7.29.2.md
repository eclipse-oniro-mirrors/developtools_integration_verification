# 7.29.2 Boolean Logical Operators — ArkTS 与 Java/Swift 行为差异及规范一致性报告

**报告日期：** 2026-07-30
**测试用例数：** 6（3 compile-pass + 2 compile-fail + 1 runtime）
**通过率：** 100%（6/6，0 unexpected）

## 一、已验证规范一致行为

| 行为 | 验证方式 | 结果 |
|------|---------|------|
| boolean & ^ \| 真值表 | 001~002 PASS + 006 RUNTIME | ✅ |
| 链式运算 | 003 PASS | ✅ |
| 非 boolean 类型编译错误 | 004~005 FAIL | ✅ |

## 二、跨语言对比

| 特性 | ArkTS | Java | Swift |
|------|:-----:|:----:|:-----:|
| 非短路 boolean & | ✅ | ✅ | ❌ 仅 && |
| 非短路 boolean \| | ✅ | ✅ | ❌ 仅 \|\| |
| boolean ^ (XOR) | ✅ | ✅ | ❌ 用 != 替代 |
| 混合类型编译错误 | ✅ | ✅ | ✅ |

## 三、D 类异常

无。6 个用例全部通过，实现与 spec 一致。
