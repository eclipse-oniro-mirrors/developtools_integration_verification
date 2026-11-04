# 14.4.2 Ambient Call Signature — 跨语言对比报告

## 1. 概览

| 语言 | 可调用类型声明 |
|------|-------------|
| ArkTS | ✅ ambient call signature in declare class |
| Java | ✅ @FunctionalInterface + lambda |
| Swift | ✅ 函数类型 `(T) -> U` |

## 2. 章节对应关系

| ArkTS 14.4.2 | Java | Swift |
|-------------|------|-------|
| `(x: string): void` | `void handle(String x)` | `(String) -> Void` |
| `(x: number): boolean` | `boolean handle(int x)` | `(Int) -> Bool` |
| 多个 distinct signatures | 多个 @FunctionalInterface | 函数类型重载 |

## 3. 关键差异矩阵

| 特性 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 可调用类型声明 | ✅ call signature in declare class | ✅ 函数式接口 | ✅ 函数类型 |
| 多签名重载 | ✅ distinct signatures 可共存 | ❌ 需不同接口 | ❌ 需不同类型别名 |
| 非 ambient 支持 | ❌ 仅在 ambient 上下文 | N/A | N/A |
| 编译器校验 | ✅ distinct 校验 | N/A | N/A |

## 4. 三环境实测结果

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | 单个 signature | ✅ compile-pass | ✅ | ✅ |
| 002 | 两个 distinct | ✅ compile-pass | ✅ | ✅ |
| 003 | 三个 distinct | ✅ compile-pass | ✅ | ✅ |
| 004 | 不同参数个数 | ✅ compile-pass | ✅ | ✅ |
| 005 | 与其余成员共存 | ✅ compile-pass | N/A | N/A |
| 006 | non-distinct | ✅ compile-fail | ✅ | ✅ |
| 007 | 非 ambient | ✅ compile-fail | N/A | N/A |
| 008 | 缺返回类型 | ✅ compile-fail | N/A | N/A |
| 009 | runtime | ✅ runtime | N/A | N/A |

## 5. 关键差异详解

### 可调用类型 vs 函数式接口

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `declare class C { (x: string): void }` | ✅ ambient call signature |
| Java | `@FunctionalInterface interface H { void handle(String x); }` | ⚠️ 需定义接口 |
| Swift | `typealias H = (String) -> Void` | ✅ 函数类型别名 |

## 6. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 声明简洁性 | ⭐⭐⭐（匿名签名） | ⭐⭐（需接口） | ⭐⭐⭐（类型别名） |
| 多签名支持 | ⭐⭐⭐（distinct 可共存） | ⭐（需多接口） | ⭐（需多别名） |
| 编译器校验 | ⭐⭐⭐（distinct/return 检查） | N/A | N/A |

## 7. 核心结论

ArkTS call signature 与 Java 函数式接口、Swift 函数类型概念相似。编译器正确实施了 distinct 校验和返回类型检查。

## 8. ArkTS 设计建议

保持当前实现 — 所有编译器校验均已正确实施，无待解决问题。
