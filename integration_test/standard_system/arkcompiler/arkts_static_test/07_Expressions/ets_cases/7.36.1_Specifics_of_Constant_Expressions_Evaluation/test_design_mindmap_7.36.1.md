# 7.36.1 Specifics of Constant Expressions Evaluation - 测试设计思维导图

## 概述

验证 ArkTS 中常量表达式求值的正确性。根据规范，常量表达式中的数值运算符按以下规则求值：double 操作数触发 double 提升；float 操作数触发 float 提升；纯整型常量使用内部 bigint 类型求值；幂运算始终为 double。

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | 整型常量折叠（bigint 内部类型） | 基本算术运算 `10+20`、`100*5`、`1000/10`、`100%30`；复合 `(10+20)*2`；移位 `1<<4`、`64>>3`、`256>>>2`；位运算 `0xFF&0x0F`、`0xF0\|0x0F`、`0xFF^0xF0`；一元 `-42`、`+7`、`~0xFF`；引用 const 变量 `base*3+2`；关系逻辑 `3>1`、`10<=20`、`7==7`、`8!=3`；三元 `3>1?10:20`、`5==5?"yes":"no"` |
| 002 | double 提升 | `double+int→double`（`3.0+5`→8.0）；`double-int→double`（`10.5-3`→7.5）；`double*int→double`（`2.5*4`→10.0）；`double/int→double`（`10.0/3`→~3.333）；`double%int→double`（`10.5%3`）；多操作数混合（`1.0+2+3`→6.0） |
| 003 | 幂运算（始终 double） | `int**int→double`（`2**3`→8.0）；零指数（`5**0`→1.0）；`double**int→double`（`2.0**3`→8.0）；`int**double→double`（`2**3.0`→8.0）；引用 const 幂运算 `baseExp**4`；混合 `double*幂运算`（`2.0*3**2`→先幂运算再乘法） |
| 004 | 混合常量表达式 | Spec 示例 `c>1 && c*2<8`；混合 int/double 子表达式 `d>1.0 && d*2<10.0`；混合幂运算子表达式 `2**3+1`→9.0；嵌套混合 `(3+5)>(2*3)&&(10-2)==(4+4)`；三元与混合 `(3>1)?(10+20):(5*6)`；逻辑与关系混合 `(3<5)&&(10>=8)\|\|(7==6)`；位运算与算术混合 `(0x0F<<4)\|(0x0F&0x03)` |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| — | 无 compile-fail 用例 | 当前设计无反向用例 |

### runtime（验证实际计算值符合常量表达式规则）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 005 | 运行时常量算术值验证 | 13 个断言验证所有运算结果正确 |
| 006 | 运行时类型提升值验证 | 5 个 double 提升断言 + 4 个幂运算断言 |
| 007 | 运行时混合表达式验证 | 8 个断言（含 spec 示例） |

## 三语言对比要点

| 特性 | ArkTS | Java | Swift |
|------|:-----:|:----:|:-----:|
| 常量声明 | `const` | `final` | `let` |
| 整型常量折叠精度 | ⭐⭐⭐ 内部 bigint 任意精度 | ⚠️ int/long 固定精度会溢出 | ⚠️ Int 固定精度会溢出 |
| double 提升 | ✅ `double + int → double` | ✅ `double + int → double` | ✅ `Double + Int → Double` |
| 幂运算 | ✅ 原生 `**` 运算符 | ⚠️ `Math.pow()` 函数 | ⚠️ `pow()` 函数（Foundation） |
| `>>>` 无符号右移 | ✅ 支持 | ✅ 支持 | ❌ 不支持 |
| 三元条件常量 | ✅ `cond ? a : b` | ✅ `cond ? a : b` | ✅ `cond ? a : b` |

## 文件清单

| # | 文件名 | 类别 | 验证点 |
|:-:|--------|:----:|--------|
| 001 | EXP_07_36_01_001_PASS_INT_CONST_FOLDING.ets | compile-pass | 整型常量折叠（加减乘除/移位/位运算/一元/三元） |
| 002 | EXP_07_36_01_002_PASS_DOUBLE_FLOAT_PROMOTION.ets | compile-pass | double 提升 + 幂运算（始终 double） |
| 003 | EXP_07_36_01_003_PASS_MIXED_CONST_EXPR.ets | compile-pass | 混合常量表达式（关系/逻辑/三元/位运算） |
| 004 | EXP_07_36_01_004_RUNTIME_CONST_ARITHMETIC.ets | runtime | 运行时常量算术值验证（13 断言） |
| 005 | EXP_07_36_01_005_RUNTIME_TYPE_PROMOTION.ets | runtime | 运行时类型提升值验证（5 double + 4 幂运算断言） |
| 006 | EXP_07_36_01_006_RUNTIME_MIXED_CONST_EXPR.ets | runtime | 运行时混合表达式验证（8 断言） |

## 分类说明

| 分类 | 用途 | 数量 |
|:----:|------|:----:|
| compile-pass | 验证常量表达式各种形式编译通过 | 3 |
| compile-fail | — | 0 |
| runtime | 验证常量表达式运行时求值结果正确 | 3 |
| **合计** | | **6** |

## 文件命名规范

```
EXP_07_36_01_001_PASS_{DESCRIPTION}.ets       // compile-pass (001-003)
EXP_07_36_01_004_RUNTIME_{DESCRIPTION}.ets    // runtime (004-006)
```

编号规则：001-003 PASS，004-006 RUNTIME（无 compile-fail）

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
