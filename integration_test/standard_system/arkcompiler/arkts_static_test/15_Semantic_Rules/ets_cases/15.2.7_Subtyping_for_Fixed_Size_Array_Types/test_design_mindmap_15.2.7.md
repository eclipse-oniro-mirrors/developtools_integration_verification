# 15.2.7 Subtyping for Fixed Size Array Types - 测试设计思维导图

## 测试范围

**规范章节**: 15.2.7 Subtyping for Fixed Size Array Types

**测试目标**: 验证 ArkTS 中固定大小数组类型（FixedArray）的子类型关系，包括 FixedArray 自身赋值、不变性等。

**关键概念**:
- FixedArray 自身子类型: `FixedArray<T>` 可以赋值给 `FixedArray<T>`（相同类型参数）
- FixedArray 不变性: `FixedArray<Derived>` 不是 `FixedArray<Base>` 的子类型
- FixedArray 逆变拒绝: `FixedArray<Object>` 不是 `FixedArray<string>` 的子类型

## 测试用例矩阵

| 用例 ID | 类型 | 测试点 | 对应 Spec 章节 |
|---------|------|--------|----------------|
| SEM_15_02_07_001 | compile-pass | FixedArray 自身赋值 | 15.2.7 |
| SEM_15_02_007_FAIL_FIXED_ARRAY_SUBTYPE | compile-fail | 验证 FixedArray<Derived> 不是 FixedArray<Base> 的子类型（不变性） | 15.2.7 |
| SEM_15_02_013_FAIL_FIXED_ARRAY_GAP | compile-fail | 验证 FixedArray<Object> 不是 FixedArray<string> 的子类型（逆变拒绝） | 15.2.7 |
| SEM_15_02_07_100 | runtime | FixedArray 运行时 | 15.2.7 |

## 测试设计思路

### 1. FixedArray 自身子类型（正向）
- **测试点**: 相同类型参数的 FixedArray 可以互相赋值
- **测试代码**: `let a: FixedArray<int> = new FixedArray<int>(3); let b: FixedArray<int> = a;`
- **预期结果**: 编译通过，运行时正常

### 2. FixedArray 不变性（反向）
- **测试点**: `FixedArray<Derived>` 不是 `FixedArray<Base>` 的子类型
- **测试代码**: `let a: FixedArray<Animal> = new FixedArray<Dog>(3); // 应报错`
- **预期结果**: 编译失败

### 3. FixedArray 逆变拒绝（反向）
- **测试点**: `FixedArray<Object>` 不是 `FixedArray<string>` 的子类型
- **测试代码**: `let a: FixedArray<Object> = new FixedArray<string>(3); // 应报错`
- **预期结果**: 编译失败

### 4. 运行时行为（运行时）
- **测试点**: 验证 FixedArray 子类型在运行时的行为
- **测试代码**: 创建 FixedArray，进行赋值和操作
- **预期结果**: 运行时行为符合预期


## 最新设计要点

从章节思维导图同步的最新测试设计点：

- identical FixedArray types
- different FixedArray types (no subtyping)

## 跨章节关联

- **15.2 Subtyping**: 子类型关系基础
- **3.17.1 Fixed Size Array Types**: 固定大小数组类型
- **15.2.2 Subtyping for Generic Classes and Interfaces**: 泛型子类型关系

## 测试环境

- **ArkTS/ArkUI-X**: DevEco Studio 5.0.3.510
- **Java**: Java 21.0.1
- **Swift**: Swift 5.9.2 + Xcode 15.2

## 注意事项

1. FixedArray 是 ArkTS 特有的类型，Java 和 Swift 没有直接对应
2. FixedArray 的不变性与泛型不变性一致
3. 运行时行为需要验证 FixedArray 的长度和元素类型是否保留
