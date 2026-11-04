# 13.11 Program Entry Point - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-27
**测试用例数：** 7（compile-pass: 3, compile-fail: 2, runtime: 2）

---

## 一、与业界静态语言的差异点

**无设计问题发现。** 所有 7 个用例的行为均与 spec 一致。

---

## 二、符合ArkTS spec的语言设计差异（与规范一致）

| 行为 | 用例编号 | 状态 |
|------|---------|------|
| main(): void入口 | NSM_13_11_001 | ✅ |
| main(): int入口 | NSM_13_11_002 | ✅ |
| main()签名错误 → 编译错误 | NSM_13_11_003 | ✅ |
| main函数运行时 | NSM_13_11_004 | ✅ |
| main(FixedArray<string>)参数 | NSM_13_11_005 | ✅ |
| main不可overload → 编译错误 | NSM_13_11_006 | ✅ |
| main()推断返回类型 | NSM_13_11_007 | ✅ |

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
| **入口函数** | ✅ `main()` | ✅ `public static void main()` | ✅ `@main` |
| **返回类型** | ✅ void/int | ✅ void | ✅ (任意) |
| **参数** | ✅ FixedArray<string> | ✅ String[] | ❌ (无命令行参数) |
| **签名错误禁止** | ✅ | ✅ | ✅ |
| **overload禁止** | ✅ | ✅ | ✅ |

---

## 五、改善建议

1. 无需修改 — 实现与spec完全一致

---

## 六、附录：完整用例索引

| 用例 ID | 分类 | 测试内容 | 结果 |
|---------|------|---------|------|
| NSM_13_11_001 | compile-pass | main(): void入口 | ✅ 通过 |
| NSM_13_11_002 | compile-pass | main(): int入口 | ✅ 通过 |
| NSM_13_11_003 | compile-fail | main()签名错误 | ✅ 通过 |
| NSM_13_11_004 | runtime | main函数运行时 | ✅ 通过 |
| NSM_13_11_005 | compile-pass | main(FixedArray<string>)参数 | ✅ 通过 |
| NSM_13_11_006 | compile-fail | main不可overload | ✅ 通过 |
| NSM_13_11_007 | runtime | main()推断返回类型 | ✅ 通过 |

---

## 2026-07-17 编译复测验证

使用 es2panda --extension=ets（build 2026-06-17）全量编译验证。

| 用例 | @expect | 实际 | 结论 |
|----|---------|------|------|
| NSM_13_11_001 | compile-pass | - | - |
| NSM_13_11_002 | compile-pass | - | - |
| NSM_13_11_003 | compile-fail | - | - |
| NSM_13_11_004 | runtime | - | - |
| NSM_13_11_005 | compile-pass | - | - |
| NSM_13_11_006 | compile-fail | - | - |
| NSM_13_11_007 | runtime | - | - |
