# 14.4.1 Ambient Indexer — 跨语言行为差异及规范一致性报告

## 总览

ArkTS 14.4.1 Ambient Indexer 的规范规则：
1. 语法：`['readonly'?] '[' identifier ':' type ']' returnType`
2. 每 class 仅允许一个 indexer
3. 仅在 ambient 上下文中支持
4. 仅用于 TS 兼容性

## 已知差异

**无。** 所有 3 个 compile-fail 用例均正确报错，无 spec 不一致问题。

## 发现

- 编译器要求 indexer 声明在字段之前（否则解析失败），spec 未说明此顺序依赖 — 属实现细节

## 总结

| ID | 问题 | 严重性 | 分类 |
|----|------|--------|------|
| — | 无待解决问题 | — | — |
