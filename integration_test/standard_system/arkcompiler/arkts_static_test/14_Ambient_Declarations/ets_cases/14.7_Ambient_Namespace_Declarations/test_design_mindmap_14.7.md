# 14.7 Ambient Namespace Declarations — 测试设计思维导图

## 概述

Ambient namespace declarations 使用 `declare namespace` 声明在别处定义的命名空间，用于逻辑分组多个实体，提供 TS 兼容性。

**核心规则（ArkTS Static Spec ambients.md）：**
1. 语法：`declare namespace Name { elements }`
2. 成员类型：variable/function/class/interface/namespace/accessor/enum/typeAlias
3. `export` 控制对外可见性（仅 exported 成员可外部访问）
4. 支持嵌套 namespace
5. ❌ exportDirective 引用不存在的成员 → compile-time error
6. `const` 前缀在 enum 上允许（TS 兼容，无影响）

## 子类型覆盖

### compile-pass（10 个）
- 空 namespace：`declare namespace A {}`
- 含 function：`declare namespace A { function foo(): void }`
- 含 variable：`declare namespace A { export let x: int }`
- 嵌套 namespace：`declare namespace A { export namespace B { ... } }`
- 多成员混合：function + variable + class + interface
- 含 type alias：`declare namespace A { type X = int }`
- 含 const enum：`declare namespace A { const enum E {A, B} }`
- 含 accessor：`declare namespace A { get name(): string }`
- 含 class：`declare namespace A { class C { ... } }`
- 含 interface：`declare namespace A { interface I { ... } }`

### compile-fail（1 个）
- exportDirective 引用不存在的成员：`declare namespace A { export {foo} }`

### runtime（1 个）
- ambient namespace + main 共存

## 文件命名规范
- 前缀：`AMB_`
- 章节：`14_07`
- PASS 001~010 → FAIL 011 → RUNTIME 012
