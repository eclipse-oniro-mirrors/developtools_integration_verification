# 15.1.7 Specifics of Type Parameters - Test Design Mindmap

## Test Scope
验证类型参数的语义规则：
- 类型参数作为返回值类型（泛型函数返回类型参数类型）
- 类型参数约束（extends 约束的类型参数可调用约束方法）
- 类型参数作为 LHS 时不提供推断信息
- 类型参数运行时行为验证（泛型函数运行时派发正确）

## ID Numbering Plan
| ID Range | Description |
|---|---|
| SEM_15_01_030 ~ SEM_15_01_031 | compile-pass: 类型参数作为返回值类型、类型参数约束 |
| SEM_15_01_012 | compile-fail: 类型参数作为LHS时不提供推断信息 |
| SEM_15_01_032 | runtime: 类型参数运行时行为 |

## File Naming Convention
- 前缀: `SEM_15_01_XXX`
- 类型标识: `PASS` (正向), `FAIL` (反向), `RUNTIME` (运行时)
- 功能描述: 驼峰命名，描述测试点
- 示例: `SEM_15_01_07_001_PASS_TYPE_PARAM_RETURN.ets`

## Test Design Mindmap

### 15.1.7 Specifics of Type Parameters
```
15.1.7 Specifics of Type Parameters
├── compile-pass (2 cases)
│   ├── SEM_15_01_030: 类型参数作为返回值类型（泛型函数返回类型参数类型）
│   └── SEM_15_01_031: 类型参数约束（extends约束的类型参数可调用约束方法）
├── compile-fail (1 case)
│   └── SEM_15_01_012: 类型参数作为LHS时不提供推断信息
└── runtime (1 case)
    └── SEM_15_01_032: 类型参数运行时行为验证（泛型函数运行时派发正确）
```

### Test Case Details

#### compile-pass
| ID | Case File | Purpose | Expected |
|---|---|---|---|
| SEM_15_01_030 | SEM_15_01_07_001_PASS_TYPE_PARAM_RETURN.ets | 验证类型参数作为返回值类型：泛型函数返回类型参数类型 | compile-pass |
| SEM_15_01_031 | SEM_15_01_07_002_PASS_TYPE_PARAM_CONSTRAINT.ets | 验证类型参数约束：extends约束的类型参数可调用约束方法 | compile-pass |

#### compile-fail
| ID | Case File | Purpose | Expected |
|---|---|---|---|
| SEM_15_01_012 | SEM_15_01_012_FAIL_TYPE_PARAM_LHS_INFERENCE.ets | 验证类型参数作为LHS时不提供推断信息 | compile-fail |

#### runtime
| ID | Case File | Purpose | Expected |
|---|---|---|---|
| SEM_15_01_032 | SEM_15_01_07_200_RUNTIME_TYPE_PARAM.ets | 验证类型参数运行时行为：泛型函数运行时派发正确 | runtime |

## Cross-Chapter Links
- 5.1 Type Parameters
- 15.1.1 Standalone Expression
- 15.5 Type Inference
- 15.7 Generic Functions


## 最新设计要点

从章节思维导图同步的最新测试设计点：

- type parameter provides no inference info in assignment context
- compile-time error expected

