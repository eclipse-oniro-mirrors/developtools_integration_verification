# 16.5 Synchronization - ArkTS与Java/Swift/TS行为差异及规范一致性报告

## 一、编译器实现待完善 (Spec要求但es2panda暂不支持)

无

## 二、与业界静态语言差异点 (ArkTS有意设计，非缺陷)

### 差异点 1：AsyncLock 同步原语

ArkTS 提供 `AsyncLock` 作为同步机制，与 Java/Swift/TS 的同步模型不同：

| 维度 | ArkTS | Java | Swift | TypeScript |
|------|-------|------|-------|------------|
| 同步原语 | `AsyncLock` | `synchronized`, `ReentrantLock` | `actor`, `os_unfair_lock` | ❌ 无语言级同步 |
| 声明方式 | `let lock = new AsyncLock()` | `synchronized(this)` / `Lock` | `actor MyActor {}` | N/A |
| 锁性质 | 异步友好锁 | 阻塞锁 | actor 隔离 | N/A |

## 三、Spec措辞待澄清

无

## 四、测试覆盖更新

| # | 问题 | 影响范围 | 状态 |
|---|------|---------|:----:|
| 1 | mindmap 标注了 runtime 测试点，但实际 .ets 文件为 0 | 16.5.1~16.5.6 | ✅ 已修复 — 全部子章节 runtime 已补充 |
| 2 | AsyncMutex/AsyncRWLock/AsyncCondVar stdlib 未提供 | 16.5.2~16.5.4 | ✅ 已修复 — stdlib 已全部实现，GAP 用例已删除 |

## 五、Spec 与实现不一致 (GAP)

| # | GAP ID | Spec 要求 | 实现现状 | 影响用例 |
|---|--------|-----------|---------|---------|
| 1 | ~~GAP-16.5.2-001~~ | ~~§16.5.2 AsyncMutex~~ | ✅ stdlib 已实现，GAP 已消除 | ~~已删除~~ |
| 2 | ~~GAP-16.5.3-001~~ | ~~§16.5.3 AsyncRWLock~~ | ✅ stdlib 已实现，GAP 已消除 | ~~已删除~~ |
| 3 | ~~GAP-16.5.4-001~~ | ~~§16.5.4 AsyncCondVar~~ | ✅ stdlib 已实现，GAP 已消除 | ~~已删除~~ |

> 所有 stdlib GAP 已消除：AsyncMutex、AsyncRWLock、AsyncCondVar 均已实现。

## 六、跨语言对比

| 维度 | ArkTS | Java | Swift | TypeScript |
|------|-------|------|-------|------------|
| 同步声明 | ✅ `AsyncLock` 声明 | ✅ `Lock`, `synchronized` | ✅ `actor` 隔离 | ❌ 无 |
| 标准库 API | ✅ 语言级同步基元 | ✅ JUC 完整 | ✅ actor 模型 | ❌ 无 |
| stdlib 实现状态 | ✅ 全部就绪（AsyncLock/Mutex/RWLock/CondVar/Atomics） | ✅ 完整 | ✅ 完整 | N/A |
