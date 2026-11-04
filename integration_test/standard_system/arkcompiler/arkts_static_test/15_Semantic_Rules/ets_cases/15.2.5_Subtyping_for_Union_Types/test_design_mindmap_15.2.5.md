# 15.2.5 Subtyping for Union Types - 测试设计思维导图

## 测试范围

**规范章节**: 15.2.5 Subtyping for Union Types

**测试目标**: 验证 ArkTS 中联合类型的子类型关系，包括联合类型的子类型规则、联合类型的分配性等。

**关键概念**:
- 联合类型子类型: `U <: T` 当且仅当 `U` 的每个成员 `<: T`
- 联合类型的分配性: `A | B <: T` 当且仅当 `A <: T` 且 `B <: T`
- 联合类型的身份: `T <: T | U` 和 `U <: T | U`

## 测试用例矩阵

| 用例 ID | 类型 | 测试点 | 对应 Spec 章节 |
|---------|------|--------|----------------|
| SEM_15_02_005_PASS_UNION_TYPE_SUBTYPE | compile-pass | 验证联合类型子类型：U <: T 当且仅当 U 的每个成员 <: T | 15.2.5 |
| SEM_15_02_011_FAIL_UNION_SUBTYPE_GAP | compile-fail | 验证联合类型子类型严格检查：U <: T 要求 U 的每个成员 <: T | 15.2.5 |
| SEM_15_02_019_RUNTIME_UNION_SUBTYPE | runtime | 验证联合类型子类型运行时行为 | 15.2.5 |

## 测试设计思路

### 1. 联合类型子类型（正向）
- **测试点**: 联合类型的每个成员都是目标类型的子类型时，联合类型是目标类型的子类型
- **测试代码**: `type Pet = Dog | Cat; let a: Animal = pet; // Dog <: Animal, Cat <: Animal`
- **预期结果**: 编译通过，运行时正常

### 2. 联合类型子类型严格检查（反向）
- **测试点**: 联合类型的某个成员不是目标类型的子类型时，联合类型不是目标类型的子类型
- **测试代码**: `type A = Dog | string; let a: Animal = a; // string 不是 Animal 的子类型`
- **预期结果**: 编译失败

### 3. 运行时行为（运行时）
- **测试点**: 验证联合类型子类型在运行时的行为
- **测试代码**: 使用联合类型进行赋值和函数调用
- **预期结果**: 运行时行为符合预期


## 最新设计要点

从章节思维导图同步的最新测试设计点：

- union assignability
- each member must be subtype

## 跨章节关联

- **15.2 Subtyping**: 子类型关系基础
- **3.19 Union Types**: 联合类型
- **15.2.4 Subtyping for Tuple Types**: 元组类型的子类型关系

## 测试环境

- **ArkTS/ArkUI-X**: DevEco Studio 5.0.3.510
- **Java**: Java 21.0.1
- **Swift**: Swift 5.9.2 + Xcode 15.2

## 注意事项

1. ArkTS 的联合类型子类型规则需要明确（是否与 TypeScript 一致）
2. 联合类型的分配性是关键特性，需要重点测试
3. 运行时行为需要验证类型收窄是否正常工作
