# 15.10.1 15.10.1_Implicit_Function_Overloading - Test Design Mindmap
## Test Scope
验证函数重载：按参数类型/数量重载、联合参数重载、歧义拒绝、运行时
## Case Matrix
| SEM_15_10_01_001_PASS_FUNCTION_OVERLOAD | PASS | 验证函数重载：同名函数不同参数类型可共存 |
| SEM_15_10_01_002_PASS_PARAM_COUNT_OVERLOAD | PASS | 验证多参数重载：不同参数数量的函数重载 |
| SEM_15_10_01_003_PASS_UNION_OVERLOAD | PASS | 验证联合类型参数重载：参数类型为联合类型时的重载解析 |
| SEM_15_10_01_004_PASS_UNAMBIGUOUS_OVERLOAD | PASS | 验证重载解析 — 编译器在可确定良好匹配时允许重载 |
| SEM_15_10_01_100_FAIL_ERASURE_AMBIGUOUS | FAIL | 验证重载解析 — 类型擦除后签名不可区分时报错 |
| SEM_15_10_01_100 | RUNTIME | 函数重载运行时解析 |
## Cross-Chapter Links
- 15.10 Overloading\n- 4.7 Function Declarations


## 最新设计要点

从章节思维导图同步的最新测试设计点：

- function overloading with different params
- overload resolution

