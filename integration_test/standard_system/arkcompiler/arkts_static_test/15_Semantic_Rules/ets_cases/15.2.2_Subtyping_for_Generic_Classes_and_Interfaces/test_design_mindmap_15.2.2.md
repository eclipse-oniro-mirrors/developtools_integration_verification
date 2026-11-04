# 15.2.2 Subtyping for Generic Classes and Interfaces - 测试设计思维导图

## 测试范围

**规范章节**: 15.2.2 Subtyping for Generic Classes and Interfaces

**测试目标**: 验证 ArkTS 中泛型类和接口的子类型关系，包括泛型不变性、泛型自身赋值、运行时行为等。

**关键概念**:
- 泛型不变性（Generic Invariance）: `Generic<Derived>` 不是 `Generic<Base>` 的子类型
- 泛型自身子类型: `Generic<T>` 可以赋值给 `Generic<T>`（相同类型参数）
- 类型参数约束: `extends` 关键字限制类型参数范围

## 测试用例矩阵

| 用例 ID | 类型 | 测试点 | 对应 Spec 章节 |
|---------|------|--------|----------------|
| SEM_15_02_02_001 | compile-pass | 泛型类自身子类型：相同类型参数的泛型实例可互相赋值 | 15.2.2 |
| SEM_15_02_003_FAIL_GENERIC_INVARIANCE | compile-fail | 验证泛型类不变性：`Array<Derived>` 不是 `Array<Base>` 的子类型 | 15.2.2 |
| SEM_15_02_02_100 | runtime | 泛型子类型运行时行为验证 | 15.2.2 |

## 测试设计思路

### 1. 泛型自身子类型（正向）
- **测试点**: 相同类型参数的泛型实例可互相赋值
- **测试代码**: `let a: Holder<int> = new Holder<int>(); let b: Holder<int> = a;`
- **预期结果**: 编译通过，运行时正常

### 2. 泛型不变性（反向）
- **测试点**: `Generic<Derived>` 不是 `Generic<Base>` 的子类型
- **测试代码**: `let a: Array<Animal> = new Array<Dog>(); // 应报错`
- **预期结果**: 编译失败

### 3. 运行时行为（运行时）
- **测试点**: 验证泛型子类型在运行时的行为
- **测试代码**: 创建泛型实例，进行赋值和操作
- **预期结果**: 运行时行为符合预期


## 最新设计要点

从章节思维导图同步的最新测试设计点：

- invariance verification
- constraint checking
- type parameter substitution

## 跨章节关联

- **15.2 Subtyping**: 子类型关系基础
- **5.2 Generic Instantiations**: 泛型实例化
- **15.5 Variance**: 类型方差（协变、逆变、不变）

## 测试环境

- **ArkTS/ArkUI-X**: DevEco Studio 5.0.3.510
- **Java**: Java 21.0.1
- **Swift**: Swift 5.9.2 + Xcode 15.2

## 注意事项

1. 泛型不变性是类型安全的重要保证
2. 需要区分泛型类自身子类型和泛型不变性
3. 运行时行为需要验证类型擦除或不擦除的影响
