# 4.5.1 Type Alias Declaration - Cross-Language Comparison (ArkTS / Java / Swift)

## 概览

Type Alias Declaration defines type aliases (`type T = existing_type`). This section covers declaration syntax, scope rules, and shadowing behavior for type aliases.

## 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 声明语法 | `type T = existingType` | 无直接等价（无类型别名） | `typealias T = ExistingType` |
| 作用域规则 | 块/模块作用域 | N/A | 模块/内部作用域 |
| 泛型支持 | 不支持 | N/A | ✅ `typealias Result<T> = (T, Error)` |

## 核心结论

ArkTS behavior in this section is largely consistent with Swift norms for type aliases. Java has no direct equivalent — type aliases do not exist in Java before SE 21 (unnamed classes/variables).

## 用例 1:1 对照（三环境实测结果）

**实测日期：** 2026-06-24
**实测环境：** ArkTS (es2panda + ark) / Java (javac + java SE 21) / Swift (5.10, /opt/swift/usr/bin/swift)

| 语言 | 编译 | 运行 | 验证结论 |
|------|------|------|---------|
| ArkTS | ✅ es2panda 编译通过 | ✅ ark 运行通过 | 行为符合预期 |
| Java | N/A | N/A | Java 无类型别名机制 |
| Swift | ✅ swift 编译通过 | ✅ swift 运行通过 | 行为一致或差异已标注 |

> 完整实测代码见章级 `cross_lang_verify/` 目录
