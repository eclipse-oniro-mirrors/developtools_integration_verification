# 15.3 Type Identity - 测试设计思维导图

## 测试范围
验证 ArkTS 类型同一性（Type Identity）语义，包括：
- 类型别名同一性
- 泛型类型实例化同一性
- 联合类型同一性
- 函数类型同一性
- 不同类型不具同一性
- 泛型不同参数拒绝
- 运行时类型同一性

## 测试用例矩阵

### compile-pass（编译通过）
| 用例 ID | 测试点 | 预期结果 |
|---------|--------|----------|
| SEM_15_03_00_002_PASS_TYPE_ALIAS_IDENTITY | 类型别名同一性：type MyInt = int，MyInt 和 int 是同一类型 | compile-pass |
| SEM_15_03_00_004_PASS_GENERIC_IDENTITY | 泛型类型实例化同一性：Container<int> 和 Container<int> 是同一类型 | compile-pass |
| SEM_15_03_00_011_PASS_UNION_IDENTITY | 联合类型同一性：相同成员的联合类型视为同一类型 | compile-pass |
| SEM_15_03_00_013_PASS_FUNCTION_TYPE_IDENTITY | 函数类型同一性：相同签名函数类型视为同一类型 | compile-pass |

### compile-fail（编译失败）
| 用例 ID | 测试点 | 预期结果 |
|---------|--------|----------|
| SEM_15_03_00_100_FAIL_DIFF_TYPES_NOT_IDENTICAL | 不同类型不具同一性：int 和 string 不是同一类型 | compile-fail |
| SEM_15_03_00_101_FAIL_GENERIC_DIFF_ARGS | 泛型类型不同参数不具同一性：Container<int> 和 Container<string> 不是同一类型 | compile-fail |

### runtime（运行时）
| 用例 ID | 测试点 | 预期结果 |
|---------|--------|----------|
| SEM_15_03_00_200_RUNTIME_TYPE_IDENTITY | 类型同一性运行时行为：别名类型与原始类型同一 | runtime |


## 最新设计要点

从章节思维导图同步的最新测试设计点：

- array type identity (T1[] vs Array<T2>)
- tuple type identity (same length and identical elements)
- union type identity (permutation of types)
- type alias identity (alias is indistinguishable from base type)
- generic class/interface type parameter shadowing
- identity relation symmetry and transitivity
- class type parameter vs method type parameter conflict

## 跨章节关联
- 15.2 Subtyping（子类型关系影响类型同一性判断）
- 15.4 Assignability（类型同一性是可赋值性的基础）
- 15.5 Invariance/Covariance/Contravariance（泛型变型与类型同一性）

## 测试设计要点
1. **类型别名同一性**：验证 `type MyInt = int` 后，MyInt 和 int 是同一类型，可互相赋值
2. **泛型类型同一性**：验证相同类型参数实例化的泛型类型相同
3. **联合类型同一性**：验证相同成员的联合类型视为同一类型（顺序无关）
4. **函数类型同一性**：验证相同签名的函数类型视为同一类型
5. **不同类型拒绝**：验证不同类型（如 int 和 string）不具同一性，不能互相赋值
6. **泛型不同参数拒绝**：验证不同参数实例化的泛型类型不同
7. **运行时验证**：验证类型同一性在运行时的行为
