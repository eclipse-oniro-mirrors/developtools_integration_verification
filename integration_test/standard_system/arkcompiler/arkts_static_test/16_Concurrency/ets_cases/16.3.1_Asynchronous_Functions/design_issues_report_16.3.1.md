# 16.3.1 Asynchronous Functions - 设计问题报告

## 1. 概述

当前覆盖 async 函数声明的正向和反向编译验证 (7 PASS + 4 FAIL)。async 函数的执行语义、悬挂点行为、Promise 决议等运行时行为尚未覆盖。

## 2. 设计问题清单

| # | 问题类型 | 问题描述 | 建议方案 | 状态 |
|---|---------|---------|---------|:----:|
| 1 | 覆盖不足 | 缺少 runtime 用例验证 async 函数执行和 Promise 决议 | 使用 ark VM 执行 async 函数调用并验证返回值 | ✅ 已修复 |
| 2 | 覆盖不足 | async 函数中 await 悬挂点行为未测试 | 增补含 await 表达式的 async 函数 runtime 用例 | ✅ 已修复 |
| 3 | 覆盖不足 | async 函数返回类型协变未覆盖（子类型返回 Promise<Sub>） | 补充 async 返回类型协变的编译用例 | ✅ 已修复 |
| 4 | 覆盖不足 | async generator 或 async 迭代器未在 spec 中定义 | 跟踪 spec 后续版本 | 低 |

## 3. 改进建议

（已全部覆盖，跟踪 spec 后续版本的 async generator/iterable）

## 4. 跟踪记录

| 日期 | 事项 |
|------|------|
| 2026-06-23 | 创建测试，标注 runtime 待覆盖 |
| 2026-06-23 | 新增 4 runtime + 1 compile-pass，覆盖 async 执行/异常/协变 |
