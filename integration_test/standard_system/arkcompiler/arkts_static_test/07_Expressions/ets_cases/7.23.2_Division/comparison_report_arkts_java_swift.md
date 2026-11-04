# 7.23.2 Division — 跨语言对比报告 (ArkTS / Java / Swift)

## 1. 概览

| 语言 | 定位 | 类型系统 | 除法语义 |
|:----:|------|---------|---------|
| **ArkTS** | 静态类型 · 华为生态 | 隐式提升 (byte→int→long→float→double) | 整数向零取整，浮点 IEEE 754 |
| **Java** | 静态类型 · JVM 生态 | 隐式提升 (byte→int→long→float→double) | 整数向零取整，浮点 IEEE 754 |
| **Swift** | 静态类型 · Apple 生态 | 显式类型，禁止隐式提升 | 整数向零取整，浮点 IEEE 754 |

## 2. 章节对应关系

| 概念 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 除法运算符 | `/` | `/` | `/` |
| 整数除法向零取整 | ✅ `7/3=2, -7/3=-2` | ✅ 同 ArkTS | ✅ 同 ArkTS |
| INT_MIN/-1 溢出 | ✅ 返回 INT_MIN | ✅ 返回 INT_MIN | ❌ Trap (fatal error) |
| 整数除零运行时 | ✅ ArithmeticError | ✅ ArithmeticException | ❌ Fatal error (不可捕获) |
| 字面量除零编译检测 | ⚠️ 仅 bigint `0n` | ❌ 不支持 | ❌ 不支持 |
| IEEE 754 NaN | ✅ NaN/any=NaN | ✅ 同 ArkTS | ✅ 同 ArkTS |
| IEEE 754 Infinity | ✅ Inf/finite=Inf | ✅ 同 ArkTS | ✅ 同 ArkTS |
| 有符号零 | ✅ +0 / -0 | ✅ +0 / -0 | ✅ +0 / -0 |
| 浮点未定义除零 | ✅ `5/0=Inf` | ✅ 同 ArkTS | ✅ 同 ArkTS |

## 3. 关键差异矩阵

| 维度 | ArkTS vs Java | ArkTS vs Swift |
|------|:------------:|:--------------:|
| 类型提升一致性 | ✅ 完全一致 | ❌ Swift 禁止隐式提升 |
| 整数除零异常类型 | ⚠️ 不同名 (ArithmeticError vs ArithmeticException) | ❌ Swift 不可捕获 |
| INT_MIN/-1 行为 | ✅ 一致 (静默溢出) | ❌ Swift trap |
| 浮点除零 (IEEE 754) | ✅ 一致 | ✅ 一致 |
| NaN 处理 | ✅ 一致 | ✅ 一致 |
| 有符号零 | ✅ 一致 | ✅ 一致 |
| 字面量除零检测 | ✅ 均不检测 (bigint 0n 除外) | ✅ 均不检测 |

## 4. 用例 1:1 对照

### 4.1 类型组合

| # | 场景 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | byte/byte→int | `byte a=6,b=3; let r=a/b; typeof(r)="int"` | `byte ba=6,bb=3; int r=ba/bb;` | `Int8(6)/Int8(3)->Int8` (无提升) |
| 002 | int/int→int | `let r: int=10/3; // 3` | `int r=10/3; // 3` | `10/3 // 3` (Int 默认 64 位) |
| 003 | int/long→long | `let r = a/c; typeof(r)="long"` | `int a=10; long c=100L; long r=a/c;` | `Int64(10)/Int64(100)` |
| 004 | int/float→float | `let r = a/b; typeof(r)="float"` | `float r = 10 / 2.5f;` | `Float(10)/2.5` |
| 005 | double/double→number | `let r = a/b; typeof(r)="number"` | `double r = 10.5/2.0;` | `10.5/2.0` |
| 006 | bigint/bigint→bigint | `let r = 100n/3n; typeof(r)="bigint"` | N/A | N/A |

### 4.2 除法向零取整

| # | 表达式 | ArkTS | Java | Swift |
|---|--------|:-----:|:----:|:-----:|
| 01 | `7/3` | 2 | 2 | 2 |
| 02 | `(-7)/3` | -2 | -2 | -2 |
| 03 | `7/(-3)` | -2 | -2 | -2 |
| 04 | `(-7)/(-3)` | 2 | 2 | 2 |

三种语言完全一致。

### 4.3 INT_MIN / -1 溢出

| 语言 | 代码 | 结果 | 说明 |
|------|------|:----:|------|
| ArkTS | `(-2147483648)/(-1)` | -2147483648 | 静默溢出，返回被除数 |
| Java | `Integer.MIN_VALUE / (-1)` | -2147483648 | 同 ArkTS |
| Swift | `Int32.min / (-1)` | Trap! | 无 `&/` 运算符 |

### 4.4 浮点除法 IEEE 754

