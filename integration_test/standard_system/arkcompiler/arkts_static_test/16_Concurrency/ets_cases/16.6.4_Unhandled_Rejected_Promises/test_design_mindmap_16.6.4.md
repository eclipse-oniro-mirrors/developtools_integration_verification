# 16.6.4 Unhandled Rejected Promises - 测试设计思维导图

## 1. 测试范围

- Promise reject 的处理与未处理场景：handled reject（有 catch）、unhandled reject（无 catch）

## 2. 测试用例设计

### 2.1 编号规划

| 编号范围 | 含义 | 数量 |
|---------|------|:----:|
| CCY_16_06_04_001~002 | compile-pass 用例 | 2 |

### 2.2 文件命名规范

- `CCY_16_06_04_YYY_{CATEGORY}_{DESC}.ets`

## 3. 测试点分解

### 3.1 compile-pass

| # | 测试点 | 文件 | spec 对应 |
|---|--------|------|-----------|
| 001 | Promise reject 被 catch 处理 | CCY_16_06_04_001_PASS_promise_reject_handled.ets | reject → catch 异常处理路径 |
| 002 | Promise reject 无 catch（未处理语法允许） | CCY_16_06_04_002_PASS_promise_reject_unhandled.ets | reject 无 catch 在编译期不报错 |

### 3.2 compile-fail

（无 — spec 未定义编译期错误条件）

### 3.3 runtime

（待覆盖 — 需 ark VM 验证未处理 reject 的运行时行为）

## 4. 覆盖情况

| 类型 | 数量 | 说明 |
|------|:----:|------|
| compile-pass | 2 | handled reject + unhandled reject 语法 |
| compile-fail | 0 | spec 无编译期错误条件 |
| runtime | 0 | 需 ark VM 实测（未处理→unhandled rejection 事件） |
