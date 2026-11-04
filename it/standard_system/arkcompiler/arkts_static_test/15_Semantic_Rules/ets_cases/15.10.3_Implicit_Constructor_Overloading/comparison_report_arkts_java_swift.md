# 15.10.3 15.10.3_Implicit_Constructor_Overloading - ArkTS/Java/Swift/TypeScript Comparison Report
| Aspect | ArkTS | Java | Swift | TypeScript |
|--------|-------|------|-------|------------|
| Ctor overload | ✅ | ✅ | ✅ | ❌ no ctors |
| Invalid args | ❌ rejected | ❌ | ❌ | ❌ |
## Test Cases
| SEM_15_10_003_PASS_CTOR_OVERLOAD | PASS | ✅ |
| SEM_15_10_03_099 | FAIL | ✅ |
| SEM_15_10_03_100 | RUNTIME | ✅ |
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
