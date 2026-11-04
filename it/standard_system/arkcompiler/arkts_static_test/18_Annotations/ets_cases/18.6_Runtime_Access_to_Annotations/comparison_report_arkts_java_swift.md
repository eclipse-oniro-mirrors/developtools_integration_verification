# 18.6 Runtime Access to Annotations - 跨语言对比报告

## 概览

ArkTS spec 中定义的运行时注解访问机制与 Java 的反射 API 类似，但当前编译器实现尚不完整。

## 关键差异矩阵

| 维度 | ArkTS Spec | ArkTS 实现 | Java | Swift |
|------|-----------|-----------|------|-------|
| 注解运行时访问 | ✅ 隐式抽象类 + 反射库 | ❌ ESE0159 | ✅ `getAnnotation()` | N/A |
| 保留策略 | BYTECODE/RUNTIME | BYTECODE/RUNTIME | RUNTIME only | N/A |
| readonly 字段 | ✅ | ✅ (编译支持) | ✅ (default) | N/A |

## 核心结论

1. **Spec vs 实现不一致**：Spec 要求 RUNTIME/BYTECODE 注解可通过反射访问，但当前编译器禁止注解作为类型使用。
2. **Java 对比**：Java 的 `getAnnotation(Class)` API 成熟稳定，ArkTS 需要补充类似的标准反射接口。
3. **该问题已记录至 issue_report.md**。
