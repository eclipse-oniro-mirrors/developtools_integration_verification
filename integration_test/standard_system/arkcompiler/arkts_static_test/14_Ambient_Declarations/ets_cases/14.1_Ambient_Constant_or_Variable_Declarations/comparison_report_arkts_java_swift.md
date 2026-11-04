# 14.1 Ambient Constant or Variable Declarations — 跨语言对比报告

## 1. 概览

| 语言 | 定位 | Ambient 支持 |
|------|------|-------------|
| ArkTS | 声明在别处定义的实体类型信息 | ✅ `declare let` / `declare const` |
| Java | 所有声明必须包含实现或初始值 | ❌ 无直接等价概念 |
| Swift | 所有声明必须有具体实现或初始值 | ❌ 无直接等价概念 |

## 2. 章节对应关系

| ArkTS 14.1 | Java | Swift |
|-----------|------|-------|
| `declare let v: type` | ❌ 无对应。`public static T v` 必须初始化 | ❌ 无对应。`var v: T` 必须初始化 |
| `declare const v: type` | ❌ 无对应。`public static final T V = val` 必须初始化 | ❌ 无对应。`let v: T = val` 必须初始化 |
| 禁止初始化器 | ❌ Java 无法声明无初始值的变量 | ❌ Swift 无法声明无初始值的变量 |
| 禁止无类型注解 | ❌ Java 要求显式类型 | ❌ Swift 要求显式类型 | 

## 3. 关键差异矩阵

| 特性 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 声明外部实体类型 | ✅ `declare let/const` | ❌ 借助 JNI/接口 | ❌ 借助 protocol/extern |
| 变量不初始化 | ✅ | ❌ 必须有初始值或默认值 | ❌ 必须有初始值 |
| 常量不初始化 | ✅ | ❌ 必须初始化 | ❌ 必须初始化 |
| 无类型推导 | ✅ (必须显式类型) | ✅ (变量必须显式类型) | ✅ (变量必须显式类型) |
| 多声明语法 | ✅ `let a: int, b: string` | ❌ 每行一个声明 | ❌ 每行一个声明 |

## 4. 三环境实测结果

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | declare let int | ✅ compile-pass | N/A | N/A |
| 002 | declare let string | ✅ compile-pass | N/A | N/A |
| 003 | declare let boolean | ✅ compile-pass | N/A | N/A |
| 004 | declare let double | ✅ compile-pass | N/A | N/A |
| 005 | declare let array | ✅ compile-pass | N/A | N/A |
| 006 | declare const int | ✅ compile-pass | N/A | N/A |
| 007 | declare const string | ✅ compile-pass | N/A | N/A |
| 008 | declare const boolean | ✅ compile-pass | N/A | N/A |
| 009 | declare let multiple | ✅ compile-pass | N/A | N/A |
| 010 | declare const multiple | ✅ compile-pass | N/A | N/A |
| 015 | let with initializer | ✅ compile-fail (ESE125125) | N/A | N/A |
| 016 | const with initializer | ✅ compile-fail (ESE125125) | N/A | N/A |
| 017 | let no type | ✅ compile-fail (ESE1111) | N/A | N/A |
| 018 | const no type | ✅ compile-fail (ESE1111) | N/A | N/A |
| 025 | runtime ambient context | ✅ runtime | N/A | N/A |
| 026 | runtime multiple ambient context | ✅ runtime | N/A | N/A |

## 5. 关键差异详解

### Ambient 声明概念：ArkTS 特有

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `declare let v: int` | ✅ 编译通过，声明外部实体类型 |
| Java | `static int v;` | ⚠️ 语义不同，Java 声明的同时创建了变量（有默认值0） |
| Swift | `var v: Int` | ⚠️ 语义不同，Swift 不允许未初始化变量 |

### 禁止初始化器

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS (spec) | `declare let v = 1` | ❌ 应产生 compile-time error |
| ArkTS (实际) | `declare let v = 1` | ❌ Semantic error ESE125125: "Initializers are not allowed in ambient contexts"（编译器已正确实施校验） |
| Java | `final int V = 1;` | ✅ 常量的标准声明方式 |
| Swift | `let v = 1` | ✅ 常量的标准声明方式 |

## 6. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 外部实体类型声明 | ⭐⭐⭐ (有 declare 关键字) | ⭐ (无直接等价，需 JNI/接口) | ⭐ (无直接等价，需 protocol/extern) |
| 类型安全 | ⭐⭐⭐ (显式类型注解) | ⭐⭐⭐ (显式类型) | ⭐⭐⭐ (显式类型) |
| 声明简洁性 | ⭐⭐⭐ (多声明语法) | ⭐⭐ (每行一个) | ⭐⭐ (每行一个) |
| 规范一致性 | ⭐⭐⭐ (编译器已正确实施校验) | N/A | N/A |

## 7. 核心结论

1. Ambient constant/variable declarations 是 **ArkTS/TypeScript 特有概念**，Java 和 Swift 均无直接对应
2. ArkTS 的 `declare` 允许在不提供实现的情况下声明类型信息，适用于描述外部 API 签名
3. 编译器已正确校验 "无初始化器"（ESE125125）和 "显式类型注解"（ESE1111）两条规则 — 见 design_issues_report
4. runtime 用例验证了 ambient 声明不干扰正常代码编译执行

## 8. ArkTS 设计建议

1. **保持与 TypeScript 兼容**：ArkTS ambient 语法与 TypeScript 一致，编译时规则已正确对齐
2. **规范一致性验证通过**：编译器已正确实施 ambient 声明的两个约束（无初始化器、显式类型注解）
