# 9.5.2 Protected Access Modifier - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-22
**测试用例数：** 6（compile-pass: 2, compile-fail: 2, runtime: 2）

---

## 一、与业界静态语言的差异点

### 设计观察：protected语义差异

**对比：** ArkTS protected 仅类内+子类可见，Java protected 还包含同包可见。Swift 无 protected（用 fileprivate/open 替代）。

**影响：** ArkTS 的 protected 比 Java 更严格，语义更清晰。这是有意设计，非缺陷。

---

## 二、符合ArkTS spec的语言设计差异

| 行为 | 用例编号 | 状态 |
|------|---------|------|
| 类内访问protected | CLS_09_05_2_001 | ✅ |
| 子类访问protected | CLS_09_05_2_002 | ✅ |
| 外部访问protected编译拒绝 | CLS_09_05_2_003 | ✅ |
| 外部访问protected字段编译拒绝 | CLS_09_05_2_004 | ✅ |
| protected子类访问运行时 | CLS_09_05_2_005 | ✅ |
| protected方法派发运行时 | CLS_09_05_2_006 | ✅ |

---

## 三、严重性等级总览

| 严重性 | 数量 | 问题列表 |
|-------|------|---------|
| 设计观察 | 1 | protected不含同包(与Java不同) |

---

## 四、跨语言对比

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| **protected** | 类内+子类 | 类内+子类+同包 | ❌(无) |

**结论：** 9.5.2 protected 规则与 spec 完全一致，语义比 Java 更严格。

---

## 五、完整用例索引

| 用例 ID | 分类 | 测试内容 | 结果 |
|---------|------|---------|------|
| CLS_09_05_2_001 | compile-pass | 类内访问protected | ✅ |
| CLS_09_05_2_002 | compile-pass | 子类访问protected | ✅ |
| CLS_09_05_2_003 | compile-fail | 外部访问protected | ✅ |
| CLS_09_05_2_004 | compile-fail | 外部访问protected字段 | ✅ |
| CLS_09_05_2_005 | runtime | protected子类访问 | ✅ |
| CLS_09_05_2_006 | runtime | protected方法派发 | ✅ |
