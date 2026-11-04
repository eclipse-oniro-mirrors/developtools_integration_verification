# 7.35.4 Runtime Evaluation of Lambda Expressions - 测试设计思维导图

## 概述

验证 ArkTS 中 Lambda 表达式运行时求值的正确性。根据规范，Lambda 表达式求值本身不执行体，产生新的函数类型实例；变量捕获是引用语义（非拷贝）；函数作用域和循环作用域中的捕获各自独立。

## Spec 规则

### 基本定义
| # | 规则 | 说明 |
|---|------|------|
| 1 | Lambda 表达式求值不执行体 | 表达式本身不执行 lambda 体，体在调用时执行 |
| 2 | 正常完成时产生新的函数类型实例 | 对应 lambda 签名的函数类型实例 |
| 3 | 内存不足时抛出 OutOfMemoryError | 空间不足时异常完成 |
| 4 | 捕获变量是引用而非拷贝 | 修改捕获变量反映到原始变量 |
| 5 | 函数作用域捕获：每次调用独立 | func1 和 func2 是不同的函数类型实例，各有自己的捕获变量 |

### 循环作用域捕获规则
| # | 规则 | 说明 |
|---|------|------|
| 6 | 循环中每轮迭代的 `let` 创建新绑定 | 每个 lambda 捕获不同的 index 值 |
| 7 | 数组存储多个 lambda | 每个 lambda 调用时输出各自的捕获值 |

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | Lambda 求值不执行体（定义编译） | 定义 lambda 赋值给变量，验证编译通过 |
| 002 | 变量捕获声明 | lambda 捕获外部 let 变量/多个变量编译通过 |

### compile-fail

无 compile-fail 用例。

### runtime（验证运行时求值行为正确）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 003 | Lambda 体延迟执行 | 定义时不执行，调用时体才执行，返回 42；多次调用累积状态正确 |
| 004 | 捕获语义 — 非拷贝修改 | let z=1, () => z++, z → 2; v=5, reader()=5, v=10, reader()=10 |
| 005 | 函数作用域捕获 — 独立性 | func1(11)→prev=0, func2(22)→prev=0, func1(33)→prev=11, func2(44)→prev=22 |
| 006 | 循环作用域捕获 — 每迭代独立 | storage[0]()=0, storage[1]()=1, ..., storage[4]()=4 |

## 三语言对比要点

| 特性 | ArkTS | Java | Swift |
|------|:-----:|:----:|:-----:|
| Lambda 求值不执行体 | ✅ 定义不执行，调用执行 | ✅ 同 ArkTS | ✅ 同 ArkTS |
| 捕获变量可修改性 | ✅ 直接 `let y; () => y++` | ❌ 需 int[]/Atomic 包装 | ✅ `var y; { y += 1 }` |
| 函数作用域独立性 | ✅ 每次调用独立捕获 | ✅ 每次调用独立捕获 | ✅ 每次调用独立捕获 |
| 循环捕获简洁性 | ✅ `let` 自动新绑定 | ⚠️ 需 `int c = i` 手动副本 | ✅ `for...in` 自然独立 |
| 多次调用累积状态 | ✅ 捕获变量保持状态 | ✅ 通过包装保持状态 | ✅ 通过 `var` 保持状态 |
| 捕获语义语法简洁性 | ⭐⭐⭐ 最简洁 | ⭐⭐ 需数组/Atomic | ⭐⭐⭐ 简洁 |

## 文件清单

| # | 文件名 | 类别 | 验证点 |
|:-:|--------|:----:|--------|
| 001 | EXP_07_35_04_001_PASS_LAMBDA_EVAL_NO_BODY.ets | compile-pass | Lambda 求值不执行体：定义 lambda 编译通过 |
| 002 | EXP_07_35_04_002_PASS_VARIABLE_CAPTURE_DECL.ets | compile-pass | 变量捕获声明编译通过 |
| 003 | EXP_07_35_04_003_RUNTIME_LAMBDA_EVAL_INSTANCE.ets | runtime | Lambda 产生实例，体在调用时执行 |
| 004 | EXP_07_35_04_004_RUNTIME_CAPTURE_SEMANTICS.ets | runtime | 捕获语义：非拷贝，修改反映 |
| 005 | EXP_07_35_04_005_RUNTIME_FUNCTION_SCOPE_CAPTURE.ets | runtime | 函数作用域捕获：独立变量 |
| 006 | EXP_07_35_04_006_RUNTIME_LOOP_SCOPE_CAPTURE.ets | runtime | 循环作用域捕获：不同 index |

## 分类说明

| 分类 | 用途 | 数量 |
|:----:|------|:----:|
| compile-pass | 验证 lambda 运行时求值的合法表达式编译通过 | 2 |
| compile-fail | — | 0 |
| runtime | 验证 lambda 运行时求值行为 | 4 |
| **合计** | | **6** |

## 文件命名规范

```
EXP_07_35_04_YYY_{CATEGORY}_{DESCRIPTION}.ets
```

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

编号规则：001-002 PASS，003-006 RUNTIME（无 compile-fail）

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
