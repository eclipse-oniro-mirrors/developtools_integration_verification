# 13.6 Exported Declarations - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-27
**测试用例数：** 15（compile-pass: 4, compile-fail: 10, runtime: 1）

---

## 一、与业界静态语言的差异点

**无设计问题发现。** 所有 15 个用例的行为均与 spec 一致。

---

## 二、符合ArkTS spec的语言设计差异（与规范一致）

| 行为 | 用例编号 | 状态 |
|------|---------|------|
| export class | NSM_13_06_001 | ✅ |
| export function | NSM_13_06_002 | ✅ |
| export let/const | NSM_13_06_003 | ✅ |
| export default | NSM_13_06_004 | ✅ |
| 导出无显式类型 → 编译错误 | NSM_13_06_005 | ✅ |
| 导出函数无返回类型 → 编译错误 | NSM_13_06_006 | ✅ |
| 导出使用未导出类型 → 编译错误 | NSM_13_06_007 | ✅ |
| 导出名重复 → 编译错误 | NSM_13_06_008 | ✅ |
| 多个default export → 编译错误 | NSM_13_06_009 | ✅ |
| extends未导出类 → 编译错误 | NSM_13_06_010 | ✅ |
| 泛型约束未导出类型 → 编译错误 | NSM_13_06_011 | ✅ |
| 导出实体运行时访问 | NSM_13_06_012 | ✅ |
| export type alias引用未导出类型 → 编译错误 | NSM_13_06_013 | ✅ |
| export overload含未导出实体 → 编译错误 | NSM_13_06_015 | ✅ |
| public field使用未导出类型 → 编译错误 | NSM_13_06_016 | ✅ |

---

## 三、严重性等级总览

| 严重性 | 数量 | 问题列表 |
|-------|------|---------|
| 编译器待完善 | 0 | - |
| 语言差异 | 0 | - |

---

## 四、跨语言对比

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| **export class** | ✅ | ✅ `public class` | ✅ `public class` |
| **export function** | ✅ | ✅ `public方法` | ✅ `public func` |
| **导出显式类型要求** | ✅ 强制 | ❌ (可选) | ❌ (可选) |
| **导出使用未导出类型禁止** | ✅ | ❌ (Java无此限制) | ❌ (Swift无此限制) |
| **default export** | ✅ | ❌ | ❌ |

---

## 五、改善建议

1. 无需修改 — 实现与spec完全一致

---

## 六、附录：完整用例索引

| 用例 ID | 分类 | 测试内容 | 结果 |
|---------|------|---------|------|
| NSM_13_06_001 | compile-pass | export class | ✅ 通过 |
| NSM_13_06_002 | compile-pass | export function | ✅ 通过 |
| NSM_13_06_003 | compile-pass | export let/const | ✅ 通过 |
| NSM_13_06_004 | compile-pass | export default | ✅ 通过 |
| NSM_13_06_005 | compile-fail | 导出无显式类型 | ✅ 通过 |
| NSM_13_06_006 | compile-fail | 导出函数无返回类型 | ✅ 通过 |
| NSM_13_06_007 | compile-fail | 导出使用未导出类型 | ✅ 通过 |
| NSM_13_06_008 | compile-fail | 导出名重复 | ✅ 通过 |
| NSM_13_06_009 | compile-fail | 多个default export | ✅ 通过 |
| NSM_13_06_010 | compile-fail | extends未导出类 | ✅ 通过 |
| NSM_13_06_011 | compile-fail | 泛型约束未导出类型 | ✅ 通过 |
| NSM_13_06_012 | runtime | 导出实体运行时访问 | ✅ 通过 |
| NSM_13_06_013 | compile-fail | export type alias引用未导出类型 | ✅ 通过 |
| NSM_13_06_015 | compile-fail | export overload含未导出实体 | ✅ 通过 |
| NSM_13_06_016 | compile-fail | public field使用未导出类型 | ✅ 通过 |

---

## 2026-07-17 编译复测验证

使用 es2panda --extension=ets（build 2026-06-17）全量编译验证。

| 用例 | @expect | 实际 | 结论 |
|----|---------|------|------|
| NSM_13_06_001 | compile-pass | - | - |
| NSM_13_06_002 | compile-pass | - | - |
| NSM_13_06_003 | compile-pass | - | - |
| NSM_13_06_004 | compile-pass | - | - |
| NSM_13_06_005 | compile-fail | - | - |
| NSM_13_06_006 | compile-fail | - | - |
| NSM_13_06_007 | compile-fail | - | - |
| NSM_13_06_008 | compile-fail | - | - |
| NSM_13_06_009 | compile-fail | - | - |
| NSM_13_06_010 | compile-fail | - | - |
| NSM_13_06_011 | compile-fail | - | - |
| NSM_13_06_012 | runtime | - | - |
| NSM_13_06_013 | compile-fail | - | - |
| NSM_13_06_015 | compile-fail | - | - |
| NSM_13_06_016 | compile-fail | - | - |
