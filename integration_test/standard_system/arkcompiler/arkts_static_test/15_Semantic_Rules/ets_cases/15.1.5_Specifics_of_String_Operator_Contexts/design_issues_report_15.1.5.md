# 15.1.5 Specifics of String Operator Contexts - Design Issues Report

## 一、编译器实现待完善 (Compiler Implementation Gaps)

### 1.1 字符串运算符转换的完整支持
- **问题描述**: ArkTS 规范规定二元 '+' 运算符在一侧为 string 时进行字符串转换，但当前编译器可能未完全支持所有转换场景
- **用例**: SEM_15_01_05_001_PASS_STRING_OPERATOR_CONVERSION.ets
- **期望行为**: string+int→string, int+string→string, string+字面量→string
- **当前状态**: 待验证
- **优先级**: 高

### 1.2 字符串与各种类型拼接的完整支持
- **问题描述**: ArkTS 规范支持字符串与布尔值、double 等类型的拼接，但当前编译器可能未完全支持所有拼接场景
- **用例**: SEM_15_01_05_002_PASS_STRING_BOOL.ets, SEM_15_01_05_003_PASS_STRING_DOUBLE.ets
- **期望行为**: string+boolean→string, string+double→string
- **当前状态**: 待验证
- **优先级**: 中

### 1.3 字符串不支持的运算符的完整检查
- **问题描述**: ArkTS 规范规定二进制运算符 '-' 不可用于字符串，但当前编译器可能未完全检查所有不支持的运算符
- **用例**: SEM_15_01_05_100_FAIL_STRING_SUB.ets
- **期望行为**: string-string 应报编译错误
- **当前状态**: 待验证
- **优先级**: 中

## 二、与业界静态语言差异点 (Differences from Industry Static Languages)

### 2.1 字符串运算符 '+' 的转换一致性
- **ArkTS 行为**: 二元 '+' 运算符在一侧为 string 时进行字符串转换
- **Java 行为**: 类似，string + int → string（字符串拼接）
- **Swift 行为**: 类似，但推荐使用字符串插值（string interpolation）
- **TypeScript 行为**: 类似，string + int → string
- **差异分析**: ArkTS 与 Java/TypeScript 一致，Swift 推荐使用字符串插值
- **设计意图**: 保持与主流语言一致的字符串拼接语义

### 2.2 字符串不支持的运算符
- **ArkTS 行为**: 二进制运算符 '-' 不可用于字符串
- **Java 行为**: 类似，string - string 编译错误
- **Swift 行为**: 类似，string - string 编译错误
- **TypeScript 行为**: 类似，string - string 编译错误（严格模式）
- **差异分析**: 所有静态语言都拒绝字符串不支持的运算符
- **设计意图**: 类型安全

## 三、Spec措辞待澄清 (Spec Wording Clarification Needed)

### 3.1 字符串运算符转换的精确定义
- **问题**: Spec 中"二元 '+' 运算符在一侧为 string 时进行字符串转换"的规则不够明确，哪些类型可以自动转换为 string？
- **建议**: 明确列举所有可以自动转换为 string 的类型（int, double, boolean, etc.）
- **影响范围**: 15.1.5 整节
- **优先级**: 中

### 3.2 字符串不支持的运算符的精确定义
- **问题**: Spec 中未明确列举所有不可用于字符串的运算符（除了 '-'）
- **建议**: 明确列举所有不可用于字符串的运算符（-, *, /, %, etc.）
- **影响范围**: 15.1.5
- **优先级**: 中

## 四、测试覆盖度分析 (Test Coverage Analysis)

### 4.1 已覆盖场景
- ✅ 字符串运算符转换（string+int→string, int+string→string）
- ✅ 字符串与布尔值拼接（string+boolean→string）
- ✅ 字符串与double拼接（string+double→string）
- ✅ 字符串减法运算无效（string-string）
- ✅ 字符串拼接运行时行为

### 4.2 待补充场景
- ⚠️ 字符串与其余类型的拼接（如 string+object）
- ⚠️ 字符串不支持的其余运算符（*, /, %, etc.）
- ⚠️ 字符串拼接的性能优化
- ⚠️ 字符串模板（template literals）的支持

## 五、优先级建议 (Priority Recommendations)

| 问题 | 优先级 | 理由 |
|---|---|---|
| 字符串运算符转换的完整支持 | 高 | 影响基本字符串拼接语义 |
| 字符串与各种类型拼接的完整支持 | 中 | 影响字符串拼接场景 |
| 字符串不支持的运算符的完整检查 | 中 | 影响类型安全 |
| 字符串运算符转换的精确定义 | 中 | 主要是规范澄清 |
| 字符串不支持的运算符的精确定义 | 中 | 主要是规范澄清 |
| 字符串与其余类型的拼接 | 中 | 影响字符串拼接场景 |
| 字符串不支持的其余运算符 | 中 | 影响类型安全 |
| 字符串拼接的性能优化 | 低 | 性能优化 |
| 字符串模板的支持 | 高 | 现代语言特性 |
