# 9.3.1 Implementing Required Interface Properties - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-22
**测试用例数：** 14（compile-pass: 6, compile-fail: 5, runtime: 3）
**目的：** 识别 ArkTS 必需接口属性实现的设计问题

---

## 一、与业界静态语言的差异点

**无严重设计问题发现。** 所有 14 个用例的行为均与 ArkTS spec 保持一致。

### 设计观察：Java 接口属性仅为常量

**对比：** Java 接口中属性只能是 `public static final` 常量，不支持可变实例属性。ArkTS 和 Swift 都支持接口/协议声明可变属性（`{ get set }`）。

**影响：** ArkTS 比 Java 更灵活，与 Swift 一致。这是 spec 明确的设计选择，非缺陷。

---

## 二、符合ArkTS spec的语言设计差异（与规范一致）

| 行为 | 用例编号 | 状态 |
|------|---------|------|
| 字段实现接口属性 | CLS_09_03_1_001 | ✅ |
| readonly字段实现readonly属性 | CLS_09_03_1_002 | ✅ |
| getter+setter实现属性 | CLS_09_03_1_003 | ✅ |
| writeable字段实现readonly属性 | CLS_09_03_1_004 | ✅ |
| getter实现readonly属性 | CLS_09_03_1_005 | ✅ |
| getter实现接口getter | CLS_09_03_1_006 | ✅ |
| readonly实现writeable编译拒绝 | CLS_09_03_1_007 | ✅ |
| getter-only实现writeable编译拒绝 | CLS_09_03_1_008 | ✅ |
| setter-only实现writeable编译拒绝 | CLS_09_03_1_009 | ✅ |
| 无实现必需属性编译拒绝 | CLS_09_03_1_010 | ✅ |
| 覆盖超类字段→accessor编译拒绝 | CLS_09_03_1_011 | ✅ |
| 字段实现运行时 | CLS_09_03_1_012 | ✅ |
| 接口引用隐式getter运行时 | CLS_09_03_1_013 | ✅ |
| readonly属性运行时 | CLS_09_03_1_014 | ✅ |

---

## 三、严重性等级总览

| 严重性 | 数量 | 问题列表 |
|-------|------|---------|
| 编译器待完善 | 0 | - |
| 语言差异 | 0 | - |
| 设计观察 | 1 | Java接口属性仅为常量 |

---

## 四、跨语言对比

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| **接口可变属性** | ✅ | ❌(仅常量) | ✅ |
| **字段实现属性** | ✅ | ✅(方法替代) | ✅ |
| **readonly约束** | ✅ | ✅(final) | ✅(let) |

**结论：** 9.3.1 规则与 Swift protocol 一致，比 Java 更灵活。所有用例与 spec 完全一致。

---

## 五、改善建议

1. 无需修改 — 当前实现与 spec 完全一致。
2. 考虑增加接口属性继承边界测试（如多层接口属性继承）。

---

## 六、完整用例索引

| 用例 ID | 分类 | 测试内容 | 结果 |
|---------|------|---------|------|
| CLS_09_03_1_001 | compile-pass | 字段实现接口属性 | ✅ |
| CLS_09_03_1_002 | compile-pass | readonly→readonly | ✅ |
| CLS_09_03_1_003 | compile-pass | getter+setter实现 | ✅ |
| CLS_09_03_1_004 | compile-pass | writeable→readonly | ✅ |
| CLS_09_03_1_005 | compile-pass | getter→readonly | ✅ |
| CLS_09_03_1_006 | compile-pass | getter→接口getter | ✅ |
| CLS_09_03_1_007 | compile-fail | readonly→writeable | ✅ |
| CLS_09_03_1_008 | compile-fail | getter-only→writeable | ✅ |
| CLS_09_03_1_009 | compile-fail | setter-only→writeable | ✅ |
| CLS_09_03_1_010 | compile-fail | 无实现必需属性 | ✅ |
| CLS_09_03_1_011 | compile-fail | 覆盖超类字段→accessor | ✅ |
| CLS_09_03_1_012 | runtime | 字段实现运行时 | ✅ |
| CLS_09_03_1_013 | runtime | 接口引用隐式getter | ✅ |
| CLS_09_03_1_014 | runtime | readonly属性运行时 | ✅ |
