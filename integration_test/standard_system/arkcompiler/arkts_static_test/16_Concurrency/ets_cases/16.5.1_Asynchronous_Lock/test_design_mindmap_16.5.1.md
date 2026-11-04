# Test Design Mindmap — §16.5.1 Asynchronous Lock

## Test Point Coverage

### Compile-Pass Tests (4)
- `decl`: AsyncLock declaration\n- `exclusive`: Exclusive lock acquisition\n- `shared`: Shared lock acquisition\n- `critical_section`: Critical section protection

### Compile-Fail Tests (1)
double_lock

## Coverage Summary
- Total test points: 5
- Compile-pass coverage: 4 point(s)
- Compile-fail coverage: 1 point(s)
- Runtime tests: ❌ Not implemented
