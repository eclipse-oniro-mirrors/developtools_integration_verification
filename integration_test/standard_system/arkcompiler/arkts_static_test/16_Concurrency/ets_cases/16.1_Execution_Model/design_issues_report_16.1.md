# 16.1 Execution Model - 设计问题报告

## 1. 概述

本章验证 ArkTS 执行模型的核心语义：job 抽象、worker thread、悬挂点机制。当前 16 个用例全部通过编译/运行时验证，但对照 spec_original.md 发现部分核心语义未覆盖。

## 2. 设计问题清单

| # | 问题类型 | 问题描述 | 影响范围 | 建议方案 | 优先级 |
|---|---------|---------|---------|---------|:------:|
| 1 | 用例冗余 | CCY_16_01_090_FAIL 和 CCY_16_01_099_FAIL 均测试"非 async 函数含 await"，语义重复 | 16.1 | 合并为单用例 | 低 |
| 2 | 规范覆盖缺失 | 共享内存模型（"program memory is shared between all jobs"）未设计测试用例 | 16.1 | 增补共享内存读写验证用例 | 高 |
| 3 | 规范覆盖缺失 | 并行执行 vs 异步执行的执行模式区分（不同 worker/同一 worker）未显式验证 | 16.1 | 增补双 worker 线程并行执行验证 | 中 |
| 4 | 规范覆盖缺失 | job body 的起始点与完成点语义未设计测试用例 | 16.1 | 增补 job body 边界验证用例 | 低 |

## 3. 详细分析

### 3.1 问题 1: 重复的 compile-fail 用例

- **问题描述**：两个 compile-fail 用例均验证 await 不能在非 async 函数中使用，测试点完全相同
- **影响分析**：造成冗余，增加维护成本
- **建议方案**：删除 CCY_16_01_099_FAIL_placeholder.ets（原占位符用例）

### 3.2 问题 2: 共享内存模型未覆盖 ⭐

- **问题描述**：spec 原文第 36 行明确说明 `The program memory is shared between all jobs, which allows for efficient data sharing but implies that the developer should use the provided means of synchronization to avoid race conditions`。当前无测试用例验证 job 间共享内存的读写可见性
- **影响分析**：共享内存是并发正确性的基础假设，缺少验证可能导致跨 job 数据竞争未定义行为
- **参考对比**：Java 的 `volatile` 和 `synchronized` 保证线程间可见性，Swift 的 Actor 隔离数据。ArkTS 共享内存行为需要实测确认
- **建议方案**：
  - compile-pass: 第二个 job 读取第一个 job 写入的共享变量
  - runtime: launch 两个 job，一个写共享变量，一个读，验证读取值正确

### 3.3 问题 3: 并行 vs 异步执行区分未显式验证

- **问题描述**：spec 区分两种执行模式：不同 worker thread 上的并行执行和同一 worker thread 上的异步执行。现有用例仅验证悬挂点让其余 job 执行（异步模式），未验证不同 worker 上的 true parallelism
- **建议方案**：增补 launch API 验证两个 job 在不同 worker 上并行执行

### 3.4 问题 4: job body 边界语义未验证

- **问题描述**：spec 定义 job body 有起始点（代码开始）和完成点（代码结束），但无用例验证 job 开始和完成的精确语义
- **影响分析**：影响对 job 生命周期的理解
- **建议方案**：低优先级，可在后续迭代中增补

## 4. 改进建议

- 移除冗余占位符用例，保持用例集精简
- 增补共享内存模型验证用例（高优先级）
- 增补并行执行模式验证用例（中优先级）
- 更新 test_design_mindmap 的覆盖情况，标记待覆盖项

## 5. 跟踪记录

| 日期 | 事项 |
|------|------|
| 2026-06-23 | 初始审计，发现冗余用例和 3 个 spec 覆盖缺失 |
