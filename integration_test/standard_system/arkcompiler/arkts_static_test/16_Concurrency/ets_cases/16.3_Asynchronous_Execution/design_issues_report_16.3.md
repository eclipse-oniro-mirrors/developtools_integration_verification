# 16.3 Asynchronous Execution - ArkTS与Java/Swift/TS行为差异及规范一致性报告

## 一、编译器实现待完善 (Spec要求但es2panda暂不支持)

无

## 二、与业界静态语言差异点 (ArkTS有意设计，非缺陷)

### 差异点 1：async 函数限制更多

ArkTS 的 async 函数有更严格的编译期限制（静态初始化禁止、abstract 禁止、native 禁止），与 Java/Swift 相比设计更为保守：

| 限制 | ArkTS | Java | Swift | TypeScript |
|------|-------|------|-------|------------|
| 静态初始化中使用 async | ❌ 编译拒绝 | ✅ 允许（在 static initializer 中） | ✅ 允许 | ✅ 允许 |
| abstract async | ❌ 编译拒绝 | N/A | ❌ 不支持 | ✅ 允许 |
| native async | ❌ 编译拒绝 | N/A | N/A | N/A |
| 非 async 函数内 await | ❌ 编译拒绝 | N/A | ❌ 编译拒绝 | ❌ 编译拒绝 |

## 三、Spec措辞待澄清

无

## 四、测试覆盖问题

| # | 问题类型 | 问题描述 | 影响范围 | 优先级 |
|---|---------|---------|---------|:------:|
| 1 | 用例冗余 | CCY_16_03_03_090_FAIL_async_abstract_method 与 CCY_16_03_01_090_FAIL_async_abstract 均测试 async abstract 编译错误，语义相同 | 16.3.3 / 16.3.1 | 低 |
| 2 | 已修复 | 新增 CCY_16_03_01_006 验证 argumentless return for void | 16.3.1 | — |
| 3 | 已修复 | 新增 CCY_16_03_04_006 验证 await 联合类型 Promise\|T | 16.3.4 | — |
| 4 | 已修复 | 新增 CCY_16_03_05_004 验证 Promise.reject() | 16.3.5 | — |
| 5 | 已修复 | await 表达式 `Awaited<T>` 结果类型独立编译验证 | 16.3.4 | — |
| 6 | 已修复 | 新增 007 验证 async 修饰符非函数类型 | 16.3.1 | — |
| 7 | 已修复 | 新增 003 验证 async lambda 无悬挂点 | 16.3.2 | — |
| 8 | 已修复 | 新增 003 验证 async 方法覆写协变返回 | 16.3.3 | — |
| 9 | 已修复 | runtime 覆盖：5 个子章节各新增 runtime 用例（共 20 个） | 全部 | — |
| 10 | 已修复 | Promise 类负面测试：新增 3 个 compile-fail | 16.3.5 | — |
| 11 | 已修复 | async 方法静态初始化 + interface 编译报错 | 16.3.3 | — |
| 12 | 已修复 | await 在控制流（for/while/try/catch/if）中编译验证 | 16.3.4 | — |

## 五、跨语言对比

| 维度 | ArkTS | Java | Swift | TypeScript |
|------|-------|------|-------|------------|
| async 函数 | `async func()` | `CompletableFuture` | `async func()` | `async function()` |
| await | `await expr` | `.join()` / `.get()` | `await expr` | `await expr` |
| 返回类型 | `Promise<T>` | `CompletableFuture<T>` | `T`（自动包装） | `Promise<T>` |
| 非 Promise await | ✅ 自动包装 | N/A | N/A | ✅ 自动包装 |
| async lambda | ✅ 支持 | ❌ 不支持 | ✅ 支持 | ✅ 支持 |
| async 方法 | ✅ 支持 | ❌ 不支持 | ✅ 支持 | ✅ 支持 |
| 运行时行为 | ✅ async 函数/await 解析/then 链 | ✅ Future 链 | ✅ async/await | ✅ async/await |
