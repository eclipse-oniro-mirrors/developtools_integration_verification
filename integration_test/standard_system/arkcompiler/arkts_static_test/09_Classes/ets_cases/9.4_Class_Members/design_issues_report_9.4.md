# 9.4 Class Members - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-22
**测试用例数：** 8（compile-pass: 3, compile-fail: 3, runtime: 2）

---

## 一、与业界静态语言的差异点

### 设计观察：字段方法同名冲突 — ArkTS独有约束

**用例：** CLS_09_04_004_FAIL_FIELD_METHOD_SAME_NAME
**对比：** ArkTS 禁止同scope字段方法同名，Java 不冲突（不同命名空间），Swift 允许但有歧义。这是 spec 明确的设计选择。

---

## 二、符合ArkTS spec的语言设计差异

| 行为 | 用例编号 | 状态 |
|------|---------|------|
| static/instance同名 | CLS_09_04_001 | ✅ |
| 含所有成员类型 | CLS_09_04_002 | ✅ |
| 继承public/protected | CLS_09_04_003 | ✅ |
| 字段方法同名编译拒绝 | CLS_09_04_004 | ✅ |
| 字段字段同名编译拒绝 | CLS_09_04_005 | ✅ |
| 方法方法同名编译拒绝 | CLS_09_04_006 | ✅ |
| static/instance区分 | CLS_09_04_007 | ✅ |
| 成员访问 | CLS_09_04_008 | ✅ |

---

## 三、严重性等级总览

| 严重性 | 数量 | 问题列表 |
|-------|------|---------|
| 设计观察 | 1 | 字段方法同名(ArkTS独有) |

---

## 四、跨语言对比

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| **字段方法同名** | ❌(禁止) | ✅(不冲突) | ✅(允许) |
| **static/instance同名** | ✅ | ✅ | ✅ |
| **继承成员** | ✅ | ✅ | ✅ |

**结论：** 9.4 章节与 spec 完全一致。字段方法同名是 ArkTS 独有的更严格设计。

---

## 五、完整用例索引

| 用例 ID | 分类 | 测试内容 | 结果 |
|---------|------|---------|------|
| CLS_09_04_001 | compile-pass | static/instance同名 | ✅ |
| CLS_09_04_002 | compile-pass | 含所有成员类型 | ✅ |
| CLS_09_04_003 | compile-pass | 继承public/protected | ✅ |
| CLS_09_04_004 | compile-fail | 字段方法同名 | ✅ |
| CLS_09_04_005 | compile-fail | 字段字段同名 | ✅ |
| CLS_09_04_006 | compile-fail | 方法方法同名 | ✅ |
| CLS_09_04_007 | runtime | static/instance区分 | ✅ |
| CLS_09_04_008 | runtime | 成员访问 | ✅ |
