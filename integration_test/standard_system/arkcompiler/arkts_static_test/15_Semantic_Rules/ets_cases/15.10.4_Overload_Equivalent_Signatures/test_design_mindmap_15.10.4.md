# 15.10.4 15.10.4_Overload_Equivalent_Signatures - Test Design Mindmap
## Test Scope
验证等价签名：可区分重载通过、等价签名拒绝（ESE0130）、运行时
## Case Matrix
| SEM_15_10_04_001 | PASS | 可区分重载通过 |
| SEM_15_10_010_FAIL_EQUIVALENT_SIG | FAIL | 验证等价签名拒绝：仅返回值不同的重载应报错 |
| SEM_15_10_04_100 | RUNTIME | 等价签名运行时 |
## Cross-Chapter Links
- 15.10 Overloading\n- 15.11.7 Overload Set Warning


## 最新设计要点

从章节思维导图同步的最新测试设计点：

- equivalent signatures (should fail compilation)

