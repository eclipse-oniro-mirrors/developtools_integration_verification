# 5.2.2 Explicit Generic Instantiations - Test Design Mindmap

## 概述
Explicit generic instantiation provides concrete type arguments at the call/usage site.
Supports class, method, function, and type alias instantiation with partial instantiation.

## 测试点覆盖

### 1. Explicit Class Instantiation（正向）
- 显式指定泛型类的类型参数
- 用例: _001_PASS_EXPLICIT_CLASS_INST

### 2. Explicit Method Instantiation（正向）
- 显式指定泛型方法的类型参数
- 用例: _002_PASS_EXPLICIT_METHOD_INST

### 3. Explicit Function Instantiation（正向）
- 显式指定泛型函数的类型参数
- 用例: _003_PASS_EXPLICIT_FUNC_INST

### 4. Explicit Type Alias Instantiation（正向）
- 显式指定泛型类型别名的类型参数
- 用例: _004_PASS_EXPLICIT_TYPE_ALIAS

### 5. Partial Instantiation（正向）
- 部分类型参数显式指定，其余推断
- 用例: _005_PASS_PARTIAL_INST_GENERIC

### 6. Non-Generic With Args（反向）
- 非泛型实体不能带类型参数
- 用例: _100_FAIL_NON_GENERIC_WITH_ARGS

### 7. Argument Count Mismatch（反向）
- 类型参数数量不匹配
- 用例: _101_FAIL_ARG_COUNT_MISMATCH

### 8. Constraint Violation（反向）
- 类型参数不满足约束
- 用例: _102_FAIL_CONSTRAINT_VIOLATION

### 9. Runtime Behavior（运行时）
- 显式实例化运行时行为验证
- 用例: _200_RUNTIME_EXPLICIT_INST

## 文件命名规范
- GEN_05_02_02_YYY_{CATEGORY}_{DESCRIPTION}.ets
