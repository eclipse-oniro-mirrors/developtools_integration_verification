# 9.3.2 Implementing Optional Interface Properties - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-22
**测试用例数：** 6（compile-pass: 3, compile-fail: 1, runtime: 2）

---

## 一、与业界静态语言的差异点

**无严重设计问题发现。** 所有 6 个用例的行为均与 ArkTS spec 保持一致。

### 设计观察：可选接口属性是ArkTS独有优势

**对比：** Java 不支持可选接口属性；Swift 仅 @objc 协议支持 optional requirements。ArkTS 原生支持可选接口属性，是三者中最灵活的设计。

---

## 二、符合ArkTS spec的语言设计差异

| 行为 | 用例编号 | 状态 |
|------|---------|------|
| 不实现可选属性 | CLS_09_03_2_001 | ✅ |
| optional字段实现 | CLS_09_03_2_002 | ✅ |
| accessor实现可选属性 | CLS_09_03_2_003 | ✅ |
| 非可选实现可选编译拒绝 | CLS_09_03_2_004 | ✅ |
| optional字段运行时 | CLS_09_03_2_005 | ✅ |
| 默认accessor返回undefined | CLS_09_03_2_006 | ✅ |

---

## 三、严重性等级总览

| 严重性 | 数量 | 问题列表 |
|-------|------|---------|
| 编译器待完善 | 0 | - |
| 语言差异 | 0 | - |
| 设计观察 | 1 | 可选接口属性(ArkTS独有优势) |

---

## 四、跨语言对比

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| **可选接口属性** | ✅原生 | ❌不支持 | ✅(仅@objc) |
| **不实现可选** | ✅ | ❌ | ✅(仅@objc) |

**结论：** 9.3.2 规则与 spec 完全一致，可选接口属性是 ArkTS 比 Java/Swift 更灵活的设计。

---

## 五、改善建议

1. 无需修改 — 当前实现与 spec 完全一致。

---

## 六、完整用例索引

| 用例 ID | 分类 | 测试内容 | 结果 |
|---------|------|---------|------|
| CLS_09_03_2_001 | compile-pass | 不实现可选属性 | ✅ |
| CLS_09_03_2_002 | compile-pass | optional字段实现 | ✅ |
| CLS_09_03_2_003 | compile-pass | accessor实现可选属性 | ✅ |
| CLS_09_03_2_004 | compile-fail | 非可选实现可选 | ✅ |
| CLS_09_03_2_005 | runtime | optional字段运行时 | ✅ |
| CLS_09_03_2_006 | runtime | 默认accessor返回undefined | ✅ |
