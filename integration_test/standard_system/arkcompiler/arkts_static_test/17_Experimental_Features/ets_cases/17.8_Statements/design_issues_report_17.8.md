# 17.8 Statements - 行为差异及规范一致性报告

## 概述

本章节 17.8 是上下文章节，不引入新的语句类型。测试覆盖了 ArkTS 中所有标准语句形式的编译通过性、编译失败边界条件、以及运行时行为。15 个用例在编译期和运行时均 100% 通过，未发现 spec 与实现之间的不一致，也未发现 ArkTS 与 Java 在标准语句语义上的行为差异。

## 检查清单

| 检查项 | 状态 |
|--------|------|
| compile-pass 用例编译通过 | ✅ 10/10 |
| compile-fail 用例正确报错 | ✅ 2/2 (ESY0209/ESY0165 + ESE0161) |
| runtime 用例运行通过 | ✅ 3/3 (verified) |
| Spec 与实现不一致 | 无 |
| 编译器实现问题 | 无 |
| ArkTS 与 Java 行为差异 | 无 |
| ArkTS 与 Swift 行为差异 | 无（Swift 不可用，推断一致） |

## 行为差异分析

### 差异 1: 无 (所有测试通过，无差异发现)

**描述**: 无

**复现用例 ID**: N/A

**实测结果**: N/A

**跨语言对比表**:

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | N/A | N/A |
| Java | N/A | N/A |
| Swift | N/A | N/A |

**分类**: N/A

**后续建议**: N/A

## 待确认问题

无。

## Spec 与实现不一致

无。所有用例的行为均符合 ArkTS Static Language Specification 对标准语句的描述。

## 编译器实现问题

无。es2panda 编译器和 ark 运行时在本章所有测试中表现正确。

## 设计一致性总结

ArkTS 的标准语句实现与 Java 完全一致:
- `if/else` 条件语义一致
- `while/do-while/for` 循环语义一致
- `for-of` 遍历数组行为一致
- `for-of` 遍历字符串直接迭代字符（优于 Java 的 toCharArray() 方式）
- `switch` 需要 break 阻断 fall-through，与 Java 一致
- `break/continue` 循环外使用产生编译错误，与 Java 一致
- `try-catch-finally` 语义一致
- `return` 语义一致

无任何设计问题或待解决异常需要记录到 `issue_report.md`。
