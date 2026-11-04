# 16.3.2 Asynchronous Lambdas - 设计问题报告

## 1. 概述

当前覆盖 async lambda 的变量赋值、参数传递、无悬挂点语法和 await 限制的基础编译验证 (3 PASS + 1 FAIL)。async lambda 执行语义、闭包捕获、类型推断细节等尚未覆盖。

## 2. 设计问题清单

| # | 问题类型 | 问题描述 | 建议方案 | 状态 |
|---|---------|---------|---------|:----:|
| 1 | 覆盖不足 | 缺少 runtime 用例验证 async lambda 执行和 Promise 决议 | 使用 ark VM 执行 async lambda 验证返回值 | ✅ 已修复 |
| 2 | 覆盖不足 | async lambda 中 await 悬挂的运行时行为未测试 | 增补含 await 的 async lambda runtime 用例 | ✅ 已修复 |
| 3 | 覆盖不足 | async lambda 捕获外部作用域变量的闭包语义未覆盖 | 补充编译 + runtime 联合验证 | ✅ 已修复 |
| 4 | 覆盖不足 | async lambda 作为回调传递给高阶函数（如数组方法）未覆盖 | 补充编译正向用例 | 低 |

## 3. 改进建议

- （已覆盖主线场景，高阶函数回调待后续跟进）

## 4. 跟踪记录

| 日期 | 事项 |
|------|------|
| 2026-06-23 | 创建测试，标注 runtime 待覆盖 |
| 2026-06-23 | 新增 3 runtime + 2 compile-pass，覆盖执行/await/闭包/trailing |
