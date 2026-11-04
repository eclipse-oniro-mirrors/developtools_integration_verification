# 7.22 Binary Expressions — 三语言对比报告

## 1. 概览

Binary Expressions（二元表达式）定义了所有二元运算符的类型组合规则。本章是 7.23~7.31 各子章节的类型组合总表。

| 语言 | 隐式数值提升 | 运算符完整性 | bigint 支持 | String+ | &&/|| 扩展 | 短路 |
|:----:|:----------:|:----------:|:----------:|:-------:|:---------:|:----:|
| **ArkTS** | ✅ byte/short→int, 最大类型 | ✅ 完整的二进制运算符集 | ✅ bigint 原生 | ✅ 自动类型转换 | ✅ Extended Conditional | ✅ |
| **Java** | ✅ byte/short→int, 最大类型 | ⚠️ 无 ** 用 Math.pow | ❌ 无原生 bigint | ✅ 自动类型转换 | ❌ 仅 boolean | ✅ |
| **Swift** | ❌ 禁止隐式提升 | ⚠️ 无 ** 用 pow(), 无 >>> | ❌ 无原生 bigint | ⚠️ 需 String() 转换 | ❌ 仅 Bool | ✅ |

## 2. 章节对应关系

| 概念 | ArkTS | Java | Swift |
|------|-------|------|-------|
| `*` 乘法 | ✅ byte→int 提升 | ✅ byte→int 提升 | ✅ 无隐式提升, 需同类型 |
| `/` 除法 | ✅ 类型提升规则 | ✅ 类型提升规则 | ✅ 同类型 |
| `%` 取余 | ✅ 类型提升规则 | ✅ 类型提升规则 | ✅ 同类型 |
| `**` 幂运算 | ✅ 原生运算符 | ❌ Math.pow() | ❌ pow() 函数 |
| `+` 字符串拼接 | ✅ 自动转换 | ✅ 自动转换 | ⚠️ 需 String() |
| `+` `-` 加法/减法 | ✅ 最大类型提升 | ✅ 最大类型提升 | ⚠️ 需同类型 |
| `<<` `>>` `>>>` 移位 | ✅ 结果由 LHS 决定 | ✅ 结果由 LHS 决定 | ⚠️ 无 >>>，需同类型 |
| Relational `<` `>` `<=` `>=` | ✅ boolean 结果 | ✅ boolean 结果 | ✅ Bool 结果 |
| Equality `==` `!=` | ✅ 跨多种类型 | ✅ 多种类型 | ✅ 类型严格 |
| `&` `^` `|` 位运算 | ✅ boolean + 数值 | ✅ boolean + 数值 | ⚠️ 仅数值 |
| `&&` `||` 条件运算 | ✅ boolean + Extended | ✅ 仅 boolean | ✅ 仅 Bool |
| Short-circuit | ✅ | ✅ | ✅ |

## 3. 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| byte/short 隐式提升 → int | ✅ 自动 | ✅ 自动 | ❌ 显式转换 |
| long + int → long | ✅ 自动 | ✅ 自动 | ⚠️ 需 Int64(ic)*ld |
| float + double → double | ✅ 自动 | ✅ 自动 | ⚠️ 需 Double(fe)*fd |
| ** 运算符 | ✅ 原生 | ❌ Math.pow | ❌ pow() |
| bigint + bigint | ✅ bigint 原生 | ❌ BigInteger 类 | ❌ 无 |
| string + int → string | ✅ 自动 | ✅ 自动 | ⚠️ String(42) |
| >>> 无符号右移 | ✅ | ✅ | ❌ 仅无符号类型 |
| boolean & boolean | ✅ | ✅ | ❌ 编译错误 |
| typeof 检查类型 | ✅ typeof | ❌ instanceof | ❌ type(of:) |
| 非 boolean &&/|| ✅ Extended Conditional | ❌ 编译错误 | ❌ 编译错误 |

## 4. 用例对照

### 4.1 类型提升机制 ⭐⭐⭐

最核心差异是隐式数值提升：

```java
// ArkTS & Java: 自动提升
byte a = 3, b = 2
int r = a * b  // byte→int 自动提升

// Swift: 必须同类型
let a: Int8 = 3, b: Int8 = 2
let r = a * b  // Int8*Int8→Int8（结果也是 Int8）
// 要转 Int: Int(a) * Int(b)
```

| 场景 | ArkTS | Java | Swift |
|------|-------|------|-------|
| byte * byte → | int | int | Int8 |
| int + long → | long | long | ❌ 编译错误，需 Int64(i) |

### 4.2 幂运算支持 ⭐

| 语言 | 代码 | 结果类型 |
|:----:|------|:--------:|
| ArkTS | `2 ** 10` | double (typeof="number") |
| Java | `Math.pow(2, 10)` | double |
| Swift | `pow(2.0, 10.0)` | Double |

### 4.3 运算符完整性 ⭐

| 运算符 | ArkTS | Java | Swift |
|:------:|:----:|:----:|:-----:|
| `**` | ✅ 原生 | ❌ Math.pow | ❌ pow() |
| `>>>` | ✅ | ✅ | ❌ |
| boolean `&` `|` | ✅ 按位逻辑 | ✅ 按位逻辑 | ❌ 编译错误 |

