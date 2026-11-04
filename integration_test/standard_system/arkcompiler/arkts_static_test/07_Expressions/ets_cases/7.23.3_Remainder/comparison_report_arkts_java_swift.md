# 7.23.3 Remainder — 三语言对比报告

## 1. 概览

取余运算符 `%` 的基本语义在 ArkTS/Java/Swift 中一致：结果符号与被除数相同，满足 (a/b)*b + (a%b) == a。主要差异在于浮点取余的实现方式、整数除零可捕获性及类型提升规则。

| 语言 | 定位 | 浮点取余实现 | 整数取余符号 |
|:----:|------|-------------|-------------|
| **ArkTS** | 静态类型 · 华为生态 | `%` 运算符 fmod 风格 | 与被除数同号 |
| **Java** | 静态类型 · JVM 生态 | `%` 运算符 fmod 风格 | 与被除数同号 |
| **Swift** | 静态类型 · Apple 生态 | `.truncatingRemainder(dividingBy:)` 方法 | 与被除数同号 |

## 2. 章节对应关系

| 概念 | ArkTS | Java (JLS SE21) | Swift (5.10) |
|------|-------|----------------|--------------|
| 取余运算符 | `%` | `%` | `%` / `.truncatingRemainder` |
| 浮点取余 | `%` 运算符 | `%` 运算符 | 方法调用 |
| 整数取余符号 | 与被除数同号 | 与被除数同号 | 与被除数同号 |
| 除零异常 | ArithmeticError | ArithmeticException | fatal error（不可捕获）|
| 字面量除零检测 | 未检测（D 类）| 不检测 | 不检测 |
| bigint | 原生支持 | 无 | 无 |

## 3. 关键差异矩阵

| 差异维度 | ArkTS vs Java | ArkTS vs Swift |
|---------|:------------:|:--------------:|
| 类型提升一致性 | 完全一致 | Swift 禁止隐式提升 |
| 整数取余除零异常 | 不同名 (ArithmeticError vs ArithmeticException) | Swift 不可捕获 |
| INT_MIN%-1 行为 | 一致 (返回 0) | Swift 内部除法溢出 trap |
| 浮点取余除零 | 一致 (NaN) | 一致 (使用 truncatingRemainder) |
| 浮点取余实现方式 | 一致 (`%` 运算符) | 需 `.truncatingRemainder(dividingBy:)` |
| 符号规则 | 完全一致 | 完全一致 |
| 字面量除零检测 | 均不检测 (int 和 bigint) | 均不检测 |

## 4. 用例对照

### 4.1 取余符号规则

| # | 表达式 | ArkTS | Java | Swift |
|---|--------|:-----:|:----:|:-----:|
| 01 | `10%3` | 1 | 1 | 1 |
| 02 | `(-10)%3` | -1 | -1 | -1 |
| 03 | `10%(-3)` | 1 | 1 | 1 |
| 04 | `(-10)%(-3)` | -1 | -1 | -1 |

✅ 三种语言完全一致：结果符号 = 被除数符号

### 4.2 浮点取余

| # | 场景 | ArkTS | Java | Swift |
|---|------|:-----:|:----:|:-----:|
| 01 | NaN%5 | NaN | NaN | NaN |
| 02 | Inf%3 | NaN | NaN | NaN |
| 03 | 5%0 | NaN | NaN | NaN (truncatingRemainder) |
| 04 | (-10.5)%3 | -1.5 | -1.5 | -1.5 |
| 05 | 3.5%Inf | 3.5 | 3.5 | 3.5 |
| 06 | 0%3.5 | 0.0 | 0.0 | 0.0 |

✅ 浮点取余特殊值三种语言行为一致

### 4.3 类型组合

