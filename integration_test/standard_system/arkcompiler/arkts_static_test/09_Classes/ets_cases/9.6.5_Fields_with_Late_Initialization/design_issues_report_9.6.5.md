# 9.6.5 Fields with Late Initialization - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-22
**测试用例数：** 8（compile-pass: 2, compile-fail: 4, runtime: 2）

---

## 一、与业界静态语言的差异点

### ⭐⭐ CLS-G6：late init + optional 组合 — D类 Spec与实现不一致

**用例：** CLS_09_06_5_005_FAIL_LATE_INIT_OPTIONAL
**章节：** 9.6.5 Fields with Late Initialization
**Spec 依据：** spec §9.6.5 — "Field with late initialization can be neither readonly nor optional. Otherwise, a compile-time error occurs."

es2panda 对 `val!: string` 编译通过，但 spec 规定 late init 不得 optional/readonly。

**跨语言实测对比（2026-06-22 WSL 实测）：**

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS es2panda | `val!: string` | ✅ 编译通过 ⚠️ |
| Java | `String val;` (默认null) | ✅ 编译通过 + 运行通过 |
| Swift | `var val: String!` | ✅ 编译通过 + 运行通过 |

**实测结论：** Java 和 Swift 都有等效机制。es2panda 应增加 `!` + `?` 组合的编译时检查。

---

## 二、符合ArkTS spec的语言设计差异

| 行为 | 用例编号 | 状态 |
|------|---------|------|
| late init字段 | CLS_09_06_5_001 | ✅ |
| 初始化后读取 | CLS_09_06_5_002 | ✅ |
| static late init编译拒绝 | CLS_09_06_5_003 | ✅ |
| readonly late init编译拒绝 | CLS_09_06_5_004 | ✅ |
| ⚠️ optional late init | CLS_09_06_5_005 | ⚠️ SPEC不一致 |
| late init含初始化器编译拒绝 | CLS_09_06_5_006 | ✅ |
| 初始化后读取运行时 | CLS_09_06_5_007 | ✅ |
| 未初始化读取runtime error | CLS_09_06_5_008 | ✅ |

---

## 三、严重性等级总览

| 严重性 | 数量 | 问题列表 |
|-------|------|---------|
| ⭐⭐ D类Spec不一致 | 1 | CLS-G6: optional+late init |

---

## 四、跨语言对比

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| **late init≈默认null≈T!** | ✅ | ✅ | ✅ |
| **!+optional组合** | ⚠️(es2panda允许/spec禁止) | —(无概念) | ✅(T!允许) |

**结论：** 9.6.5 有 D 类不一致（CLS-G6）。Java/Swift 有等效机制。

---

## 五、改善建议

1. ⚠️ **建议 es2panda 增加 !+? 组合的编译时检查** — spec 已明确禁止。
2. ✅ 保留 static/readonly late init 禁止 — 合理约束。

---

## 六、完整用例索引

| 用例 ID | 分类 | 测试内容 | 结果 |
|---------|------|---------|------|
| CLS_09_06_5_001 | compile-pass | late init字段 | ✅ |
| CLS_09_06_5_002 | compile-pass | 初始化后读取 | ✅ |
| CLS_09_06_5_003 | compile-fail | static late init | ✅ |
| CLS_09_06_5_004 | compile-fail | readonly late init | ✅ |
| CLS_09_06_5_005 | compile-fail | optional late init ⚠️ | ✅(标注SPEC不一致) |
| CLS_09_06_5_006 | compile-fail | late init含初始化器 | ✅ |
| CLS_09_06_5_007 | runtime | 初始化后读取 | ✅ |
| CLS_09_06_5_008 | runtime | 未初始化读取 | ✅ |
