# 5.1.4 Wildcard Type - Test Design Mindmap

## 概述
Wildcard types (`?`) represent unknown types. ArkTS supports wildcards with constraints.
Wildcards can be used in type arguments but have position restrictions.

## 测试点覆盖

### 1. Wildcard Declaration（正向）
- 泛型类型中使用通配符声明
- 用例: _001_PASS_WILDCARD_DECL

### 2. instanceof with Wildcard（正向）
- instanceof 检查中使用通配符
- 用例: _002_PASS_INSTANCEOF_WILDCARD

### 3. Wildcard in Any Position（反向）
- 通配符在不允许的位置使用
- 用例: _100_FAIL_ANY

### 4. Wildcard Constraint Violation（反向）
- 通配符约束不满足
- 用例: _101_FAIL_CONSTRAINT

### 5. Position Violation（反向）
- 通配符在禁止的位置
- 用例: _102_FAIL_POS

### 6. Invariant Position（反向）
- 通配符用于不变位置
- 用例: _103_FAIL_INVARIANT

### 7. Never Type with Wildcard（反向）
- never 类型与通配符交互
- 用例: _104_FAIL_NEVER

### 8. Wildcard in Complex Context（反向）
- 复杂场景中的通配符约束
- 用例: _105_FAIL_C

### 9. Write Position Violation（反向）
- 通配符在写位置被禁止
- 用例: _106_FAIL_WRITE

### 10. Assignment Violation（反向）
- 通配符赋值限制
- 用例: _107_FAIL_ASSIGN

## 文件命名规范
- GEN_05_01_04_YYY_{CATEGORY}_{DESCRIPTION}.ets

### 11. Runtime Behavior（运行时）
- 通配符类型运行时行为验证
- 用例: _200_RUNTIME_WILDCARD
