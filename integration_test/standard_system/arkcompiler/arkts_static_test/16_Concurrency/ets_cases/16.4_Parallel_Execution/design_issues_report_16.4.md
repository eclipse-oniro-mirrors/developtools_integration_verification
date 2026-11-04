# 16.4 Parallel Execution - ArkTS与Java/Swift/TS行为差异及规范一致性报告

## 一、编译器实现待完善 (Spec要求但es2panda暂不支持)

| # | GAP ID | Spec 要求 | 实现现状 | 影响用例 | 类型 |
|---|--------|-----------|---------|---------|:----:|
| 1 | GAP-16.4.2-001 | §16.4.2 `launch async { }` 推断形式 | ❌ 语法不支持（需显式类型参数+括号） | 无已创建 | D 类 |
| 2 | GAP-16.4.2-002 | §16.4.2 `launch { }` 无括号块形式 | ❌ 语法不支持（需括号） | 无已创建 | D 类 |
| 3 | GAP-16.4.2-003 | §16.4.2 launch + async lambda + await | 💥 **编译器 CRASH**（PromiseTypeArg 段错误） | CCY_16_04_02_003/004 | **C 类 + D 类** |

## 二、与业界静态语言差异点 (ArkTS有意设计，非缺陷)

### 差异点 1：launch 并发原语

ArkTS 使用 `launch` 作为并发执行原语，属于标准库 API 而非语言语法，与 Java/Swift/TS 的并发模型有本质差异：

| 维度 | ArkTS | Java | Swift | TypeScript |
|------|-------|------|-------|------------|
| 并发原语 | `launch {}` | `new Thread()`, `ExecutorService` | `Task {}`, `Task.detached` | `Promise`, `async/await` |
| 并行模型 | 基于协程/actor | 基于线程 | 基于协程（Swift Concurrency） | 事件循环 |
| 语言级 vs 库级 | 标准库 API | 标准库 API | 语言级（async let） | 语言级 + 库级 |

## 三、Spec措辞待澄清

无

## 四、跨语言对比

| 维度 | ArkTS | Java | Swift | TypeScript |
|------|-------|------|-------|------------|
| launch 基本 | ✅ 支持 | ✅ `Thread` / `Executor` | ✅ `Task.detached` | ❌ 单线程事件循环 |
| launch async | ✅ 支持 | ✅ `CompletableFuture.supplyAsync` | ✅ `Task { await ... }` | ✅ `Promise` 链 |
| launch 非 async | ✅ 支持 | ✅ `Runnable` | ✅ `Task { }` | ✅ 函数调用 |

## 五、测试覆盖更新

| 日期 | 变更 |
|------|------|
| 2026-06-23 | 新增 4 runtime 用例，覆盖 launch sync/void/type param/non-async 执行场景 |
| 2026-06-23 | EAWorker(16.4.3)/Taskpool(16.4.4) stdlib 已就绪，新增 7 runtime + 4 compile-pass + 4 compile-fail 覆盖真实 API 测试 |
| 2026-06-23 | 16.4.2 launch API 已知编译器 CRASH 已记录至 issue_report.md |

## 六、子章节最终统计

| 子章节 | compile-pass | compile-fail | runtime | 合计 |
|--------|:-----------:|:-----------:|:-------:|:----:|
| 16.4 (父章节) | 3 | 1 | 4 | 8 |
| 16.4.1 | 1 | 1 | 0 | 2 |
| 16.4.2 | 2 | 3 | 4 | 9 |
| 16.4.3 | 1 | 2 | 3 | 6 |
| 16.4.4 | 1 | 2 | 4 | 7 |
| **总计** | **8** | **9** | **15** | **32** |

> 注: 16.4.2 另有 2 个用例在 `compile-pass/` 目录（`@expect compile-pass`），因编译器 CRASH 暂不可执行。详见 `16.4.2_launch_API/issue_report.md`。
