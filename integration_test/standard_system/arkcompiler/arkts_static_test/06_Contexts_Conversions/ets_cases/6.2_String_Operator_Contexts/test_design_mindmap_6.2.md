# 6.2 String Operator Contexts - 测试设计思维导图

## 概述
String context 仅适用于二元运算符 '+' 的非 string 操作数，当另一个操作数为 string 时触发。
目标类型始终为 string。非 string 操作数的转换规则：

1. **整数类型** → string（十进制形式）
2. **浮点类型** → string（十进制形式，不丢失信息）
3. **boolean** → string（"true" 或 "false"）
4. **string 值枚举** → string（对应枚举成员值）
5. **nullish 类型** → null → "null"，undefined → "undefined"
6. **引用类型 / 非 string 值枚举** → toString() 调用
7. 无适用转换 → 编译时错误

## 子类型覆盖

### 1. 整数类型转换
- 正向编译: int + string, string + int, long + string, byte/short + string
- 反向编译: 两个整数间无 string 操作数时不应自动转换
- 运行时: 验证十进制字符串输出（正数、负数、零）

### 2. 浮点类型转换
- 正向编译: double + string, string + double, float + string
- 反向编译: —
- 运行时: 验证浮点数字符串形式不丢失信息

### 3. boolean 转换
- 正向编译: boolean + string, string + boolean
- 反向编译: boolean + boolean（无 string 操作数）
- 运行时: 验证 true/false 字符串输出

### 4. nullish 类型转换
- 正向编译: null + string, undefined + string
- 反向编译: —
- 运行时: 验证 null→"null", undefined→"undefined"

### 5. 枚举类型转换
- 正向编译: string 值枚举 + string, 非 string 值枚举 + string
- 反向编译: —
- 运行时: 验证枚举成员 string 值输出

### 6. 引用类型转换（toString()）
- 正向编译: class 实例 + string
- 反向编译: —
- 运行时: 验证 toString() 调用结果

### 7. 无适用转换
- 反向编译: '+' 运算符两侧均非 string 且无有效运算符定义
- 反向编译: void 类型 + string

## 分类说明
- compile-pass: 验证合法 string context 转换编译通过
- compile-fail: 验证非法场景产生编译时错误
- runtime: 验证转换结果的正确性

## 文件命名规范
- 前缀: CON_（06_Contexts_Conversions 章节前缀）
- 格式: CON_06_02_ZZZ_{CATEGORY}_{DESCRIPTION}.ets
- 编号: 001 起连续递增
