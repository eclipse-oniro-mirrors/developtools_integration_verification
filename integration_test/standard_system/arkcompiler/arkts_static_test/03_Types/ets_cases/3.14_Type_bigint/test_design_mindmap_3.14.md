# 3.14 Type bigint - 测试设计思维导图

## 概述

ArkTS §3.14 定义 `bigint` 类型：
- 内置类型，支持理论上的任意大整数
- 可以持有比 `long` 最大值更大的数
- 使用任意精度算术
- **不属于数值类型层次结构**
- 与数值类型之间无隐式转换
- 与非 bigint 类型的 relational operators 非法（编译错误）
- 与非 bigint 类型的 binary arithmetic expressions 非法（编译错误）
- 与非 bigint 的相等比较总是返回 false，且有编译警告
- **双重语义**：创建/赋值/传参时引用语义，操作时值语义
- 是 `Object` 的子类型
- `BigInt` 是 `bigint` 的别名
- 字面量使用 `n` 后缀（如 `123n`）

**Spec 原文关键引用（spec/types.md）：**
> "Type bigint does not belong to the hierarchy of Numeric Types."
> "No implicit conversion between bigint type and numeric types."
> "type bigint has dual semantics"
> "type bigint is a subtype of Object"

## 子规则覆盖

### 1. bigint 字面量与创建
- 正向编译: `let b: bigint = 123n`
- 正向编译: `let b: bigint = 0n`
- 正向编译: `let b: bigint = -123n`
- 正向编译: `new bigint` 创建默认值 0
- 正向编译: `BigInt(5)` 静态方法创建
- 运行时: bigint 字面量值验证
- 运行时: `new bigint` 输出 0

### 2. bigint 是 Object 子类型
- 正向编译: `let o: Object = a_bigint`
- 正向编译: bigint 赋值给 Object 变量
- 运行时: bigint instanceof Object 验证

### 3. bigint 双重语义
- 正向编译: bigint 作为引用类型（创建、赋值、传参）
- 正向编译: bigint 作为值类型（+、-、*、/ 运算）
- 运行时: 引用赋值后修改不影响原变量
- 运行时: 运算结果验证

### 4. bigint 与数值类型无隐式转换 ⭐ 关键差异
- 反向编译: `let b: bigint = 42` (编译错误)
- 反向编译: `let n: int = 123n` (编译错误)
- 反向编译: bigint + int (编译错误)
- 反向编译: bigint - long (编译错误)
- 反向编译: bigint * double (编译错误)

### 5. bigint 与非 bigint 类型关系运算非法 ⭐ 关键差异
- 反向编译: bigint > int (编译错误)
- 反向编译: bigint < long (编译错误)
- 反向编译: bigint >= double (编译错误)
- 反向编译: bigint <= float (编译错误)

### 6. bigint 与非 bigint 类型算术运算非法 ⭐ 关键差异
- 反向编译: bigint + int (编译错误)
- 反向编译: bigint - long (编译错误)
- 反向编译: bigint * float (编译错误)
- 反向编译: bigint / double (编译错误)
- 反向编译: bigint % byte (编译错误)

### 7. bigint 与非 bigint 相等比较 ⭐ 关键差异
- 正向编译: bigint == int (编译警告，返回 false)
- 正向编译: bigint != long (编译警告，返回 true)
- 运行时: bigint 与 int 相等比较结果验证

### 8. bigint 算术运算
- 正向编译: bigint + bigint
- 正向编译: bigint - bigint
- 正向编译: bigint * bigint
- 正向编译: bigint / bigint
- 正向编译: bigint % bigint
- 正向编译: -bigint (一元取负)
- 运行时: 算术运算结果验证

### 9. bigint 关系运算
- 正向编译: bigint > bigint
- 正向编译: bigint < bigint
- 正向编译: bigint >= bigint
- 正向编译: bigint <= bigint
- 正向编译: bigint == bigint
- 正向编译: bigint != bigint
- 运行时: 关系运算结果验证

### 10. bigint 任意精度特性
- 运行时: 超过 long 最大值的 bigint
- 运行时: 超过 long 最小值的 bigint
- 运行时: 大数乘法验证
- 运行时: 大数除法验证

### 11. bigint BigInt 别名
- 正向编译: `let b: BigInt = 123n`
- 正向编译: `BigInt` 作为类型使用
- 运行时: BigInt 与 bigint 行为一致

### 12. bigint 类方法
- 正向编译: `BigInt(5)` 创建 bigint
- 正向编译: `new BigInt(5)` 创建 bigint
- 运行时: 类方法创建值验证

### 13. bigint 边界值与异常场景
- 运行时: 0n 操作
- 运行时: 1n 操作
- 运行时: -1n 操作
- 运行时: 极大值操作

## 分类说明

- **compile-pass**: 验证 bigint 类型的正确用法、合法语法、预期通过编译的场景
- **compile-fail**: 验证 bigint 类型的非法用法、类型不兼容、应产生编译时错误的场景
- **runtime**: 验证 bigint 类型的运行时行为、操作结果、边界值

## 文件命名规范

- `TYP_03_14_XXX_PASS_<DESCRIPTION>.ets`
- `TYP_03_14_XXX_FAIL_<DESCRIPTION>.ets`
- `TYP_03_14_XXX_RUNTIME_<DESCRIPTION>.ets`
