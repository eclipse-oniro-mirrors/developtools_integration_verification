# 13.7.3 Export Type Directive - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-27
**测试用例数：** 2（compile-pass: 1, compile-fail: 1）

---

## 一、与业界静态语言的差异点

### D4 ⭐⭐ — export type 引用非 type 未报错

- **问题描述：** Spec §13.7.3 规定 "If a binding refers to something other than type, then a compile-time error occurs"，但 `export type { foo }` （foo 为函数）编译通过
- **复现用例 ID：** NSM_13_07_3_002_FAIL_EXPORT_TYPE_NON_TYPE
- **跨语言对比：**

| 语言 | 代码 | 行为 | WSL实测 |
|------|------|------|---------|
| ArkTS | `export type { foo }` (foo为函数) | 编译通过(违反spec) | ⚠️ D类 |
| Java | 无export type概念, import=类型+值 | ✅ (不存在类型信息丢失) | ✅ TypeValue实测: type+value绑定 |
| Swift | 无export type概念, import=类型+值 | ✅ (不存在类型信息丢失) | ✅ 实测确认 |

- **严重性等级：** ⭐⭐ — 中等（spec明确要求但编译器未实现）
- **改进建议：** 编译器应检查 export type binding 的目标是否为 type

---

## 二、严重性等级总览

| 严重性 | 数量 | 问题列表 |
|-------|------|---------|
| 编译器待完善 | 1 | D4: export type引用非type未报错 |

---

## 三、改善建议

1. **编译器修复** — 检查 export type binding 的目标是否为 type（D4）

---

## 四、附录：完整用例索引

| 用例 ID | 分类 | 测试内容 | 结果 |
|---------|------|---------|------|
| NSM_13_07_3_001 | compile-pass | export type合法使用 | ✅ 通过 |
| NSM_13_07_3_002 | compile-fail | export type引用非type | ⚠️ D类 |

---

## 2026-07-17 编译复测验证

使用 es2panda --extension=ets（build 2026-06-17）全量编译验证。

| 用例 | @expect | 实际 | 结论 |
|----|---------|------|------|
| NSM_13_07_3_001 | compile-pass | - | - |
| NSM_13_07_3_002 | compile-fail | ACCEPTED | D4未修复 |

