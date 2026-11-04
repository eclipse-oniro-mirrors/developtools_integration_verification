# 16.7 Runtime Implementation Details - 测试设计思维导图

## 1. 测试范围

- 运行时实现细节：调度规则、worker thread 创建/销毁、job 排队

## 2. 测试用例设计

### 2.1 编号规划

| 编号范围 | 含义 | 数量 |
|---------|------|:----:|
| CCY_16_07_001 | compile-pass 用例（16.7 父章节） | 1 |
| CCY_16_07_01_001 | compile-pass 用例（16.7.1 子章节） | 1 |

### 2.2 文件命名规范

- `CCY_16_07_YYY_{CATEGORY}_{DESC}.ets`

## 3. 测试点分解

### 3.1 compile-pass

| # | 测试点 | 文件 | 章节 |
|---|--------|------|:----:|
| 001 | async main 支持多 await | CCY_16_07_001_PASS_placeholder.ets | 16.7 |
| 001 | 基本调度规则（语法验证） | CCY_16_07_01_001_PASS_scheduling_basic.ets | 16.7.1 |

### 3.2 compile-fail

（暂缺）

### 3.3 runtime

（暂缺）

## 4. 覆盖情况

### 4.1 已覆盖

| 类型 | 数量 | 覆盖范围 |
|------|:----:|---------|
| compile-pass | 2 | async main 多 await、基本调度语法 |

### 4.2 待覆盖

| 类型 | 说明 |
|------|------|
| compile-fail | 调度规则为运行时语义，无编译期错误条件定义 |
| runtime | ⭐ 调度规则验证：job 优先级（suspendable > other）、同优先级 FIFO |
| runtime | worker 线程创建/删除场景（依赖 EAWorker stdlib） |

> 注：16.7 定义的调度规则均为运行时行为，需 ark VM 真实执行验证。
