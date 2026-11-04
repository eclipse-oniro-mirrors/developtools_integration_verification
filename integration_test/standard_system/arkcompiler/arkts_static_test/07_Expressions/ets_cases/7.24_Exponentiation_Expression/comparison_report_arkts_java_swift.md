# 7.24 Exponentiation Expression — 三语言对比报告

## 1. 概览

Exponentiation Expression（幂运算，`**` 运算符）在 ArkTS、Java、Swift 三语言之间存在显著差异。ArkTS 以 `**` 运算符提供双语义（bigint**bigint 和 numeric→double），Java 使用 `Math.pow()` 静态方法，Swift 使用 Foundation 的 `pow()` 函数。

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 语法 | `base ** exp` | `Math.pow(base, exp)` | `pow(base, exp)` |
| bigint 支持 | `bigint ** bigint` 原生支持 | ❌ 无 | ❌ 无 |
| 数值类型提升 | 所有→double | 固定 double→double | 固定 double→double |
| 负指数 bigint | 编译时/运行时错误 | N/A | N/A |
| 运算语义 | 规范定义明确的 IEEE 754+扩展 | IEEE 754 (Math.pow) | IEEE 754 (Foundation.pow) |

## 2. 章节对应关系

| ArkTS | Java | Swift |
|-------|------|-------|
| `a ** b` (numeric) | `Math.pow(a, b)` | `pow(a, b)` |
| `a ** b` (bigint) | N/A | N/A |
| `a ** -1n` | N/A | N/A |

## 3. 关键差异矩阵

| 测试点 | ArkTS | Java | Swift | 差异等级 |
|--------|-------|------|-------|:--------:|
| NaN**0=1 | ✅ | ✅ | ✅ | 一致 |
| (-5)**0=1 | ⚠️ NaN | ✅ 1.0 | ✅ 1.0 | **高** |
| 0**3=+0 | ✅ | ✅ | ✅ | 一致 |
| (-0)**3=-0 | ✅ | ✅ | ✅ | 一致 |
| 0**(-3)=+Inf | ✅ | ✅ | ✅ | 一致 |
| (-0)**(-3)=-Inf | ✅ | ✅ | ✅ | 一致 |
| 0**(-Inf)=+Inf | ✅ | ✅ | ✅ | 一致 |
| 1**NaN=1 | ✅ 1.0 | ❌ NaN | ❌ NaN | **高** |
| 1**Inf=1 | ✅ 1.0 | ❌ NaN | ❌ NaN | **高** |
| (-1)**Inf=1 | ✅ 1.0 | ❌ NaN | ❌ NaN | **高** |
| NaN**2=NaN | ✅ | ✅ | ✅ | 一致 |
| Inf**2=Inf | ✅ | ✅ | ✅ | 一致 |
| (-Inf)**3=-Inf | ✅ | ✅ | ✅ | 一致 |
| 0.5**Inf=+0 | ✅ | ✅ | ✅ | 一致 |
| 2**Inf=+Inf | ✅ | ✅ | ✅ | 一致 |
| (-2)**0.5=NaN | ✅ | ✅ | ✅ | 一致 |
| (-2)**3.0=-8.0 | ⚠️ NaN | ✅ | ✅ | **高** |
| 2**10=1024 | ✅ | ✅ | ✅ | 一致 |
| 右结合 2**3**2=512 | ✅ | ✅ | ✅ | 一致 |
| bigint**bigint | ✅ | N/A | N/A | N/A |

## 4. 用例 1:1 对照

### 关键用例实测代码对比

#### 1) x ** 0 = 1（含 NaN）

| 语言 | 代码 | 结果 |
|------|------|------|
| ArkTS | `Double.NaN ** 0.0` | 1.0 ✅ |
| Java | `Math.pow(Double.NaN, 0.0)` | 1.0 ✅ |
| Swift | `pow(Double.nan, 0.0)` | 1.0 ✅ |

#### 2) (-5)**0 ⚠️（负数基底零指数）

| 语言 | 代码 | 结果 |
|------|------|------|
| ArkTS | `(-5.0) ** 0.0` | NaN ⚠️ |
| Java | `Math.pow(-5.0, 0.0)` | 1.0 ✅ |
| Swift | `pow(-5.0, 0.0)` | 1.0 ✅ |

#### 3) 1**NaN ⚠️（特殊基数与 NaN 指数）

| 语言 | 代码 | 结果 |
|------|------|------|
| ArkTS | `1.0 ** Double.NaN` | 1.0 ✅（Spec 指定） |
| Java | `Math.pow(1.0, Double.NaN)` | NaN ❌（IEEE 754） |
| Swift | `pow(1.0, Double.nan)` | NaN ❌（IEEE 754） |

