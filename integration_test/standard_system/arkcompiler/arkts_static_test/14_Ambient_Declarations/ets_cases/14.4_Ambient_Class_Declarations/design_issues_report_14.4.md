# 14.4 Ambient Class Declarations — 跨语言行为差异及规范一致性报告

## 总览

ArkTS 14.4 Ambient Class Declarations 的规范规则：
1. 字段必须有显式类型注解，无初始化器
2. 构造器、方法、访问器不能有实现体
3. 仅允许 public/protected 访问修饰符
4. 方法必须指定返回类型

## 已知差异

### B-14.4-01: struct 关键字在 ambient 上下文受限

**描述**：spec 语法允许 `'class'|'struct'`，但 ArkTS 编译器禁止 ambient struct 声明（struct 仅用于 UI 组件上下文）。

**复现用例**：
- AMB_14_04_022_FAIL_STRUCT_NOT_ALLOWED.ets（`declare struct Point {}`）

**严重性**：LOW
**分类**：B 类（ArkTS 设计选择）
**建议**：明确 spec 与实现差异，或扩展 struct 支持到 ambient 上下文

## 总结

| ID | 问题 | 严重性 | 分类 |
|----|------|--------|------|
| B-14.4-01 | struct 关键字在 ambient 受限 | LOW | B 类 |