| # | 场景 | ArkTS | Java | Swift |
|---|------|:-----:|:----:|:-----:|
| 01 | NaN/5 | NaN | NaN | NaN |
| 02 | Inf/Inf | NaN | NaN | NaN |
| 03 | 0/0 | NaN | NaN | NaN |
| 04 | Inf/3 | +Inf | +Inf | +Inf |
| 05 | 5/0 | +Inf | +Inf | +Inf |
| 06 | 3/Inf | +0 | +0 | +0 |
| 07 | -Inf/3 | -Inf | -Inf | -Inf |
| 08 | 10/(-2) | -5.0 | -5.0 | -5.0 |
| 09 | 1e200/1e-200 | Inf | Inf | Inf |

三种语言 IEEE 754 行为完全一致。

## 5. 三环境实测结果

| # | 用例 | ArkTS | Java | Swift |
|:-:|------|:-----:|:----:|:-----:|
| 001 | byte/byte→int 提升 | ✅ compile-pass | ✅ compile-pass | N/A (无byte隐式提升) |
| 002 | int/int→int | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |
| 003 | int/long→long | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |
| 004 | float/int→float | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |
| 005 | double/int→number | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |
| 006 | bigint/bigint→bigint | ✅ compile-pass | N/A | N/A |
| 021 | string/string | ✅ compile-fail | ✅ compile-fail | ✅ compile-fail |
| 022 | boolean/boolean | ✅ compile-fail | ✅ compile-fail | ✅ compile-fail |
| 023 | string/int | ✅ compile-fail | ✅ compile-fail | ✅ compile-fail |
| 024 | boolean/int | ✅ compile-fail | ✅ compile-fail | ✅ compile-fail |
| 025 | bigint/int mixed | ✅ compile-fail | N/A | N/A |
| 026 | bigint/double mixed | ✅ compile-fail | N/A | N/A |
| 027 | 字面量除零 | ⚠️ D类 | N/A (不支持) | N/A (不支持) |
| 028 | bigint 字面量 0n 除零 | ✅ compile-fail | N/A | N/A |
| 031 | 整数除法向零取整 | ✅ runtime | ✅ runtime | ✅ runtime |
| 032 | INT_MIN/-1 溢出 | ✅ runtime | ✅ runtime | ✅ N/A (trap) |
| 033 | 整数除零抛异常 | ✅ runtime | ✅ runtime | ✅ N/A (fatal error) |
| 034 | bigint 向零取整 | ✅ runtime | N/A | N/A |
| 035 | bigint 除零抛异常 | ✅ runtime | N/A | N/A |
| 036 | 浮点 NaN 除法 | ✅ runtime | ✅ runtime | ✅ runtime |
| 037 | 浮点 Infinity 除法 | ✅ runtime | ✅ runtime | ✅ runtime |
| 038 | 浮点有符号零 | ✅ runtime | ✅ runtime | ✅ runtime |
| 039 | 浮点符号规则+溢出 | ✅ runtime | ✅ runtime | ✅ runtime |
| 040 | 除法不抛异常 | ✅ runtime | ✅ runtime | ✅ runtime |

### 关键差异详解

#### D类: 字面量整数除零 ⭐

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS (spec) | `let x = a / 0` | ❌ Compile-time error |
| ArkTS (实现) | `let x = a / 0` | ✅ 编译通过（不检测） |
| Java | `int x = a / 0` | ✅ 编译通过，运行时 ArithmeticException |
| Swift | `let x = a / 0` | ✅ 编译通过，运行时 fatal error |

#### INT_MIN / -1 溢出 ⭐⭐

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `let r = -2147483648 / (-1)` | -2147483648（静默溢出，返回被除数） |
| Java | `int r = Integer.MIN_VALUE / (-1);` | -2147483648（同 ArkTS） |
| Swift | `Int32.min / (-1)` | ❌ 运行时 trap（fatal error），无 `&/` 运算符 |

#### Swift 整数除零不可捕获 ⭐

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `try { a / 0 } catch(e) {}` | ✅ 可捕获 ArithmeticError |
| Java | `try { a / 0 } catch(ArithmeticException e) {}` | ✅ 可捕获 |
| Swift | `do { a / 0 } catch {}` | ❌ 不可捕获，fatal error |

## 6. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|:----:|:----:|:-----:|
| 类型安全 | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 除法语义清晰度 | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| IEEE 754 符合度 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 整数除零安全 | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐ |
| 溢出安全 | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ (默认 trap) |
| 跨语言一致性 | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐ |

## 7. 核心结论

1. **整数除法向零取整**：ArkTS/Java/Swift 完全一致
2. **IEEE 754 浮点除法**：三种语言完全一致（NaN/Infinity/有符号零/溢出）
3. **INT_MIN/-1 溢出**：ArkTS 与 Java 一致（静默返回 INT_MIN）；Swift 无等效机制
4. **整数除零**：ArkTS(ArithmeticError) 与 Java(ArithmeticException) 均可捕获；Swift 不可捕获
5. **字面量除零检测**：ArkTS 仅检测 bigint `0n`，不检测 int `0`（D 类 Spec 不一致）

## 8. ArkTS 设计建议

- **修复 D 类不一致**：实现 spec 中字面量整数除零的编译时检测，或放宽 spec 允许运行时处理
- **与 Java 误差接近**：除 D 类问题外，ArkTS 除法语义与 Java 高度一致，迁移成本低
- **IEEE 754 正确性**：浮点除法 NaN/Infinity/+0/-0 行为完全符合标准