#### 4) (-2)**3.0 ⚠️（负数基底整数指数）

| 语言 | 代码 | 结果 |
|------|------|------|
| ArkTS | `(-2.0) ** 3.0` | NaN ⚠️ |
| Java | `Math.pow(-2.0, 3.0)` | -8.0 ✅ |
| Swift | `pow(-2.0, 3.0)` | -8.0 ✅ |

## 5. 三环境实测结果

| # | 用例 | ArkTS | Java | Swift |
|:-:|------|-------|------|-------|
| 033 | x ** +/-0 = 1 | ✅ runtime | ✅ | ✅ |
| 033 | (-5)**0 = 1 | ⚠️ NaN（不符 IEEE 754） | ✅ 1.0 | ✅ 1.0 |
| 034 | +/-0 ** 正指数 | ✅ runtime | ✅ | ✅ |
| 035 | +/-0 ** 负指数 | ✅ runtime | ✅ | ✅ |
| 036 | +/-0 ** +/-Inf | ✅ runtime | ✅ | ✅ |
| 037 | +1 ** y = 1 | ✅ runtime | ⚠️ NaN for Inf/NaN | ⚠️ NaN for Inf/NaN |
| 038 | NaN/Inf 基底 | ✅ runtime | ✅ | ✅ |
| 039 | -Infinity ** y | ✅ runtime | ✅ | ✅ |
| 040 | x ** +/-Inf 范围 | ✅ runtime | ✅ | ✅ |
| 041 | 负数**非整数=NaN | ✅ runtime | ✅ | ✅ |
| 041 | (-2)**3.0=-8.0 | ⚠️ NaN | ✅ | ✅ |
| 042 | 基本运算+右结合 | ✅ runtime | ✅ | ✅ |
| 042 | 不抛异常 | ✅ runtime | ✅ | ✅ |
| 031 | bigint 幂运算 | ✅ runtime | N/A | N/A |
| 032 | bigint 负指数异常 | ✅ runtime | N/A | N/A |

## 6. 综合评分

| 维度 | ArkTS | Java | Swift | 备注 |
|------|:-----:|:----:|:-----:|------|
| 数值精度 | ★★★ | ★★★★ | ★★★★ | ArkTS 负数基底 NaN 问题 |
| 类型安全 | ★★★★ | ★★★★ | ★★★★ | 混合类型编译时检测 |
| 运算符直观 | ★★★★★ | ★★★ | ★★★ | ArkTS 直接用 `**` |
| IEEE 754 遵循 | ★★★ | ★★★★★ | ★★★★★ | ArkTS 在部分负数基底场景偏离 |
| bigint 支持 | ★★★★★ | ☆ | ☆ | ArkTS 唯一支持 bigint**bigint |
| 编译时检查 | ★★★★★ | N/A | N/A | 负指数 bigint 编译检测 |

## 7. 核心结论

### 发现 1：ArkTS `**` 运算符的负数基底行为与 IEEE 754 不一致
- **问题**：`(-5.0)**0.0` 返回 NaN（应为 1.0），`(-2.0)**3.0` 返回 NaN（应为 -8.0）
- **影响**：所有负数基底 ** double 指数均返回 NaN，不区分指数是否为整数值
- **Java/Swift**：`Math.pow(-2.0, 3.0) = -8.0`，正确识别双精度整数值

### 发现 2：ArkTS `+1**y=1` 规则覆盖 NaN 和 Inf
- **Spec 明确**：+1 ** y returns 1 for any y（even for NaN）
- **Java/Swift**：`pow(1, NaN)=NaN`，`pow(1, ±Inf)=NaN`（标准 IEEE 754 pow 行为）
- ArkTS 此行为是**刻意规范设计**而非实现缺陷

### 发现 3：ArkTS 唯一原生支持 bigint ** bigint
- Java/Swift 均无对应能力
- bigint 负指数字面量编译检测 ✅

## 8. ArkTS 设计建议

1. **负数基底整数指数**：建议 ArkTS `**` 实现按照 IEEE 754 pow 规则，对负数基底且指数为整数（小数部分为零的 double）时返回有效数学结果，而非一律 NaN
2. **负数基底零指数**：建议按照 IEEE 754 规则 `x**0=1 for all x` 修复 `(-5.0)**0.0=NaN` 的行为
3. **与 Math.pow() 对齐**：建议检查 `**` 与 `Math.pow()` 是否实现同一底层函数，如有差异应统一
