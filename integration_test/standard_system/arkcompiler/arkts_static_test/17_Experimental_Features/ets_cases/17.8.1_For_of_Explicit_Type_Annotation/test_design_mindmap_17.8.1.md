# 17.8.1 For-of Explicit Type Annotation - 测试设计思维导图

## 概述
ArkTS 允许在 for-of 循环的迭代变量上显式标注类型。标准 for-of 形式为 `for (let v of iterable)`，而显式类型标注形式为 `for (let v: T of iterable)`。如果可迭代对象的元素类型不能赋值给标注类型 `T`，编译器应产生编译时错误。

**规范原文（ArkTS Static Specification 17.8.1）：**
- `for (let str: string of x) { ... }` -- 在 for-of 循环变量上显式标注类型
- 元素类型必须可赋值给变量类型，否则产生编译时错误
- 这扩展了标准 for-of，允许在循环变量上使用显式类型注释

## 子类型覆盖

### 1. 显式类型标注 -- 匹配类型（compile-pass）
- **正向编译**: for-of 数组元素类型与标注类型完全匹配（如 `let v: int of int[]`）
- **正向编译**: for-of 标注 `number` 遍历 `double[]`（number 是 double 的别名）
- **正向编译**: for-of 标注 `Object` 遍历 `int[]`（装箱可赋值）
- **正向编译**: for-of 标注 `string` 遍历 `string[]`
- **正向编译**: for-of 标注 `Any` 遍历任意类型数组

### 2. 显式类型标注 -- 不兼容类型（compile-fail）
- **反向编译**: for-of 标注 `string` 遍历 `int[]`（类型不兼容）
- **反向编译**: for-of 标注 `int` 遍历 `string[]`（类型不兼容）
- **反向编译**: for-of 标注 `char` 遍历 `int[]`（char 和 int 不直接兼容）

### 3. 联合类型标注（compile-pass + runtime）
- **正向编译**: for-of 标注 `int | string` 遍历联合类型数组
- **正向编译**: for-of 标注 `number | null` 遍历可空类型数组

### 4. 运行时验证（runtime）
- **运行时**: for-of 显式类型标注遍历数组，验证每次迭代值和循环次数
- **运行时**: for-of 显式 Object 类型标注遍历不同类型元素的数组
- **运行时**: for-of 显式 Any 类型标注遍历混合类型数组

## 分类说明
- **compile-pass**（.ets 文件必须编译成功）
- **compile-fail**（.ets 文件必须产生编译时错误）
- **runtime**（.ets 文件必须编译成功并通过 ark VM 实际运行 + assert 断言）

## 文件命名规范
- 前缀: `EXP2_`（17 Experimental Features）
- 格式: `EXP2_17_08_01_YYY_{CATEGORY}_{DESCRIPTION}.ets`
- 编号顺序: PASS（001~）→ FAIL（接续）→ RUNTIME（接续）
- 章节号: 17.08.01

## 预期用例清单

| YYY | 分类 | 描述 | 预期结果 |
|-----|------|------|---------|
| 001 | PASS | 显式 int 类型遍历 int[] 数组 | compile-pass |
| 002 | PASS | 显式 string 类型遍历 string[] 数组 | compile-pass |
| 003 | PASS | 显式 number 类型遍历 double[] 数组（number 是 double 别名） | compile-pass |
| 004 | PASS | 显式 Object 类型遍历 int[] 数组（装箱） | compile-pass |
| 005 | PASS | 显式 Any 类型遍历混合类型数组 | compile-pass |
| 006 | PASS | 显式联合类型 int\|string 遍历联合类型数组 | compile-pass |
| 007 | PASS | 标准 for-of 无显式类型（对照） | compile-pass |
| 008 | FAIL | 显式 string 类型遍历 int[] 数组（类型不兼容） | compile-fail |
| 009 | FAIL | 显式 int 类型遍历 string[] 数组（类型不兼容） | compile-fail |
| 010 | FAIL | 显式 char 类型遍历 int[] 数组（char 与 int 不兼容） | compile-fail |
| 011 | RUNTIME | for-of 显式 int 类型遍历 int[]，验证迭代值和次数 | runtime |
| 012 | RUNTIME | for-of 显式 Any 类型遍历混合数组，验证迭代值 | runtime |
| 013 | RUNTIME | for-of 显式 Object 类型遍历 int[]，验证装箱和迭代 | runtime |
