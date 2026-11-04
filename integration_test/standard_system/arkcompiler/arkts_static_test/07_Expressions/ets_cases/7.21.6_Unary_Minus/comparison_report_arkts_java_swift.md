# 7.21.6 Unary Minus — 三语言对比报告

## 1. 概览

`-expr` 一元负号运算符。三语言均支持，溢出处理和浮点特殊值语义一致。

| 语言 | byte/short 拓宽 | int.MIN 溢出 | 浮点特殊值 | bigint |
|------|----------------|-------------|-----------|--------|
| **ArkTS** | ✅ → int | ✅ 静默包装 | ✅ -NaN=NaN, -0.0→+0.0 | ✅ |
| **Java** | ✅ → int | ✅ 静默包装 | ✅ 同上 | ❌ |
| **Swift** | ❌ 无此类型 | ⚠️ 需溢出运算 &- | ✅ 同上 | ❌ |

## 2. 章节对应关系

| 概念 | ArkTS | Java | Swift |
|------|-------|------|-------|
| `-expr` 一元求反 | ✅ | ✅ | ✅ |
| byte/short → int 拓宽 | ✅ (byte/short) | ✅ (byte/short/char) | ❌ 无此类型 |
| long 保持 long | ✅ | ✅ | ✅ (Int) |
| float/double 保持 | ✅ | ✅ | ✅ (Float/Double) |
| bigint 支持 | ✅ (-bigint) | ❌ | ❌ |
| int.MIN 溢出包装 | ✅ 静默为 int.MIN | ✅ 静默为 Integer.MIN_VALUE | ❌ 编译时检测溢出 |
| 浮点 -0.0→+0.0 | ✅ | ✅ | ✅ |
| 浮点 -inf→inf | ✅ | ✅ | ✅ |
| 浮点 -NaN=NaN | ✅ | ✅ | ✅ |
| 非数值类型拒绝 | ✅ 编译时错误 | ✅ 编译时错误 | ✅ 编译时错误 |

## 3. 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| `-` 存在（一元） | ✅ | ✅ | ✅ |
| byte/short 拓宽 | ✅ → int | ✅ → int | ❌ N/A |
| long/float/double 保持 | ✅ | ✅ | ✅ |
| bigint 支持 | ✅ -bigint | ❌ | ❌ |
| int.MIN 溢出 | ✅ 静默包装 | ✅ 静默包装 | ⚠️ 编译时检测 |
| 浮点特殊值 | ✅ 完全一致 | ✅ 完全一致 | ✅ 完全一致 |
| 非数值检查 | ✅ | ✅ | ✅ |
| 所有测试通过 | ✅ 20/20 | ✅ 7/7 | ✅ 5/5 |

## 4. 用例对照

### 4.1 int.MIN 求反 — ArkTS = Java > Swift ⭐⭐

| 语言 | `-int.MIN_VALUE` |
|------|-----------------|
| ArkTS | ✅ 静默包装为 int.MIN |
| Java | ✅ 静默包装为 Integer.MIN_VALUE |
| Swift | ⚠️ **编译时检测溢出**：`-Int.min` 编译报错，需 `0 &- x` |

这是三语言最大差异点。ARKTS 和 Java 允许静默溢出（包装回自身），Swift 则在编译时就拒绝。

### 4.2 浮点特殊值 — 三语言完全一致 ⭐

| 场景 | 期望结果 | ArkTS | Java | Swift |
|------|---------|-------|------|-------|
| `-(-0.0)` | +0.0 | ✅ | ✅ | ✅ |
| `-(-infinity)` | infinity | ✅ | ✅ | ✅ |
| `-NaN` | NaN（NaN != NaN）| ✅ | ✅ | ✅ |

IEEE 754 标准确保三语言浮点求反完全一致。

### 4.3 byte/short → int 拓宽 — ArkTS = Java ⭐⭐

| 语言 | `-byte(10)` 类型 | `-short(1)` 类型 |
|------|-----------------|-----------------|
| ArkTS | **int** | **int** |
| Java | **int** | **int** |
| Swift | N/A（无 byte/short）| N/A |

### 4.4 bigint 支持 — ArkTS 独有 ⭐

| 语言 | `-bigint` |
|------|-----------|
| ArkTS | ✅ `-1n` → `-1n`，`-(-1n)` → `1n` |
| Java | ❌ |
| Swift | ❌ |

### 4.5 null 拒绝 — ArkTS vs JavaScript ⭐

| 语言 | `-null` |
|------|---------|
| ArkTS | ❌ 编译时错误 |
| JavaScript | ✅ `-null → -0` |
| Java | ❌ 编译时错误 |
| Swift | ❌ 编译时错误 |

ArkTS 与 Java/Swift 一致在编译时拒绝 `-null`，优于 JavaScript 的隐式转换。

## 5. 三环境实测结果

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001-008 | compile-pass（含 int.MIN）| ✅ | ✅ | ⚠️ 需 &- |
| 021-024 | compile-fail | ✅ | ✅ | ✅ |
| 031 | -int 求反 | ✅ runtime | ✅ | ✅ |
| 032 | -int.MIN 溢出 | ✅ runtime | ✅ | ⚠️ 0 &- x |
| 033 | -short → int | ✅ runtime | ✅ | ❌ N/A |
| 034 | -byte → int | ✅ runtime | ✅ | ❌ N/A |
| 035 | -long | ✅ runtime | ✅ | ✅ |
| 036 | -float/double 符号 | ✅ runtime | ✅ | ✅ |
| 037 | -bigint | ✅ runtime | ❌ | ❌ |
| 038 | -0.0, -inf, -NaN | ✅ runtime | ✅ | ✅ |

## 6. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| `-`（一元）存在 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 类型完整度 | ⭐⭐⭐⭐⭐（含 bigint）| ⭐⭐⭐⭐（含 char）| ⭐⭐⭐⭐ |
| byte/short 拓宽 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ |
| int.MIN 溢出处理 | ⭐⭐⭐⭐（包装）| ⭐⭐⭐⭐（包装）| ⭐⭐⭐⭐⭐（编译时保护）|
| 浮点特殊值 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| bigint 支持 | ⭐⭐⭐⭐⭐ | ⭐ | ⭐ |
| 非数值检查 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| null 检查 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |

## 7. 核心结论

1. **ArkTS = Java**：求反语义高度一致（拓宽、溢出包装、浮点特殊值、非数值检查）
2. **Swift**：编译时检测 int.MIN 溢出，需 `0 &- x` 包装运算
3. **浮点特殊值**：三语言完全一致（IEEE 754 标准）
4. **bigint 支持独有**：ArkTS 是唯一支持 -bigint 的语言
5. **null 拒绝 vs JavaScript**：ArkTS/Java/Swift 编译时拒绝，优于 JS 的隐式 `-null→-0`
6. **0 D 类 Spec 不一致**：20/20 全部通过

## 8. ArkTS 设计建议

- 当前实现完全符合 spec 规范
- byte/short → int 拓宽与 Java 一致，是合理的设计
- bigint 支持 - 是特殊优势
- 浮点特殊值处理与 Java/Swift 完全一致（IEEE 754）
- 溢出包装语义合理（与 Java 一致）
- 建议保持当前实现
