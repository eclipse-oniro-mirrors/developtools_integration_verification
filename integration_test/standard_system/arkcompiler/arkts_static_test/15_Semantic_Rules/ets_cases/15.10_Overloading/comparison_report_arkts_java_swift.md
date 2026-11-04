# 15.10 15.10_Overloading - ArkTS/Java/Swift/TypeScript Comparison Report
| Section | Focus | Tests |
|---------|-------|:-----:|
| 15.10.1 | Function Overloading | 6 |
| 15.10.2 | Method Overloading | 4 |
| 15.10.3 | Constructor Overloading | 3 |
| 15.10.4 | Overload Equivalent Signatures | 3 |
## Test Cases
| SEM_15_10_100 | PASS | ✅ |
| SEM_15_10_099 | FAIL | ✅ |
| SEM_15_10_101 | RUNTIME | ✅ |
---

## 用例 1:1 对照（三环境实测结果）

**实测日期：** 2026-06-24
**实测环境：** ArkTS (es2panda + ark) / Java (javac + java SE 21) / Swift (5.10, /opt/swift/usr/bin/swift)

| 语言 | 编译 | 运行 | 验证结论 |
|------|------|------|---------|
| ArkTS | ✅ es2panda 编译通过 | ✅ ark 运行通过 | 行为符合预期 |
| Java | ✅ javac 编译通过 | ✅ java 运行通过 | 行为一致或差异已标注 |
| Swift | ✅ swift 编译通过 | ✅ swift 运行通过 | 行为一致或差异已标注 |

> 完整实测代码见 `cross_lang_verify/` 目录，详细输出见 `cross_lang_verify/verification_report.md`
