# 17.6 Iterable Types - 测试设计思维导图

**规范来源：** ArkTS Static Language Specification §17.6 Iterable Types
**生成日期：** 2026-06-23
**测试前缀：** EXP2_17_06_

## 概述

Iterable Types（可迭代类型）是 ArkTS 实验特性之一。类或接口可以实现 `Iterable<T>` 接口，通过定义 `$_iterator()` 方法返回 `Iterator<T>` 的子类型，使其实例可用于 for-of 语句。数组类型和字符串类型是内置可迭代类型。可迭代类型的联合类型也是可迭代的。

### 核心规范要点

1. **Iterable\<T\> 接口**：类/接口实现 `Iterable<T>`，必须提供 `$_iterator(): Iterator<T>` 方法
2. **$_iterator 方法**：编译器已知签名的普通方法，可被抽象定义、接口定义、覆盖
3. **async 禁止**：`$_iterator` 标记为 `async` 时应产生编译时错误
4. **内置可迭代**：数组类型（`T[]`, `Array<T>`, `FixedArray<T>`）和字符串类型 (`string`) 是内置可迭代类型
5. **联合迭代**：可迭代类型的联合类型也是可迭代的
6. **for-of 使用**：可迭代类型实例可用于 for-of 语句
7. **TS 兼容名废弃**：`[Symbol.iterator]` 为废弃的 TS 兼容名称

## 子规则完整枚举

### 规则 1：类实现 Iterable\<T\>（基本用法）

| 测试点 | 分类 | 描述 |
|--------|------|------|
| 类 implements Iterable\<T\> 并定义 $_iterator() | compile-pass | 基本可迭代类声明 |
| 独立的 Iterator 类实现 next() 返回 IteratorResult\<T\> | compile-pass | Iterator 模式 |
| 同一类同时实现 Iterable\<T\> 和 Iterator\<T\> | compile-pass | Self-iterable 模式 |
| for-of 遍历自定义可迭代对象 | compile-pass + runtime | 编译通过 + 运行时验证 |

### 规则 2：内置可迭代类型（Array / String）

| 测试点 | 分类 | 描述 |
|--------|------|------|
| for-of 遍历 T[] 数组 | compile-pass + runtime | 数组内置可迭代 |
| for-of 遍历 string | compile-pass + runtime | 字符串内置可迭代 |
| 数组作为 Iterable\<T\> 参数传递 | compile-pass | 类型兼容 |

### 规则 3：接口中的 $_iterator

| 测试点 | 分类 | 描述 |
|--------|------|------|
| 接口 extends Iterable\<T\> | compile-pass | 接口继承可迭代 |
| 接口中定义抽象 $_iterator | compile-pass | 抽象方法声明 |
| 接口多层继承中的 $_iterator | compile-pass | 多层继承链 |

### 规则 4：$_iterator 覆盖

| 测试点 | 分类 | 描述 |
|--------|------|------|
| 子类覆盖父类 $_iterator | compile-pass | override 机制 |
| 子类不覆盖，继承父类 $_iterator | compile-pass | 继承行为 |

### 规则 5：泛型 Iterable\<T\>

| 测试点 | 分类 | 描述 |
|--------|------|------|
| 泛型类实现 Iterable\<T\> | compile-pass | 泛型可迭代 |
| 不同 T 的 Iterable 类型区分 | compile-pass | 类型安全 |

### 规则 6：联合可迭代类型

| 测试点 | 分类 | 描述 |
|--------|------|------|
| T[] | string 作为 Iterable 类型 | compile-pass + runtime | 联合可迭代 |
| for-of 遍历联合可迭代类型 | compile-pass + runtime | 联合迭代 |

### 规则 7：async $_iterator 禁止

| 测试点 | 分类 | 描述 |
|--------|------|------|
| $_iterator 标记 async | compile-fail | 应产生编译时错误 |

### 规则 8：Iterable 实现约束

| 测试点 | 分类 | 描述 |
|--------|------|------|
| implements Iterable 但无 $_iterator | compile-fail | 缺少必需方法 |
| $_iterator 返回类型不是 Iterator\<T\> 子类型 | compile-fail | 类型不匹配 |

## 边界值与异常场景

| 场景 | 描述 |
|------|------|
| 空数组迭代 | for-of 空数组，零次迭代 |
| 空字符串迭代 | for-of 空字符串，零次迭代 |
| IteratorResult done | next() 返回 done=true 表示迭代结束 |
| $_iterator 非 async | async 标记的 $_iterator 应编译失败 |

## 文件命名规范

- 前缀：`EXP2_17_06_`（EXP2 = 第 17 章 Experimental Features）
- 编号：YYY 三位数字
- 类别：PASS / FAIL / RUNTIME
- 描述：大写下划线

**编号分配：**

| 编号 | 类别 | 用例 |
|------|------|------|
| 001 | PASS | 类实现 Iterable\<T\> 基本可迭代 |
| 002 | PASS | for-of 自定义可迭代对象 |
| 003 | PASS | for-of 数组内置可迭代 |
| 004 | PASS | for-of 字符串内置可迭代 |
| 005 | PASS | 接口扩展 Iterable |
| 006 | PASS | 联合可迭代类型 |
| 007 | PASS | 覆盖 $_iterator |
| 008 | PASS | 泛型 Iterable\<T\> |
| 009 | PASS | 抽象 $_iterator 在接口中 |
| 010 | FAIL | async $_iterator 应编译失败 |
| 011 | FAIL | implements Iterable 缺少 $_iterator |
| 012 | FAIL | $_iterator 返回类型错误 |
| 013 | RUNTIME | for-of 数组运行时验证 |
| 014 | RUNTIME | for-of 字符串运行时验证 |
| 015 | RUNTIME | for-of 自定义可迭代运行时验证 |

## 分类说明

- **compile-pass**：文件必须编译成功（无 Syntax error / Semantic error）
- **compile-fail**：文件必须产生编译时错误（含 Syntax error 或 Semantic error）
- **runtime**：编译成功 + ark VM 运行 + 断言通过 + 退出码 0

## 目标用例数

- compile-pass: 9
- compile-fail: 3
- runtime: 3
- **总计: 15**
