# 16.3.2 Asynchronous Lambdas - 测试设计思维导图

## 1. 测试范围

- async lambda 的语法形式：变量赋值、参数传递、无悬挂点场景、await 在非 async lambda 中的限制

## 2. 测试用例设计

### 2.1 编号规划

| 编号范围 | 含义 | 数量 |
|---------|------|:----:|
| CCY_16_03_02_001~003 | compile-pass 用例 | 3 |
| CCY_16_03_02_090 | compile-fail 用例 | 1 |

### 2.2 文件命名规范

- `CCY_16_03_02_YYY_{CATEGORY}_{DESC}.ets`

## 3. 测试点分解

### 3.1 compile-pass

| # | 测试点 | 文件 | @design |
|---|--------|------|---------|
| 001 | async lambda 作为变量 | CCY_16_03_02_001_PASS_async_lambda_variable.ets | async lambda 表达式赋值给变量通过编译 |
| 002 | async lambda 作为参数 | CCY_16_03_02_002_PASS_async_lambda_argument.ets | async lambda 作为函数参数通过编译 |
| 003 | async lambda 无悬挂点 | CCY_16_03_02_003_PASS_async_lambda_no_suspension.ets | async lambda 无悬挂点的语法正确性（zero suspension points） |

### 3.2 compile-fail

| # | 测试点 | 文件 | @design |
|---|--------|------|---------|
| 090 | await 在非 async lambda 中 | CCY_16_03_02_090_FAIL_await_non_async_lambda.ets | await 在非 async lambda 中应编译错误 |

### 3.3 runtime

（待覆盖 — 需 ark VM 验证 async lambda 执行语义）

## 4. 覆盖情况

| 类型 | 数量 | 说明 |
|------|:----:|------|
| compile-pass | 3 | 变量赋值、参数传递、无悬挂点语法 |
| compile-fail | 1 | await 在非 async lambda 中 |
| runtime | 0 | 需 ark VM 实测（execution、suspension、Promise chain） |
