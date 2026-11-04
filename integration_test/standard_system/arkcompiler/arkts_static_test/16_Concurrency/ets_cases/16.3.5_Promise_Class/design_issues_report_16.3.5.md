# 16.3.5 Promise Class - 设计问题报告

## 1. 概述

当前覆盖 Promise 类的 resolve、reject、then/catch 和状态转换的基础编译验证 (4 PASS + 0 FAIL)。Promise 链式调用、finally、错误传播、Promise.all/race 等高级 API 尚未覆盖。

## 2. 设计问题清单

| # | 问题类型 | 问题描述 | 建议方案 | 状态 |
|---|---------|---------|---------|:----:|
| 1 | 覆盖不足 | 缺少 runtime 用例验证 Promise 回调执行和异步调度 | 使用 ark VM 执行 then/catch 回调 | ✅ 已修复 |
| 2 | 覆盖不足 | Promise 链式调用（then 返回新 Promise）未测试 | 补充链式 then 的编译 + runtime 用例 | ✅ 已修复 |
| 3 | 覆盖不足 | Promise.finally API 未覆盖 | 补充 finally 的编译用例 | ✅ 已修复 |
| 4 | 覆盖不足 | Promise.all / Promise.race 静态组合子未测试 | 补充组合子的编译用例 | ✅ 已修复 |
| 5 | 覆盖不足 | Promise 通过 await 展开异常（rejected → catch）未测试 | 补充 await reject 的运行时用例 | ✅ 已修复 |
| 6 | 覆盖不足 | Promise 构造函数中同步 resolve/reject 边界未测试 | 补充边界条件的运行时用例 | ✅ 已修复 |
| 7 | 覆盖不足 | 缺少 compile-fail 负面测试（如错误类型参数、无效回调） | 补充负面编译用例 | ✅ 已修复 |

## 3. 改进建议

- （主线场景已覆盖；Promise.allSettled 待 stdlib 支持后跟进）

## 4. 跟踪记录

| 日期 | 事项 |
|------|------|
| 2026-06-23 | 创建测试，标注 runtime 待覆盖 |
| 2026-06-23 | 新增 5 runtime + 4 compile-pass + 3 compile-fail，系统覆盖 Promise 执行/链式/组合/负面 |
