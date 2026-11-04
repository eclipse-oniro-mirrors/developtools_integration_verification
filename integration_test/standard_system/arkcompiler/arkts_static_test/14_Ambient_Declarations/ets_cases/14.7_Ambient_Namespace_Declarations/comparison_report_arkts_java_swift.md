# 14.7 Ambient Namespace Declarations — 跨语言对比报告

## 1. 概览

| 语言 | 命名空间机制 | 嵌套支持 |
|------|-------------|---------|
| ArkTS | ✅ `declare namespace` | ✅ |
| Java | ✅ package / 静态内部类 | ✅ |
| Swift | ✅ enum / struct 作为命名空间 | ✅ |

## 2. 章节对应关系

| ArkTS 14.7 | Java | Swift |
|-----------|------|-------|
| `declare namespace A { export function foo(): void }` | `class A { public static void foo() {} }` | `enum A { static func foo() {} }` |
| `declare namespace A { export namespace B { ... } }` | `class A { static class B { ... } }` | `enum A { enum B { ... } }` |
| `declare namespace A { type X = int }` | ❌ 静态类中不可定义类型别名 | ❌ 嵌套 enum 中不可定义 typealias |
| `declare namespace A { let x: int }` | `class A { public static int x; }` | `enum A { static var x: Int }` |

## 3. 关键差异矩阵

| 特性 | ArkTS | Java | Swift |
|------|-------|------|-------|
| namespace 关键字 | ✅ | ❌ 无关键字，用 class/package | ❌ 无关键字，用 enum |
| 嵌套 namespace | ✅ | ✅ 嵌套类 | ✅ 嵌套 enum |
| type alias 成员 | ✅ 支持 | ❌ 不支持 | ❌ 不支持 |
| export 控制 | ✅ export 关键字 | ✅ public 访问修饰符 | ✅ public 访问修饰符 |
| const enum | ❌ 暂时不支持 | N/A | N/A |
| 可声明类型 | ✅ function/variable/class/interface/type/accessor | ⭐ static 成员 | ⭐ static 成员 |

## 4. 三环境实测结果

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | 空 namespace | ✅ compile-pass | ✅ | ✅ |
| 002 | function | ✅ compile-pass | ✅ | ✅ |
| 003 | variable | ✅ compile-pass | ✅ | ✅ |
| 004 | 嵌套 namespace | ✅ compile-pass | ✅ | ✅ |
| 005 | 混合成员 | ✅ compile-pass | ✅ | ✅ |
| 006 | type alias | ✅ compile-pass | N/A | N/A |
| 008 | accessor | ✅ compile-pass | N/A | N/A |
| 009 | class | ✅ compile-pass | ✅ | ✅ |
| 010 | interface | ✅ compile-pass | ✅ | ✅ |
| 011 | export 不存在 | ✅ compile-fail | N/A | N/A |
| 013 | const enum | ✅ compile-fail | N/A | N/A |
| 012 | runtime | ✅ runtime | N/A | N/A |

## 5. 关键差异详解

### namespace 关键字为 ArkTS/TS 特有

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `declare namespace A { export function foo(): void }` | ✅ 原生 namespace 支持 |
| Java | `class A { public static void foo() {} }` | ⚠️ 使用 class 模拟命名空间 |
| Swift | `enum A { static func foo() {} }` | ⚠️ 使用 enum 模拟命名空间 |

### type alias 在 namespace 中

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `declare namespace A { type X = int }` | ✅ 编译通过 |
| Java | `class A { type X = Integer; }` | ❌ 不存在类型别名 |
| Swift | `enum A { typealias X = Int }` | ❌ 支持的语法不同 |

## 6. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 命名空间声明 | ⭐⭐⭐（原生 namespace） | ⭐⭐（需 class 模拟） | ⭐⭐（需 enum 模拟） |
| 成员类型丰富度 | ⭐⭐⭐（function/variable/class/interface/type alias） | ⭐⭐（仅 static 成员） | ⭐⭐（仅 static 成员） |
| 嵌套支持 | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ |
| 编译器校验 | ⭐⭐⭐（export 检查正确） | N/A | N/A |

## 7. 核心结论

1. ArkTS namespace 与 Java/Swift 无直接对应，Java 用静态内部类、Swift 用 enum 模拟命名空间
2. `export` 不存在成员的校验已正确实施
3. type alias 在 namespace 中是 ArkTS/TS 独有的灵活特性
4. const enum 在 namespace 内同样受全局限制（与 14.6 一致）

## 8. ArkTS 设计建议

1. 保持当前 namespace 实现 — 所有校验均已正确实施
2. 未来取消 const enum 限制后，namespace 内的 const enum 也应自动支持
