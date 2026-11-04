# 3.12 Type null - 测试设计思维导图

## 概述
Type `null` 是 ArkTS 的预定义类型，其唯一值是字面量 `null`。null 类型主要用于 TS 兼容性，ArkTS 推荐使用 `undefined` 替代。null 是 nullish 类型之一，可参与联合类型 `T | null`。null 类型不兼容 `Object`，不能赋值给非空类型。

**Spec 定义要点（spec/types.md 3.12 节 + Nullish Types 节）：**
1. `null` 的唯一值是字面量 `null`
2. `null` 类型仅用于 TS 兼容性，推荐使用 `undefined`
3. `null` 作为类型标注或联合类型成员不推荐（但合法）
4. `undefined` 性能优于 `null`
5. nullish 类型（`T | null`、`T | undefined`、`T | null | undefined`）不兼容 `Object`
6. `null` 字面量类型是自身子类型（semantics.md: `null <: null`）
7. `null` 是 `Any` 的子类型（`Any` 是所有类型的超类型，包括 nullish）
8. `null` 不是 `Object` 的子类型（`Object` 排除 nullish 类型）
9. `NonNullable<null>` = `never`
10. `null` 在 switch-case 中可作为匹配值
11. `null` 与 `undefined` 语义不同，不可互换

## 子规则覆盖

### 1. null 字面量声明与赋值
- 正向编译: `let x: null = null` 声明、赋值
- 反向编译: `let x: null = 1` 非法赋值、`let x: null = undefined` 非法赋值
- 运行时: null 变量始终为 null

### 2. null 在联合类型中的使用（T | null）
- 正向编译: `int | null`、`string | null`、`Object | null` 声明和双向赋值
- 反向编译: 将 `T | null` 赋值给 `Object`（nullish 不兼容 Object）
- 运行时: null 联合类型的类型收窄（`if (x != null)`）

### 3. null 与 null | undefined 三重联合
- 正向编译: `T | null | undefined` 声明、赋值 null 和 undefined
- 反向编译: 将 `T | null | undefined` 赋值给 `Object`
- 运行时: 三重联合类型中 null 和 undefined 的区分

### 4. null 赋值给非空类型
- 反向编译: `let n: int = null`、`let s: string = null`、`let o: Object = null`、函数参数传 null 给非空类型

### 5. null 与 Object 不兼容
- 正向编译: `let o: Object | null = null`、`Object | null` 参数
- 反向编译: `let o: Object = null`（compile-time error）、函数参数 `Object` 传入 nullish

### 6. null 与 undefined 的区别
- 正向编译: `null` 和 `undefined` 是不同类型、不同值
- 反向编译: `let x: null = undefined`、`let x: undefined = null`
- 运行时: `null != undefined` 严格不等、`null == undefined` 抽象相等（如有）

### 7. null 作为 switch-case 匹配值
- 正向编译: `case null:` 在 switch 中
- 运行时: null 匹配 switch-case

### 8. null 在泛型中的使用
- 正向编译: 泛型参数约束允许 null、`T | null` 联合类型
- 反向编译: 泛型默认约束 `extends Any` 不包含 null

### 9. NonNullable 对 null 的作用
- 正向编译: `NonNullable<null>` = `never`
- 反向编译: 对 never 类型赋值

### 10. null 与 Any 的关系
- 正向编译: `Any` 类型变量可以接受 null 值
- 运行时: null 值赋给 Any 变量后 instanceof 检查

### 11. null 的性能语义（spec 注明但不测试性能）
- 注: spec 声明 `undefined` 性能优于 `null`，此为设计建议，不作为功能测试点

### 12. null 在函数返回类型中的使用
- 正向编译: 函数返回类型为 `T | null`
- 反向编译: 函数返回类型为 `null` 但返回非 null 值
- 运行时: 函数返回 null

## 分类说明
- **compile-pass**（.ets 文件必须编译成功）
- **compile-fail**（.ets 文件必须产生编译时错误）
- **runtime**（.ets 文件测试运行时行为，必须有 main 函数 + assert 断言）

## 文件命名规范
- `TYP_03_12_YYY_{CATEGORY}_{DESCRIPTION}.ets`
- 编号顺序：PASS(001~) → FAIL(接续) → RUNTIME(接续)