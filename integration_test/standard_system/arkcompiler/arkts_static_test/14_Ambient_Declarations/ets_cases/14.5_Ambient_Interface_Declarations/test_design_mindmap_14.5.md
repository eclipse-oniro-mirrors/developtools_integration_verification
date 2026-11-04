# 14.5 Ambient Interface Declarations — 测试设计思维导图

## 概述

Ambient interface declarations 使用 `declare interface` 声明在别处定义的接口类型信息。接口成员可以有属性、方法（可带 `default` 标记）、indexer、iterable。

**核心规则（来自 ArkTS Static Spec ambients.md）：**
1. 语法：`declare interface Name { members }`
2. 成员类型：interfaceProperty、ambientInterfaceMethodDeclaration、ambientIndexerDeclaration、ambientIterableDeclaration
3. 方法可用 `default` 标记（表示接口提供了默认实现，实现类无需提供）
4. 支持 `extends` 和泛型参数
5. ambient 接口中的方法**不能有函数体**（否则 compile-time error）
6. 方法必须具有显式返回类型（否则 compile-time error）
7. indexer 规则与 ambient class 一致（每类仅允许一个）
8. iterable 规则与 ambient class 一致（返回类型必须实现 Iterator 接口）

**语法：**
```
ambientInterfaceDeclaration:
    'interface' identifier typeParameters?
    interfaceExtendsClause?
    '{' ambientInterfaceMember* '}'
    ;
ambientInterfaceMember
    : interfaceProperty
    | ambientInterfaceMethodDeclaration
    | ambientIndexerDeclaration
    | ambientIterableDeclaration
    ;
ambientInterfaceMethodDeclaration:
    'default'? identifier signature
    ;
```

## 子类型覆盖

### 1. declare interface 正向编译（compile-pass）

- **空接口**：`declare interface Empty {}` — 最简语法
- **属性声明**：`declare interface I { x: int, name: string }` — 成员变量
- **方法声明**：`declare interface I { foo(x: int): void, bar(): string }` — 无体方法
- **default 方法**：`declare interface I { default foo(): void }` — default 关键字标记
- **extends**：`declare interface Derived extends Base { ... }` — 接口继承
- **泛型接口**：`declare interface Container<T> { value: T, get(): T }` — 泛型参数
- **indexer 成员**：`declare interface I { [index: number]: string }` — 索引签名
- **iterable 成员**：`declare interface I { [Symbol.iterator](): Iterator<int> }` — 可迭代声明

### 2. 反向编译（compile-fail）

- **方法有实现体**：`declare interface I { foo(): void {} }` — violate "ambient 方法不能有体"
- **方法无返回类型**：`declare interface I { foo(x: int) }` — violate "显式返回类型"
- **两个 indexer**：`declare interface I { [index: number]: number; [index: string]: string }` — violate "仅一个 indexer"

### 3. 运行时（runtime）

- 在带 main 入口的文件中使用 ambient interface 声明，验证不影响正常代码编译与执行
- ambient interface 本身不产生可执行代码，运行时仅验证周围代码可正常运行

## 分类说明

| 分类 | 设计目的 | 通过条件 |
|------|---------|---------|
| compile-pass | 验证合法语法编译通过 | 编译无 Syntax/Semantic error |
| compile-fail | 验证非法语法报错 | 编译有 Syntax/Semantic error |
| runtime | 验证 ambient 声明不干扰正常运行 | 编译成功 + ark 执行成功 |

## 文件命名规范

- 前缀：`AMB_`
- 章节：`14_05`（14 章 05 子节）
- 编号：PASS 001~008 → FAIL 009~011 → RUNTIME 012
- 格式：`AMB_14_05_YYY_{CATEGORY}_{DESCRIPTION}.ets`
