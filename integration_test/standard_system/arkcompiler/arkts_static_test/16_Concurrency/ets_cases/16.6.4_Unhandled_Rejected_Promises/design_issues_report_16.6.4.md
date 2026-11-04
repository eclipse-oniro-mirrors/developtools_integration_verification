# 16.6.4 Unhandled Rejected Promises - 设计问题报告

## 1. 概述

当前覆盖 Promise reject 有/无 catch 两种场景的编译验证。未处理 reject 的运行时行为（unhandled rejection 事件、程序终止）需运行时验证。

## 2. 设计问题清单

| # | 问题类型 | 问题描述 | 建议方案 | 优先级 |
|---|---------|---------|---------|:------:|
| 1 | 覆盖不足 | 缺少 runtime 用例验证未处理 reject 触发 unhandled 事件 | 使用 ark VM 执行 unhandled 用例 | 高 |
| 2 | 覆盖不足 | reject 后在 then 中处理 vs catch 中处理的差异未覆盖 | 增补 then(success, reject) 双回调用例 | 中 |

## 3. 改进建议

- runtime 测试：验证未处理 reject 是否触发全局 unhandledrejection
- 编译期：确认编译不对未处理 reject 发出警告（spec 约定）

## 4. 跟踪记录

| 日期 | 事项 |
|------|------|
| 2026-06-23 | 创建测试，标注 runtime 待覆盖 |
