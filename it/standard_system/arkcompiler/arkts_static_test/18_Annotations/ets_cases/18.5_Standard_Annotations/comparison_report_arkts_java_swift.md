# 18.5 Standard Annotations - 跨语言对比报告

## 概览

ArkTS 的标准注解 `@Retention` 和 `@Target` 的概念与 Java 几乎完全对应。

## 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| @Retention | ✅ "SOURCE"/"BYTECODE"/"RUNTIME" | ✅ RetentionPolicy | N/A |
| @Target | ✅ AnnotationTargets enum | ✅ ElementType | N/A |
| 仅用于注解 | ✅ ESE1122645 | ✅ 编译错误 | N/A |
| 错误诊断 | ★★★★★ | ★★★★☆ | N/A |

## 核心结论

1. ArkTS 的 `@Retention` 和 `@Target` 语义与 Java 几乎一致。
2. Retention 策略名 SOURCE/BYTECODE/RUNTIME 对应 Java 的 SOURCE/CLASS/RUNTIME。
3. 编译器严格检查标准注解只能用于注解声明（ESE1122645）。
