# 9.6.4 Field Initialization - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-22
**测试用例数：** 5（compile-pass: 2, compile-fail: 1, runtime: 2）

---

## 一、与业界静态语言的差异点

### ⭐⭐ CLS-G5：this 在字段初始化器中 — D类 Spec与实现不一致

**用例：** CLS_09_06_4_003_FAIL_FIELD_THIS_INITIALIZER
**章节：** 9.6.4 Field Initialization
**Spec 依据：** spec §9.6.4 — "If the initializer expression uses super or this in any form, then a compile-time warning occurs."

es2panda 对 `f0 = this` 编译通过（无 error 也无 warning），spec 规定应为 compile-time warning。

**跨语言实测对比（2026-06-22 WSL 实测）：**

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS es2panda | `class T { f0 = this }` | ✅ 编译通过（无 warning）⚠️ |
| Java | `class T { T f0 = this }` | ✅ 编译通过 + 运行通过 |
| Swift | `class T { var f0: T = self }` | ❌ **编译错误** |

**实测结论：** Swift 比 ArkTS spec 更严格（compile error vs warning）。es2panda 应至少增加 warning 提示。

---

## 二、符合ArkTS spec的语言设计差异

| 行为 | 用例编号 | 状态 |
|------|---------|------|
| 字段初始化器表达式 | CLS_09_06_4_001 | ✅ |
| 字段默认值 | CLS_09_06_4_002 | ✅ |
| ⚠️ this在初始化器 | CLS_09_06_4_003 | ⚠️ SPEC不一致 |
| 字段初始化顺序运行时 | CLS_09_06_4_004 | ✅ |
| 初始化器求值运行时 | CLS_09_06_4_005 | ✅ |

---

## 三、严重性等级总览

| 严重性 | 数量 | 问题列表 |
|-------|------|---------|
| ⭐⭐ D类Spec不一致 | 1 | CLS-G5: this在初始化器 |
| 设计观察 | 1 | Swift比ArkTS更严格 |

---

## 四、编译规则正确性评估

| 规则 | spec 描述 | 实测 | 结论 |
|------|----------|------|------|
| ⚠️ this在初始化器 | spec要求warning | es2panda不产生warning ⚠️ | ⚠️ 不一致 |
| 初始化顺序 | 先基类后派生类 | 运行时通过 | ✅ 一致 |
| 默认值 | 各类型默认值正确 | 运行时通过 | ✅ 一致 |

---

## 五、跨语言对比

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| **this在init中** | ⚠️(es2panda允许/spec要求warning) | ✅(允许) | ❌(编译错误) |

**结论：** 9.6.4 有 D 类不一致（CLS-G5）。Swift 最严格，Java 最宽松，ArkTS spec 在中间。

---

## 六、改善建议

1. ⚠️ **建议 es2panda 增加 this/super 在初始化器中的 warning** — spec 已明确要求。
2. ⚠️ **考虑提升为 compile error** — 参考 Swift 的更安全策略。

---

## 七、完整用例索引

| 用例 ID | 分类 | 测试内容 | 结果 |
|---------|------|---------|------|
| CLS_09_06_4_001 | compile-pass | 字段初始化器表达式 | ✅ |
| CLS_09_06_4_002 | compile-pass | 字段默认值 | ✅ |
| CLS_09_06_4_003 | compile-fail | this在初始化器 ⚠️ | ✅(标注SPEC不一致) |
| CLS_09_06_4_004 | runtime | 字段初始化顺序 | ✅ |
| CLS_09_06_4_005 | runtime | 初始化器求值 | ✅ |
