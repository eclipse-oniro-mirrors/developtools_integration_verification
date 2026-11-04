# 14.5 Ambient Interface Declarations — 跨语言行为差异及规范一致性报告

## 总览

ArkTS 14.5 Ambient Interface Declarations 的规范规则：
1. 语法：`declare interface Name { members }`
2. 成员支持 property、method、indexer、iterable
3. method 可用 `default` 标记
4. 支持 extends、泛型
5. ambient 方法不能有体

## 已知差异

**无。** 所有 3 个 compile-fail 用例均正确报错，无 spec 不一致问题。

## 总结

| ID | 问题 | 严重性 | 分类 |
|----|------|--------|------|
| — | 无待解决问题 | — | — |
