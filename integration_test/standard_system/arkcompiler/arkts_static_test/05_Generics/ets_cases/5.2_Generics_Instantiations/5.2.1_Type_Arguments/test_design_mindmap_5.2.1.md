# 5.2.1 Type Arguments - Test Design Mindmap

## 概述
Type arguments are concrete types used to instantiate generic parameters.
ArkTS supports number, union, array, tuple, and function types as type arguments.

## 测试点覆盖

### 1. Number Type Argument（正向）
- 数值类型作为类型参数
- 用例: _001_PASS_TYPE_ARG_NUMBER

### 2. Union Type Argument（正向）
- 联合类型作为类型参数
- 用例: _002_PASS_TYPE_ARG_UNION

### 3. Array Type Argument（正向）
- 数组类型作为类型参数
- 用例: _003_PASS_TYPE_ARG_ARRAY

### 4. Tuple Type Argument（正向）
- 元组类型作为类型参数
- 用例: _004_PASS_TYPE_ARG_TUPLE

### 5. Function Type Argument（正向）
- 函数类型作为类型参数
- 用例: _005_PASS_TYPE_ARG_FUNC_TYPE

### 6. Invalid Type Argument（反向）
- 非法类型参数导致编译拒绝
- 用例: _100_FAIL_INVALID_TYPE_ARG

### 7. Runtime Behavior（运行时）
- 类型参数运行时行为验证
- 用例: _200_RUNTIME_TYPE_ARG

## 文件命名规范
- GEN_05_02_01_YYY_{CATEGORY}_{DESCRIPTION}.ets
