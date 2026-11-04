# 9.6.2 Readonly Constant Fields - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-22
**测试用例数：** 6（compile-pass: 2, compile-fail: 2, runtime: 2）

---

## 一、与业界静态语言的差异点

**无设计问题发现。** readonly ≈ final ≈ let，三语言语义一致。

---

## 二、符合ArkTS spec的语言设计差异

| 行为 | 用例编号 | 状态 |
|------|---------|------|
| readonly字段 | CLS_09_06_2_001 | ✅ |
| static readonly | CLS_09_06_2_002 | ✅ |
| readonly重赋值编译拒绝 | CLS_09_06_2_003 | ✅ |
| static readonly重赋值编译拒绝 | CLS_09_06_2_004 | ✅ |
| readonly访问运行时 | CLS_09_06_2_005 | ✅ |
| 构造器初始化readonly运行时 | CLS_09_06_2_006 | ✅ |

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
| CLS_09_06_2_001 | compile-pass | readonly字段 | ✅ |
| CLS_09_06_2_002 | compile-pass | static readonly | ✅ |
| CLS_09_06_2_003 | compile-fail | readonly重赋值 | ✅ |
| CLS_09_06_2_004 | compile-fail | static readonly重赋值 | ✅ |
| CLS_09_06_2_005 | runtime | readonly访问 | ✅ |
| CLS_09_06_2_006 | runtime | 构造器初始化readonly | ✅ |
