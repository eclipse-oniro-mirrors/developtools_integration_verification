# 16.1 Execution Model - 测试设计思维导图

## 1. 测试范围

- 执行模型核心概念：job 定义、worker thread 抽象、悬挂点
- main job 作为程序隐式入口点
- 悬挂点（suspension point）的暂停与恢复
- 多个 job 的并发执行
- job 通过 Promise 通信返回值
- 悬挂点允许其余 job 在同一 worker thread 上执行

## 2. 测试用例设计

### 2.1 编号规划

| 编号范围 | 含义 | 数量 |
|---------|------|:----:|
| CCY_16_01_001~010 | compile-pass 用例 | 10 |
| CCY_16_01_090~099 | compile-fail 用例 | 2 |
| CCY_16_01_020~023 | runtime 用例 | 4 |

### 2.2 文件命名规范

- `CCY_16_01_YYY_{PASS|FAIL|RUNTIME}_{DESC}.ets`

## 3. 测试点分解

### 3.1 compile-pass

| # | 测试点 | 文件 |
|---|--------|------|
| 001 | main job 作为程序入口点 | CCY_16_01_001_PASS_main_job.ets |
| 002 | async 函数创建并发 job | CCY_16_01_002_PASS_async_job.ets |
| 003 | 多个 job 并发执行 | CCY_16_01_003_PASS_multiple_jobs.ets |
| 004 | job 通过 Promise 返回值 | CCY_16_01_004_PASS_job_return_value.ets |
| 005 | worker thread 独立性 | CCY_16_01_005_PASS_worker_thread_independence.ets |
| 006 | job 无悬挂点 | CCY_16_01_006_PASS_zero_suspension_points.ets |
| 007 | job 一个悬挂点 | CCY_16_01_007_PASS_one_suspension_point.ets |
| 008 | job 多个悬挂点 | CCY_16_01_008_PASS_multiple_suspension_points.ets |
| 009 | 隐式 main job | CCY_16_01_009_PASS_main_job_implicit.ets |
| 010 | 悬挂点让其余 job 执行 | CCY_16_01_010_PASS_suspension_allows_other_jobs.ets |

### 3.2 compile-fail

| # | 测试点 | 文件 |
|---|--------|------|
| 090 | 非 async 函数含悬挂点 | CCY_16_01_090_FAIL_suspension_in_non_async.ets |
| 099 | 普通函数中 await (占位) | CCY_16_01_099_FAIL_placeholder.ets |

### 3.3 runtime

| # | 测试点 | 文件 |
|---|--------|------|
| 020 | main job 执行至完成 | CCY_16_01_020_RUNTIME_main_job.ets |
| 021 | job 完成触发 Promise resolve | CCY_16_01_021_RUNTIME_job_completion.ets |
| 022 | main job 完成后程序终止 | CCY_16_01_022_RUNTIME_main_job_termination.ets |
| 023 | async job 悬挂点暂停与恢复 | CCY_16_01_023_RUNTIME_async_job_suspend_resume.ets |

## 4. 覆盖情况

### 4.1 已覆盖

| 类型 | 数量 | 覆盖范围 |
|------|:----:|---------|
| compile-pass | 10 | main job、async job、多 job、悬挂点(0/1/多个)、worker 独立性、隐式 main job、悬挂点让其余 job 执行 |
| compile-fail | 2 | 非 async 函数含悬挂点 |
| runtime | 4 | main job 执行、job 完成 Promise resolve、程序终止、悬挂点暂停恢复 |

### 4.2 待覆盖（对照 spec）

| # | Spec 要点 | 优先级 | 说明 |
|---|----------|:------:|------|
| 1 | 共享内存模型：job 间共享内存读写可见性 | 高 | 需增补 compile-pass 和 runtime 用例 |
| 2 | 并行执行 vs 异步执行：不同 worker 线程的 true parallelism | 中 | 需增补 launch 跨 worker 验证 |
| 3 | job body 起始点与完成点语义 | 低 | 边界语义验证 |
