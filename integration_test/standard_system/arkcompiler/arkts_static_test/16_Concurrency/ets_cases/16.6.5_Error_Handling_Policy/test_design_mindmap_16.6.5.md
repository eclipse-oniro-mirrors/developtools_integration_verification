# 16.6.5 Error Handling Policy - 测试设计思维导图

## 1. 测试范围

- 错误处理策略：未捕获错误→程序终止、job 异常完成→Promise reject、main job 抛出→未捕获

## 2. 测试用例设计

### 2.1 编号规划

| 编号范围 | 含义 | 数量 |
|---------|------|:----:|
| CCY_16_06_05_001~002 | compile-pass 用例 | 2 |

### 2.2 文件命名规范

- `CCY_16_06_05_YYY_{CATEGORY}_{DESC}.ets`

## 3. 测试点分解

### 3.1 compile-pass

| # | 测试点 | 文件 | spec 对应 |
|---|--------|------|-----------|
| 001 | async 函数内 try/catch 捕获 await 异常 | CCY_16_06_05_001_PASS_async_error_handling.ets | 错误应被处理，Promise reject 被 catch 捕获 |
| 002 | main job 抛出错误（编译通过，运行时未捕获终止） | CCY_16_06_05_002_PASS_main_job_throw.ets | main job 抛出→未捕获→程序终止序列 |

### 3.2 compile-fail

（无 — spec 未定义编译期错误条件）

### 3.3 runtime

（待覆盖 — 需 ark VM 验证程序终止行为）

## 4. 覆盖情况

| 类型 | 数量 | 说明 |
|------|:----:|------|
| compile-pass | 2 | try/catch 处理 + main throw 语法 |
| compile-fail | 0 | spec 无编译期错误条件 |
| runtime | 0 | 需 ark VM 实测（程序终止、未捕获传播） |
