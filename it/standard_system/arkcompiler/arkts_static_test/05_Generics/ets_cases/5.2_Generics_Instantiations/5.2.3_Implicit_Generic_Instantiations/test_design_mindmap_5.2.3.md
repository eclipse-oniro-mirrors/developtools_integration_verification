# 5.2.3 Implicit Generic Instantiations - Test Design Mindmap

## 概述
Implicit generic instantiation infers type arguments from context when not explicitly provided.
Supports function argument inference, multi-parameter inference, and method default from class.

## 测试点覆盖

### 1. Implicit Function Infer（正向）
- 函数调用时隐式推断类型参数
- 用例: _001_PASS_IMPLICIT_FUNC_INFER

### 2. Multi-Parameter Infer（正向）
- 多个类型参数从上下文隐式推断
- 用例: _002_PASS_IMPLICIT_MULTI_INFER

### 3. Method Default from Class（正向）
- 方法继承类的默认类型参数
- 用例: _003_PASS_METHOD_DEFAULT_FROM_CLASS

### 4. Cannot Infer（反向）
- 无法推断时编译拒绝
- 用例: _100_FAIL_CANNOT_INFER

### 5. No Context（反向）
- 缺少上下文时编译拒绝
- 用例: _101_FAIL_INFER_NO_CONTEXT

### 6. Default Order Implicit（反向）
- 隐式推断与默认参数顺序限制
- 用例: _102_FAIL_DEFAULT_ORDER_IMPLICIT

### 7. Runtime Behavior（运行时）
- 隐式实例化运行时行为验证
- 用例: _200_RUNTIME_IMPLICIT_INST

## 文件命名规范
- GEN_05_02_03_YYY_{CATEGORY}_{DESCRIPTION}.ets
