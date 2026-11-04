# 15.1.4 Specifics of Numeric Operator Contexts - Test Design Mindmap

## Test Scope
验证数值运算符上下文的语义规则：
- 数值运算符操作数拓宽到更大类型（最低 int）
- byte/short 自增不自宽
- 混合数值类型运算拓宽（int + long → long）
- 非数值运算符不可用于数值（boolean + int 无效）
- 数值运算符运行时行为验证

## ID Numbering Plan
| ID Range | Description |
|---|---|
| SEM_15_01_010 | compile-pass: 数值运算符操作数拓宽 |
| SEM_15_01_021 ~ SEM_15_01_022 | compile-pass: byte/short自增不自宽、混合数值类型运算 |
| SEM_15_01_023 | compile-fail: 非数值运算符不可用于数值 |
| SEM_15_01_024 | runtime: 数值运算符运行时行为 |

## File Naming Convention
- 前缀: `SEM_15_01_XXX`
- 类型标识: `PASS` (正向), `FAIL` (反向), `RUNTIME` (运行时)
- 功能描述: 驼峰命名，描述测试点
- 示例: `SEM_15_01_04_001_PASS_NUMERIC_OPERATOR_WIDEN.ets`

## Test Design Mindmap

### 15.1.4 Specifics of Numeric Operator Contexts
```
15.1.4 Specifics of Numeric Operator Contexts
├── compile-pass (3 cases)
│   ├── SEM_15_01_010: 数值运算符操作数拓宽到更大类型（最低int）
│   ├── SEM_15_01_021: byte/short自增不自宽
│   └── SEM_15_01_022: 混合数值类型运算拓宽（int+long→long）
├── compile-fail (1 case)
│   └── SEM_15_01_023: 非数值运算符不可用于数值（boolean+int无效）
└── runtime (1 case)
    └── SEM_15_01_024: 数值运算符运行时行为验证
```

### Test Case Details

#### compile-pass
| ID | Case File | Purpose | Expected |
|---|---|---|---|
| SEM_15_01_010 | SEM_15_01_04_001_PASS_NUMERIC_OPERATOR_WIDEN.ets | 验证数值运算符操作数拓宽到更大类型（最低int） | compile-pass |
| SEM_15_01_021 | SEM_15_01_04_002_PASS_BYTE_SHORT_INC.ets | 验证byte/short自增不自宽 | compile-pass |
| SEM_15_01_022 | SEM_15_01_04_003_PASS_MIXED_NUMERIC.ets | 验证混合数值类型运算拓宽：int+long→long | compile-pass |

#### compile-fail
| ID | Case File | Purpose | Expected |
|---|---|---|---|
| SEM_15_01_023 | SEM_15_01_04_100_FAIL_BOOL_NUMERIC.ets | 验证非数值运算符不可用于数值：boolean+int无效 | compile-fail |

#### runtime
| ID | Case File | Purpose | Expected |
|---|---|---|---|
| SEM_15_01_024 | SEM_15_01_04_200_RUNTIME_NUMERIC_OPS.ets | 验证数值运算符运行时行为：数值运算结果正确 | runtime |

## Cross-Chapter Links
- 6.3 Numeric Operator Contexts
- 15.1.1 Standalone Expression
- 15.1.2 Assignment-like Contexts


## 最新设计要点

从章节思维导图同步的最新测试设计点：

- postfix/prefix increment on byte/short (no widening)
- numeric operators widening (min int)

