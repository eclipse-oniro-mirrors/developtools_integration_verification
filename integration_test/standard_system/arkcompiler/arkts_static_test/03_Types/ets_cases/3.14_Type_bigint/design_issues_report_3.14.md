# 3.14 Type bigint - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 概述

本报告记录在测试 ArkTS 3.14 Type bigint 章节时发现的语言设计问题或 Spec 与实现的差异。

---

---

## 报告分类口径

| 分类 | 含义 | 处理方式 |
|------|------|----------|
| 符合 ArkTS spec 的语言设计差异 | 行为与 Java/Swift 不同，但符合 ArkTS spec 或当前明确语义 | 不标为缺陷，仅记录差异 |
| Spec 与实现不一致 | 用例与 spec 要求不一致，且当前实现未按 spec 报错/运行 | 保留 FAIL 用例并记录 issue_report |
| 待确认问题 | 需要补充 stdlib/spec/实现依据后才能定性 | 暂不判定为缺陷 |
| 已验证规范一致行为 | 用例验证 ArkTS 行为符合 spec | 记录为通过项 |

## 设计问题列表

### 问题 1: Spec 与实现不一致 - bigint 与数值类型关系运算

**问题描述**：
Spec 声明 "Relational operators that use an operand of type bigint along with an operand of another type are illegal"，但实际测试发现 `bigint > int` 和 `bigint < double` 是允许的。

**复现用例 ID**：TYP_03_14_014_FAIL_BIGINT_GT_INT, TYP_03_14_016_FAIL_BIGINT_LT_DOUBLE

**用例状态**：⚠️ SPEC 不一致 — 已恢复为 FAIL 用例并标注（原 FAIL 用例被误改为 PASS，已按 v4.3 规则修正）

**实测错误信息**：无（编译通过）

**跨语言对比表**：

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `bigint > int` | ✅ 编译通过（与 Spec 矛盾） |
| Java | `BigInteger.compareTo(int)` | ❌ 编译错误 |
| Swift | `Int64 > Int` | ❌ 编译错误 |

**严重性等级**：MEDIUM

**分析**：
- Spec 明确声明关系运算非法，但实现允许
- 可能是实现的扩展或 Spec 过于严格
- 需要澄清 Spec 或修改实现

**改进建议**：
1. 修改 Spec，允许 bigint 与数值类型的关系运算（返回 false 或进行类型提升）
2. 或修改实现，禁止 bigint 与数值类型的关系运算

---

### 问题 2: bigint 没有 length 属性

**问题描述**：
string 有 length 属性，但 bigint 没有 length 属性。测试中尝试访问 `bigint.length` 导致编译错误。

**复现用例 ID**：TYP_03_14_020

**实测错误信息**：`Property 'length' does not exist on type 'BigInt'`

**跨语言对比表**：

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `bigint.length` | ❌ 编译错误 |
| Java | `BigInteger.toString().length()` | ✅ 需要转换 |
| Swift | `String(b).count` | ✅ 需要转换 |

**严重性等级**：LOW

**分析**：
- bigint 是数值类型，length 概念不适用
- string 的 length 是字符数，bigint 的 "长度" 需要定义（如十进制位数）
- 当前设计合理，无需修改

**改进建议**：
1. 保持现状，bigint 不需要 length 属性
2. 如需获取位数，可使用标准库方法

---

### 问题 3: bigint 双重语义的直观性

**问题描述**：
bigint 具有双重语义（创建/赋值时引用语义，操作时值语义），但与 string 类似，可能增加开发者认知负担。

**复现用例 ID**：TYP_03_14_007, TYP_03_14_025

**实测错误信息**：无（设计选择）

**跨语言对比表**：

| 语言 | 语义模型 | 特点 |
|------|----------|------|
| ArkTS | 双重语义（引用+值） | 赋值是引用，操作是值 |
| Java | 纯引用类型 | 赋值是引用，操作返回新对象 |
| Swift | 纯值类型 | 赋值是拷贝 |

**严重性等级**：LOW

**分析**：
- 与 string 的双重语义设计一致
- 可能需要文档明确说明
- 当前设计合理，无需修改

**改进建议**：
1. 在文档中明确说明 bigint 的双重语义
2. 提供示例代码说明引用和值语义的区别

---

## 总结

| 问题 | 严重性 | 是否需要改进 |
|------|--------|-------------|
| Spec 与实现不一致 - 关系运算 | MEDIUM | 需要澄清 |
| bigint 没有 length 属性 | LOW | 保持现状 |
| 双重语义直观性 | LOW | 文档改进 |

**核心结论**：
ArkTS 的 bigint 类型设计总体合理，主要特色是任意精度和简洁的字面量语法。唯一需要关注的是 Spec 与实现在关系运算上的不一致。

---

**报告生成时间**：2026-06-21
**分析依据**：ArkTS Static Language Specification, Java SE 21, Swift 5.10
