# 18.2.1 Using Single Field Annotations - 跨语言对比报告

## 1. 概览

ArkTS 单字段注解支持 `@Anno(expr)` 简写，与长形式 `@Anno({field: expr})` 完全等价。

## 2. 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 简写条件 | 任意单字段 | 仅 `value()` 字段 | N/A |
| 语法 | `@Anno(expr)` | `@Anno(expr)` | N/A |
| 长形式 | `@Anno({f: expr})` | `@Anno(f = expr)` | N/A |
| 枚举简写 | ✅ | ✅ | N/A |
| 数组简写 | ✅ `["a"]` | ✅ `{"a"}` | N/A |
| 多字段使用简写 | ❌ ESE0043 | ❌ 编译错误 | N/A |
| 常量检查 | ✅ ESE0012 | ✅ 编译错误 | N/A |

## 3. 核心结论

1. **ArkTS 单字段简写比 Java 更灵活**：Java 要求字段名为 `value()` 才支持简写，ArkTS 无此限制。
2. **行为等价**：简写和长形式行为完全一致（spec 明确声明）。
3. **错误诊断清晰**：ESE0043（多字段使用简写）、ESE0012（非常量值）。
