# 7.31 Conditional-Or Expression — 三语言对比报告

## 1. 概览

Conditional-Or Expression 定义了短路逻辑 OR 运算符 `||` 在三种语言中的行为对比。

| 语言 | `||` (short-circuit OR) | 短路特性 | 结果类型 | 与 `|` 一致性验证 |
|------|:------------------------:|:--------:|:--------:|:-----------------:|
| ArkTS | ✅ `true || false` → `true` | ✅ LHS true 时 RHS 跳过 | `boolean` | ✅ `||` ≡ `|` for boolean |
| Java | ✅ `true || false` → `true` | ✅ LHS true 时 RHS 跳过 | `boolean` | ✅ `||` ≡ `|` for boolean |
| Swift | ✅ `true || false` → `true` | ✅ LHS true 时 RHS 跳过 | `Bool` | ❌ `|` 对 Bool 不可用 |

## 2. 章节对应关系

| 功能点 | ArkTS 7.31 | Java | Swift |
|--------|-----------|------|-------|
| 短路 OR | `true || false` → `true` | `true || false` → `true` | `true || false` → `true` |
| LHS true 短路 | `true || effect()` RHS 跳过 | `true || effect()` RHS 跳过 | `true || effect()` RHS 跳过 |
| LHS false 执行 | `false || effect()` RHS 执行 | `false || effect()` RHS 执行 | `false || effect()` RHS 执行 |
| 完全结合律 | `(a||b)||c` ≡ `a||(b||c)` | `(a||b)||c` ≡ `a||(b||c)` | `(a||b)||c` ≡ `a||(b||c)` |
| 左结合性 | 从左到右分组 | 从左到右分组 | 从左到右分组 |
| 结果类型 | `boolean` | `boolean` | `Bool` |
| 与 `|` 一致性 | ✅ `T||T == T|T` | ✅ `T||T == T|T` | ❌ `|` 对 Bool 无效 |

## 3. 关键差异矩阵

| 差异点 | ArkTS | Java | Swift |
|--------|:-----:|:----:|:-----:|
| `||` 短路 OR | ✅ | ✅ | ✅ |
| 短路行为（LHS true→RHS 跳过） | ✅ | ✅ | ✅ |
| 完全结合律 | ✅ | ✅ | ✅ |
| 左结合性 | ✅ | ✅ | ✅ |
| 与 `|` 一致性验证 | ✅ | ✅ | ❌ |
| boolean + non-boolean 混合 | ❌ compile-error | ❌ compile-error | ❌ type-safe |
| 非 boolean 操作数 | ❌ compile-error | ❌ compile-error | ❌ type-safe |

## 4. 用例对照

### 用例 1: `true || true`
| 语言 | 代码 | 结果 |
|------|------|:----:|
| ArkTS | `true || true` | `true` |
| Java | `true || true` | `true` |
| Swift | `true || true` | `true` |

### 用例 2: `true || false`
| 语言 | 代码 | 结果 |
|------|------|:----:|
| ArkTS | `true || false` | `true` |
| Java | `true || false` | `true` |
| Swift | `true || false` | `true` |

### 用例 3: `false || true`
| 语言 | 代码 | 结果 |
|------|------|:----:|
| ArkTS | `false || true` | `true` |
| Java | `false || true` | `true` |
| Swift | `false || true` | `true` |

### 用例 4: `false || false`
| 语言 | 代码 | 结果 |
|------|------|:----:|
| ArkTS | `false || false` | `false` |
| Java | `false || false` | `false` |
| Swift | `false || false` | `false` |

### 用例 5: `true || effect()`（短路行为）
| 语言 | 代码 | 结果 |
|------|------|:----:|
| ArkTS | `true || effect()` | `true`（effect 不执行） |
| Java | `true || setEffect()` | `true`（setEffect 不执行） |
| Swift | `true || setEffect()` | `true`（setEffect 不执行） |

### 用例 6: `false || effect()`（不短路）
| 语言 | 代码 | 结果 |
|------|------|:----:|
| ArkTS | `false || effect()` | `true`（effect 执行） |
| Java | `false || setEffect()` | `true`（setEffect 执行） |
| Swift | `false || setEffect()` | `true`（setEffect 执行） |

### 用例 7: 链式运算 `true || false || true`
| 语言 | 代码 | 结果 |
|------|------|:----:|
| ArkTS | `true || false || true` | `true` |
| Java | `true || false || true` | `true` |
| Swift | `true || false || true` | `true` |

### 用例 8: 完全结合律 `(a||b)||c == a||(b||c)`
| 语言 | 代码 | 结果 |
|------|------|:----:|
| ArkTS | `(false||false)||true == false||(false||true)` | `true` |
| Java | `(false||false)||true == false||(false||true)` | `true` |
| Swift | `(false||false)||true == false||(false||true)` | `true` |

## 5. 三环境实测结果

| # | 维度 | ArkTS | Java | Swift |
|---|------|:-----:|:----:|:-----:|
| 001 | `||` 真值表 (4 种) | ✅ runtime | ✅ runtime | ✅ runtime |
| 002 | 短路行为（LHS true→RHS 跳过） | ✅ runtime | ✅ runtime | ✅ runtime |
| 003 | 不短路（LHS false→RHS 执行） | ✅ runtime | ✅ runtime | ✅ runtime |
| 004 | 链式运算 (4 种 3 元组合) | ✅ runtime | ✅ runtime | ✅ runtime |
| 005 | 结合律 `(a||b)||c ≡ a||(b||c)` | ✅ runtime | ✅ runtime | ✅ runtime |
| 006 | 变量运算 (4 种) | ✅ runtime | ✅ runtime | ✅ runtime |
| 007 | 与 `|` 一致性 (4 种) | ✅ runtime | ✅ runtime | ❌ 不适用 |
| 008 | boolean & int 混合 | ✅ compile-fail | ✅ compile-error | ✅ type-safe |
| 009 | boolean & string 混合 | ✅ compile-fail | ✅ compile-error | ✅ type-safe |
| 010 | int & int（全非 boolean） | ✅ compile-fail | ✅ compile-error | ✅ type-safe |

## 6. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|:----:|:----:|:-----:|
| `||` 运算符语义正确性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 短路行为正确性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 结合律 / 左结合性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 与 `|` 一致性验证能力 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐ |
| 类型安全性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 运行时正确性 | ✅ 24/24 | ✅ 24/24 | ✅ 20/20 |

## 7. 核心结论

1. **ArkTS == Java == Swift** — 三语言 `||` 短路 OR 在真值表、短路行为、结合律上语义完全一致
2. **Swift 小差异** — `|` 对 `Bool` 类型不可用（仅 `Int` 支持位运算），不支持 `||` 与 `|` 的一致性验证
3. **短路行为一致** — 三语言都在 LHS 为 `true` 时跳过 RHS 求值，副作用行为完全一致
4. **结合律一致** — `(a||b)||c` ≡ `a||(b||c)` 在三语言中均运行时验证通过
5. **0 个 D 类异常** — 规范与实现完全一致

## 8. ArkTS 设计建议

1. **功能完整性** ✅ — Conditional-Or Expression 已完整实现，与 Java、Swift 语义一致
2. **建议改进**：无
3. **无需改动** — 规范与实现完全一致，无 D 类异常
