# 7.2.5 Evaluation of Other Expressions - 测试设计思维导图

## 概述

本节定义 6 种特殊表达式在异常条件下求值顺序的具体规则。这些表达式的求值顺序不能完全由 7.2.3（一般求值顺序）和 7.2.4（参数求值顺序）覆盖：

1. **Class Instance Creation Expressions** — `new` 表达式
2. **Resizable Array Creation Expressions** — 可伸缩数组创建
3. **Indexing Expressions** — `arr[index]` 索引表达式
4. **Method Call Expressions** — `obj.method(args)` 方法调用
5. **Assignments Involving Indexing** — `arr[i] = value` 索引赋值
6. **Lambda Expressions** — 箭头/匿名函数表达式

| 子类型 | 求值顺序规则 | 异常场景 |
|--------|-------------|---------|
| Class Instance Creation | 参数 L→R 求值 → 创建实例 → 调用构造函数 | 参数异常完成 |
| Resizable Array Creation | 尺寸参数求值 → 分配 → 元素初始化 L→R | 尺寸为负 / OOM |
| Indexing | 数组引用求值 → 索引求值 | OOB / 负索引 |
| Method Call | 对象求值 → 参数 L→R 求值 → 调用方法 | 对象 null / 参数异常 |
| Index Assignment | 数组引用求值 → 索引求值 → 值表达式求值 | OOB / 类型不匹配 |
| Lambda | 创建时不求值体，调用时求值（惰性求值） | 调用时异常 |

## 三级测试点设计

### compile-pass

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | Class Instance Creation（`new` 表达式） | 类实例创建（new）基本编译通过 |
| 002 | Resizable Array Creation（数组创建） | 数组创建基本编译通过（字面量+new Array） |
| 003 | Indexing Expressions（索引表达式） | 索引表达式基本编译通过 |
| 004 | Method Call Expressions（方法调用） | 方法调用表达式基本编译通过 |
| 005 | Assignments Involving Indexing（索引赋值） | 索引赋值基本编译通过 |
| 006 | Lambda Expressions（Lambda 表达式） | Lambda 表达式基本编译通过 |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| — | 本节无编译时错误场景 | — |

### runtime

| # | 测试点 | 预期值 |
|---|--------|--------|
| 007 | new 参数 L→R 求值顺序 | 参数按 A→B 顺序求值后调用构造 |
| 008 | 数组字面量元素 L→R 求值顺序 | 元素按 X→Y→Z 顺序求值 |
| 009 | 索引表达式数组先于索引求值 | 数组引用求值后再求索引值 |
| 010 | 方法调用对象先于参数求值 | 接收者对象求值后再参数 L→R 求值 |
| 011 | 索引赋值 arr[i]=val 求值顺序 | 数组→索引→值表达式顺序求值 |
| 012 | Lambda 惰性求值 | 创建时不执行体，调用时执行，重复调用每次重新执行 |

## 文件命名规范

```
EXP_07_02_05_{SEQ}_{CATEGORY}_{DESCRIPTION}.ets
```

- SEQ: 001–012（PASS→RUNTIME 连续编号）
- CATEGORY: PASS / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
