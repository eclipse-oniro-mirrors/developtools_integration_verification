# 14.3 Ambient Overload Function Declarations — 测试设计思维导图

## 概述

Ambient overload function declarations 使用 `declare overload name {func1, func2}` 语法为一组 declare function 创建重载集合，调用时按参数类型进行重载解析。

**核心规则（ArkTS Static Spec ambients.md + semantics.md）：**
1. 语法与显式函数重载（Explicit Function Overload）相同
2. `declare overload` 引用的是已声明的 `declare function` 实体
3. 重载集按列表顺序进行重载解析，第一个匹配的实体被选中
4. 重载函数的返回类型不参与重载解析
5. ❌ 重载引用不存在的函数 → compile-time error
6. ❌ 重载标识符引用隐式重载名而非单个实体 → compile-time error
7. ❌ 重载等价签名（overload-equivalent）→ compile-time error

## 子类型覆盖

### 1. compile-pass：合法 ambient overload 声明

- **顶层重载**：`declare overload foo {foo1, foo2}`（顶层作用域）
- **命名空间重载**：namespace 内的 overload 声明
- **三重载**：三个及以上 declare function 组合
- **不同参数个数**：`foo1(x: int)` + `foo2(x: int, y: string)`
- **可选参数**：含可选参数的重载
- **函数内调用重载**：在正常函数内调用重载函数，验证编译通过

### 2. compile-fail：非法 ambient overload 声明

- **引用未定义函数**：overload 列表中的函数名未声明
- **重载等价签名**：两个函数的参数类型完全相同
- **空重载集**：overload 列表为空
- **引用不存在的标识符**：overload 后的名称不是已声明的 declare function
- **引用非 ambient 函数**：overload 引用普通函数（非 declare）

### 3. runtime

- ambient overload 声明与带 main 的正常代码共存，验证不影响编译执行

## 文件命名规范

- 前缀：`AMB_`
- 章节：`14_03`
- 编号：PASS 001~006 → FAIL 007~011 → RUNTIME 012
