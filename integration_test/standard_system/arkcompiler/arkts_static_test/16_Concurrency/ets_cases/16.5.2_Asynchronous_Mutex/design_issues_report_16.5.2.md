# Design Issues Report — §16.5.2 Asynchronous Mutex

## Identified Issues

### 1. Stdlib Dependency (Asynchronous Mutex) — ✅ Resolved
- **Issue**: AsyncMutex relies on `std.concurrency` stdlib module.
- **Status**: ✅ 已修复 — AsyncMutex 已在 stdlib 中实现
- **Fix**: 新增 4 runtime 用例覆盖 lock/unlock/临界区/异常路径

### 2. Missing Runtime Tests — ✅ Resolved
- **Type**: Functional / Integration
- **Severity**: Medium
- **Description**: No runtime test existed under the `runtime/` directory.
- **Status**: ✅ 已修复 — 4 runtime tests added

### 3. GAP Compile-Fail Test — ✅ Resolved
- **Issue**: `CCY_16_GAP_001_FAIL_async_mutex_missing.ets` 因 stdlib 未实现而标注 AsyncMutex 不存在
- **Status**: ✅ 已修复 — stdlib 已实现，GAP 用例已移除

## Remaining GAPs
- 并发竞争测试：多 job 同时访问同一锁
- 性能/压力测试
- AsyncMutex 与 AsyncCondVar 配合使用（§16.5.4）

## Recommendations
- 补充多 job 并发加锁的 runtime 测试（需 cross-section）
- 验证锁的互斥性：临界区不被另一 job 中断

## Tracking
| Date | Event |
|------|-------|
| 2026-06-23 | 新增 4 runtime 用例，stdlib 依赖已消除 |
| 2026-06-23 | 移除 GAP_001_FAIL，移除 `issue_report.md` 中 D-16.5.2 |