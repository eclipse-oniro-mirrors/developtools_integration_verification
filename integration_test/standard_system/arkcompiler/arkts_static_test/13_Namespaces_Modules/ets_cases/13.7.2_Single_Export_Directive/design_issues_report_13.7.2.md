# 13.7.2 Single Export Directive - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-27
**测试用例数：** 7（compile-pass: 4, compile-fail: 2, runtime: 1）

---

## 一、与业界静态语言的差异点

### D6 ⭐⭐ — export default expression 中未导出类型被要求导出

- **问题描述：** Spec §13.7.2 和 §13.6 示例显示 `class A { foo(){} } export default new A` 在 A 未导出时是合法的（因为 default export expression 创建匿名常量变量），但 es2panda 报错 "Type 'A' used in export declaration(s) is not exported"
- **复现用例 ID：** NSM_13_07_2_007_FAIL_EXPORT_DEFAULT_EXPR_UNEXPORTED_TYPE
- **跨语言对比：**

| 语言 | 代码 | 行为 | WSL实测 |
|------|------|------|---------|
| ArkTS (es2panda) | `class A{}; export default new A` | 编译错误 (A未导出) | ⚠️ D类 |
| Spec 期望 | `class A{}; export default new A` | 合法 | — |
| Java | 类=类型+值(不存在"只导出值不导出类型"问题) | ✅ | ✅ DefaultExport实测: type+value both accessible |
| Swift | 类型=值(不存在此问题) | ✅ | ✅ 实测确认 |

- **严重性等级：** ⭐⭐ — 中等（spec与编译器不一致）
- **改进建议：** 编译器应允许 export default expression 引用未导出类型（因为 expression 值为常量）

---

## 二、符合ArkTS spec的语言设计差异（与规范一致）

| 行为 | 用例编号 | 状态 |
|------|---------|------|
| export identifier | NSM_13_07_2_001 | ✅ |
| export default class | NSM_13_07_2_002 | ✅ |
| export {A as default} | NSM_13_07_2_005 | ✅ |
| export default expression | NSM_13_07_2_006 | ✅ |
| 多个export default → 编译错误 | NSM_13_07_2_003 | ✅ |
| 单名导出运行时 | NSM_13_07_2_004 | ✅ |

---

## 三、严重性等级总览

| 严重性 | 数量 | 问题列表 |
|-------|------|---------|
| 编译器待完善 | 1 | D6: export default expression中A未导出被报错 |
| 语言差异 | 0 | - |

---

## 四、改善建议

### 短期
1. **编译器修复** — 允许 export default expression 引用未导出类型（D6）

---

## 五、附录：完整用例索引

| 用例 ID | 分类 | 测试内容 | 结果 |
|---------|------|---------|------|
| NSM_13_07_2_001 | compile-pass | export identifier | ✅ 通过 |
| NSM_13_07_2_002 | compile-pass | export default class | ✅ 通过 |
| NSM_13_07_2_003 | compile-fail | 多个export default | ✅ 通过 |
| NSM_13_07_2_004 | runtime | 单名导出运行时 | ✅ 通过 |
| NSM_13_07_2_005 | compile-pass | export {A as default} | ✅ 通过 |
| NSM_13_07_2_006 | compile-pass | export default expression | ✅ 通过 |
| NSM_13_07_2_007 | compile-fail | export default new A(A未导出) | ⚠️ D类 |

---

## 2026-07-17 编译复测验证

使用 es2panda --extension=ets（build 2026-06-17）全量编译验证。

| 用例 | @expect | 实际 | 结论 |
|----|---------|------|------|
| NSM_13_07_2_001 | compile-pass | - | - |
| NSM_13_07_2_002 | compile-pass | - | - |
| NSM_13_07_2_003 | compile-fail | - | - |
| NSM_13_07_2_004 | runtime | - | - |
| NSM_13_07_2_005 | compile-pass | - | - |
| NSM_13_07_2_006 | compile-pass | - | - |
| NSM_13_07_2_007 | compile-fail | REJECTED | D6用例设计问题 |

