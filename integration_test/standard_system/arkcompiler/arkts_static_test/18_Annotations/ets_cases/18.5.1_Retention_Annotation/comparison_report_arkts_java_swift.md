# 18.5.1 Retention Annotation - 跨语言对比报告

## 概览

ArkTS `@Retention` 与 Java `@Retention` 概念完全对应。

## 关键差异矩阵

| 维度 | ArkTS | Java |
|------|-------|------|
| 简写 | `@Retention("SOURCE")` | `@Retention(RetentionPolicy.SOURCE)` |
| 完整形式 | `@Retention({policy: "SOURCE"})` | `@Retention(value = RetentionPolicy.SOURCE)` |
| SOURCE | ✅ | ✅ |
| BYTECODE | ✅ | ✅（CLASS） |
| RUNTIME | ✅ | ✅ |
| 默认策略 | BYTECODE | CLASS |
| 错误诊断 | ESE0004/ESE1122645 | ✅ |

## 核心结论

ArkTS 的 `@Retention` 语义与 Java 几乎完全一致。BYTECODE 对应 Java 的 CLASS。诊断清晰。
