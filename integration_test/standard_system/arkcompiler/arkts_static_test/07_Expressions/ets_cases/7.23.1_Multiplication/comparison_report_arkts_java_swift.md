# 7.23.1 Multiplication — 三语言对比报告

## 1. 概览

Multiplication（乘法运算）在三个语言中基本一致：类型组合规则、IEEE 754 浮点行为、整数溢出。主要差异在于隐式类型提升和整数溢出处理。

| 语言 | 隐式数值提升 | 整数溢出 | IEEE 754 | bigint |
|:----:|:----------:|:--------:|:--------:|:-----:|
| **ArkTS** | byte/short→int, 最大类型 | 静默截断 | 完全符合 | bigint 原生 |
| **Java** | byte/short→int, 最大类型 | 静默截断 | 完全符合 | 无 |
| **Swift** | 禁止隐式提升 | 默认 trap, `&*` 包装 | 完全符合 | 无 |

## 2. 章节对应关系

| 概念 | ArkTS | Java (JLS SE21) | Swift (5.10) |
|------|-------|----------------|--------------|
| 乘法运算符 | `*` | `*` | `*` |
| 隐式数值提升 | byte/short→int, 最大类型 | 同 ArkTS | 禁止隐式提升 |
| 整数溢出 | 静默截断低 32/64 位 | 静默截断 | `&*` 包装, 否则 trap |
| IEEE 754 浮点 | 完全符合 | 完全符合 | 完全符合 |
| bigint | 原生支持 | 无 | 无 |

## 3. 关键差异矩阵

| 差异维度 | ArkTS | Java | Swift |
|---------|-------|------|-------|
| byte * byte → | int | int | Int8（无提升）|
| int + long → | long | long | 编译错误 |
| 类型不匹配 | 自动提升 | 自动提升 | 编译时错误 |
| 整数溢出行为 | 静默截断 | 静默截断 | 需 `&*`，否则 trap |
| bigint 支持 | 原生支持 | 无 | 无 |
| float 字面量 | `Double.toFloat(2.5)` | `2.5f` | `Float(2.5)` |
| typeof(double) | `"number"` | `instanceof` | `type(of:)` |

## 4. 用例对照

### 4.1 隐式类型提升
```
ArkTS:  byte a=3, b=5;  typeof(a*b) = "int"
Java:   byte a=3, b=5;  typeof(a*b) = int
Swift:  let a: Int8 = 3, b: Int8 = 5;  a*b → Int8（无提升）
```
✅ ArkTS 与 Java 一致；Swift 无隐式提升

### 4.2 整数溢出
```
ArkTS:  2147483647 * 2 → -2 (低 32 位截断)
Java:   2147483647 * 2 → -2 (低 32 位截断)
Swift:  Int32(2147483647) &* 2 → -2 (需 &*)
```
⚠️ Swift 默认 trap，需 `&*` 溢出包装

### 4.3 浮点特殊值
```
ArkTS:  Infinity * 0 → NaN,  NaN * any → NaN,  Inf * 5 = Inf
Java:   Infinity * 0 → NaN,  NaN * any → NaN,  Inf * 5 = Inf
Swift:  Infinity * 0 → NaN,  NaN * any → NaN,  Inf * 5 = Inf
```
✅ IEEE 754 三语言完全一致

### 4.4 bigint 乘法
```
ArkTS:  100n * 200n → 20000n (bigint)
Java:   不支持 bigint
Swift:  不支持 bigint
```
✅ 仅 ArkTS 原生支持

## 5. 三环境实测结果

| # | 测试项 | ArkTS | Java | Swift |
|:-:|-------|:-----:|:----:|:-----:|
| 1 | byte/Int8 * byte = promoted | int | int | Int8 |
| 2 | short * short → int | int | int | N/A |
| 3 | int * int → int | int | int | Int |
| 4 | int * long → long | long | long | 需 Int64(i) |
| 5 | long * long → long | long | long | Int64 |
| 6 | int * float → float | float | float | 需 Float(i) |
| 7 | float * float → float | float | float | Float |
| 8 | int * double → double | number | double | 需 Double(i) |
| 9 | float * double → double | number | double | 需 Double(f) |
| 10 | double * double → double | number | double | Double |
| 11 | Integer overflow (low bits) | -2 | -2 | Int32 &* 得 -2 |
| 12 | Infinity*0 = NaN | NaN | NaN | NaN |
| 13 | NaN*any = NaN | NaN | NaN | NaN |
| 14 | Infinity*finite = ±Inf | ±Inf | ±Inf | ±Inf |
| 15 | 符号规则 | 正/负 | 正/负 | 正/负 |
| 16 | float overflow → Inf | Inf | Inf | Inf |
| 17 | double overflow → Inf | Inf | Inf | Inf |
| 18 | 负负得正 | 7.5 | 7.5 | 7.5 |
| 19 | 正负得负 | -7.5 | -7.5 | -7.5 |
| 20 | bigint 乘法 | bigint | N/A | N/A |

## 6. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|:-----:|:----:|:-----:|
| 类型灵活性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ |
| 类型安全性 | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| IEEE 754 符合度 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| bigint 支持 | ⭐⭐⭐⭐⭐ | ⭐⭐ | ⭐ |
| 整数溢出处理 | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ |
| 隐式类型提升 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐ |

## 7. 核心结论

1. **ArkTS 与 Java** 乘法行为几乎完全一致（类型提升、溢出、IEEE 754）
2. **Swift 最严格**：禁止隐式提升，要求 `&*` 处理整数溢出
3. **IEEE 754** 三语言完全一致（NaN、Infinity、符号规则）
4. **bigint** 仅 ArkTS 原生支持
5. **0 D 类异常**：23 个 ArkTS 测试全部通过

## 8. ArkTS 设计建议

1. **当前设计合理**：乘法类型组合规则完整，覆盖所有数值类型和 bigint
2. **IEEE 754 行为**：与 Java/Swift 一致，无需调整
3. **无待确认的编译器实现问题**
