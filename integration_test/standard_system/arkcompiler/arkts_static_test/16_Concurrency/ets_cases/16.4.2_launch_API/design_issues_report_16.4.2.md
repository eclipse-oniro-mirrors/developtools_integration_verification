# Design Issues Report: 16.4.2 launch API

## Issues Identified

| ID | Severity | Description | Status |
|----|----------|-------------|--------|
| DI-LAUNCH-001 | **C 类（编译器 CRASH）** | `launch<T>(async () => { await ...; return ...; })` 导致 es2panda 段错误 | **Open** (见 issue_report.md) |
| DI-LAUNCH-002 | D 类（Spec 不一致） | `launch async { }` 推断形式不支持 | Open |
| DI-LAUNCH-003 | D 类（Spec 不一致） | `launch { }` 无括号块形式不支持 | Open |

## Remarks
- compile-pass: 4 (其中 2 个 ⚠️ 编译器 CRASH), compile-fail: 3, runtime: 3
- runtime 已覆盖: await 结果/多并发/异常拒绝/嵌套调用
- **编译器 CRASH 详见 `issue_report.md`**
- ⚠️ 003/004 保留在 `compile-pass/` 目录（`@expect compile-pass`），但编译器段错误
- Spec 语法 GAP: `launch async {}` 和 `launch {}` 推断形式不支持
