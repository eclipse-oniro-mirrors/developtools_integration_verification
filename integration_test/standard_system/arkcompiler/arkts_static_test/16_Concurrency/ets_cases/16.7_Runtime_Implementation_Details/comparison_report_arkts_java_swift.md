# 16.7 Runtime Implementation Details - 跨语言对比报告（ArkTS / Java / Swift）

## 1. 概览

运行时实现细节涵盖 worker 线程调度、job 排队规则、线程创建/销毁等底层机制。

## 2. 章节对应关系

| ArkTS (§16.7) | Java (JLS) | Swift (Concurrency) |
|------|------|-------|
| 调度规则 | Thread scheduler | Global executor |
| worker 线程创建/销毁 | Thread lifecycle | executor 管理 |
| job 排队 | Thread pool queue | Task queue |

## 3. 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 调度规则 | 语言规范定义 | JVM 实现决定 | 全局 executor |
| worker 线程生命周期 | 运行时管理 | 开发人员管理 | 系统管理 |
| 独占 worker | ✅ EAWorker | ✅ 自定义 Thread | ❌ |

## 4. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|:----:|:----:|:-----:|
| 调度灵活性 | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ |
| 自动管理 | ⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐⭐ |
| 规范明确性 | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |

## 5. 核心结论

ArkTS 的调度规则在规范层面定义，提供了 EAWorker 独占线程等特性。

## 6. ArkTS 设计建议

建议进一步明确调度规则的规范定义，补充 worker 线程创建/删除的语义。

## 7. 三环境实测结果

（暂未实测）