| # | 场景 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | byte%byte→int | `typeof(r)="int"` | `byte → int` | Int8（无提升）|
| 002 | int%int→int | `10%3=1` | `10%3=1` | `10%3=1` |
| 003 | int%long→long | `typeof(r)="long"` | `long r = ...` | Int64 |
| 004 | double%double→number | `typeof(r)="number"` | double | 方法调用 |
| 005 | bigint%bigint→bigint | `typeof(r)="bigint"` | N/A | N/A |

### 4.4 INT_MIN % -1

| 语言 | 代码 | 结果 | 说明 |
|------|------|:----:|------|
| ArkTS | `(-2147483648) % (-1)` | 0 | 正确返回 0 |
| Java | `Integer.MIN_VALUE % (-1)` | 0 | 同 ArkTS |
| Swift | `Int32.min % (-1)` | Trap! | 内部除法溢出 trap |

⚠️ Swift 因内部除法溢出导致运行时 trap

## 5. 三环境实测结果

| # | 用例 | ArkTS | Java | Swift |
|:-:|------|:-----:|:----:|:-----:|
| 001 | byte%byte→int | ✅ compile-pass | ✅ compile-pass | N/A |
| 002 | int%int→int | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |
| 003 | int%long→long | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |
| 004 | float%float→float | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |
| 005 | double%double→number | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |
| 006 | bigint%bigint→bigint | ✅ compile-pass | N/A | N/A |
| 021 | string%string | ✅ compile-fail | ✅ compile-fail | ✅ compile-fail |
| 022 | boolean%boolean | ✅ compile-fail | ✅ compile-fail | ✅ compile-fail |
| 023 | string%int | ✅ compile-fail | ✅ compile-fail | ✅ compile-fail |
| 024 | boolean%int | ✅ compile-fail | ✅ compile-fail | ✅ compile-fail |
| 025 | bigint%int | ✅ compile-fail | N/A | N/A |
| 026 | bigint%double | ✅ compile-fail | N/A | N/A |
| 027 | int%0 literal | ⚠️ D类 | N/A | N/A |
| 028 | bigint%0n literal | ⚠️ D类 | N/A | N/A |
| 031 | 整数取余符号+恒等式 | ✅ runtime | ✅ runtime | ✅ runtime |
| 032 | INT_MIN%-1=0 | ✅ runtime | ✅ runtime | ✅ N/A (trap) |
| 033 | 整数取余除零 | ✅ runtime | ✅ runtime | ✅ N/A (fatal) |
| 034 | bigint 恒等式 | ✅ runtime | N/A | N/A |
| 035 | bigint%0n 运行时 | ✅ runtime | N/A | N/A |
| 036 | 浮点 NaN/Inf/0 | ✅ runtime | ✅ runtime | ✅ runtime |
| 037 | 浮点符号规则 | ✅ runtime | ✅ runtime | ✅ runtime |
| 038 | 浮点特殊值+公式 | ✅ runtime | ✅ runtime | ✅ runtime |
| 039 | 浮点不抛异常 | ✅ runtime | ✅ runtime | ✅ runtime |

## 6. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|:----:|:----:|:-----:|
| 类型安全 | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 取余语义清晰度 | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐ |
| 浮点取余便利性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ |
| 整数取余安全 | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐ |
| 除零检测 | ⭐⭐ | ⭐⭐ | ⭐⭐ |
| 跨语言一致性 | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐ |

## 7. 核心结论

1. **取余符号规则完全一致**：ArkTS/Java/Swift 结果符号均与被除数相同
2. **浮点取余特殊值一致**：NaN/Infinity/zero 行为三种语言一致
3. **D 类问题**：int%0 和 bigint%0n 字面量均未被编译器检测（bigint%0n 与除法检测结果不一致）
4. **INT_MIN%-1**：ArkTS/Java 返回 0；Swift 因内部除法溢出 trap
5. **Swift 差异大**：浮点取余需方法调用，整数取余除零不可捕获

## 8. ArkTS 设计建议

1. **统一除零检测策略**：除法和取余应使用相同代码路径检测 0 和 0n
2. **与 Java 误差较小**：除 D 类问题外，取余语义与 Java 高度一致
