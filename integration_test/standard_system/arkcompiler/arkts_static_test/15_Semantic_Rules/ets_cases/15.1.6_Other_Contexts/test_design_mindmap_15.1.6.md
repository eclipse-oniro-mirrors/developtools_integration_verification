# 15.1.6 Other Contexts - Test Design Mindmap

## Test Scope
验证其余上下文的语义规则（兜底条款）：
- 独立字符串表达式推断
- 独立布尔表达式推断
- 数组字面量作为独立表达式
- 函数返回上下文
- 属性访问表达式推断
- 其余上下文类型不匹配拒绝
- 其余上下文运行时行为验证

## ID Numbering Plan
| ID Range | Description |
|---|---|
| SEM_15_01_06_001 ~ SEM_15_01_06_005 | compile-pass: 各种其余上下文的正向用例 |
| SEM_15_01_06_101 | compile-pass: 其余上下文布尔拼接 |
| SEM_15_01_06_099 | compile-fail: 其余上下文类型不匹配拒绝 |
| SEM_15_01_06_100 | runtime: 其余上下文运行时行为 |

## File Naming Convention
- 前缀: `SEM_15_01_06_XXX`
- 类型标识: `PASS` (正向), `FAIL` (反向), 或无（运行时）
- 功能描述: 驼峰命名，描述测试点（可选）
- 示例: `SEM_15_01_06_001.ets`, `SEM_15_01_06_002_PASS_BOOL_CONTEXT.ets`

## Test Design Mindmap

### 15.1.6 Other Contexts
```
15.1.6 Other Contexts (Fallback Rule)
├── compile-pass (6 cases)
│   ├── SEM_15_01_06_001: 独立字符串表达式推断
│   ├── SEM_15_01_06_002: 独立布尔表达式推断
│   ├── SEM_15_01_06_003: 数组字面量作为独立表达式
│   ├── SEM_15_01_06_004: 函数返回上下文
│   ├── SEM_15_01_06_005: 属性访问表达式推断
│   └── SEM_15_01_06_101: 其余上下文布尔拼接
├── compile-fail (1 case)
│   └── SEM_15_01_06_099: 其余上下文类型不匹配拒绝
└── runtime (1 case)
    └── SEM_15_01_06_100: 其余上下文运行时行为验证
```

### Test Case Details

#### compile-pass
| ID | Case File | Purpose | Expected |
|---|---|---|---|
| SEM_15_01_06_001 | SEM_15_01_06_001.ets | 验证独立字符串表达式推断 | compile-pass |
| SEM_15_01_06_002 | SEM_15_01_06_002_PASS_BOOL_CONTEXT.ets | 验证独立布尔表达式推断 | compile-pass |
| SEM_15_01_06_003 | SEM_15_01_06_003_PASS_ARRAY_CONTEXT.ets | 验证数组字面量作为独立表达式 | compile-pass |
| SEM_15_01_06_004 | SEM_15_01_06_004_PASS_FUNC_RETURN_CONTEXT.ets | 验证函数返回上下文 | compile-pass |
| SEM_15_01_06_005 | SEM_15_01_06_005_PASS_PROPERTY_ACCESS.ets | 验证属性访问表达式推断 | compile-pass |
| SEM_15_01_06_101 | SEM_15_01_06_101.ets | 验证其余上下文布尔拼接 | compile-pass |

#### compile-fail
| ID | Case File | Purpose | Expected |
|---|---|---|---|
| SEM_15_01_06_099 | SEM_15_01_06_100_FAIL_MISMATCH.ets | 验证其余上下文类型不匹配拒绝 | compile-fail |

#### runtime
| ID | Case File | Purpose | Expected |
|---|---|---|---|
| SEM_15_01_06_100 | SEM_15_01_06_100.ets | 验证其余上下文运行时行为 | runtime |

## Cross-Chapter Links
- 15.1.1 Standalone Expression (fallback rule)
- All 15.1.x sub-sections
- 15.4 Assignability
- 15.5 Type Inference


## 最新设计要点

从章节思维导图同步的最新测试设计点：

- overriding uses subtyping

