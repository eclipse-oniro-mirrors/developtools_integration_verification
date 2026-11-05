# Design Issues Report: 16.4.3 EAWorker API

## Issues Identified

| ID | Severity | Description | Status |
|----|----------|-------------|--------|
| DI-EAW-001 | Medium | **Stdlib dependency**: EAWorker API is gated behind `std.core` and previously could not be fully tested. | ✅ Resolved (stdlib 已就绪) |
| DI-EAW-002 | Low | **No actual worker lifecycle tests**: No tests for worker creation, message passing, termination, or error handling. | ✅ 已修复 |

## Detailed Analysis

### DI-EAW-001: Stdlib-Dependent API
- **Status**: ✅ Resolved
- **Fix**: 新增 1 compile-pass + 2 compile-fail + 3 runtime 用例，覆盖 EAWorker 创建/启动/运行/join/quit

### DI-EAW-002: Missing Lifecycle Tests
- **Status**: ✅ 已修复
- **Coverage**: 
  - compile-pass: EAWorker 构造/start/isAlive/run/quit 方法编译
  - compile-fail: 构造参数类型错误、run 类型不匹配
  - runtime: 任务执行、生命周期（start→isAlive→quit）、join 等待

## Remaining GAPs

| GAP | Description | Priority |
|-----|-------------|:--------:|
| EAWorker-001 | worker 优先级设置 (`setPriority`/`getPriority`) | 低 |
| EAWorker-002 | `postToMain` 向主线程发送消息 | 低 |
| EAWorker-003 | `setUncaughtExceptionHandler` 异常处理 | 低 |
| EAWorker-004 | 多 worker 并发通信 | 低 |

## Summary
- **Total Design Issues**: 2
- **Open**: 0
- **Resolved**: 2

## 跟踪记录
| 日期 | 事项 |
|------|------|
| 2026-06-23 | 新增 runtime/compile 用例，stdlib 依赖已消除 |
| 2026-06-23 | EAWorker 基本功能已覆盖，高级 API 待后续 |