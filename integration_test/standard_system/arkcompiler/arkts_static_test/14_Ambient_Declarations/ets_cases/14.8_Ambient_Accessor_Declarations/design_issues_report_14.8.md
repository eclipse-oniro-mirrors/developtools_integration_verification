# 14.8 Ambient Accessor Declarations — 跨语言行为差异及规范一致性报告

## 总览

ArkTS 14.8 Ambient Accessor Declarations 的规范规则：
1. `get` 必须有显式返回类型，否则 compile-time error
2. `set` 参数不能有默认值（ambient 参数规则）

## 已知差异

**无。** 所有 compile-fail 用例均正确报错。

## 总结

| ID | 问题 | 严重性 | 分类 |
|----|------|--------|------|
| — | 无待解决问题 | — | — |
