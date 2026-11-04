# 7.26 Shift Expressions — ArkTS 与 Java/Swift 行为差异及规范一致性报告

**报告日期：** 2026-07-30
**测试用例数：** 27（8 compile-pass + 9 compile-fail + 10 runtime）
**通过率：** 100%（27/27，0 unexpected）
**编译器：** es2panda + ark VM (WSL)
**Spec 依据：** expressions.md §Bitwise Operators

## 一、已验证规范一致行为

| 行为 | 验证方式 | 结果 |
|------|---------|------|
| int << >> >>> 基本移位 | 001 PASS + 013~015 RUNTIME | ✅ |
| long << >> >>> 基本移位 | 002 PASS + 016 RUNTIME | ✅ |
| bigint << >> 移位 | 003 PASS + 020 RUNTIME | ✅ |
| byte/short 自动提升 | 004 PASS | ✅ |
| 移位结合性（左结合） | 005 PASS | ✅ |
| float/double 截断为 int/long | 006 PASS | ✅ |
| 非数值类型移位编译错误 | 007~012 FAIL | ✅ |
| 移位距离掩码 int 0x1f | 017 RUNTIME | ✅ |
| 移位距离掩码 long 0x3f | 018 RUNTIME | ✅ |
| int 溢出 (1<<31=MIN_INT) | 019 RUNTIME | ✅ |
| bigint >>> 编译错误 | 007 FAIL | ✅ |

## 二、跨语言对比差异

| 特性 | ArkTS | Java | Swift |
|------|:-----:|:----:|:-----:|
| int >>> (无符号右移) | ✅ | ✅ | ⚠️ 无对应，用 UInt>> |
| 链式移位左结合 | ✅ | ✅ | ⚠️ 需显式括号 |
| int 距离掩码 5-bit | ✅ | ✅ | ⚠️ 64-bit 平台用 6-bit |
| bigint 移位 | ✅ bigint 原生 | ⚠️ BigInteger.shift | ❌ 无 bigint 类型 |
| byte/short 提升 | 自动提升为 int | 自动提升为 int | 需显式转换 |

## 三、分类汇总

| 条目 | 分类 |
|------|------|
| >>> 无符号右移 | 符合 ArkTS spec 的语言设计差异 |
| 链式移位结合性 | 符合各语言设计规范 |
| 移位距离掩码位数 | 架构差异（32-bit vs 64-bit）|
| bigint 移位 | ArkTS 特有设计 |
| byte/short 提升 | 符合各语言设计规范 |

## 四、D 类异常

无。当前 27 个用例全部通过，实现与 spec 一致。

## 五、关联记录

- 章节级异常汇总：`../../issue_report.md`
- 测试执行报告：`test_report_7.26.md`
- 跨语言验证：`cross_lang_verify/verification_report.md`
- 测试设计：`test_design_mindmap_7.26.md`
