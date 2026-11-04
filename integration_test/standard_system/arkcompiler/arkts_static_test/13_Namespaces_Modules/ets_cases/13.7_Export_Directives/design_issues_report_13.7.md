# 13.7 Export Directives - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-27
**测试用例数：** 3（compile-pass: 2, runtime: 1）

---

## 一、与业界静态语言的差异点

**无设计问题发现。** 所有 3 个用例与 spec 一致。

---

## 二、严重性等级总览

| 严重性 | 数量 | 问题列表 |
|-------|------|---------|
| 编译器待完善 | 0 | - |

---

## 三、跨语言对比（WSL实测）

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| **export指令** | ✅ `export {A, B}` | ❌ (public修饰符替代) | ❌ (public修饰符替代) |
| **export default** | ✅ | ❌ | ❌ |
| **选择性导出** | ✅ `export {A as B}` | ❌ | ❌ |

**WSL实测结果：**
- Java: `public class ExportLib { public static int PUB_VAL=10; }` → ✅ 编译+运行成功，public修饰符控制可见性
- Swift: `public func exportedFunc() -> Int { return 10 }` → ✅ 编译+运行成功，public修饰符控制可见性

**关键发现：** Java用public修饰符逐个控制可见性，等价于ArkTS的export指令，但无选择性导出/别名/re-export语法

---

## 四、改善建议

1. 无需修改

---

## 四、附录：完整用例索引

| 用例 ID | 分类 | 测试内容 | 结果 |
|---------|------|---------|------|
| NSM_13_07_001 | compile-pass | export指令选择性导出 | ✅ 通过 |
| NSM_13_07_002 | compile-pass | export指令单名导出 | ✅ 通过 |
| NSM_13_07_003 | runtime | export指令运行时 | ✅ 通过 |

---

## 2026-07-17 编译复测验证

使用 es2panda --extension=ets（build 2026-06-17）全量编译验证。

| 用例 | @expect | 实际 | 结论 |
|----|---------|------|------|
| NSM_13_07_001 | compile-pass | - | - |
| NSM_13_07_002 | compile-pass | - | - |
| NSM_13_07_003 | runtime | - | - |
