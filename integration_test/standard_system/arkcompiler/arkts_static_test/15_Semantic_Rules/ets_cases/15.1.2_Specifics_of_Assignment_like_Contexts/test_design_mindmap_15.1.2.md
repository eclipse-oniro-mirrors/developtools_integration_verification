# 15.1.2 Specifics of Assignment-like Contexts - Test Design Mindmap

## Test Scope
验证赋值类上下文的语义规则：
- 已知 RHS 类型时的可赋值性检查
- 未知 RHS 类型时从 LHS 类型推断
- 数值拓宽赋值（int → double）
- 子类型赋值（Dog → Animal）
- 类型不匹配拒绝（string 不可赋值给 int）
- 不相关类拒绝（Dog 不可赋值给 Cat）
- 运行时赋值语义验证

## ID Numbering Plan
| ID Range | Description |
|---|---|
| SEM_15_01_006 ~ SEM_15_01_007 | compile-pass: 已知RHS类型检查、未知RHS类型推断 |
| SEM_15_01_012 ~ SEM_15_01_013 | compile-pass: 数值拓宽赋值、子类型赋值 |
| SEM_15_01_014 ~ SEM_15_01_015 | compile-fail: 类型不匹配拒绝、不相关类拒绝 |
| SEM_15_01_016 | runtime: 赋值上下文运行时行为 |

## File Naming Convention
- 前缀: `SEM_15_01_XXX`
- 类型标识: `PASS` (正向), `FAIL` (反向), `RUNTIME` (运行时)
- 功能描述: 驼峰命名，描述测试点
- 示例: `SEM_15_01_02_001_PASS_KNOWN_RHS_ASSIGN.ets`

## Test Design Mindmap

### 15.1.2 Specifics of Assignment-like Contexts
```
15.1.2 Specifics of Assignment-like Contexts
├── compile-pass (4 cases)
│   ├── SEM_15_01_006: 已知RHS类型时的可赋值性检查
│   ├── SEM_15_01_007: 未知RHS类型时从LHS类型推断
│   ├── SEM_15_01_012: 数值拓宽赋值（int→double）
│   └── SEM_15_01_013: 子类型赋值（Dog→Animal）
├── compile-fail (2 cases)
│   ├── SEM_15_01_014: 类型不匹配拒绝（string→int）
│   └── SEM_15_01_015: 不相关类拒绝（Dog→Cat）
└── runtime (1 case)
    └── SEM_15_01_016: 赋值上下文运行时行为验证
```

### Test Case Details

#### compile-pass
| ID | Case File | Purpose | Expected |
|---|---|---|---|
| SEM_15_01_006 | SEM_15_01_02_001_PASS_KNOWN_RHS_ASSIGN.ets | 验证赋值上下文中RHS类型已知时的可赋值性检查 | compile-pass |
| SEM_15_01_007 | SEM_15_01_02_002_PASS_UNKNOWN_RHS_INFER.ets | 验证赋值上下文中RHS类型未知时从LHS类型推断 | compile-pass |
| SEM_15_01_012 | SEM_15_01_02_003_PASS_WIDENING_ASSIGN.ets | 验证赋值上下文中数值拓宽：int→double可赋值 | compile-pass |
| SEM_15_01_013 | SEM_15_01_02_004_PASS_SUBTYPE_ASSIGN.ets | 验证赋值上下文中子类型赋值：Dog→Animal可赋值 | compile-pass |

#### compile-fail
| ID | Case File | Purpose | Expected |
|---|---|---|---|
| SEM_15_01_014 | SEM_15_01_02_100_FAIL_TYPE_MISMATCH.ets | 验证赋值上下文中类型不匹配拒绝：string不可赋值给int | compile-fail |
| SEM_15_01_015 | SEM_15_01_02_101_FAIL_UNRELATED_ASSIGN.ets | 验证赋值上下文中不相关类拒绝：Dog不可赋值给Cat | compile-fail |

#### runtime
| ID | Case File | Purpose | Expected |
|---|---|---|---|
| SEM_15_01_016 | SEM_15_01_02_200_RUNTIME_ASSIGN_SEMANTICS.ets | 验证赋值上下文运行时行为：赋值后变量值正确 | runtime |

## Cross-Chapter Links
- 15.1.1 Standalone Expression
- 15.4 Assignability
- 15.5 Type Inference


## 最新设计要点

从章节思维导图同步的最新测试设计点：

- known RHS type
- unknown RHS type, infer from LHS

