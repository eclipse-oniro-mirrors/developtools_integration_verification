# 14.6 Ambient Enumeration Declarations — 跨语言对比报告

## 1. 概览

| 语言 | 枚举声明 | 成员初始化器 |
|------|---------|-------------|
| ArkTS | ✅ `declare enum` | ❌ 禁止（spec 要求） |
| Java | ✅ `enum` | ✅ 允许 |
| Swift | ✅ `enum` | ✅ 允许（原始值） |

## 2. 章节对应关系

| ArkTS 14.6 | Java | Swift |
|-----------|------|-------|
| `declare enum RGB {Red, Green, Blue}` | `enum RGB { RED, GREEN, BLUE }` | `enum RGB { case red, green, blue }` |
| `declare enum Code: int {OK, Error}` | `enum Code { OK, ERROR }` | `enum Code: Int { case ok, error }` |
| 禁止 `const enum` | ❌ 无对应 | ❌ 无对应 |
| 禁止成员初始化器 | ✅ `A(5)` 允许 | ✅ `case a = 5` 允许 |

## 3. 关键差异矩阵

| 特性 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 枚举声明 | ✅ declare enum | ✅ enum | ✅ enum |
| const 前缀 | ❌ 暂时禁止 | N/A | N/A |
| 成员初始化器 | ❌ spec 禁止（D 类）| ✅ 允许 | ✅ 允许 |
| 基类型 | ✅ enumBaseType | ✅ 隐式 int | ✅ 原始值类型 |
| 空枚举 | ✅ 允许 | ❌ 至少一个成员 | ❌ 至少一个 case |

## 4. 三环境实测结果

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | 基本 enum | ✅ compile-pass | ✅ | ✅ |
| 002 | 单成员 | ✅ compile-pass | ✅ | ✅ |
| 003 | 空 enum | ✅ compile-pass | ✅ | ✅ |
| 004 | 基类型 | ✅ compile-pass | ✅ | ✅ |
| 005 | const enum | ✅ compile-fail | N/A | N/A |
| 006 | 成员初始化器 | ⚠️ D 类不一致 | ✅ | ✅ |
| 007 | 混合初始化器 | ⚠️ D 类不一致 | ✅ | ✅ |
| 008 | runtime | ✅ runtime | N/A | N/A |

## 5. 关键差异详解

### 成员初始化器禁止

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS (spec) | `declare enum E { A = 5 }` | ❌ compile-time error |
| ArkTS (实际) | `declare enum E { A = 5 }` | ⚠️ 编译通过（D 类不一致）|
| Java | `enum E { A(5) }` 或 `A { ... }` | ✅ 允许构造函数/值关联 |
| Swift | `enum E: Int { case A = 5 }` | ✅ 允许原始值关联 |

### const enum 限制

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `declare const enum E { A }` | ❌ compile-time error（临时限制）|
| TypeScript | `const enum E { A }` | ✅ 支持 |

## 6. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 枚举声明简洁性 | ⭐⭐⭐（简洁标识符列表） | ⭐⭐⭐ | ⭐⭐⭐ |
| 成员初始化器 | ⭐（spec 禁止，但有 D 类问题） | ⭐⭐⭐ | ⭐⭐⭐ |
| const enum | ⭐（暂时限制） | N/A | N/A |
| 编译器校验 | ⭐⭐（const enum ✅，初始化器 ❌）| N/A | N/A |

## 7. 核心结论

1. `const enum` 的限制已正确实施（编译时报错）
2. 成员初始化器检查缺失，属 D 类不一致（与 14.1 模式相同）
3. Java/Swift 均允许枚举成员带初始化器/原始值，ArkTS 的禁止是独有约束

## 8. ArkTS 设计建议

1. 修复成员初始化器的编译器校验，对齐 spec 约束
2. 明确 `const enum` 的未来支持时间线
