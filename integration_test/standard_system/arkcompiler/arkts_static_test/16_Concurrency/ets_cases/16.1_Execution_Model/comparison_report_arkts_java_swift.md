# 16.1 Execution Model - 跨语言对比报告（ArkTS / Java / Swift）

## 1. 概览

ArkTS 执行模型核心概念：job（可暂停的计算单元）、worker thread（1:1 映射 OS 线程）、悬挂点（暂停点）。三语言的并发执行模型差异较大。

## 2. 章节对应关系

| ArkTS (§16.1) | Java (JLS) | Swift (Concurrency) |
|------|------|-------|
| job 抽象 | Thread / Runnable | Task |
| worker thread | OS thread | executor |
| 悬挂点 (await) | N/A (blocking) | await suspension |
| main job | main() thread | @main |
| job 完成触发程序终止 | JVM 线程存活 | 所有 Task 完成 |

## 3. 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| job 概念 | ✅ 语言级抽象 | ⚠️ 库级 Thread/Runnable | ✅ Task 结构体 |
| 悬挂点 | ✅ await | ❌ 无（阻塞调用） | ✅ await |
| 共享内存模型 | ✅ 所有 job 共享 | ✅ 线程共享 | ❌ actor 隔离 |
| 程序终止 | main job 完成即终止 | 非守护线程存活则不终止 | 所有 Task 完成后终止 |
| main 函数 async | ✅ 支持 | ❌ 不支持 | ✅ @main struct 支持 async |

## 4. 用例 1:1 对照

### 4.1 main job 概念

| # | 用例 | ArkTS | Java | Swift |
|---|------|:-----:|:----:|:-----:|
| 001 | main job 入口点 | ✅ compile-pass | ✅ | ✅ |

**代码对照：**

ArkTS:
```typescript
function main(): void {
    console.log("main job");
}
```

Java:
```java
public class Main {
    public static void main(String[] args) {
        System.out.println("main thread");
    }
}
```

Swift:
```swift
@main
struct MainApp {
    static func main() {
        print("main task")
    }
}
```

### 4.2 悬挂点

| # | 用例 | ArkTS | Java | Swift |
|---|------|:-----:|:----:|:-----:|
| 007 | await 悬挂点 | ✅ compile-pass | ❌ N/A | ✅ |

ArkTS:
```typescript
async function task(): Promise<void> {
    await new Promise<void>(() => {});
}
```

Java (无语言级 await):
```java
CompletableFuture<Void> future = CompletableFuture.runAsync(() -> {});
future.get(); // blocking, not suspension
```

Swift:
```swift
func task() async {
    await Task.sleep(1_000_000_000)
}
```

## 5. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|:----:|:----:|:-----:|
| 执行模型清晰度 | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 悬挂点机制 | ⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐⭐ |
| 共享内存模型 | ⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐ |

## 6. 核心结论

ArkTS 的执行模型与 Swift 的 Task/await 模型最为接近，均支持语言级的悬挂点和异步 main。Java 缺乏语言级支持，依赖库级别的 CompletableFuture 和线程模型。

## 7. ArkTS 设计建议

保持当前设计。ArkTS 的执行模型在简洁性和表达能力之间取得了良好平衡。

## 8. 三环境实测结果

| 用例 | ArkTS | Java | Swift |
|------|:-----:|:----:|:-----:|
| main job 入口 | ✅ | ✅ | ✅ |
| await 悬挂点 | ✅ | N/A | ✅ |
| 多 job 并发 | ✅ | ✅ | ✅ |
