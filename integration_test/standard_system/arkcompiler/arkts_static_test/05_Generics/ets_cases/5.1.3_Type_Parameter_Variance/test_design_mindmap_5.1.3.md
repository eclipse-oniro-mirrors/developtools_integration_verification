# 5.1.3 Type Parameter Variance - Test Design Mindmap

## 概述
Type parameters can have variance annotations: `in` (contravariant), `out` (covariant), or default (invariant).
Variance must satisfy position restrictions: out T cannot appear in parameter position; in T cannot appear in return position.
Variance interleaving: in+in=out, out+out=out, in+out=in, out+in=in.

## 测试点覆盖

### 1. Return Type Covariance（正向）
- out T 可用于返回值位置
- 用例: _001_PASS_RETURN, _008_PASS_COVARIANT_OUT

### 2. Parameter Contravariance（正向）
- in T 可用于参数位置
- 用例: _004_PASS_PARAM

### 3. Invariant Usage（正向）
- 不变类型参数可用于任何位置
- 用例: _002_PASS_VARIANCE

### 4. Readonly Field（正向）
- readonly 字段中 out T 可用
- 用例: _003_PASS_READONLY

### 5. Position Analysis（正向）
- 复杂位置嵌套分析
- 用例: _005_PASS_POS

### 6. Variance Interleaving（正向）
- 回调函数参数位置的 variance 交错计算
- 用例: _006_PASS_INTERLEAVE, _009_PASS_CALLBACK_PARAM_INTERLEAVING, _010_PASS_CALLBACK_RETURN_INTERLEAVING

### 7. Constructor Variance（正向）
- 构造函数中 variance 的处理
- 用例: _007_PASS_CONSTRUCTOR

### 8. Variance Violation（反向）
- out T 出现在参数位置 / in T 出现在返回值位置
- 用例: _100_FAIL_VARIANCE, _101_FAIL_POSITION, _103_FAIL_RETURN, _106_FAIL_PARAM

### 9. Field Variance Violation（反向）
- 非 readonly 字段中 out T 被禁止
- 用例: _102_FAIL_FIELD, _104_FAIL_FIELD

## 文件命名规范
- GEN_05_01_03_YYY_{CATEGORY}_{DESCRIPTION}.ets

### 10. Runtime Behavior（运行时）
- 协变/逆变在运行时行为正确
- 用例: _200_RUNTIME_COVARIANT_OUT
