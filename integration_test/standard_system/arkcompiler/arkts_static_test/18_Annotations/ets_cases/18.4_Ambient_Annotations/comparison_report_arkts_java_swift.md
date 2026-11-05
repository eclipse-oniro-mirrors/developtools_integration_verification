# 18.4 Ambient Annotations - 跨语言对比报告

## 1. 概览

ArkTS 的 ambient annotation 是声明文件 (.d.ets) 中的特性，Java 和 Swift 均无直接对应概念。

## 2. 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| Ambient 声明 | `declare @interface` | ❌ 无 | ❌ 无 |
| 实现必须匹配 | ✅ | N/A | N/A |
| 字段类型校验 | ✅ ESE0038 | N/A | N/A |
| 字段默认值校验 | ✅ ESE0039 | N/A | N/A |
| 字段数量校验 | ✅ ESE0040 | N/A | N/A |

## 3. 核心结论

1. Ambient annotation 是 ArkTS 声明系统的特有概念。
2. 编译器对 ambient 与实现的匹配检查非常严格（类型/默认值/字段数量）。
3. 所有 7 个用例与 spec 一致。
