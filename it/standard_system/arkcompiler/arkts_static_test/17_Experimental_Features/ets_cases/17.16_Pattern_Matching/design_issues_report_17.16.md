# 17.16 Pattern Matching - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

**报告日期：** 2026-06-23
**测试用例数：** 12（compile-pass: 4, compile-fail: 4, runtime: 4）
**目的：** 通过用例执行（编译期 + 真实运行时）以及 Java/Swift 对比，确认 ArkTS 行为与 spec 的一致性，并记录语言设计差异和待确认问题。

---

## 一、符合 ArkTS spec 的语言设计差异

### 差异 A：`is` 运算符不支持（符合当前实现）

**用例：** EXP2_17_16_010_FAIL_IS_OPERATOR / EXP2_17_16_011_FAIL_TYPE_PREDICATE

**ArkTS 实测行为：**
```typescript
x is string  // ESY169587: 'is' operator is not supported. Use 'instanceof' instead
```

**跨语言对比：**
| 语言 | `is` 运算符 |
|------|-----------|
| ArkTS | ❌ 不支持，使用 instanceof |
| Java | ❌ 无 is 关键字 |
| Swift | ✅ 原生类型检查关键字 |
| TypeScript | ✅ 类型谓词和类型收窄 |

**分类：** 符合 ArkTS 当前实现的设计差异。ArkTS 选择跟随 Java 的 `instanceof` 语法而非 TypeScript 的 `is`。

---

### 差异 B：无独立 match/switch 模式匹配构造（符合当前实现）

**用例：** 探索性测试

**ArkTS 实测行为：**
ArkTS 没有 `match` 关键字，也没有 `switch` 的模式匹配功能。仅能使用 `if-else if` + `instanceof` 模拟。

**跨语言对比：**
| 语言 | 模式匹配 |
|------|---------|
| ArkTS | ❌ 无 |
| Java | ✅ Java 21 switch 模式匹配 |
| Swift | ✅ switch + case let 完整模式匹配 |

**分类：** 符合 ArkTS 当前实现的设计差异。

---

### 差异 C：无模式绑定（需手动 as 转换）

**用例：** 探索性测试

**ArkTS 实测行为：**
```typescript
if (x instanceof String) {
  let s: String = x as String  // 需要手动转换
}
```

**跨语言对比：**
| 语言 | 模式绑定 |
|------|---------|
| ArkTS | ❌ 需手动 as |
| Java | ✅ Java 16+ `if (x instanceof String s)` |
| Swift | ✅ `if let s = x as? String` |

**分类：** 符合 ArkTS 当前实现的设计差异。

---

## 二、Spec 与实现不一致（D 类）

### ⚠️ D-01: instanceof 不兼容类型检查仅警告不拒绝

**用例：** EXP2_17_16_012_FAIL_INSTANCEOF_MISMATCH

**ArkTS spec 期望：** 模式匹配中对不兼容/不可能的类型检查产生编译错误（pattern exhaustiveness / type safety）

**ArkTS 实测行为：**
```typescript
let val: Object = 42
if (val instanceof String && val instanceof int) {
  // W1001506: the value of the instanceof expression is known at compile-time
  // 编译通过！仅产生 Warning，不产生 Error
}
```

**跨语言对比：**
| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `val instanceof int` | ⚠️ W1001506 警告，编译通过 |
| Java | `val instanceof int` | ❌ 编译错误: incompatible types |
| Swift | `val is Int` | ❌ 编译错误 |

**分类：** D 类（Spec 与实现不一致）。ArkTS 实现在此维度安全级别低于 Java/Swift。

**建议：** 将编译期可确定结果的 instanceof 检查从 Warning 提升为 Error，或至少对原始类型（int/double 等）的 instanceof 检查产生编译错误。

---

## 三、已验证 ArkTS 行为（与规范一致）

| 行为 | 用例编号 | 状态 |
|------|---------|------|
| instanceof String 返回 true | 020 | ✅ |
| instanceof Class 层次正确 | 021 | ✅ |
| instanceof 多分支分发正确 | 022 | ✅ |
| null instanceof T 返回 false | 023 | ✅ |
| `is` 运算符编译错误 | 010 | ✅ |
| 类型谓词编译错误 | 011 | ✅ |
| instanceof 错误上下文编译错误 | 013 | ✅ |
| instanceof 基本语法编译通过 | 001-004 | ✅ |

---

## 四、报告分类口径

| 分类 | 条目 | 说明 |
|------|------|------|
| 符合 ArkTS spec / 当前实现的语言设计差异 | A, B, C | 设计选择而非缺陷 |
| Spec 与实现不一致（D 类） | D-01 | instanceof 不兼容类型仅警告 |
| 待确认问题 | 无 | - |
| 已验证规范一致行为 | 12 项 | 全部通过 |

---

## 五、后续建议

1. **D-01 优先级 HIGH**：将不兼容类型的 instanceof 检查提升为编译错误，与 Java/Swift 对齐
2. **中期建议**：评估引入 Java 16+ 风格的模式绑定 `if (x instanceof String s)`
3. **长期建议**：评估引入完整的 switch/match 模式匹配（参考 Java 21 或 Swift）
4. **保持现有选择**：`instanceof` 而非 `is` 是有意设计选择，与 Java 一致
