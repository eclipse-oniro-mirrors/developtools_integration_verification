# Design Issues Report: 16.4.4 Taskpool API

## Issues Identified

| ID | Severity | Description | Status |
|----|----------|-------------|--------|
| DI-TP-001 | Medium | **Stdlib dependency**: Taskpool API is gated behind `std.concurrency` and previously could not be fully tested. | ✅ Resolved (stdlib 已就绪) |
| DI-TP-002 | Low | **No actual task pool tests**: No tests for task submission, task scheduling, priority, worker reuse, or pool lifecycle. | ✅ 已修复 |

## Detailed Analysis

### DI-TP-001: Stdlib-Dependent API
- **Status**: ✅ Resolved
- **Fix**: 新增 1 compile-pass + 2 compile-fail + 4 runtime 用例

### DI-TP-002: Missing Pool Lifecycle Tests
- **Status**: ✅ 已修复
- **Coverage**:
  - compile-pass: Task/TaskGroup 创建、execute、优先级配置编译
  - compile-fail: execute 参数类型错误、优先级参数类型错误
  - runtime: Task 执行、函数直接执行、TaskGroup 分组、优先级配置

## Remaining GAPs

| GAP | Description | Priority |
|-----|-------------|:--------:|
| TP-001 | `executeDelayed` 延迟执行 | 中 |
| TP-002 | `executePeriodically` 周期性执行 | 中 |
| TP-003 | `cancel` 任务取消 | 中 |
| TP-004 | `SequenceRunner` 顺序执行器 | 低 |
| TP-005 | `AsyncRunner` 并发上限执行器 | 低 |
| TP-006 | `addDependency` / `removeDependency` 任务依赖 | 低 |

## Summary
- **Total Design Issues**: 2
- **Open**: 0
- **Resolved**: 2

## 跟踪记录
| 日期 | 事项 |
|------|------|
| 2026-06-23 | 新增 runtime/compile 用例，stdlib 依赖已消除 |
| 2026-06-23 | Taskpool 基本功能已覆盖，高级 API 待后续 |