### 4.4 Extended Conditional ⭐

ArkTS 独有：`&&`/`||` 接受非 boolean 类型（JS 风格 truthy/falsy）。

| 代码 | ArkTS | Java | Swift |
|------|-------|------|-------|
| `null || 42` | ✅ 42 | ❌ 编译错误 | ❌ 编译错误 |
| `"" || "fallback"` | ✅ "fallback" | ❌ 编译错误 | ❌ 编译错误 |
| `0 && 42` | ✅ 0 | ❌ 编译错误 | ❌ 编译错误 |

### 4.5 短路行为 — 三语言一致 ⭐

| 定律 | ArkTS | Java | Swift |
|:----:|:----:|:----:|:-----:|
| `false && expr` 短路 | ✅ | ✅ | ✅ |
| `true || expr` 短路 | ✅ | ✅ | ✅ |

## 5. 三环境实测结果

| # | 用例 | ArkTS | Java | Swift |
|:-:|------|:-----:|:----:|:-----:|
| 001 | 乘法类型组合 byte*byte→int | ✅ compile-pass | ✅ int | ✅ Int8 |
| 002 | bigint 乘法/幂 | ✅ compile-pass | ❌ N/A | ❌ N/A |
| 003 | 幂运算 double 结果 | ✅ compile-pass | ✅ Math.pow→double | ✅ pow→Double |
| 004 | 字符串拼接 | ✅ compile-pass | ✅ 自动转换 | ⚠️ 需 String() |
| 005 | 加法类型组合 int+long→long | ✅ compile-pass | ✅ long | ⚠️ 需转换 |
| 006 | bigint 加法 | ✅ compile-pass | ❌ N/A | ❌ N/A |
| 007 | 移位 LHS 决定结果类型 | ✅ compile-pass | ✅ | ✅ |
| 008 | bigint 移位 | ✅ compile-pass | ❌ N/A | ❌ N/A |
| 009 | 关系运算符 boolean 结果 | ✅ compile-pass | ✅ | ✅ |
| 010 | 枚举关系比较 | ✅ compile-pass | ✅ enum→boolean | ❌ 无 enum 比较 |
| 011 | 相等运算符类型组合 | ✅ compile-pass | ✅ | ✅ |
| 012 | 相等特殊类型 (null/enum) | ✅ compile-pass | ✅ | ⚠️ Optional==nil |
| 013 | 位运算 int/long/boolean | ✅ compile-pass | ✅ | ⚠️ 无 boolean & |
| 014 | bigint 位运算 | ✅ compile-pass | ❌ N/A | ❌ N/A |
| 015 | 逻辑 &&/|| boolean | ✅ compile-pass | ✅ | ✅ |
| 021 | string * 编译错误 | ✅ compile-fail | ✅ | ✅ |
| 022 | boolean * 编译错误 | ✅ compile-fail | ✅ | ✅ |
| 023 | bigint * int 编译错误 | ✅ compile-fail | ✅ | ✅ |
| 024 | string << int 编译错误 | ✅ compile-fail | ✅ | ✅ |
| 025 | boolean >> int 编译错误 | ✅ compile-fail | ✅ | ✅ |
| 026 | string & string 编译错误 | ✅ compile-fail | ✅ | ✅ |
| 027 | boolean & int 编译错误 | ✅ compile-fail | ✅ | ✅ |
| 031 | Note 1: 操作数顺序 | ✅ runtime | ✅ | ✅ |
| 032 | Note 2: 移位 LHS 依赖 | ✅ runtime | ✅ | ✅ |
| 033 | 短路 &&/|| | ✅ runtime | ✅ | ✅ |
| 034 | Note 5: Extended Conditional | ✅ runtime | ❌ N/A | ❌ N/A |
| 035 | 幂运算 double/数值 | ✅ runtime | ✅ | ✅ |

## 6. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|:-----:|:----:|:-----:|
| 类型灵活性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐ |
| 类型安全性 | ⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 运算符完整性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐ |
| bigint 支持 | ⭐⭐⭐⭐⭐ | ⭐⭐ | ⭐ |
| 隐式类型提升 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐ |
| Extended Conditional | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ |
| 短路行为 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 字符串拼接 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |

## 7. 核心结论

1. **ArkTS 最灵活**：隐式类型提升 + Extended Conditional + bigint 原生支持
2. **Java 最相似**：类型提升规则几乎一致（byte→int, 最大类型规则）
3. **Swift 最严格**：禁止隐式类型转换，所有运算符要求同类型
4. **短路一致**：三个语言 &&/|| 短路行为完全一致
5. **幂运算差异**：仅 ArkTS 有原生 `**`（Java/Swift 用函数）
6. **0 异常**：27 个测试全部通过，无 D 类 Spec 不一致

## 8. ArkTS 设计建议

- 当前二元表达式类型组合规则设计合理，与 Java 的类型提升规则一致
- Extended Conditional Expressions（Note 5）是 ArkTS 的差异化优势
- bigint 原生支持优于 Java 的 BigInteger 和 Swift 的缺失
- 建议在 spec 中明确 `typeof(double)` 返回 `"number"` 而非 `"double"`（当前返回与 ECMAScript 一致）
