# 14.7 Ambient Namespace Declarations — 跨语言行为差异及规范一致性报告

## 总览

ArkTS 14.7 Ambient Namespace Declarations 的规范规则：
1. 语法：`declare namespace Name { elements }`
2. `export` 控制对外可见性
3. 支持嵌套 namespace
4. ❌ exportDirective 引用不存在的成员 → compile-time error
5. const enum 在 namespace 中允许（目前版本不支持 const enum）

## 已知差异

**无。** 所有 compile-fail 用例均正确报错。

## 总结

| ID | 问题 | 严重性 | 分类 |
|----|------|--------|------|
| — | 无待解决问题 | — | — |
