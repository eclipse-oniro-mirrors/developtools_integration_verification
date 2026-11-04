# 9.6.3 Optional Fields - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-22
**测试用例数：** 5（compile-pass: 2, compile-fail: 1, runtime: 2）

---

## 一、与业界静态语言的差异点

**无设计问题发现。** optional ≈ nullable ≈ T?，三语言语义一致。

---

## 二、符合ArkTS spec的语言设计差异

| 行为 | 用例编号 | 状态 |
|------|---------|------|
| optional无初始化器 | CLS_09_06_3_001 | ✅ |
| optional含初始化器 | CLS_09_06_3_002 | ✅ |
| optional赋值给non-nullish编译拒绝 | CLS_09_06_3_003 | ✅ |
| optional默认undefined运行时 | CLS_09_06_3_004 | ✅ |
| optional赋值后访问运行时 | CLS_09_06_3_005 | ✅ |

---

## 三、严重性等级总览

| 严重性 | 数量 |
|-------|------|
| HIGH | 0 |
| MEDIUM | 0 |
| LOW | 0 |

---

## 四、完整用例索引

| 用例 ID | 分类 | 测试内容 | 结果 |
|---------|------|---------|------|
| CLS_09_06_3_001 | compile-pass | optional无初始化器 | ✅ |
| CLS_09_06_3_002 | compile-pass | optional含初始化器 | ✅ |
| CLS_09_06_3_003 | compile-fail | optional赋值给non-nullish | ✅ |
| CLS_09_06_3_004 | runtime | optional默认undefined | ✅ |
| CLS_09_06_3_005 | runtime | optional赋值后访问 | ✅ |
