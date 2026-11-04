# 7.21.7 Bitwise Complement — 三语言对比报告

## 1. 概览

`~expr` 一元按位求反运算符。对操作数的每一位取反（0→1, 1→0）。

ArkTS 独有特性：支持 ~float（截断为 int）和 ~double（截断为 long），Java 和 Swift 均不支持浮点按位求反。

| 语言 | byte/short 拓宽 | float/double ~ | bigint ~ | 非数值检查 |
|------|----------------|----------------|---------|-----------|
| **ArkTS** | ✅ → int | ✅ 截断后求反 | ✅ bigint | ✅ 编译时错误 |
| **Java** | ✅ → int | ❌ 编译错误 | ❌ | ✅ 编译时错误 |
| **Swift** | ❌ 无此类型 | ❌ 编译错误 | ❌ | ✅ 编译时错误 |

## 2. 章节对应关系

| 概念 | ArkTS | Java | Swift |
|------|-------|------|-------|
| `~expr` 操作符 | ✅ | ✅ | ✅ (FixedWidthInteger) |
| byte/short → int 拓宽 | ✅ | ✅ | ❌ 无此类型 |
| int → int | ✅ | ✅ | ✅ (Int) |
| long → long | ✅ | ✅ | ✅ (Int64) |
| float → int（截断）| ✅ | ❌ 编译错误 | ❌ 编译错误 |
| double → long（截断）| ✅ | ❌ 编译错误 | ❌ 编译错误 |
| bigint → bigint | ✅ | ❌ | ❌ |
| ~x = (-x)-1 恒等式 | ✅ | ✅ | ✅ |
| 非数值类型拒绝 | ✅ 编译时错误 | ✅ 编译时错误 | ✅ 编译时错误 |

## 3. 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| `~` 存在 | ✅ | ✅ | ✅ |
| byte/short 拓宽 | ✅ → int | ✅ → int | ❌ N/A |
| float/double ~ | ✅ (截断) | ❌ | ❌ |
| bigint ~ | ✅ | ❌ | ❌ |
| ~x = (-x)-1 恒等式 | ✅ | ✅ | ✅ |
| 非数值检查 | ✅ | ✅ | ✅ |
| enum ~ | ⚠️ D 类通过 | ✅ 通过 | ❌ N/A |
| 所有测试通过 | ✅ 20/21 (1 D类) | ✅ 7/7 | ✅ 5/5 |

## 4. 用例对照

### 4.1 float/double 支持 ~ — ArkTS 独有 ⭐⭐⭐

| 语言 | `~float(2.5)` | `~double(2.5)` |
|------|--------------|----------------|
| ArkTS | ✅ 截断 2.5→2→~2=-3 | ✅ 截断 2.5→2→~2=-3(long) |
| Java | ❌ 编译错误: bad operand type | ❌ 编译错误: bad operand type |
| Swift | ❌ 编译错误: cannot apply ~ to Double | ❌ 编译错误: cannot apply ~ to Double |

ArkTS 是唯一允许 ~ 用于浮点数（先截断再求反）的语言。这是显著的差异。

### 4.2 bigint 支持 — ArkTS 独有 ⭐⭐

| 语言 | `~bigint(2n)` |
|------|--------------|
| ArkTS | ✅ `~2n` → `-3n` |
| Java | ❌ 无 bigint 类型 |
| Swift | ❌ 无 bigint 类型 |

### 4.3 ~x = (-x)-1 恒等式 — 三语言一致 ⭐

| 语言 | `~42` = `(-42)-1` |
|------|------------------|
| ArkTS | ✅ ~42 = -43 = (-42)-1 |
| Java | ✅ ~42 = -43 = (-42)-1 |
| Swift | ✅ ~42 = -43 = (-42)-1 |

恒等式对所有整数类型成立。

### 4.4 enum ~ — ArkTS D 类 Spec 不一致 ⭐

| 语言 | `~Color.RED` |
|------|-------------|
| ArkTS (spec) | ❌ 应报编译时错误 |
| ArkTS (实现) | ✅ 编译通过（D 类不一致）|
| Java | ✅ 编译通过（enum 底层 int）|

### 4.5 byte/short → int 拓宽 — ArkTS = Java ⭐

ArkTS 和 Java 的 ~byte/~short 均拓宽为 int。

## 5. 三环境实测结果

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001-008 | compile-pass | ✅ | ✅ | ✅ |
| 021-024 | compile-fail | ✅ | ✅ | ✅ |
| 025 | ~enum (D类) | ⚠️ D 类 | ✅ | ❌ N/A |
| 031 | ~int 值 | ✅ runtime | ✅ | ✅ |
| 032 | ~short 值 | ✅ runtime | ✅ | ❌ N/A |
| 033 | ~long 值 | ✅ runtime | ✅ | ✅ |
| 034 | ~byte 值 | ✅ runtime | ✅ | ❌ N/A |
| 035 | ~float 截断 | ✅ runtime | ❌ N/A | ❌ N/A |
| 036 | ~double 截断 | ✅ runtime | ❌ N/A | ❌ N/A |
| 037 | ~bigint | ✅ runtime | ❌ N/A | ❌ N/A |
| 038 | ~x=(-x)-1 恒等式 | ✅ runtime | ✅ | ✅ |

## 6. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| `~` 存在 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 类型完整度 | ⭐⭐⭐⭐⭐（含 float/double/bigint）| ⭐⭐⭐⭐（仅整型）| ⭐⭐⭐（仅 Int 族）|
| byte/short 拓宽 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ |
| float/double 支持 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ |
| bigint 支持 | ⭐⭐⭐⭐⭐ | ⭐ | ⭐ |
| ~x = (-x)-1 恒等式 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 非数值检查 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |

## 7. 核心结论

1. **ArkTS 最系统**：唯一支持 ~float/~double（截断求反）和 ~bigint 的语言
2. **ArkTS = Java**（整型）：byte/short→int 拓宽、非数值检查一致
3. **~x = (-x)-1 恒等式**：三语言完全一致
4. **Swift**：仅支持整数类型 FixedWidthInteger，Float/Double 不支持 ~
5. **~enum 不一致**：D 类 Spec 不一致（实现允许但 spec 要求报错）
6. **20/21 用例通过，1 D 类**

## 8. ArkTS 设计建议

- float/double 截断求反是特殊优势，需确认是否为有意设计
- ~x = (-x)-1 恒等式对所有类型正确实现
- 建议统一 enum 处理策略（++/-- 拒绝 enum 但 ~ 允许，行为不一致）
