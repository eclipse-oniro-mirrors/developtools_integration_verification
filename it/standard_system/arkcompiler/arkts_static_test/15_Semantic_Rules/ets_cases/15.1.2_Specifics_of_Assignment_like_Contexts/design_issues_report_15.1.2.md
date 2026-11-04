# 15.1.2 Specifics of Assignment-like Contexts - Design Issues Report

## 一、编译器实现待完善 (Compiler Implementation Gaps)

### 1.1 数值拓宽赋值的完整支持
- **问题描述**: ArkTS 规范允许数值拓宽赋值（如 int → double），但当前编译器可能未完全支持所有拓宽场景
- **用例**: SEM_15_01_02_003_PASS_WIDENING_ASSIGN.ets
- **期望行为**: int 值可以赋值给 double 类型变量
- **当前状态**: 待验证
- **优先级**: 中

### 1.2 子类型赋值的完整支持
- **问题描述**: ArkTS 规范允许子类型赋值（如 Dog → Animal），但当前编译器可能未完全支持所有子类型场景
- **用例**: SEM_15_01_02_004_PASS_SUBTYPE_ASSIGN.ets
- **期望行为**: 子类实例可以赋值给父类类型变量
- **当前状态**: 待验证
- **优先级**: 中

## 二、与业界静态语言差异点 (Differences from Industry Static Languages)

### 2.1 赋值上下文类型推断一致性
- **ArkTS 行为**: 赋值上下文中，RHS 类型已知时做可赋值性检查，未知时从 LHS 类型推断
- **Java 行为**: 类似，Type compatibility check / LHS type inference
- **Swift 行为**: 类似，Type compatibility check / LHS type inference
- **TypeScript 行为**: 类似，Type compatibility check / LHS type inference
- **差异分析**: ArkTS 与主流静态语言行为一致，无明显差异
- **设计意图**: 保持与业界静态语言一致的赋值语义

### 2.2 数值拓宽赋值的支持
- **ArkTS 行为**: 支持数值拓宽赋值（int → double）
- **Java 行为**: 支持（implicit widening conversion）
- **Swift 行为**: 不支持，需要显式转换
- **TypeScript 行为**: 支持（number 类型统一）
- **差异分析**: ArkTS 与 Java 一致，比 Swift 更灵活
- **设计意图**: 提高开发便利性，同时保持类型安全

## 三、Spec措辞待澄清 (Spec Wording Clarification Needed)

### 3.1 赋值上下文的精确定义
- **问题**: Spec 中"assignment-like contexts"的定义不够明确，哪些上下文属于"assignment-like"？
- **建议**: 明确列举所有 assignment-like contexts（如 =, +=, -= 等）
- **影响范围**: 15.1.2 整节
- **优先级**: 低

### 3.2 类型推断的优先级
- **问题**: 当 RHS 类型部分已知时（如泛型类型），类型推断的优先级和规则不够明确
- **建议**: 补充类型推断的详细规则
- **影响范围**: 15.1.2, 15.1.7
- **优先级**: 中

## 四、测试覆盖度分析 (Test Coverage Analysis)

### 4.1 已覆盖场景
- ✅ 已知 RHS 类型时的可赋值性检查
- ✅ 未知 RHS 类型时从 LHS 类型推断
- ✅ 数值拓宽赋值
- ✅ 子类型赋值
- ✅ 类型不匹配拒绝
- ✅ 不相关类拒绝
- ✅ 运行时赋值语义

### 4.2 待补充场景
- ⚠️ 复合赋值运算符（+=, -=, etc.）的赋值上下文语义
- ⚠️ 解构赋值（destructuring assignment）的赋值上下文语义
- ⚠️ 泛型类型的赋值上下文类型推断

## 五、优先级建议 (Priority Recommendations)

| 问题 | 优先级 | 理由 |
|---|---|---|
| 数值拓宽赋值的完整支持 | 中 | 影响基本类型赋值语义 |
| 子类型赋值的完整支持 | 中 | 影响面向对象编程 |
| 赋值上下文的精确定义 | 低 | 主要是规范澄清 |
| 类型推断的优先级 | 中 | 影响泛型类型推断 |
| 复合赋值运算符语义 | 高 | 常见编程场景 |
| 解构赋值语义 | 中 | 现代语言特性 |
| 泛型赋值上下文推断 | 高 | 泛型编程核心 |
