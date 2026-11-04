# 15.1.5 Specifics of String Operator Contexts - Test Design Mindmap

## Test Scope
验证字符串运算符上下文的语义规则：
- 二元 '+' 运算符在一侧为 string 时进行字符串转换
- 字符串与布尔值拼接（string + boolean → string）
- 字符串与 double 拼接（string + double → string）
- 二进制运算符 '-' 不可用于字符串（string - string 无效）
- 字符串拼接运行时行为验证

## ID Numbering Plan
| ID Range | Description |
|---|---|
| SEM_15_01_011 | compile-pass: 字符串运算符转换（string+int） |
| SEM_15_01_025 ~ SEM_15_01_026 | compile-pass: 字符串与布尔值拼接、字符串与double拼接 |
| SEM_15_01_027 | compile-fail: 字符串减法运算无效 |
| SEM_15_01_028 | runtime: 字符串拼接运行时行为 |

## File Naming Convention
- 前缀: `SEM_15_01_XXX`
- 类型标识: `PASS` (正向), `FAIL` (反向), `RUNTIME` (运行时)
- 功能描述: 驼峰命名，描述测试点
- 示例: `SEM_15_01_05_001_PASS_STRING_OPERATOR_CONVERSION.ets`

## Test Design Mindmap

### 15.1.5 Specifics of String Operator Contexts
```
15.1.5 Specifics of String Operator Contexts
├── compile-pass (3 cases)
│   ├── SEM_15_01_011: 字符串运算符转换（string+int→string）
│   ├── SEM_15_01_025: 字符串与布尔值拼接（string+boolean→string）
│   └── SEM_15_01_026: 字符串与double拼接（string+double→string）
├── compile-fail (1 case)
│   └── SEM_15_01_027: 字符串减法运算无效（string-string）
└── runtime (1 case)
    └── SEM_15_01_028: 字符串拼接运行时行为验证
```

### Test Case Details

#### compile-pass
| ID | Case File | Purpose | Expected |
|---|---|---|---|
| SEM_15_01_011 | SEM_15_01_05_001_PASS_STRING_OPERATOR_CONVERSION.ets | 验证二元'+'运算符在一侧为string时进行字符串转换 | compile-pass |
| SEM_15_01_025 | SEM_15_01_05_002_PASS_STRING_BOOL.ets | 验证字符串与布尔值拼接：string+boolean→string | compile-pass |
| SEM_15_01_026 | SEM_15_01_05_003_PASS_STRING_DOUBLE.ets | 验证字符串与double拼接：string+double→string | compile-pass |

#### compile-fail
| ID | Case File | Purpose | Expected |
|---|---|---|---|
| SEM_15_01_027 | SEM_15_01_05_100_FAIL_STRING_SUB.ets | 验证二进制运算符'-'不可用于字符串：string-string无效 | compile-fail |

#### runtime
| ID | Case File | Purpose | Expected |
|---|---|---|---|
| SEM_15_01_028 | SEM_15_01_05_200_RUNTIME_STRING_CONCAT.ets | 验证字符串拼接运行时行为：字符串+数值拼接结果正确 | runtime |

## Cross-Chapter Links
- 7.4 String Operators
- 15.1.1 Standalone Expression
- 15.1.4 Numeric Operator Contexts


## 最新设计要点

从章节思维导图同步的最新测试设计点：

- '+' with string operand (string conversion)

