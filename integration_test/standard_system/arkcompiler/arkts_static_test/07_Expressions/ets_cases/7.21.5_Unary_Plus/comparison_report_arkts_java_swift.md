# 7.21.5 Unary Plus — 三语言对比报告

## 1. 概览

`+expr` 一元正号运算符。三语言均支持，类型拓宽规则有差异。

| 语言 | 语法 | byte/short 拓宽 | long/float/double 保持 | bigint | 非数值检查 |
|------|------|----------------|----------------------|--------|-----------|
| **ArkTS** | `+expr` | ✅ → int | ✅ | ✅ bigint | ✅ 编译时错误 |
| **Java** | `+expr` | ✅ → int | ✅ | ❌ 无 bigint | ✅ 编译时错误 |
| **Swift** | `+expr` | ❌ 无 byte/short | ✅ | ❌ 无 bigint | ✅ 编译时错误 |

## 2. 章节对应关系

| 概念 | ArkTS | Java | Swift |
|------|-------|------|-------|
| `+expr` 操作符 | ✅ | ✅ | ✅ |
| byte/short → int 拓宽 | ✅ (含 byte/short) | ✅ (含 byte/short/char) | ❌ 无此类型 |
| long 保持 long | ✅ | ✅ | ✅ (Int) |
| float/double 保持 | ✅ | ✅ | ✅ (Float/Double) |
| bigint 支持 | ✅ (+bigint) | ❌ | ❌ |
| string 拒绝 | ✅ 编译时错误 | ✅ 编译时错误 | ✅ 编译时错误 |
| boolean 拒绝 | ✅ 编译时错误 | ✅ 编译时错误 | ✅ 编译时错误 |
| null/Object 拒绝 | ✅ 编译时错误 | ✅ 编译时错误 | ❌ N/A |

## 3. 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| `+` 存在 | ✅ | ✅ | ✅ |
| byte/short 拓宽 | ✅ → int | ✅ → int | ❌ N/A |
| long/float/double 保持 | ✅ | ✅ | ✅ |
| bigint 支持 | ✅ +bigint | ❌ | ❌ |
| 非数值检查 | ✅ | ✅ | ✅ |
| null 拒绝 | ✅ 编译错误 | ✅ 编译错误 | ❌ N/A |
| 所有测试通过 | ✅ 17/17 | ✅ 7/7 | ✅ 4/4 |

## 4. 用例对照

### 4.1 类型拓宽 — ArkTS = Java > Swift ⭐⭐

| 语言 | `+byte(10)` 结果类型 | `+short(1)` 结果类型 |
|------|---------------------|---------------------|
| ArkTS | **int**（拓宽） | **int**（拓宽） |
| Java | **int**（拓宽） | **int**（拓宽） |
| Swift | N/A（无 byte/short） | N/A（无 byte/short） |

ArkTS 的 `+byte` 与 Java 一致，拓宽为 int。这与 `++byte`（保持 byte 类型）形成对比——一元 + 触发拓宽，自增/减不触发。

### 4.2 bigint 支持 — ArkTS 独有 ⭐

| 语言 | `+bigint` |
|------|-----------|
| ArkTS | ✅ `+1n` → `1n` |
| Java | ❌ |
| Swift | ❌ |

ArkTS 是唯一支持 +bigint 的语言。bigint 不受拓宽规则影响，保持 bigint 类型。

### 4.3 非数值类型拒绝 — ArkTS = Java ⭐

三语言在非数值类型上一致拒绝（编译时错误）：

| 场景 | ArkTS | Java | Swift |
|------|-------|------|-------|
| `+"hello"` | ❌ 编译错误 | ❌ 编译错误 | ❌ 编译错误 |
| `+true` | ❌ 编译错误 | ❌ 编译错误 | ❌ 编译错误 |
| `+null` | ❌ 编译错误 | ❌ 编译错误 | ❌ 编译错误 |

## 5. 三环境实测结果

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001-007 | compile-pass | ✅ | ✅ | ✅ |
| 021-024 | compile-fail | ✅ | ✅ | ✅ |
| 031 | +int 值不变 | ✅ runtime | ✅ | ✅ |
| 032 | +short → int | ✅ runtime | ✅ | ❌ N/A |
| 033 | +byte → int | ✅ runtime | ✅ | ❌ N/A |
| 034 | +long 保持 | ✅ runtime | ✅ | ✅ |
| 035 | +float/double 保持 | ✅ runtime | ✅ | ✅ |
| 036 | +bigint | ✅ runtime | ❌ N/A | ❌ N/A |

## 6. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| `+` 存在 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 类型拓宽（byte/short）| ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ |
| long/float/double 保持 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| bigint 支持 | ⭐⭐⭐⭐⭐ | ⭐ | ⭐ |
| 非数值检查 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |

## 7. 核心结论

1. **ArkTS = Java**：`+` 语义完全一致（byte/short → int 拓宽，非数值类型检查）
2. **bigint 支持独有**：ArkTS 是唯一支持 `+bigint` 的语言
3. **++ 与 + 区别**：`++` 保持 byte/short 类型，`+` 拓宽 byte/short 为 int（与 Java 一致）
4. **Swift**：无 byte/short 类型，但 Int/Double 的 `+`一致
5. **0 D 类 Spec 不一致**：17/17 全部通过

## 8. ArkTS 设计建议

- 当前实现完全符合 spec 规范
- byte/short → int 拓宽与 Java 一致，是合理的设计
- bigint 支持 + 是特殊优势
- 非数值类型编译时检查与 Java/Swift 一致
- 建议保持当前实现
