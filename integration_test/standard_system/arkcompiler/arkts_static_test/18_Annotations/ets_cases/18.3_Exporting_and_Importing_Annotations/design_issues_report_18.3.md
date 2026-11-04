# 18.3 Exporting and Importing Annotations - 行为差异及规范一致性报告

## 概要

所有 8 个用例与 spec 一致，无设计问题。

## 行为差异

### `import type` 差异

| 语言 | 行为 |
|------|------|
| ArkTS | ❌ ESY7095: Import type notation to import annotations is forbidden |
| Java | ✅ 允许（注解是 interface 类型）|

此为 ArkTS 设计选择（注解不定义类型），非问题。
