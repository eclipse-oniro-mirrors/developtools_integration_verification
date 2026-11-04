# 3.3 Using Types - 测试设计思维导图

## 概述
本节定义在源码中**引用/使用类型**的两种方式：**类型引用 (Type Reference)** 和 **就地类型声明 (In-place Type Declaration)**。包括类型组合时的括号优先级规则、union 优先级最低、注解前置时必须加括号等。

## 核心规则
1. **类型引用** = 命名类型（class/interface/enum/type alias/类型参数/预定义类型，但**内置数组除外**）+ 类型别名
2. **就地类型声明** = array / tuple / function / functionWithReceiver / keyof / union / 字面量字符串 / `(type)`
3. **括号优先级**：union `|` 是优先级最低的类型构造符
4. **注解必须括号**：`@anno() (type)` 合法，`@anno (type)` 编译错误

## 子类型覆盖

### 1. 类型引用（Type Reference）
- **正向**：用预定义类型名(int/number/Object)、用户类/接口/enum、类型参数 T、type alias 引用
- **正向**：泛型类型引用 `Map<string, number>`、嵌套引用 `A<B<C>>`
- **反向**：引用未定义的类型名、引用非类型实体（变量名作类型）
- **运行时**：通过类型引用变量正常调用方法

### 2. 就地数组类型 `T[]` / `Array<T>` / `readonly T[]`
- **正向**：基本数组、readonly 数组、嵌套数组
- **反向**：数组类型与非数组互赋值
- **运行时**：通过就地数组类型声明的变量可索引访问

### 3. 就地元组类型 `[T1, T2]` / `readonly [T1, T2]`
- **正向**：基本元组、readonly 元组
- **反向**：元组元素数量不匹配
- **运行时**：元组索引访问

### 4. 就地函数类型 `(x: T) => R`
- **正向**：函数类型直接作为变量类型
- **反向**：签名不匹配
- **运行时**：调用就地函数类型的变量

### 5. 就地联合类型 `T1 | T2`
- **正向**：union 直接作变量类型
- **反向**：联合类型不兼容赋值

### 6. 就地 keyof 类型
- **正向**：`keyof C` 生成 union of property names
- **反向**：keyof 用于非类/接口
- **运行时**：keyof 类型作为 string 字面量集合

### 7. 字符串字面量类型作就地类型
- **正向**：`let l: "xyz" = "xyz"`
- **反向**：字面量值不匹配

### 8. 括号优先级规则 ⭐【本章重点】
- **正向**：
  - `string[] | undefined`（nullish 数组类型）
  - `(string | undefined)[]`（数组元素是 union）
  - `() => string | undefined`（函数返回 union）
  - `(() => string) | undefined`（nullish 函数类型）
- **反向**：
  - 给 `(string | undefined)[]` 赋 undefined（数组本身非 nullish）
  - 给 `string | undefined[]` 赋 undefined（实际是 string 或 undefined 数组）
  - 给 `() => string | undefined` 赋 undefined（函数本身非 nullish）

### 9. 注解前置括号规则
- **正向**：`@my_annotation() (A|B)` 合法
- **反向**：`@my_annotation (A|B)` 编译错误（缺少 `()`）

## 分类与编号
- compile-pass: 001 ~ ~012（基本/括号优先级/注解 OK）
- compile-fail: 013 ~ ~022（不兼容/无注解括号/优先级误用）
- runtime: 023 ~ ~027（实际执行验证类型行为）

## 文件命名规范
`TYP_03_03_YYY_{CATEGORY}_{DESCRIPTION}.ets`