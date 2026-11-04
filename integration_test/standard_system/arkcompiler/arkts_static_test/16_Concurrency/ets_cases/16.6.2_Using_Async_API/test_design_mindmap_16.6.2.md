# 16.6.2 Using Async API - 测试设计思维导图

## 1. 测试范围

- async 函数定义与调用：async main、async 函数链式调用

## 2. 测试用例设计

### 2.1 编号规划

| 编号范围 | 含义 | 数量 |
|---------|------|:----:|
| CCY_16_06_02_001~002 | compile-pass 用例 | 2 |

### 2.2 文件命名规范

- `CCY_16_06_02_YYY_{CATEGORY}_{DESC}.ets`

## 3. 测试点分解

### 3.1 compile-pass

| # | 测试点 | 文件 | spec 对应 |
|---|--------|------|-----------|
| 001 | async main：入口函数声明为 async | CCY_16_06_02_001_PASS_async_main.ets | async 入口函数语法 |
| 002 | async 链：一个 async 函数调用另一个 async 函数 | CCY_16_06_02_002_PASS_async_chain.ets | async 函数链式调用 |

### 3.2 compile-fail

（无 — spec 未定义编译期错误条件）

### 3.3 runtime

（待覆盖 — 需 ark VM 验证 async 执行流）

## 4. 覆盖情况

| 类型 | 数量 | 说明 |
|------|:----:|------|
| compile-pass | 2 | async main + async 链式调用 |
| compile-fail | 0 | spec 无编译期错误条件 |
| runtime | 0 | 需 ark VM 实测（await 语义） |
