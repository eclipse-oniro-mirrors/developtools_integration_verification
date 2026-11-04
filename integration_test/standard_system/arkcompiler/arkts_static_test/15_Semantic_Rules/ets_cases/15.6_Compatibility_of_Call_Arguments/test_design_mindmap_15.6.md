# 15.6 Compatibility of Call Arguments - 测试设计思维导图

## 测试范围
验证 ArkTS 调用参数兼容性（Compatibility of Call Arguments）语义，包括：
- 调用参数类型兼容：参数类型与声明类型匹配时通过
- 子类型参数传递：子类型参数可传父类型声明（多态）
- 调用参数类型不匹配拒绝：参数类型不兼容时编译拒绝
- 参数数量不匹配拒绝：参数数量不匹配时编译拒绝
- 运行时调用参数行为：参数传递正确，值一致

## 测试用例矩阵

### compile-pass（编译通过）
| 用例 ID | 测试点 | 预期结果 |
|---------|--------|----------|
| SEM_15_06_00_001_PASS_ARG_COMPATIBILITY | 调用参数类型兼容：参数类型与声明类型匹配时通过 | compile-pass |
| SEM_15_06_00_005_PASS_SUBTYPE_ARG | 子类型参数兼容：子类型参数可传父类型声明 | compile-pass |

### compile-fail（编译失败）
| 用例 ID | 测试点 | 预期结果 |
|---------|--------|----------|
| SEM_15_06_00_102_FAIL_ARG_MISMATCH | 调用参数类型不匹配拒绝：string 传 int 声明应报错 | compile-fail |
| SEM_15_06_00_104_FAIL_ARG_COUNT | 参数数量不匹配：少传参数应报错 | compile-fail |

### runtime（运行时）
| 用例 ID | 测试点 | 预期结果 |
|---------|--------|----------|
| SEM_15_06_012 | 调用参数运行时行为：参数传递正确，值一致 | runtime |


## 最新设计要点

从章节思维导图同步的最新测试设计点：

- spread expression linearization (Step 1)
- non-rest parameter assignment (Step 2 arg_pos/par_pos increment)
- rest array parameter matching (type assignability)
- rest tuple parameter matching (element-wise assignability)
- excess argument error (no matching parameter)
- missing required argument error
- assignability check for each argument
- implicit conversions in call arguments
- spread of non-array expression (compile-error)
- argument count exceeding parameter count (compile-error)

## 跨章节关联
- 15.2 Subtyping（子类型关系影响参数传递）
- 15.4 Assignability（参数类型兼容性基于可赋值性）
- 15.11 Overload Resolution（重载解析依赖参数兼容性）

## 测试设计要点
1. **参数类型兼容**：验证参数类型与声明类型匹配时编译通过
2. **子类型参数传递**：验证子类型参数可传父类型声明（多态），如 Dog 可传 Animal 参数
3. **类型不匹配拒绝**：验证参数类型不兼容时编译拒绝，如 string 传 int 参数
4. **参数数量不匹配拒绝**：验证参数数量不匹配时编译拒绝，如少传参数
5. **运行时验证**：验证参数在运行时传递正确，值一致
