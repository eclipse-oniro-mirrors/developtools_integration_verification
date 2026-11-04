# 14.2 Ambient Function Declarations — 测试设计思维导图

## 概述

Ambient function declaration 使用 `declare function` 关键字声明在别处定义的函数类型信息，不提供实现体。

**核心规则（ArkTS Static Spec ambients.md）：**
1. ❌ 必须显式指定返回类型 — 否则 compile-time error
2. ❌ 参数不能有默认值 — 否则 compile-time error
3. ❌ 不能有函数体 `{}` — 否则 compile-time error
4. ❌ 不能使用 `async` 修饰符 — 否则 compile-time error
5. ✅ 可选参数 `param?: type` 允许使用
6. ✅ 泛型参数允许使用

## 子类型覆盖

### 1. compile-pass：合法 ambient function 声明

- **基本函数**：`declare function foo(x: int): void`
- **多参数**：`declare function bar(x: int, y: string): boolean`
- **可选参数**：`declare function baz(x?: string): void`（spec 明确允许）
- **无参数**：`declare function empty(): int`
- **数组返回**：`declare function getArr(): int[]`
- **Object 返回**：`declare function getObj(): Object`
- **联合类型参数**：`declare function fn(x: int | string): void`
- **混合参数（必选+可选）**：`declare function fn(a: int, b?: string): void`

### 2. compile-fail：非法 ambient function 声明

- **无返回类型**：`declare function bad1(x: number)` — 缺少返回类型
- **参数默认值**：`declare function bad2(y: number = 1): void` — 默认值参数
- **函数体**：`declare function bad3(): void {}` — 有实现体
- **async 修饰符**：`declare async function bad4(): void` — 异步修饰符
- **可选+默认值**：`declare function bad5(x?: int = 5): void` — 可选参数+默认值
- **多参数含默认值**：`declare function bad6(a: int, b: string = "x"): void`
- **布尔默认值**：`declare function bad7(x: boolean = true): void`

### 3. runtime

- ambient function 声明与带 main 的正常代码共存，验证不影响编译执行

## 分类说明

| 分类 | 通过条件 |
|------|---------|
| compile-pass | 编译无 Syntax/Semantic error |
| compile-fail | 编译有 Syntax/Semantic error |
| runtime | 编译成功 + ark 执行成功 |

## 文件命名规范

- 前缀：`AMB_`
- 章节：`14_02`
- 编号：PASS 001~008 → FAIL 009~015 → RUNTIME 016
