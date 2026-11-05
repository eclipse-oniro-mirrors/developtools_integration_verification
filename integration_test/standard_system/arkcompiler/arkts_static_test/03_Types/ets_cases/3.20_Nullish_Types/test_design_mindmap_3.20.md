# 3.20 Nullish Types - 测试设计思维导图

## 概述
Nullish Types 是 union types 的特殊形式，用于表示类型 T 的可空版本：
- `T | undefined`
- `T | null`
- `T | undefined | null`

推荐使用 `T | undefined`。

## 核心规则

### 1. nullish 类型形式
- `T | undefined`：T 或 undefined
- `T | null`：T 或 null
- `T | undefined | null`：T 或 undefined 或 null

### 2. non-nullish 类型限制
- 除 Any 外所有预定义类型都是 non-nullish
- 所有用户定义类型都是 non-nullish
- non-nullish 类型运行时不能持有 null/undefined

### 3. nullish 类型不兼容 Object
- `Object = null` 编译错误
- `Object = undefined` 编译错误
- `Object = null|undefined` 编译错误
- `Object = T|null|undefined` 编译错误

### 4. nullish-safe 操作
- safe field access: `obj?.field`
- safe method call: `obj?.method()`
- safe indexing: `arr?.[0]`
- safe function call: `f?.()`

### 5. 转换回 non-nullish
- cast expression
- ensure-not-nullish: `expr!`

### 6. fallback
- nullish coalescing: `expr ?? fallback`

## 测试点覆盖

### compile-pass
- T|undefined / T|null / T|null|undefined 声明和赋值
- 派生类赋值给 Base|null
- safe field/method/index/function call
- `??` nullish coalescing
- `!` ensure-not-nullish
- cast from nullish to non-nullish

### compile-fail
- non-nullish 类型赋 null/undefined
- Object 接收 null/undefined/nullish union
- 直接访问 nullish 成员（不使用 ?.）
- nullish 赋值给 non-nullish T
- `??` 与 `||` 不加括号混用

### runtime
- `??` 左侧非 nullish 懒求值
- `??` 左侧 null/undefined 使用右侧
- safe access null/undefined 返回 undefined
- `!` 非 nullish 成功，nullish 抛 NullPointerError
- safe function call 行为

## 编号规划
- compile-pass: 001~010
- compile-fail: 011~016
- runtime: 017~022

## 文件命名规范
`TYP_03_20_YYY_{CATEGORY}_{DESCRIPTION}.ets`