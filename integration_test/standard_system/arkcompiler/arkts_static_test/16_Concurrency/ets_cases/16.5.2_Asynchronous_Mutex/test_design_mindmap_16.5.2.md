# Test Design Mindmap — §16.5.2 Asynchronous Mutex

## Test Point Coverage

### Compile-Pass Tests (3)
- `decl`: AsyncMutex declaration
- `lock_unlock`: Lock and unlock operations
- `critical_section`: Critical section protection with await

### Compile-Fail Tests (1)
- `unlock_without_lock`: unlock without lock → compile error

### Runtime Tests (4)
- `basic_lock_unlock`: lock/unlock 正常执行路径
- `critical_section`: 临界区内含 await 悬挂点
- `unlock_without_lock_error`: 未加锁 unlock → IllegalLockStateError
- `sequential_locks`: 顺序 lock/unlock 多次

## Coverage Summary
| Category | Count |
|----------|:-----:|
| compile-pass | 3 |
| compile-fail | 1 |
| runtime | 4 |
| **Total** | **8** |

## Notes
- AsyncMutex 已由 `std.concurrency` 提供，GAP 已消除
- 运行时覆盖基本操作和异常路径
- 多 job 并发竞争测试待 cross-section 补充