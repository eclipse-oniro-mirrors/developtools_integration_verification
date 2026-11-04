# 15.5 Invariance, Covariance, Contravariance - 测试设计思维导图

## 测试范围
验证 ArkTS 泛型变型（Variance）语义，包括：
- 泛型类型参数不变性（Invariance）：Holder<Derived> 不是 Holder<Base> 的子类型
- 返回值协变（Covariance）：子类覆写方法返回类型可以是父类返回类型的子类型
- 参数逆变（Contravariance）：函数类型参数支持逆变
- 协变位置禁止参数：out 类型参数不可用于参数位置
- 逆变位置禁止返回值：in 类型参数不可用于返回值位置
- 变体运行时行为：协变/逆变的运行时方法派发

## 测试用例矩阵

### compile-pass（编译通过）
| 用例 ID | 测试点 | 预期结果 |
|---------|--------|----------|
| SEM_15_05_00_004_PASS_RETURN_COVARIANCE | 返回值协变：子类覆写方法返回 Dog <: Animal 允许 | compile-pass |
| SEM_15_05_00_006_PASS_PARAM_CONTRAVARIANCE | 函数参数逆变：(Animal)→void <: (Dog)→void | compile-pass |

### compile-fail（编译失败）
| 用例 ID | 测试点 | 预期结果 |
|---------|--------|----------|
| SEM_15_05_00_100_FAIL_GENERIC_INVARIANCE | 泛型类型参数不变性：Holder<Derived> 不是 Holder<Base> 的子类型 | compile-fail |
| SEM_15_05_00_105_FAIL_COVARIANT_PARAM | 协变位置禁止参数：out 类型参数不可用于参数位置 | compile-fail |
| SEM_15_05_00_107_FAIL_CONTRAVARIANT_RETURN | 逆变位置禁止返回值：in 类型参数不可用于返回值位置 | compile-fail |

### runtime（运行时）
| 用例 ID | 测试点 | 预期结果 |
|---------|--------|----------|
| SEM_15_05_020 | 变体运行时行为：协变返回值 + 逆变参数的实际方法派发 | runtime |


## 最新设计要点

从章节思维导图同步的最新测试设计点：

- generic class invariance (no subtyping for different type args)
- method return type covariance (valid overriding)
- method parameter type contravariance (valid overriding)
- prohibition of parameter type covariance (compile-error)
- prohibition of return type contravariance (compile-error)
- generic interface variance annotations (in/out)
- variance in function types
- invariance with wildcard types
- covariance with array types (restricted in ArkTS)

## 跨章节关联
- 5.1.3 Type Parameter Variance（类型参数变型）
- 15.2.6 Function Type Subtyping（函数类型子类型）
- 15.4 Assignability（可赋值性与变型的关系）

## 测试设计要点
1. **泛型不变性**：验证泛型类型参数不变（Invariance），即 Holder<Derived> 不是 Holder<Base> 的子类型
2. **返回值协变**：验证子类覆写方法时，返回类型可以是父类返回类型的子类型（Covariance）
3. **参数逆变**：验证函数类型参数支持逆变（Contravariance），即 (Animal)→void <: (Dog)→void
4. **协变位置禁止参数**：验证 out 类型参数不可用于参数位置（类型安全）
5. **逆变位置禁止返回值**：验证 in 类型参数不可用于返回值位置（类型安全）
6. **运行时验证**：验证协变/逆变在运行时的行为正确（方法派发）
