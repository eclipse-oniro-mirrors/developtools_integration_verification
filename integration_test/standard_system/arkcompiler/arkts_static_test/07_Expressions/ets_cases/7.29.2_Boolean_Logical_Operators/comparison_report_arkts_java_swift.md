# 7.29.2 Boolean Logical Operators — 三语言对比报告

## 1. 概览

Boolean Logical Operators 定义了三个 boolean 逻辑运算符 `&`（AND）、`^`（XOR）、`|`（OR）在三种语言中的行为对比。

| 语言 | boolean & (AND) | boolean ^ (XOR) | boolean \| (OR) | 非短路特性 | 结果类型 |
|------|:---------------:|:----------------:|:---------------:|:----------:|:--------:|
| ArkTS | `true & false` → `false` | `true ^ false` → `true` | `true \| false` → `true` | 非短路 | `boolean` |
| Java | `true & false` → `false` | `true ^ false` → `true` | `true \| false` → `true` | 非短路 | `boolean` |
| Swift | 仅 `&&`（短路） | 用 `!=` 模拟 | 仅 `\|\|`（短路） | 短路 | `Bool` |

## 2. 章节对应关系

| 功能点 | ArkTS 7.29.2 | Java | Swift |
|--------|-------------|------|-------|
| boolean AND | `true & false` → `false` | `true & false` → `false` | `true && false` → `false`（短路） |
| boolean XOR | `true ^ false` → `true` | `true ^ false` → `true` | `true != false` → `true`（`!=` 模拟） |
| boolean OR | `true \| false` → `true` | `true \| false` → `true` | `true \|\| false` → `true`（短路） |
| 非短路特性 | 两侧均求值 | 两侧均求值 | 短路（RHS 可能跳过） |
| 与自身运算 | `a & a = a`, `a ^ a = false`, `a \| a = a` | 同 ArkTS | `a && a = a`, `a != a = false`, `a \|\| a = a` |
| 结果类型 | `boolean` | `boolean` | `Bool` |
| boolean + 数值混合 | compile-error | compile-error | type-safe |

## 3. 关键差异矩阵

| 差异点 | ArkTS | Java | Swift |
|--------|:-----:|:----:|:-----:|
| 非短路 boolean `&` | 支持 | 支持 | 仅有短路 `&&` |
| 非短路 boolean `^` | 支持 | 支持 | 用 `!=` 模拟 |
| 非短路 boolean `\|` | 支持 | 支持 | 仅有短路 `\|\|` |
| 短路替代方案 | N/A | N/A | `&&` / `\|\|` / `!=` |
| 两侧均求值（非短路） | 支持 | 支持 | 不支持 |
| `a ^ a = false` | 支持 | 支持 | `a != a = false` |
| boolean + int 混合 | compile-error | compile-error | N/A |
| 结果类型 boolean | 支持 | 支持 | `Bool` |

## 4. 用例对照

### 用例 1: boolean `&`（AND）真值表
| # | 表达式 | ArkTS | Java | Swift |
|:-:|--------|:-----:|:----:|:-----:|
| 001 | `true & true` | `true` | `true` | `true`（&&） |
| 002 | `true & false` | `false` | `false` | `false`（&&） |
| 003 | `false & true` | `false` | `false` | `false`（&&） |
| 004 | `false & false` | `false` | `false` | `false`（&&） |

### 用例 2: boolean `^`（XOR）真值表
| # | 表达式 | ArkTS | Java | Swift |
|:-:|--------|:-----:|:----:|:-----:|
| 005 | `true ^ true` | `false` | `false` | `false`（!=） |
| 006 | `true ^ false` | `true` | `true` | `true`（!=） |
| 007 | `false ^ true` | `true` | `true` | `true`（!=） |
| 008 | `false ^ false` | `false` | `false` | `false`（!=） |

### 用例 3: boolean `|`（OR）真值表
| # | 表达式 | ArkTS | Java | Swift |
|:-:|--------|:-----:|:----:|:-----:|
| 009 | `true \| true` | `true` | `true` | `true`（\|\|） |
| 010 | `true \| false` | `true` | `true` | `true`（\|\|） |
| 011 | `false \| true` | `true` | `true` | `true`（\|\|） |
| 012 | `false \| false` | `false` | `false` | `false`（\|\|） |

### 用例 4: 自身运算
| 语言 | `a & a`（a=true） | `a ^ a`（a=true） | `a \| a`（a=true） |
|------|:-----------------:|:-----------------:|:------------------:|
| ArkTS | `true` | `false` | `true` |
| Java | `true` | `false` | `true` |
| Swift | `true`（&&） | `false`（!=） | `true`（\|\|） |

### 用例 5: boolean & int 混合（仅 ArkTS/Java）
| 语言 | 代码 | 结果 |
|------|------|:----:|
| ArkTS | `true & 1` | compile-error |
| Java | `true & 1` | compile-error |
| Swift | N/A（Boolean & Int 类型安全） | N/A |

## 5. 三环境实测结果

| # | 维度 | ArkTS | Java | Swift |
|---|------|:-----:|:----:|:-----:|
| 001 | `&` 真值表 (4 种) | runtime | runtime | runtime |
| 002 | `^` 真值表 (4 种) | runtime | runtime | runtime |
| 003 | `\|` 真值表 (4 种) | runtime | runtime | runtime |
| 004 | 变量与常量组合 (6 种) | runtime | runtime | runtime |
| 005 | 自身运算 (6 种) | runtime | runtime | runtime |
| 006 | boolean & int 混合 | compile-fail | compile-error | N/A |
| 007 | boolean & string 混合 | compile-fail | compile-error | N/A |

## 6. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|:----:|:----:|:-----:|
| boolean 逻辑运算符完整性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ |
| 非短路运算符支持 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐ |
| 与自身运算正确性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 类型安全性（禁止混合类型） | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 运行时正确性 | 24/24 | 24/24 | 24/24 |

## 7. 核心结论

1. **ArkTS 与 Java 完全等价** — boolean `&`/`^`/`|` 的语义在两个语言中完全一致（非短路、真值表、类型检查）
2. **Swift 缺少非短路 boolean 逻辑运算符** — 仅提供短路 `&&`/`||` 版本，XOR 需用 `!=` 模拟；有副作用时行为不同
3. **全部 24 断言在三环境中均通过** — 真值表逻辑正确性已验证
4. **类型安全性一致** — 三语言均禁止 boolean + 数值/字符串混合运算
5. **0 个 D 类异常** — 规范与实现完全一致

## 8. ArkTS 设计建议

1. **功能完整性** — Boolean Logical Operators 已完整实现
2. **建议改进**：无
3. **无需改动** — 规范与实现完全一致，无 D 类异常
