# 15.2.3 Subtyping for Literal Types - 测试设计思维导图

## 测试范围

**规范章节**: 15.2.3 Subtyping for Literal Types

**测试目标**: 验证 ArkTS 中字面量类型的子类型关系，包括字符串字面量、数字字面量、布尔字面量等。

**关键概念**:
- 字符串字面量子类型: `"hello"` 是 `string` 的子类型
- 数字字面量子类型: `42` 是 `number` 的子类型（但 ArkTS 中 `int` 不是 `number` 的子类型）
- 布尔字面量子类型: `true` 是 `boolean` 的子类型

## 测试用例矩阵

| 用例 ID | 类型 | 测试点 | 对应 Spec 章节 |
|---------|------|--------|----------------|
| SEM_15_02_03_001_PASS_STRING_LITERAL_SUBTYPE | compile-pass | 验证字符串字面量类型是其基础类型 string 的子类型 | 15.2.3 |
| SEM_15_02_03_002_PASS_int_widens_to_number | compile-pass | 验证 int 字面量隐式拓宽为 number | 15.2.3 |
| SEM_15_02_03_003_PASS_string_literal_override_subtype | compile-pass | 验证字符串字面量在覆写场景中的子类型关系 | 15.2.3 |
| SEM_15_02_03_100_FAIL_STRING_LITERAL_NOT_INT | compile-fail | 验证字符串字面量不是 int 的子类型 | 15.2.3 |
| SEM_15_02_03_101_FAIL_INT_LITERAL_NOT_STRING | compile-fail | 验证 int 字面量不是 string 的子类型 | 15.2.3 |
| SEM_15_02_03_102_FAIL_BOOLEAN_LITERAL_NOT_NUMBER | compile-fail | 验证 boolean 字面量不是 number 的子类型 | 15.2.3 |
| SEM_15_02_03_200_RUNTIME_LITERAL | runtime | 验证字符串字面量子类型运行时行为 | 15.2.3 |

## 测试设计思路

### 1. 字符串字面量子类型（正向）
- **测试点**: 字符串字面量类型是其基础类型 string 的子类型
- **测试代码**: `let literal: "hello" = "hello"; let str: string = literal;`
- **预期结果**: 编译通过，运行时正常

### 2. int 子类型 GAP（反向）
- **测试点**: 验证 int 不是 number 的子类型
- **测试代码**: `let n: number = 42; // 应报错（如果 int 不是 number 的子类型）`
- **预期结果**: 编译失败（或根据 ArkTS 设计而定）

### 3. 运行时行为（运行时）
- **测试点**: 验证字面量子类型在运行时的行为
- **测试代码**: 使用字面量类型进行赋值和函数调用
- **预期结果**: 运行时行为符合预期


## 最新设计要点

从章节思维导图同步的最新测试设计点：

- string literal subtype of string
- numeric literal subtype of numeric type

## 跨章节关联

- **15.2 Subtyping**: 子类型关系基础
- **3.15 Literal Types**: 字面量类型
- **3.11 Type void or undefined**: 特殊类型的子类型关系

## 测试环境

- **ArkTS/ArkUI-X**: DevEco Studio 5.0.3.510
- **Java**: Java 21.0.1
- **Swift**: Swift 5.9.2 + Xcode 15.2

## 注意事项

1. ArkTS 中 `int` 和 `number` 的关系需要明确（可能存在设计 GAP）
2. 字符串字面量类型的子类型关系是 TypeScript 兼容的特性
3. 运行时行为需要验证类型保护是否正常工作
