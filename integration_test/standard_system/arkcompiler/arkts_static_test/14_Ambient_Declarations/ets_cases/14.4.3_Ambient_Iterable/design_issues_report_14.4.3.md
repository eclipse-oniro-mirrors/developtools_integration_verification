# 14.4.3 Ambient Iterable — 跨语言行为差异及规范一致性报告

## 总览

ArkTS 14.4.3 Ambient Iterable 的规范规则：
1. 语法：`[Symbol.iterator]() : returnType`
2. returnType 必须实现 Iterator 接口
3. 每 class 仅允许一个 iterable
4. 仅在 ambient 上下文中支持

## 已知差异

**无。** 所有 3 个 compile-fail 用例均正确报错，无 spec 不一致问题。

## 总结

| ID | 问题 | 严重性 | 分类 |
|----|------|--------|------|
| — | 无待解决问题 | — | — |
