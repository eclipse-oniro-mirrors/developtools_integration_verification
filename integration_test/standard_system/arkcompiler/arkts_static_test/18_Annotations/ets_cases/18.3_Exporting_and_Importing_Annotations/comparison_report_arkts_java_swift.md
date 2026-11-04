# 18.3 Exporting and Importing Annotations - 跨语言对比报告

## 1. 概览

ArkTS 注解的 export/import 规则与 Java 非常相似，但在几个关键点上更严格。

## 2. 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 导出语法 | `export @interface` | `public @interface` | N/A |
| 限定名导入 | ✅ `import * as ns` | ✅ `import pkg.Anno` | N/A |
| 非限定名导入 | ✅ `import { Anno }` | ✅ `import pkg.Anno` | N/A |
| `import type` | ❌ ESY7095 | ✅（注解是 interface）| N/A |
| import 重命名 | ❌ ESE0357 | ✅ 允许 | N/A |
| `export default` | ❌ ESY0042 | ❌ 不允许 | N/A |
| default import | ❌ ESE0358 | ❌ 不允许 | N/A |
| 诊断清晰度 | ★★★★★ | ★★★★☆ | N/A |

## 3. 核心结论

1. **大部分规则与 Java 一致**：export、qualified/unqualified import 行为相似。
2. **关键差异在 `import type`**：Java 中注解是一种类型（interface），ArkTS 中注解不是类型，因此 `import type` 被禁止。
3. **ArkTS 更严格**：禁止 import 重命名、export default、default import。
4. **所有 8 个用例与 spec 一致**。
