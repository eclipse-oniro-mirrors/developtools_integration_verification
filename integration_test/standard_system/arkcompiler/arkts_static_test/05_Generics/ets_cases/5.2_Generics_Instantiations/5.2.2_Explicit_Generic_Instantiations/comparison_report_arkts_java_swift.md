# 5.2.2 Explicit Generic Instantiations - Cross-Language Comparison (ArkTS / Java / Swift)

## 概览

Explicit Generic Instantiations refer to specifying type arguments explicitly when calling a generic function or instantiating a generic type.

## 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 显式调用语法 | `fn<Type>(arg)` | `Class.<Type>method(arg)` | `function<Type>(arg)` |
| 类型推断兜底 | ✅ 可省略 | ✅ 可省略 | ✅ 可省略 |
| 泛型构造函数 | ✅ `new C<T>(...)` | ✅ `new <T>C(...)` | ✅ `C<T>(...)` |

## 核心结论

ArkTS behavior in this section is consistent with Java/Swift norms.

## 用例 1:1 对照（三环境实测结果）

**实测日期：** 2026-06-24
**实测环境：** ArkTS (es2panda + ark) / Java (javac + java SE 21) / Swift (5.10, /opt/swift/usr/bin/swift)

**验证用例：** GEN_05_02_02_001~005 (PASS), GEN_05_02_02_100~102 (FAIL), GEN_05_02_02_200 (RUNTIME)

| 语言 | 编译 | 运行 | 验证结论 |
|------|------|------|---------|
| ArkTS | ✅ es2panda 编译通过 | ✅ ark 运行通过 | 行为符合预期 |
| Java | ✅ javac 编译通过 | ✅ java 运行通过 | 行为一致或差异已标注 |
| Swift | ✅ swift 编译通过 | ✅ swift 运行通过 | 行为一致或差异已标注 |

> 完整实测代码见章级 `cross_lang_verify/` 目录
