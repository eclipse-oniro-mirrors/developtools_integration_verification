# 18.2.1 Using Single Field Annotations - 行为差异及规范一致性报告

## 概要

所有 11 个用例与 spec 一致，无设计问题。

## 行为差异

### 简写字段名限制（ArkTS vs Java）

| 语言 | 行为 |
|------|------|
| ArkTS | 任意单字段都支持 `@Anno(expr)` |
| Java | 仅 `value()` 字段支持简写 |

此为语言设计差异，非问题。
