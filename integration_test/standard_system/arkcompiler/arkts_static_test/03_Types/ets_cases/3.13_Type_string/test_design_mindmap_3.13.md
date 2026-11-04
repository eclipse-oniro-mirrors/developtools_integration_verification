# 3.13 Type string - 测试设计思维导图

## 概述

ArkTS §3.13 定义 `string` 类型：
- 值为所有字符串字面量（如 `"abc"`）
- 存储 Unicode UTF-16 码元序列
- 不可变（immutable）：创建后值不可改变
- 可共享：值可被多个引用共享
- **双重语义**：创建/赋值/传参时表现为引用类型；字符串操作（+ 连接、== 比较、< 关系比较）时表现为值类型
- 是 `Object` 的子类型，是类类型，可以在任何需要类名的地方使用
- 可迭代（iterable），可在任何需要可迭代类型的地方使用
- `String` 是 `string` 的别名，推荐使用 `string`
- `new string` 创建空字符串，输出 `<empty_string>`
- `length` 属性返回 `int` 类型，非负整数，运行时设置一次后不可更改
- `+` 运算符产生 `string` 类型值，若结果非常量表达式则可能隐式创建新 string 对象
- 索引表达式 `s[i]` 返回 `string` 类型值，可能隐式创建新 string 对象
- `\0` 字符是字符串内部的普通字符（不表示字符串结束）

**Spec 原文关键引用（spec/types.md）：**
> "A string object is immutable, the value of a string object cannot be changed after the object is created."
> "Type string has dual semantics"
> "type string is a subtype of Object, and can be used at any place where a class name is expected"
> "type string is iterable"
> "Using string in all cases is recommended"

## 子规则覆盖

### 1. string 字面量与创建
- 正向编译: 空字符串 `""`
- 正向编译: 带内容字符串 `"hello"`
- 正向编译: `new string` 创建空字符串
- 反向编译: string 不可变（验证赋值后不可修改字段）
- 运行时: `new string` 输出空字符串
- 运行时: 字符串字面量赋值与比较

### 2. string 是 Object 子类型
- 正向编译: `let o: Object = a_string`
- 正向编译: string 赋值给 Object 变量
- 运行时: string instanceof Object 验证

### 3. string 不可变性
- 正向编译: string 变量重新赋值（合法，创建新对象）
- 正向编译: string 字段重新赋值
- 运行时: 验证 string 赋值后原引用不受影响

### 4. string 双重语义
- 正向编译: string 作为引用类型（创建、赋值、传参）
- 正向编译: string 作为值类型（+ 连接、== 比较、< 比较）
- 运行时: 引用赋值后修改不影响原变量
- 运行时: == 比较的是值而非引用

### 5. string.length 属性
- 正向编译: 访问 string.length 返回 int
- 正向编译: 空字符串 length 为 0
- 运行时: 各种字符串 length 值验证
- 运行时: length 为非负整数

### 6. string 连接运算符 `+`
- 正向编译: string + string
- 正向编译: string + number（数值隐式转 string）
- 正向编译: string + boolean（boolean 隐式转 string）
- 正向编译: string + null（null 转 "null"）
- 正向编译: string + undefined（undefined 转 "undefined"）
- 正向编译: number + string（左侧数值，右侧字符串）
- 运行时: 字符串拼接结果验证
- 运行时: 数值 + 字符串隐式转换验证
- 运行时: boolean + string 隐式转换结果验证
- 运行时: null + string 隐式转换结果验证
- 运行时: undefined + string 隐式转换结果验证

### 7. string 索引表达式
- 正向编译: `s[0]` 返回 string
- 正向编译: `s[1]` 返回单字符 string
- 运行时: 索引返回 string 类型验证
- 运行时: 越界索引行为（runtime error 或 undefined）

### 8. string 包含 `\0` 字符
- 正向编译: `"a\0b"` 合法
- 运行时: `"a\0b".length === 3`

### 9. string 与 nullish 类型联合
- 正向编译: `string | null`
- 正向编译: `string | undefined`
- 正向编译: `string | null | undefined`
- 反向编译: `string | null` 赋值给 `string`（compile-fail）
- 运行时: nullish 收窄后安全访问

### 10. string 可迭代性
- 正向编译: `for (let c of "hello")`
- 运行时: for-of 遍历 string 逐字符
- 运行时: string 作为 Iterable 使用

### 11. string 比较运算符
- 正向编译: `s1 === s2`
- 正向编译: `s1 !== s2`
- 正向编译: `s1 < s2`、`s1 > s2`、`s1 <= s2`、`s1 >= s2`
- 运行时: string 相等比较（值比较）
- 运行时: string 关系比较（字典序）

### 12. string 与 char 类型关系
- 正向编译: string 与 char 的关系
- 运行时: char 字面量 `c'a'` 与 string 的转换

### 13. string 别名 String
- 正向编译: `String` 是 `string` 的别名
- 正向编译: `let s: String = "hello"`
- 运行时: `String` 与 `string` 行为一致

### 14. string 作为类类型使用
- 正向编译: string 在需要类名的地方使用（泛型参数等）
- 运行时: string 作为 Object 子类型的运行时验证

### 15. string 在 for-of 中作为 iterable
- 正向编译: string 在需要 iterable 类型的地方使用
- 运行时: for-of 遍历字符串字符

### 16. 边界值与异常场景
- 正向编译: 非常长的字符串
- 运行时: 空字符串操作
- 运行时: 单字符字符串操作
- 运行时: 包含转义字符的字符串
- 运行时: Unicode 字符串操作

### 17. string 连接运算符的非 string 操作数隐式转换（spec conversions.md）
- 运行时: integer + string → string 中整数值转十进制字符串
- 运行时: float/double + string → string 中浮点值转十进制字符串（无精度损失）
- 运行时: boolean + string → "true"/"false"
- 运行时: null + string → "null"
- 运行时: undefined + string → "undefined"
- 运行时: enum + string（string 基类型 enum 成员值）

### 18. string 索引表达式运行时越界
- 运行时: 索引越界抛出 runtime error（spec 明确声明）
- 运行时: 索引为负数抛出 runtime error

## 分类说明

- **compile-pass**: 验证 string 类型的正确用法、合法语法、预期通过编译的场景
- **compile-fail**: 验证 string 类型的非法用法、类型不兼容、应产生编译时错误的场景
- **runtime**: 验证 string 类型的运行时行为、操作结果、边界值

## 文件命名规范

- `TYP_03_13_XXX_PASS_<DESCRIPTION>.ets`
- `TYP_03_13_XXX_FAIL_<DESCRIPTION>.ets`
- `TYP_03_13_XXX_RUNTIME_<DESCRIPTION>.ets`