# 16.3.4 await Expression - 设计问题报告

## 1. 概述

当前覆盖 await 表达式的 6 种正向语法场景和 await 在非 async 上下文中的错误检测。await 的运行时执行语义（挂起→恢复、Promise 链传播、并发 await）尚未覆盖。

## 2. 设计问题清单

| # | 问题类型 | 问题描述 | 建议方案 | 状态 |
|---|---------|---------|---------|:----:|
| 1 | 覆盖不足 | 缺少 runtime 用例验证 await 挂起和恢复语义 | 使用 ark VM 执行含 await 的 async 函数 | ✅ 已修复 |
| 2 | 覆盖不足 | await 表达式错误传播（rejected Promise → throw）未测试 | 增补 await 拒绝 Promise 的 runtime 用例 | ✅ 已修复 |
| 3 | 覆盖不足 | await 在条件表达式、循环、try/catch 块中的语法未测试 | 补充编译用例覆盖 await 在控制流中的位置 | ✅ 已修复 |
| 4 | 覆盖不足 | await 并发执行（await Promise.all 等组合子）未测试 | 补充 stdlib 支持后的并发 await 用例 | 低 |

## 3. 改进建议

- （主线场景已覆盖；Promise.all 并发 await 待 stdlib 支持后跟进）

## 4. 跟踪记录

| 日期 | 事项 |
|------|------|
| 2026-06-23 | 创建测试，标注 runtime 待覆盖 |
| 2026-06-23 | 新增 5 runtime + 7 compile-pass，覆盖挂起/恢复/异常/控制流 |
