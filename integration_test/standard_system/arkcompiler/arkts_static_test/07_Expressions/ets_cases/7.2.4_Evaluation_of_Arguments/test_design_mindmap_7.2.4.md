# 7.2.4 Evaluation of Arguments - 测试设计思维导图

## 概述

本节定义参数表达式求值顺序规则：参数表达式总从左到右求值到第一个错误，或到表达式末尾；任何参数表达式在其左侧所有参数正常完成后才求值；左侧参数异常完成时，右侧参数不被求值。适用范围包括函数调用、方法调用、构造函数（new）调用中的逗号分隔参数。

## 三级测试点设计

### compile-pass

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | 函数调用参数左到右基本编译 | 验证函数调用参数表达式从左到右求值编译通过 |
| 002 | 方法调用参数左到右基本编译 | 验证方法调用参数表达式从左到右求值编译通过 |
| 003 | 构造函数参数左到右基本编译 | 验证构造函数参数表达式从左到右求值编译通过 |
| 004 | 三种调用类型混合编译 | 验证三种调用类型混合使用参数求值编译通过 |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| — | 本节无编译时错误场景 | 无 |

### runtime

| # | 测试点 | 预期值 |
|---|--------|--------|
| 005 | 函数参数 L→M→R 顺序 | trace="LMR" |
| 006 | 方法参数 A→B→C 顺序 | trace="ABC" |
| 007 | 构造参数 X→Y→Z 顺序 | trace="XYZ" |
| 008 | 左参数错误→右参数跳过 | ArithmeticError，右侧不执行 |
| 009 | 嵌套函数调用参数顺序 | trace 验证 |

## 文件命名规范

```
EXP_07_02_04_{SEQ}_{CATEGORY}_{DESCRIPTION}.ets
```

| 字段 | 值 |
|------|-----|
| 前缀 | EXP_（07 Expressions） |
| 章节 | 07_02_04（7.2.4） |
| 编号 | 001–009 连续递增 |
| 分类 | PASS / RUNTIME |

## 注释模板要求

每个测试文件需包含以下 JSDoc 标签：

```typescript
/**
 * @id EXP_07_02_04_YYY_{CATEGORY}_{DESC}
 * @expect compile-pass | runtime
 * @section 7.2.4
 * @design <测试内容描述>
 * @note 正向用例：验证该特性编译通过的正确用法
 *       运行时用例：验证该场景的运行时行为
 */
```

Runtime 用例必须有 `main()` 函数并使用断言验证：

```typescript
function main(): void {
  if (actualResult != expectedResult) {
    throw new Error("assertion failed: " + actualResult)
  }
  console.log("verified")
}
```
