# 16.3.3 Asynchronous Methods - 测试设计思维导图

## 1. 测试范围

- async 实例方法、静态方法、方法覆写与返回类型协变、async 抽象方法限制

## 2. 测试用例设计

### 2.1 编号规划

| 编号范围 | 含义 | 数量 |
|---------|------|:----:|
| CCY_16_03_03_001~003 | compile-pass 用例 | 3 |
| CCY_16_03_03_090 | compile-fail 用例 | 1 |

### 2.2 文件命名规范

- `CCY_16_03_03_YYY_{CATEGORY}_{DESC}.ets`

## 3. 测试点分解

### 3.1 compile-pass

| # | 测试点 | 文件 | @design |
|---|--------|------|---------|
| 001 | async 实例方法 | CCY_16_03_03_001_PASS_async_instance_method.ets | async 实例方法通过编译 |
| 002 | async 静态方法 | CCY_16_03_03_002_PASS_async_static_method.ets | async 静态方法通过编译 |
| 003 | async 方法覆写与返回类型协变 | CCY_16_03_03_003_PASS_async_method_override_covariant.ets | 子类覆写 async 父类方法时返回类型协变（Promise<string> <: Promise<Object>） |

### 3.2 compile-fail

| # | 测试点 | 文件 | @design |
|---|--------|------|---------|
| 090 | async 抽象方法 | CCY_16_03_03_090_FAIL_async_abstract_method.ets | async abstract 方法应编译错误 |

### 3.3 runtime

（待覆盖 — 需 ark VM 验证 async 方法调用和执行语义）

## 4. 覆盖情况

| 类型 | 数量 | 说明 |
|------|:----:|------|
| compile-pass | 3 | 实例方法、静态方法、覆写协变返回类型 |
| compile-fail | 1 | async 抽象方法禁止 |
| runtime | 0 | 需 ark VM 实测（方法调用、方法链、继承语义） |
