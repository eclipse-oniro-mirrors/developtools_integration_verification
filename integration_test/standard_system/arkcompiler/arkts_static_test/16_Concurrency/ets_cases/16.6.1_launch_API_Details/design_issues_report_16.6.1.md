# 16.6.1 launch API Details - 设计问题报告

## 1. 概述

当前覆盖 launch API 基本语法的编译验证。launch 的运行时语义（job 调度、父子 job 关系）需运行时验证。

## 2. 设计问题清单

| # | 问题类型 | 问题描述 | 建议方案 | 优先级 |
|---|---------|---------|---------|:------:|
| 1 | 覆盖不足 | 缺少 runtime 用例验证 launch job 执行顺序 | 使用 ark VM 执行 launch 用例 | 中 |
| 2 | 覆盖不足 | launch API 与 async 函数交互未覆盖 | 增补 async 中 launch 的嵌套场景 | 低 |

## 3. 改进建议

- runtime 测试：验证 launch 创建的 job 在 await 后完整执行
- 编译期测试：验证 launch 内 return 类型为 void 的约束

## 4. 跟踪记录

| 日期 | 事项 |
|------|------|
| 2026-06-23 | 创建测试，标注 runtime 待覆盖 |
