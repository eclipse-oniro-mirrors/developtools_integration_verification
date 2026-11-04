# 7.22 Binary Expressions - 测试设计思维导图

## 概述

Binary Expressions（二元表达式）定义了所有二元运算符的操作数类型组合规则。本章为 7.23~7.31 各子章节的**类型组合总表**，涵盖了 *、/、%、**、+、-、<<、>>、>>>、<、<=、>、>=、==、===、!=、!==、&、^、|、&&、|| 等所有二元运算符。

**核心规则（类型组合表）：** 只有表中列出的类型组合是合法的。未列出的组合：
- 编译时检测到 → compile-time error
- 运行时检测到 → runtime error

**5 个重要注释：**
1. 除移位运算符外，操作数顺序不影响结果类型
2. 移位运算符的结果类型取决于左操作数类型
3. 相等运算符定义为任意类型可用，但表中列出的组合有具体行为
4. 含 null/undefined 的相等运算见 "Extended Equality with null or undefined"
5. && 和 || 除 boolean 外的类型参见 "Extended Conditional Expressions"

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | 乘法类型组合 | byte*byte→int, short*int→int, long*int→long, float*int→float, double*int→double, bigint*bigint→bigint |
| 002 | 幂运算符类型组合 | int**int→double, float**double→double, bigint**bigint→bigint |
| 003 | 字符串拼接 | string+string→string, string+int→string, string+boolean→string, string+null/undefined→string |
| 004 | 加法/减法类型组合 | byte+byte→int, int+long→long, long+float→float, float+double→double, bigint+bigint→bigint |
| 005 | 移位运算符类型组合 | int<<int→int, long>>int→long, bigint<<bigint→bigint |
| 006 | 关系运算符类型组合 | int<int→boolean, string>string→boolean, boolean<=boolean→boolean, enum≥enum→boolean |
| 007 | 相等运算符类型组合 | int==int→boolean, boolean!=boolean→boolean, bigint===bigint→boolean, char==char→boolean, enum!=enum→boolean, null==null→boolean |
| 008 | 位运算符类型组合 | boolean&boolean→boolean, int|int→int, long^long→long, bigint&bigint→bigint |
| 009 | 条件与/或类型组合 | boolean&&boolean→boolean, boolean||boolean→boolean |
| 010 | 枚举关系运算符类型组合 | enum≤enum→boolean |
| 011 | 相等运算符 byte/short/char/long 组合 | byte==byte→boolean, char==char→boolean 等 |
| 012 | 相等运算符特殊类型（enum/null/undefined） | enum==enum→boolean, null==null→boolean 等 |
| 013 | 位运算符类型组合（boolean/int/long） | boolean&boolean→boolean, int|int→int, long^long→long |
| 014 | bigint 位运算 | bigint&bigint→bigint, bigint^bigint→bigint, bigint|bigint→bigint |
| 015 | 条件与/或类型组合 | boolean&&boolean→boolean, boolean||boolean→boolean |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 021 | 字符串乘法 | string * string — 编译错误 |
| 022 | 布尔乘法 | boolean * boolean — 编译错误 |
| 023 | bigint 混合乘法 | bigint * int — 混合 bigint/非 bigint 编译错误 |
| 024 | 字符串移位 | string << int — 编译错误 |
| 025 | 布尔移位 | boolean >> int — 编译错误 |
| 026 | 字符串按位与 | string & string — 编译错误 |
| 027 | 混合类型位运算 | boolean & int — 混合类型编译错误 |

### runtime（验证实际计算值符合类型组合规则）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 031 | Note 1: 操作数顺序不影响结果类型 | a+b 和 b+a 结果类型一致（对非移位运算符） |
| 032 | Note 2: 移位结果类型取决于 LHS | int<<long→int（结果类型由 LHS int 决定） |
| 033 | 短路 &&/|| | false&&expr 短路, true||expr 短路 |
| 034 | Note 5: Extended Conditional | 非 boolean 类型的 &&/|| 短路行为 |
| 035 | 幂运算返回 double | int**int→number(double) 类型 |

## 文件命名规范

- 前缀：`EXP_`（07_Expressions）
- 格式：`EXP_07_22_YYY_{CATEGORY}_{DESCRIPTION}.ets`
- 编号：PASS = 001~015, FAIL = 021~027, RUNTIME = 031~035

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
