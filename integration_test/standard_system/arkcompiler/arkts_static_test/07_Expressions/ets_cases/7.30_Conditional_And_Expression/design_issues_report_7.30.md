# 7.30 Conditional-And Expression — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

### ID-01: Swift & 运算符对 Bool 类型不可用

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_30_006_RUNTIME_COND_AND_SEMANTICS（与 `&` 一致性验证）、cross_lang_verify |
| **实测结果** | Swift 中 `&` 对 `Bool` 类型不可用（仅 `Int` 支持位运算），无法比较 `&&` 与 `&` 的一致性 |
| **差异类型** | 跨语言设计差异 |

**描述**：Swift 中 `&` 仅用于整数按位与，不适用于布尔类型。`Bool` 类型仅支持 `&&`（短路 AND）、`||`（短路 OR）、`!`（NOT）。这与 ArkTS/Java 不同，后者的 `&` 对 boolean 也有效。本子章节未发现 D 类异常，全部 6 个测试用例通过，规范与实现完全一致。

**跨语言对比**：

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `true && true == true & true` | `&&` 与 `&` 对 boolean 可比较一致性 |
| Java | `true && true == true & true` | `&&` 与 `&` 对 boolean 可比较一致性 |
| Swift | `true && true == true & true` | ❌ `&` 对 `Bool` 类型不可用（仅 `Int` 支持位运算），无法比较 |

**分类**：跨语言设计差异

---
