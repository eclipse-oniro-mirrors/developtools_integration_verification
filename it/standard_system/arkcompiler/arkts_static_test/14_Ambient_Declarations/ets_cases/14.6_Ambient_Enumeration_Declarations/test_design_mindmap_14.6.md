# 14.6 Ambient Enumeration Declarations — 测试设计思维导图

## 概述

Ambient enumeration declarations 使用 `declare enum` 声明在别处定义的枚举类型。成员不能有初始化器，`const enum` 暂时禁止。

**核心规则（ArkTS Static Spec ambients.md）：**
1. 语法：`'const'? 'enum' identifier enumBaseType? '{' ambientEnumMemberList? '}'`
2. ❌ `const` 前缀 → compile-time error（临时限制，未来版本可用）
3. ❌ 成员有初始化器 `{ A = 5 }` → compile-time error
4. ✅ 成员仅为标识符列表
5. ✅ 支持 enumBaseType
6. ✅ 可为空 `{}`

## 子类型覆盖

### compile-pass
- 基本枚举：`declare enum RGB {Red, Green, Blue}`
- 单成员：`declare enum Single {Only}`
- 空枚举：`declare enum Empty {}`
- 指定基类型：`declare enum Code: int {OK, Error}`

### compile-fail
- `const enum` 前缀：`declare const enum E {A, B}`
- 成员有初始化器：`declare enum E { A = 5 }`
- 非首成员有初始化器：`declare enum E { A, B = 5 }`

### runtime
- ambient enum + main 共存

## 文件命名规范
- 前缀：`AMB_`
- 章节：`14_06`
- PASS 001~004 → FAIL 005~007 → RUNTIME 008
