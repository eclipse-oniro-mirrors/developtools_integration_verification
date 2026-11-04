# 7.5.1 Array Literal Type Inference from Context - 测试设计思维导图

## 概述

**Spec 定义：**
- Type of an array literal can be inferred from the context.
- 上下文类型可以是：变量声明类型标注、赋值左值、函数/方法/lambda 返回类型、调用参数类型、cast 目标类型、数组元素或类字段类型。
- 允许的上下文类型：Any, Object, Tuple, FixedArray, ValueArray, ResizableArray, ResizableArray 的超接口, 包含上述类型的 Union

**核心测试维度：**
1. 变量声明类型标注 → `let a: number[] = [1, 2, 3]`
2. 赋值左值类型 → `a = [4, 5]`
3. Cast 目标类型 → `let b = [1, 2, 3] as number[]`
4. 参数类型 → `min([1., 3.14, 0.99])`
5. 数组元素类型 → 多维数组 `[[1, 2], [3, 4]]`
6. Tuple → `[number, string]`
7. FixedArray → `FixedArray<string>`
8. ValueArray → `ValueArray<int>`
9. ResizableArray → `Array<string>` / `string[]`
10. Object[] → 混合元素类型
11. Object / Any → 元素类型推断
12. Union → 恰好一个成员匹配
13. 类型不匹配 → compile-time error
14. 非数组接口 → compile-time error

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | 变量声明类型标注上下文 | `let a: number[] = [1, 2, 3]` 变量声明类型标注推断 |
| 002 | 赋值左值类型上下文 | `a = [4, 5]` 赋值左值类型推断 |
| 003 | Cast 目标类型上下文 | `let b = [1, 2, 3] as number[]` cast 目标类型推断 |
| 004 | 参数类型上下文 | `min([1., 3.14, 0.99])` 参数类型推断 |
| 005 | 数组元素类型上下文 | 多维数组 `[[1, 2], [3, 4]]` 元素类型推断 |
| 006 | Tuple 类型上下文 | `let t: [number, string] = [1, "hello"]` |
| 007 | FixedArray 上下文 | `FixedArray<string> = ["hello", "world"]` |
| 008 | ValueArray 上下文 | `ValueArray<int> = [1, 2]` |
| 009 | Array<string> 泛型上下文 | `let a: Array<string> = ["a", "b"]` |
| 010 | string[] 语法上下文 | `let a: string[] = ["a", "b"]` |
| 011 | Object[] 混合类型上下文 | `let a: Object[] = [1, "a", true]` |
| 012 | Object 上下文 | `let a: Object = [1, 2, 3]` 元素类型推断为 int[] |
| 013 | Any 上下文 | `let a: Any = [1, 2, 3]` |
| 014 | FixedArray<Object> 混合元素 | `FixedArray<Object> = [1, "a"]` |
| 015 | ValueArray<double> 接受 int | `ValueArray<double> = [1, 2]` int 可隐式转换为 double |
| 016 | Union 唯一匹配上下文 | `string[] \| [int, int]` 中 `[1, 2]` 唯一匹配 |
| 017 | 类类型数组上下文 | `let a: Array<aClass> = [new aClass()]` |
| 018 | readonly 数组上下文 | `let a: readonly string[] = ["a", "b"]` |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 019 | Tuple 元素类型不匹配 | `[number, string]` 中元素位置类型错误 |
| 020 | FixedArray 元素类型不匹配 | `FixedArray<string> = [1, 2]` string 不匹配 int |
| 021 | ValueArray 元素类型不匹配 | `ValueArray<int> = [3.14]` double 不匹配 int |
| 022 | ResizableArray 元素类型不匹配 | `string[] = ["text", 2]` int 不匹配 string |
| 023 | Union 上下文歧义 | `number[] \| [number, number]` 两者皆匹配 |
| 024 | 非数组接口上下文 | 非 Array 超接口的上下文类型 |

### runtime（验证数组字面量值）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 025 | 基本数组值验证 | int[] = [1,2,3]，元素值 1,2,3 |
| 026 | Tuple 元素访问 | [int, string] 元素按位置访问 |
| 027 | Cast 上下文数组值 | as number[] 转换后元素值验证 |
| 028 | string[] 字面量值 | string[] 字面量元素值验证 |

## 文件命名规范

```
EXP_07_05_01_YYY_{CATEGORY}_{DESCRIPTION}.ets
```

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
