# 16.6 API Details and Restrictions - ArkTS与Java/Swift/TS行为差异及规范一致性报告

## 一、编译器实现待完善 (Spec要求但es2panda暂不支持)

| # | GAP ID | Spec 要求 | 实现现状 | 影响用例 |
|---|--------|-----------|---------|---------|
| 1 | GAP-16.6.1-001 | §16.6.1：launch API 支持 domain/group/worker thread ID 参数 | ❌ launch 签名仅接受 lambda（1 参数），domain/group/ID 参数未实现 | CCY_16_06_01_090_FAIL (已标注⚠️) |

## 二、与业界静态语言差异点 (ArkTS有意设计，非缺陷)

### 差异点 1：Promise API 限制

ArkTS 对 `Promise.then` 和 `Promise.catch` 的调用有特殊限制（属于标准库 API 描述性章节），与 Java/Swift/TS 相比：

| 维度 | ArkTS | Java | Swift | TypeScript |
|------|-------|------|-------|------------|
| Promise.then | ✅ 有限制 | ✅ CompletableFuture.then | N/A | ✅ 无限制 |
| Promise.catch | ✅ 有限制 | ✅ CompletableFuture.exception | N/A | ✅ 无限制 |
| API 约束性质 | 编译期检查 | 运行时检查 | N/A | 运行时检查 |

## 三、测试覆盖说明

16.6 各子章节大部分 spec 要点属于**运行时行为**（如回调执行顺序、未处理拒绝检测、错误终止序列），无法通过 compile-pass/fail 测试验证：

| 子章节 | 运行时要点（不可 compile 测试） | 当前覆盖 |
|--------|-------------------------------|:-------:|
| §16.6.1 | worker ID 有效性、domain/group 行为 | 基础语法 |
| §16.6.3 | 同线程回调顺序、跨线程顺序无保证 | then/catch/finally 语法 |
| §16.6.4 | 未处理拒绝检测时机、跨线程处理状态 | .catch() 正例 + reject 无处理 |
| §16.6.5 | main job 抛出→程序终止、运行时创建 job 抛出 | try/catch + main throw |

> 以上运行时要点待 ark VM 实测时验证。

## 四、跨语言对比

| 维度 | ArkTS | Java | Swift | TypeScript |
|------|-------|------|-------|------------|
| Promise.then 调用 | ✅ 有限制 | ✅ `thenApply` | N/A | ✅ 无限制 |
| Promise.catch 调用 | ✅ 有限制 | ✅ `exception` | N/A | ✅ 无限制 |
| Promise 类型 | `Promise<T>` | `CompletableFuture<T>` | N/A（Async/await 原生） | `Promise<T>` |
