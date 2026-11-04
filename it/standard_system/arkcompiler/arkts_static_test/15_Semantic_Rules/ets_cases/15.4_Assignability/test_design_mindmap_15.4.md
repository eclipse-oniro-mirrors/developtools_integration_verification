# 15.4 Assignability - 测试设计思维导图

## 测试范围
验证 ArkTS 可赋值性（Assignability）语义，包括：
- 子类型可赋值性（S <: T ⇒ S 可赋值给 T）
- 数值拓宽可赋值性（int → double）
- undefined 可赋值性（undefined 可赋值给含 undefined 的联合类型）
- 接口实现可赋值性（实现类可赋值给接口类型）
- 类型不匹配拒绝（string 不可赋值给 int）
- 不相关类拒绝（无继承关系的类不可互相赋值）
- 运行时可赋值性（子类型赋值后方法调用正确）

## 测试用例矩阵

### compile-pass（编译通过）
| 用例 ID | 测试点 | 预期结果 |
|---------|--------|----------|
| SEM_15_04_00_001_PASS_SUBTYPE_ASSIGNABILITY | 子类型可赋值性：S <: T ⇒ S 可赋值给 T | compile-pass |
| SEM_15_04_00_005_PASS_NUMERIC_WIDENING | 数值拓宽可赋值性：int → double | compile-pass |
| SEM_15_04_00_006_PASS_UNDEFINED_ASSIGNABILITY | undefined 可赋值性：undefined 可赋值给含 undefined 的联合类型 | compile-pass |
| SEM_15_04_00_008_PASS_INTERFACE_ASSIGNABILITY | 接口实现可赋值性：实现类可赋值给接口类型 | compile-pass |

### compile-fail（编译失败）
| 用例 ID | 测试点 | 预期结果 |
|---------|--------|----------|
| SEM_15_04_00_102_FAIL_TYPE_MISMATCH | 类型不匹配拒绝：string 不可赋值给 int | compile-fail |
| SEM_15_04_00_104_FAIL_UNRELATED_TYPES | 不相关类拒绝：无继承关系的类不可互相赋值 | compile-fail |

### runtime（运行时）
| 用例 ID | 测试点 | 预期结果 |
|---------|--------|----------|
| SEM_15_04_00_200_RUNTIME_ASSIGNABILITY | 可赋值性运行时行为：子类型赋值后方法调用正确 | runtime |


## 最新设计要点

从章节思维导图同步的最新测试设计点：

- subtyping-based assignability
- implicit conversion-based assignability
- assignability asymmetry verification
- assignability with union types
- assignability with intersection types
- assignability with literal types
- assignability with null/undefined
- failed assignability (compile-error)

## 跨章节关联
- 15.2 Subtyping（可赋值性基于子类型关系）
- 15.3 Type Identity（类型同一性影响可赋值性判断）
- 15.5 Invariance/Covariance/Contravariance（泛型变型与可赋值性）

## 测试设计要点
1. **子类型可赋值性**：验证 S <: T 时，S 可赋值给 T（如 Dog <: Animal，Dog 可赋值给 Animal）
2. **数值拓宽**：验证数值类型拓宽（如 int → double）是可赋值的
3. **undefined 可赋值性**：验证 undefined 可赋值给含 undefined 的联合类型（如 T | undefined）
4. **接口实现可赋值性**：验证实现类可赋值给接口类型
5. **类型不匹配拒绝**：验证类型不兼容时编译拒绝（如 string 赋值给 int）
6. **不相关类拒绝**：验证无继承关系的类不可互相赋值
7. **运行时验证**：验证子类型赋值后方法调用正确（多态行为）
