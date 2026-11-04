# 7.5.2 Array Type Inference from Types of Elements - 测试设计思维导图

## 概述

**Spec 定义：**
- 当上下文无法推断数组字面量类型时，从初始化元素的类型推断
- 算法：
  1. 空数组 `[]` (N==0) → 类型无法推断 → compile-time error
  2. 任一元素类型无法确定 → compile-time error
  3. 所有元素同类型 T → T[]
  4. 所有元素为数值类型 → number[]
  5. 否则 → union 类型 (T1 | ... | TN)[]
     - 字面量类型 → 替换为超类型
     - union 中的字面量 → 替换为超类型
     - Union Types Normalization 应用

**核心测试维度：**
1. 所有元素同类型 → T[]
2. 所有元素为数值类型 → number[]
3. 混合类型 → union 数组
4. 字面量类型提升为超类型
5. 空数组 → 编译时错误

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | 相同类型 string | `["a"]` → string[] |
| 002 | 相同类型 int | `[1, 2, 3]` → int[] |
| 003 | 数值类型混合 | `[1, 2.1, 3]` → number[] |
| 004 | 字符串+数字混合 | `["ab", 1, 3.14]` → (string\|number)[] |
| 005 | 字面量类型提升 | `[u]` u为`"A"\|"B"` → string[] |
| 006 | 函数+类混合 | lambda + 类 → union 数组 |
| 007 | 单一元素 | `[42]` → int[] |
| 008 | 相同类型 boolean | `[true, false]` → boolean[] |
| 009 | 数值 int+double+float | `[1, 1.5, 3]` → number[] |
| 010 | 字符串+布尔+整数混合 | `["hello", true, 1]` → union 数组 |
| 011 | 空数组有上下文 | 返回类型 `int[]` 提供上下文 |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 012 | 空数组无上下文 | `let a = []` 无上下文无法推断类型 |

### runtime（验证数组值）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 013 | int 数组值验证 | `[1, 2, 3]` int[] 元素值验证 |
| 014 | number 数组值验证 | `[1.0, 2.0, 3.0]` number[] 元素值验证 |
| 015 | string 数组单一元素 | `["hello"]` 元素值验证 |

## 文件命名规范

```
EXP_07_05_02_YYY_{CATEGORY}_{DESCRIPTION}.ets
```

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
