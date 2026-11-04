# Test Design Mindmap: 16.4.2 launch API

## Test Points Covered

### 1. Basic Launch (PASS: 1, FAIL: 0)
- **TC-LAUNCH-001**: Verify basic `launch` API usage
  - Call `launch` with a simple sync lambda
  - Verify the task is scheduled and executes

### 2. Non-Async Function Launch (PASS: 1, FAIL: 0)
- **TC-LAUNCH-002**: Verify `launch` with a non-async (synchronous) function
  - Call `launch` passing a regular (non-async) function reference

### 3. Async Lambda Launch (⚠️ COMPILER CRASH)
- **TC-LAUNCH-003**: launch + async lambda + await → 💥 ES2PANDA 段错误
  - `launch<number>(async () => { await g(); return 42; })` 触发编译器崩溃
  - 用例在 `compile-pass/` 目录，`@expect compile-pass`，但编译器 CRASH
  - 已知 Bug 详见 `issue_report.md`

### 4. Type Parameter Launch (⚠️ COMPILER CRASH)
- **TC-LAUNCH-004**: launch + 显式类型参数 + async lambda + await → 💥 同样崩溃
  - 用例在 `compile-pass/` 目录，`@expect compile-pass`，但编译器 CRASH

### GAP / Known Bugs

| ID | 问题 | 类型 | 状态 |
|----|------|:----:|:----:|
| GAP-16.4.2-001 | Spec `launch async { }` 推断形式不支持 | D 类 | ❌ |
| GAP-16.4.2-002 | Spec `launch { }` 无括号形式不支持 | D 类 | ❌ |
| GAP-16.4.2-003 | launch + async lambda + await → 编译器段错误 | C 类 + D 类 | 💥 |

## Coverage Summary
| Category | Count |
|----------|:-----:|
| Compile-pass | 2 + 2 ⚠️ CRASH (sync + non-async + async+await) |
| Compile-fail | 3 (type mismatch + spec GAPs) |
| Runtime | 3 (并发/错误/嵌套) |
| Spec syntax GAPs | 2 (inferred/block forms) |