# 5.1.2 Type Parameter Default - Test Design Mindmap

## 概述
Type parameters can have default types. When omitted, the default type is used.
Rules: default must be after non-default params; default cannot forward-reference later params.

## 测试点覆盖

### 1. Basic Default（正向）
- 类型参数有默认值，使用时可省略
- 用例: _001_PASS_TYPE_PARAM_DEFAULT

### 2. Multiple Defaults（正向）
- 多个类型参数各有默认值
- 用例: _002_PASS_MULTI_DEFAULT

### 3. Function Default（正向）
- 函数泛型参数有默认值
- 用例: _003_PASS_FUNC_DEFAULT

### 4. Default Equivalence（正向）
- 省略默认参数与显式指定等价
- 用例: _004_PASS_DEFAULT_EQUIV

### 5. Default After No-Default（反向）
- 无默认参数不能跟在有默认参数之后
- 用例: _100_FAIL_DEFAULT_AFTER_NO_DEFAULT

### 6. Forward Reference（反向）
- 默认值不能引用后面的类型参数
- 用例: _101_FAIL_DEFAULT_REF_FORWARD

### 7. Runtime Behavior（运行时）
- 默认类型参数运行时行为验证
- 用例: _200_RUNTIME_DEFAULT_TYPE_ARG, _201_RUNTIME_FUNC_EXPLICIT_DEFAULT

## 文件命名规范
- GEN_05_01_02_YYY_{CATEGORY}_{DESCRIPTION}.ets
