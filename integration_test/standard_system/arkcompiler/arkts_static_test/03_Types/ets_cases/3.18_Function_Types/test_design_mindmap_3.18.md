# 3.18 Function Types - 测试设计思维导图

## 概述

Function type 用于表示函数的期望签名。函数类型由以下部分组成：
- 可选的类型参数（type parameters）
- 参数列表（可以为空）
- 可选的返回类型

语法：`(ftParameterList?) => ftReturnType`

参数列表中，带 `?` 标记的参数为可选参数，且可选参数后不能跟必选参数（否则 compile-time error）。可选参数的实际类型为参数类型与 `undefined` 的联合类型。

Type Function 是所有函数类型的直接超接口，其值不能直接调用，必须通过 `unsafeCall` 方法调用。

## 子类型覆盖

### 1. 基本函数类型声明与赋值
- 正向编译: 变量声明函数类型、type 别名、空参数函数类型、单参数函数类型、多参数函数类型
- 反向编译: 函数类型语法错误
- 运行时: 函数类型变量调用、参数传递

### 2. 函数类型可选参数
- 正向编译: 全部可选参数 `(x?: number, y?: string) => void`、单个可选参数 `(x?: number) => void`
- 反向编译: 必选参数在可选参数之后 `(x?: number, y: string) => void`、非可选参数混合
- 运行时: 可选参数调用时传 undefined

### 3. 函数类型与 lambda 赋值兼容性
- 正向编译: 签名完全匹配的 lambda 赋值
- 反向编译: 参数类型不匹配、返回类型不匹配、参数数量不匹配
- 运行时: lambda 赋值后调用验证

### 4. 函数类型作为参数和返回值
- 正向编译: 函数类型参数、函数类型返回值、嵌套函数类型
- 反向编译: 无
- 运行时: 回调函数执行验证

### 5. 泛型函数类型
- 正向编译: 泛型函数类型别名 `type Predicate<T> = (x: T) => boolean`
- 反向编译: 无
- 运行时: 泛型函数类型实例化与调用

### 6. 函数类型与 rest 参数
- 正向编译: 函数类型含 rest 参数 `(...args: number[]) => number`
- 反向编译: rest 参数位置错误
- 运行时: rest 参数函数调用

### 7. Type Function（函数类型超接口）
- 正向编译: 函数值赋给 Function 类型变量、Function.name 属性、Function.unsafeCall 调用
- 反向编译: Function 类型变量直接调用（应 compile-time error）
- 运行时: unsafeCall 正确调用、name 属性验证

### 8. 函数类型与联合类型
- 正向编译: 函数类型在联合类型中使用（需括号包裹）
- 反向编译: 函数类型在联合类型中未加括号
- 运行时: 联合类型中函数类型成员调用

### 9. 函数类型 readonly 参数
- 正向编译: 函数类型含 readonly 数组参数
- 反向编译: readonly 参数内赋值
- 运行时: 无

### 10. 函数类型与 void 返回
- 正向编译: `() => void` 声明与赋值
- 反向编译: void 返回类型赋值给非 void 函数类型变量
- 运行时: void 函数调用

### 11. 可选参数实际类型为 T | undefined
- 正向编译: 可选参数类型等价验证
- 反向编译: 无
- 运行时: 可选参数传 undefined 验证类型等价

## 分类说明

| 分类 | 说明 |
|------|------|
| compile-pass | 验证函数类型特性在 ArkTS 中编译通过 |
| compile-fail | 验证违反函数类型规则时产生编译时错误 |
| runtime | 验证函数类型的运行时行为，必须有 main 函数和 assert 断言 |

## 文件命名规范

- `TYP_03_18_YYY_{CATEGORY}_{DESCRIPTION}.ets`
- 编号顺序：PASS(001~) → FAIL(接续) → RUNTIME(接续)

## 子章节 3.18.1 Type Function

### Type Function 特性
- Type Function 是所有函数类型的直接超接口
- Function 类型值不能直接调用，必须用 unsafeCall
- Function.name 属性返回函数关联名称
- 函数/方法赋给 Function 变量 → 名称为函数/方法名
- lambda 赋给变量 → 名称为变量名
- 匿名 lambda → 名称为空字符串

命名前缀同：`TYP_03_18_01_YYY_{CATEGORY}_{DESCRIPTION}.ets`