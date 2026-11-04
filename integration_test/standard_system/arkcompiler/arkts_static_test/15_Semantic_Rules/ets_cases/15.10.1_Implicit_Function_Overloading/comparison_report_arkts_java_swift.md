# 15.10.1 15.10.1_Implicit_Function_Overloading - ArkTS/Java/Swift/TypeScript Comparison Report
| Aspect | ArkTS | Java | Swift | TypeScript |
|--------|-------|------|-------|------------|
| Overload by param types | ✅ | ✅ | ✅ (labels) | Multiple sigs |
| Overload by param count | ✅ | ✅ | ✅ | ✅ |
| Ambiguous overload | ❌ rejected | ❌ | ❌ | ✅ last sig |
## Test Cases
| SEM_15_10_01_001_PASS_FUNCTION_OVERLOAD | PASS | ✅ |
| SEM_15_10_01_002_PASS_PARAM_COUNT_OVERLOAD | PASS | ✅ |
| SEM_15_10_01_003_PASS_UNION_OVERLOAD | PASS | ✅ |
| SEM_15_10_01_004_PASS_UNAMBIGUOUS_OVERLOAD | PASS | ✅ |
| SEM_15_10_01_100_FAIL_ERASURE_AMBIGUOUS | FAIL | ✅ |
| SEM_15_10_01_100 | RUNTIME | ✅ |
---

## 用例 1:1 对照（三环境实测结果）

**实测日期：** 2026-06-24
**实测环境：** ArkTS (es2panda + ark) / Java (javac + java SE 21) / Swift (5.10, /opt/swift/usr/bin/swift)

| 语言 | 编译 | 运行 | 验证结论 |
|------|------|------|---------|
| ArkTS | ✅ es2panda 编译通过 | ✅ ark 运行通过 | 行为符合预期 |
| Java | ✅ javac 编译通过 | ✅ java 运行通过 | 行为一致或差异已标注 |
| Swift | ✅ swift 编译通过 | ✅ swift 运行通过 | 行为一致或差异已标注 |

> 本节未单独设 cross_lang_verify，实测代码见父章节 `../cross_lang_verify/` 目录
