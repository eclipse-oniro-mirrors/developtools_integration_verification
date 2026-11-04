# 17.7.1 Callable Types with $_invoke Method - 测试设计思维导图

## 概述

本章节测试 ArkTS 实验特性：**可调用类型（Callable Types）的 `$_invoke` 方法**。

根据 ArkTS Static Language Specification §17.7.1：
- 在类中定义静态 `$_invoke` 方法（任意签名）可使该类成为可调用类型
- 可通过短形式 `ClassName(args)` 或显式形式 `ClassName.$_invoke(args)` 调用
- 一个类可定义多个不同签名的 `$_invoke` 方法（重载）
- 实例 `$_invoke` 方法不会使类成为可调用类型
- 静态方法无法访问泛型类型参数 — 泛型类中 `$_invoke` 不能使用类型参数
- 一个类不能同时定义 `$_invoke` 和 `$_instantiate`
- `new ClassName()` 调用构造函数，不会调用 `$_invoke`

## 子类型覆盖

### 1. 基本静态 $_invoke（无参数/简洁签名）
- **正向编译 (compile-pass):** 定义 static $_invoke() 无参无返回 / 有参有返回，类可被调用
- **反向编译 (compile-fail):** -
- **运行时 (runtime):** 通过短形式调用并断言结果

### 2. 静态 $_invoke 调用方式
- **正向编译:** 短形式 `ClassName(args)`、显式形式 `ClassName.$_invoke(args)`
- **反向编译:** -
- **运行时:** 两种调用方式的结果一致性验证

### 3. 多重 $_invoke 重载（不同签名）
- **正向编译:** 定义 2+ 个不同参数类型/数量的 $_invoke static 重载
- **反向编译:** -
- **运行时:** 运行时根据参数选择正确的重载

### 4. 实例 $_invoke（不使类可调用）
- **正向编译:** 定义实例 $_invoke 方法（合法定义）
- **反向编译:** 尝试以 `ClassName()` 调用仅含实例 $_invoke 的类 — 应编译失败
- **运行时:** -

### 5. $_invoke 与 $_instantiate 互斥
- **正向编译:** -
- **反向编译:** 同类中同时定义 $_invoke 和 $_instantiate — 应编译失败
- **运行时:** -

### 6. 泛型类中的 $_invoke
- **正向编译:** 定义泛型类的 static $_invoke（不使用类型参数）
- **反向编译:** 泛型类的 $_invoke 中使用类型参数 — 应编译失败
- **运行时:** 泛型类的 $_invoke 运行时调用验证

### 7. void 返回的 $_invoke
- **正向编译:** static $_invoke 返回 void
- **反向编译:** -
- **运行时:** void 返回的 $_invoke 调用验证

### 8. 复杂参数的 $_invoke
- **正向编译:** $_invoke 接受数组/FixedArray/自定义类型参数
- **反向编译:** -
- **运行时:** 复杂参数传递和返回值验证

### 9. new 表达式与 $_invoke 区分
- **正向编译:** -
- **反向编译:** -
- **运行时:** 验证 `new ClassName()` 调用构造函数而非 $_invoke

## 边界值/异常场景

- $_invoke 参数数量不匹配（编译时错误，由重载解析处理）
- $_invoke 返回类型与实际返回不一致（编译时错误，类型检查）
- 空类（无 $_invoke）尝试直接调用（编译时错误）
- $_invoke 与构造函数同时存在时的行为区分

## 分类说明
- **compile-pass**（.ets 文件必须编译成功）：验证语法正确的用法
- **compile-fail**（.ets 文件必须产生编译时错误）：验证违反规则的场景
- **runtime**（.ets 文件测试运行时行为，必须含 main + assert）：验证实际执行结果

## 文件命名规范

`EXP2_17_07_01_YYY_{CATEGORY}_{DESCRIPTION}.ets`

| 字段 | 含义 | 示例 |
|------|------|------|
| `EXP2_` | 第 17 章 Experimental Features 前缀 | 固定 |
| `17` | 主章节号 | 17 |
| `07` | 子章节号 | 07 |
| `01` | 孙章节号 | 01 |
| `YYY` | 章节内连续编号 | 001, 002, ... |
| `CATEGORY` | 分类 | PASS / FAIL / RUNTIME |
| `DESCRIPTION` | 用例描述（大写下划线） | SIMPLE_INVOKE_NO_PARAMS |

**编号顺序：** PASS（001~）→ FAIL（接续）→ RUNTIME（接续）

## 用例清单

| 编号 | 文件名 | 分类 | 测试点 |
|------|--------|------|--------|
| 001 | EXP2_17_07_01_001_PASS_SIMPLE_INVOKE_NO_PARAMS.ets | compile-pass | 无参 static $_invoke |
| 002 | EXP2_17_07_01_002_PASS_INVOKE_WITH_PARAMS.ets | compile-pass | 有参有返回 static $_invoke |
| 003 | EXP2_17_07_01_003_PASS_MULTIPLE_OVERLOADS.ets | compile-pass | 多个 $_invoke 不同签名 |
| 004 | EXP2_17_07_01_004_PASS_EXPLICIT_CALL.ets | compile-pass | 显式 ClassName.$_invoke(args) |
| 005 | EXP2_17_07_01_005_PASS_VOID_RETURN.ets | compile-pass | void 返回的 $_invoke |
| 006 | EXP2_17_07_01_006_PASS_COMPLEX_PARAMS.ets | compile-pass | 复杂参数 (数组等) |
| 007 | EXP2_17_07_01_007_PASS_GENERIC_CLASS.ets | compile-pass | 泛型类 static $_invoke (不用类型参数) |
| 008 | EXP2_17_07_01_008_PASS_INSTANCE_INVOKE_DEFINED.ets | compile-pass | 实例 $_invoke 合法定义 |
| 009 | EXP2_17_07_01_009_FAIL_BOTH_INVOKE_AND_INSTANTIATE.ets | compile-fail | 同时定义 $_invoke 和 $_instantiate |
| 010 | EXP2_17_07_01_010_FAIL_INSTANCE_INVOKE_NOT_CALLABLE.ets | compile-fail | 仅实例 $_invoke 的类尝试调用 |
| 011 | EXP2_17_07_01_011_FAIL_GENERIC_USE_TYPE_PARAM.ets | compile-fail | 泛型类 $_invoke 使用类型参数 |
| 012 | EXP2_17_07_01_012_RUNTIME_SHORT_FORM_CALL.ets | runtime | 短形式调用并断言结果 |
| 013 | EXP2_17_07_01_013_RUNTIME_OVERLOAD_SELECT.ets | runtime | 重载选择运行时验证 |
| 014 | EXP2_17_07_01_014_RUNTIME_NEW_VS_INVOKE.ets | runtime | new 表达式 vs $_invoke 区分 |

**总计：14 用例 (8 compile-pass + 3 compile-fail + 3 runtime)**
