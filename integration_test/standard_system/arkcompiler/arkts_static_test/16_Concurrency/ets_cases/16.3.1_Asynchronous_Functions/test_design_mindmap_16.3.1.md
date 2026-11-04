# 16.3.1 Asynchronous Functions - 测试设计思维导图

## 1. 测试范围

- async 函数声明、返回类型、入口函数、类型推断、返回语句、修饰符语义

## 2. 测试用例设计

### 2.1 编号规划

| 编号范围 | 含义 | 数量 |
|---------|------|:----:|
| CCY_16_03_01_001~007 | compile-pass 用例 | 7 |
| CCY_16_03_01_090~093 | compile-fail 用例 | 4 |

### 2.2 文件命名规范

- `CCY_16_03_01_YYY_{CATEGORY}_{DESC}.ets`

## 3. 测试点分解

### 3.1 compile-pass

| # | 测试点 | 文件 | @design |
|---|--------|------|---------|
| 001 | async 函数声明返回 Promise<T> | CCY_16_03_01_001_PASS_async_declaration.ets | async 函数声明和返回值类型 Promise<T> 通过编译 |
| 002 | async 函数显式返回 Promise<T> 实例 | CCY_16_03_01_002_PASS_async_explicit_promise.ets | async 函数体内显式返回 Promise<T> 实例通过编译 |
| 003 | async 函数返回 Promise<void> | CCY_16_03_01_003_PASS_async_void_return.ets | async 函数返回 Promise<void> 通过编译 |
| 004 | async 入口函数 | CCY_16_03_01_004_PASS_async_main_entry.ets | async main 作为程序入口通过编译 |
| 005 | async 函数返回类型推断 | CCY_16_03_01_005_PASS_async_inferred_return.ets | async 函数返回类型可推断为 Promise<T> 通过编译 |
| 006 | async 函数 Promise<void> 中无参数 return | CCY_16_03_01_006_PASS_async_void_return_argless.ets | spec "If T has void or undefined type, argumentless return is allowed" |
| 007 | async 修饰符不是函数类型的一部分 | CCY_16_03_01_007_PASS_async_modifier_not_part_of_type.ets | async 和非 async 函数签名相同时类型系统无区别 |

### 3.2 compile-fail

| # | 测试点 | 文件 | @design |
|---|--------|------|---------|
| 090 | async 方法有 abstract 修饰 | CCY_16_03_01_090_FAIL_async_abstract.ets | async abstract 方法应编译错误 |
| 091 | async 函数有 native 修饰 | CCY_16_03_01_091_FAIL_async_native.ets | async native 函数应编译错误 |
| 092 | async 函数返回类型非 Promise | CCY_16_03_01_092_FAIL_async_return_type.ets | async 函数返回类型非 Promise 应编译错误 |
| 093 | async 函数在静态初始化中调用 | CCY_16_03_01_093_FAIL_async_static_init.ets | async 函数在静态初始化中调用应编译错误 |

### 3.3 runtime

（待覆盖 — 需 ark VM 验证 async 函数执行及 Promise 决议行为）

## 4. 覆盖情况

| 类型 | 数量 | 说明 |
|------|:----:|------|
| compile-pass | 7 | 声明、返回类型、入口、类型推断、返回语句、修饰符语义 |
| compile-fail | 4 | abstract、native、非 Promise 返回类型、静态初始化 |
| runtime | 0 | 需 ark VM 实测（执行语义、Promise 决议、悬挂点行为） |
