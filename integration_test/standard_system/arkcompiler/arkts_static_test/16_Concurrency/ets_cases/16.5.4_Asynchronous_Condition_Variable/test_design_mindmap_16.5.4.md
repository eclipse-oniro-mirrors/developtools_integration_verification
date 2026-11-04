# Test Design Mindmap — §16.5.4 Asynchronous Condition Variable

## Test Point Coverage

### Compile-Pass Tests (3)
- `decl`: AsyncCondVar declaration\n- `notify`: Notify one/all waiting coroutines\n- `wait_loop`: Wait loop with predicate

### Compile-Fail Tests (1)
- `GAP_async_condvar_missing`: ⚠️ Spec §16.5.4 定义 AsyncCondVar，但 stdlib 未实现（D 类 Spec 不一致）

## Coverage Summary
- Total test points: 4
- Compile-pass coverage: 3 point(s)
- Compile-fail coverage: 1 point(s) (含 1 GAP)
- Runtime tests: ❌ Not implemented (依赖 stdlib 实现)
- **GAP**: AsyncCondVar 类型在 stdlib 中不存在，spec 要求存在但未实现
