# 5.1.1 Type Parameter Constraint - Test Design Mindmap

## 概述
Type parameter constraint restricts the types that can be substituted for a type parameter.
ArkTS supports: class/interface constraint, union constraint, literal union constraint, keyof constraint, and dependent type parameters.

## 测试点覆盖

### 1. Class/Interface Constraint（正向）
- extends 指定具体类或接口作为约束
- 约束满足时编译通过
- 用例: _001_PASS_CONSTRAINT_CLASS

### 2. Union Constraint（正向）
- extends 联合类型约束
- 类型参数为联合成员时通过
- 用例: _002_PASS_CONSTRAINT_UNION

### 3. Literal Union Constraint（正向）
- 字面量联合类型约束
- 用例: _003_PASS_CONSTRAINT_LITERAL_UNION

### 4. keyof Constraint（正向）
- keyof 类型约束
- 用例: _004_PASS_CONSTRAINT_KEYOF

### 5. Dependent Type Parameters（正向）
- 类型参数依赖前面的类型参数
- 用例: _005_PASS_DEPENDENT_PARAM

### 6. Derived Constraint（正向）
- 派生类型满足约束
- 用例: _006_PASS_CONSTRAINT_DERIVED

### 7. Constraint Not Satisfied（反向）
- 类型参数不满足约束时编译拒绝
- 用例: _100_FAIL_CONSTRAINT_NOT_SATISFIED

### 8. Union Constraint Not Satisfied（反向）
- 类型不满足联合约束时编译拒绝
- 用例: _101_FAIL_CONSTRAINT_UNION_NOT_SATISFIED

### 9. Literal Constraint Violation（反向）
- 字面量约束不满足时编译拒绝
- 用例: _102_FAIL_LITERAL_CONSTRAINT

### 10. keyof Constraint Violation（反向）
- keyof 约束不满足时编译拒绝
- 用例: _103_FAIL_KEYOF_CONSTRAINT

## 文件命名规范
- GEN_05_01_01_YYY_{CATEGORY}_{DESCRIPTION}.ets
- CATEGORY: PASS / FAIL / RUNTIME
