# 14.4.2 Ambient Call Signature — 跨语言行为差异及规范一致性报告

## 总览

ArkTS 14.4.2 Ambient Call Signature 的规范规则：
1. 用 `signature` 语法 `(params): returnType` 声明
2. 必须在 ambient class 内
3. 多个 signatures 必须 distinct（参数类型不同）

## 已知差异

**无。** 所有 3 个 compile-fail 用例均正确报错，无 spec 不一致问题。

## 总结

| ID | 问题 | 严重性 | 分类 |
|----|------|--------|------|
| — | 无待解决问题 | — | — |
