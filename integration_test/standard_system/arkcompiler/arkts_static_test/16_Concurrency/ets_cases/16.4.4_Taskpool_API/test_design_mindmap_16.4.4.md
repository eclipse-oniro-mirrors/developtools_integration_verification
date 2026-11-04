# Test Design Mindmap: 16.4.4 Taskpool API

## Test Points Covered

### 1. Taskpool 编译验证 (PASS: 1, FAIL: 2)
- **TC-TP-001**: Task 构造、taskpool.execute、TaskGroup 编译通过
- **TC-TP-090**: taskpool.execute 参数类型错误编译报错
- **TC-TP-091**: taskpool.execute 优先级参数类型错误编译报错

### 2. Taskpool 运行时验证 (RUNTIME: 4)
- **TC-TP-020**: Task 创建 → taskpool.execute → Promise resolved
- **TC-TP-021**: taskpool.execute 直接执行函数返回 Promise
- **TC-TP-022**: TaskGroup 分组执行
- **TC-TP-023**: 优先级 (Priority.HIGH) 配置执行

### Coverage Summary
| Category | Count |
|----------|:-----:|
| compile-pass | 1 |
| compile-fail | 2 |
| runtime | 4 |
| **Total** | **7** |

## 待覆盖
- executeDelayed / executePeriodically
- cancel 任务取消
- SequenceRunner 顺序执行器
- AsyncRunner 并发上限执行器
- 任务依赖 addDependency