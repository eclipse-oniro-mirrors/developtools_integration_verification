# 6.1 Assignment-like Contexts - 测试设计思维导图

## 概述
Assignment-like contexts 包括以下5种子类型上下文：
1. **Declaration contexts** — 带显式类型标注的变量声明(const)、常量声明、字段声明
2. **Assignment contexts** — 对变量的赋值表达式
3. **Call contexts** — 函数/方法/构造器/lambda 调用的实参到形参的赋值
4. **Return contexts** — return 语句的返回值到函数返回类型的赋值
5. **Composite literal contexts** — 数组字面量元素、对象字面量字段的赋值

核心规则：表达式类型必须可赋值(assignable)给目标类型。可赋值性允许使用隐式转换(Implicit Conversions)。若无适用转换，则产生编译时错误。

## 子类型覆盖

### 1. Declaration Contexts（声明上下文）
- **正向编译**: 
  - let 变量声明 + 完全匹配类型
  - const 常量声明 + 完全匹配类型
  - class field 字段声明 + 完全匹配类型
  - 声明中利用隐式 widening 转换（如 int -> number）
  - 泛型声明上下文（let t: T = p）
- **反向编译**: 
  - let 声明类型不匹配（如 string 赋给 number）
  - const 声明类型不匹配
  - field 声明类型不匹配
  - 声明中不允许的 narrowing 转换
- **运行时**: 
  - 变量声明的实际赋值行为验证
  - const 常量的不可变性验证

### 2. Assignment Contexts（赋值上下文）
- **正向编译**:
  - 变量赋值完全匹配类型
  - 对象字段赋值完全匹配类型
  - 赋值中利用隐式 conversion
- **反向编译**:
  - 变量赋值类型不匹配
  - 字段赋值类型不匹配
- **运行时**:
  - 变量赋值后读取值验证
  - 字段赋值后读取值验证

### 3. Call Contexts（调用上下文）
- **正向编译**:
  - 函数调用实参类型完全匹配
  - 方法调用实参类型完全匹配
  - 构造器调用实参类型完全匹配
  - 实参利用隐式 conversion
- **反向编译**:
  - 函数调用实参类型不匹配
  - 方法调用实参类型不匹配
  - 构造器调用实参类型不匹配
- **运行时**:
  - 函数调用参数传递实际行为
  - 方法调用参数传递实际行为

### 4. Return Contexts（返回上下文）
- **正向编译**:
  - return 表达式类型与返回类型完全匹配
  - return 表达式利用隐式 conversion
- **反向编译**:
  - return 表达式类型与返回类型不匹配
- **运行时**:
  - 函数返回值的实际行为验证

### 5. Composite Literal Contexts（复合字面量上下文）
- **正向编译**:
  - 数组字面量元素类型匹配
  - 对象字面量字段类型匹配
  - 元素利用隐式 conversion
- **反向编译**:
  - 数组字面量元素类型不匹配
  - 对象字面量字段类型不匹配
- **运行时**:
  - 数组字面量元素值的实际行为
  - 对象字面量字段值的实际行为

## 分类说明
- **compile-pass**: 验证合法赋值上下文编译通过
- **compile-fail**: 验证非法赋值上下文产生编译时错误
- **runtime**: 验证赋值上下文的运行时行为

## 文件命名规范
- 前缀: `CON_`（06_Contexts_Conversions 章节前缀）
- 格式: `CON_06_01_ZZZ_{CATEGORY}_{DESCRIPTION}.ets`
- 编号: 001 起连续递增，跨分类统一编号
- 顺序: PASS → FAIL → RUNTIME
