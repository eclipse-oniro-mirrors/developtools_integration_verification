# 18.5.2 Target Annotation - 跨语言对比报告

## 概览

ArkTS `@Target` 与 Java `@Target` 概念完全对应。

## 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| @Target 语法 | `@Target({targets: [AnnotationTargets.CLASS]})` | `@Target({ElementType.TYPE})` | N/A |
| 目标枚举 | `AnnotationTargets` | `ElementType` | N/A |
| 越界检查 | ✅ ESE495032 | ✅ | N/A |
| 重复值检查 | ✅ ESE263981 | ✅ | N/A |
| 仅用于注解 | ✅ ESE1122645 | ✅ | N/A |

## 核心结论

ArkTS 的 `@Target` 语义与 Java 一致。编译器对越界使用（ESE495032）和重复值（ESE263981）的诊断非常清晰。
