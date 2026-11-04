# 3.11 Type void or undefined - 测试设计思维导图

## 概述
本节定义 `void` 与 `undefined` 实际指向同一类型，唯一值为 `undefined`，在规范中可互换使用。

## 核心规则

### 1. void ≡ undefined
- `function f(): void { return undefined }` 合法
- `function f(): undefined { return }` 合法
- `let v: void = undefined` 合法
- `let u: undefined = undefined` 合法
- `v = u`, `u = v` 合法

### 2. void 常用于返回类型
- 函数/方法/lambda 无返回值
- `return` 无表达式
- 无 return 语句

### 3. void/undefined 可作为泛型实参
- `new A<void>(undefined)` 合法
- `new A<undefined>(undefined)` 合法
- `foo<void>(undefined)` 合法
- `F1<void>` 函数类型合法
- `void[]` / `Array<void>` 可由 `[undefined]` 初始化

## 测试点覆盖

### compile-pass
1. void 函数 return undefined
2. undefined 函数 return 无表达式
3. 返回类型省略但 return undefined
4. void/undefined 变量声明与互赋值
5. void 方法与 lambda
6. void/undefined 作为泛型类实参
7. void/undefined 作为泛型函数实参
8. void 作为函数类型实参
9. void[] / Array<void> 数组
10. undefined 作为泛型类型实参

### compile-fail
1. void 函数返回非 undefined 值
2. undefined 函数返回非 undefined 值
3. undefined 赋值给非 nullish 类型
4. void/undefined 数组中放非 undefined
5. void 参数传非 undefined

### runtime
1. void 函数运行时返回 undefined
2. undefined 函数运行时返回 undefined
3. 泛型 A<void> 持有 undefined
4. void[] 内容为 undefined
5. F1<void> 函数调用结果为 undefined

## 编号规划
- compile-pass: 001 ~ 010
- compile-fail: 011 ~ 015
- runtime: 016 ~ 020

## 文件命名规范
`TYP_03_11_YYY_{CATEGORY}_{DESCRIPTION}.ets`