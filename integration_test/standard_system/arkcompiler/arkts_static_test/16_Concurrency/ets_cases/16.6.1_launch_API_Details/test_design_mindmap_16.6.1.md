# 16.6.1 launch API Details - 测试设计思维导图

## 1. 测试范围

- launch API 基本语法：async lambda/function 通过 `launch` 创建独立 job

## 2. 测试用例设计

### 2.1 编号规划

| 编号范围 | 含义 | 数量 |
|---------|------|:----:|
| CCY_16_06_01_001 | compile-pass 用例 | 1 |

### 2.2 文件命名规范

- `CCY_16_06_01_YYY_{CATEGORY}_{DESC}.ets`

## 3. 测试点分解

### 3.1 compile-pass

| # | 测试点 | 文件 | spec 对应 |
|---|--------|------|-----------|
| 001 | launch 基本语法：async lambda 创建独立 job | CCY_16_06_01_001_PASS_launch_details.ets | launch { ... } 创建并启动 job |

### 3.2 compile-fail

| # | 测试点 | 文件 | spec 对应 |
|---|--------|------|-----------|
| 090 | ⚠️ GAP：launch 传入 domain 参数编译报错 | CCY_16_06_01_090_FAIL_launch_details_wrong.ets | §16.6.1 要求支持 domain/group/ID，实现仅接受 lambda |

### 3.3 runtime

（待覆盖 — 需 ark VM 验证 job 执行顺序）

## 4. 覆盖情况

| 类型 | 数量 | 说明 |
|------|:----:|------|
| compile-pass | 1 | launch 基本语法验证 |
| compile-fail | 1 | ⚠️ GAP：launch domain/group/ID 参数未实现（D 类 Spec 不一致） |
| runtime | 0 | 需 ark VM 实测（job 调度语义） |
