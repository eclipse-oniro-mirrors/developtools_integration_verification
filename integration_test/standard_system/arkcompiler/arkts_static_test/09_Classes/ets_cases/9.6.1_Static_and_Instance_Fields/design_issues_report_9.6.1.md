# 9.6.1 Static and Instance Fields - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-22
**测试用例数：** 7（compile-pass: 3, compile-fail: 2, runtime: 2）

---

## 一、与业界静态语言的差异点

**无严重设计问题发现。**

### 设计观察：static字段泛型参数禁止

**对比：** ArkTS 禁止 static 字段使用外围类泛型参数，Java 和 Swift 允许。这是有意的安全约束。

---

## 二、符合ArkTS spec的语言设计差异

| 行为 | 用例编号 | 状态 |
|------|---------|------|
| static字段基本 | CLS_09_06_1_001 | ✅ |
| instance字段基本 | CLS_09_06_1_002 | ✅ |
| 类名访问static | CLS_09_06_1_003 | ✅ |
| static泛型参数编译拒绝 | CLS_09_06_1_004 | ✅ |
| 实例访问static编译拒绝 | CLS_09_06_1_005 | ✅ |
| static字段共享运行时 | CLS_09_06_1_006 | ✅ |
| instance字段独立运行时 | CLS_09_06_1_007 | ✅ |

---

## 三、严重性等级总览

| 严重性 | 数量 | 问题列表 |
|-------|------|---------|
| 设计观察 | 1 | static泛型参数禁止(ArkTS独有) |

---

## 四、完整用例索引

| 用例 ID | 分类 | 测试内容 | 结果 |
|---------|------|---------|------|
| CLS_09_06_1_001 | compile-pass | static字段基本 | ✅ |
| CLS_09_06_1_002 | compile-pass | instance字段基本 | ✅ |
| CLS_09_06_1_003 | compile-pass | 类名访问static | ✅ |
| CLS_09_06_1_004 | compile-fail | static泛型参数 | ✅ |
| CLS_09_06_1_005 | compile-fail | 实例访问static | ✅ |
| CLS_09_06_1_006 | runtime | static字段共享 | ✅ |
| CLS_09_06_1_007 | runtime | instance字段独立 | ✅ |
