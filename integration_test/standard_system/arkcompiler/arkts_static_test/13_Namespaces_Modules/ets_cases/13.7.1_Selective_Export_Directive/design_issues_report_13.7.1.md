# 13.7.1 Selective Export Directive - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-27
**测试用例数：** 4（compile-pass: 2, compile-fail: 1, runtime: 1）

---

## 一、与业界静态语言的差异点

**无设计问题发现。** 所有 4 个用例与 spec 一致。

---

## 二、严重性等级总览

| 严重性 | 数量 | 问题列表 |
|-------|------|---------|
| 编译器待完善 | 0 | - |
| 已修复(A类) | 0 | A1: alias后原名不可访问 → 已修复 |

---

## 三、跨语言对比（WSL实测）

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| **选择性导出** | ✅ `export {d1, d2 as d3}` | ❌ (Java用public逐个标注) | ❌ (Swift用public逐个标注) |
| **导出别名** | ✅ `export {x as y}` | ❌ | ❌ |
| **别名后原名不可访问(模块外)** | ✅ spec禁止 | ❌ (Java无此概念) | ❌ |

**WSL实测结果：**
- Java: `public static int EXPORTED_A=10; public static int EXPORTED_B=20; private static int NOT_EXPORTED=30;` → ✅ 编译+运行成功，A=10, B=20, sum=30
- Swift: `public struct ExportedStruct { public var a=10, b=20; private var hidden=30 }` → ✅ 编译+运行成功，a=10, b=20, sum=30

**关键发现：** Java/Swift用public/private逐个标注成员可见性，等价于ArkTS的export {A, B}，但无导出别名(as)语法

---

## 四、改善建议

1. 无需修改

---

## 四、附录：完整用例索引

| 用例 ID | 分类 | 测试内容 | 结果 |
|---------|------|---------|------|
| NSM_13_07_1_001 | compile-pass | export {d1, d2 as d3} | ✅ 通过 |
| NSM_13_07_1_002 | compile-pass | alias后原名同一模块内仍可用 | ✅ 通过(A类修复) |
| NSM_13_07_1_003 | runtime | 选择性导出运行时 | ✅ 通过 |
| NSM_13_07_1_004 | compile-fail | export {bar as foo}与已导出同名 | ✅ 通过 |

---

## 2026-07-17 编译复测验证

使用 es2panda --extension=ets（build 2026-06-17）全量编译验证。

| 用例 | @expect | 实际 | 结论 |
|----|---------|------|------|
| NSM_13_07_1_001 | compile-pass | - | - |
| NSM_13_07_1_002 | compile-pass | - | - |
| NSM_13_07_1_003 | runtime | - | - |
| NSM_13_07_1_004 | compile-fail | - | - |
