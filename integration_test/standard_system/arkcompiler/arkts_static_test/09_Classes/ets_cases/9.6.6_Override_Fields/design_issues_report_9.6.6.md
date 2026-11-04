# 9.6.6 Override Fields - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-22
**测试用例数：** 9（compile-pass: 3, compile-fail: 4, runtime: 2）

---

## 一、与业界静态语言的差异点

### ⭐⭐ 设计观察：字段 override vs 字段隐藏 — 核心差异

**对比：**
- **ArkTS**: 字段 override 是虚方法（父类引用也看到子类值）
- **Java**: 字段只能隐藏（父类引用看到父类值！`(Parent)child.field != child.field`）
- **Swift**: 存储属性不能 override，计算属性 override 是虚方法

**影响：** 这是从 Java 迁移代码时最重要的注意事项。Java 的字段隐藏语义与 ArkTS 的虚字段 override 完全不同。

---

## 二、符合ArkTS spec的语言设计差异

| 行为 | 用例编号 | 状态 |
|------|---------|------|
| override同类型字段 | CLS_09_06_6_001 | ✅ |
| override字段初始化器 | CLS_09_06_6_002 | ✅ |
| 构造器中初始化override | CLS_09_06_6_003 | ✅ |
| override类型不匹配编译拒绝 | CLS_09_06_6_004 | ✅ |
| override修饰符不匹配编译拒绝 | CLS_09_06_6_005 | ✅ |
| static+override编译拒绝 | CLS_09_06_6_006 | ✅ |
| override不存在字段编译拒绝 | CLS_09_06_6_007 | ✅ |
| override字段值运行时 | CLS_09_06_6_008 | ✅ |
| override字段初始化顺序运行时 | CLS_09_06_6_009 | ✅ |

---

## 三、严重性等级总览

| 严重性 | 数量 | 问题列表 |
|-------|------|---------|
| 设计观察 | 1 | 字段override(虚字段vs Java隐藏) |

---

## 四、跨语言对比

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| **字段override语义** | 虚字段 | 字段隐藏 | 虚属性(计算) |
| **存储属性override** | ✅允许 | ❌(隐藏) | ❌(禁止) |

**结论：** 9.6.6 与 spec 完全一致。字段 override 是虚方法（与 Swift 一致），与 Java 字段隐藏完全不同。

---

## 五、改善建议

1. ⚠️ **文档中明确说明与 Java 字段隐藏的差异** — 迁移时重要注意事项。
2. ✅ 保留虚字段 override — 比 Java 隐藏更安全。

---

## 六、完整用例索引

| 用例 ID | 分类 | 测试内容 | 结果 |
|---------|------|---------|------|
| CLS_09_06_6_001 | compile-pass | override同类型字段 | ✅ |
| CLS_09_06_6_002 | compile-pass | override字段初始化器 | ✅ |
| CLS_09_06_6_003 | compile-pass | 构造器中初始化override | ✅ |
| CLS_09_06_6_004 | compile-fail | override类型不匹配 | ✅ |
| CLS_09_06_6_005 | compile-fail | override修饰符不匹配 | ✅ |
| CLS_09_06_6_006 | compile-fail | static+override | ✅ |
| CLS_09_06_6_007 | compile-fail | override不存在字段 | ✅ |
| CLS_09_06_6_008 | runtime | override字段值 | ✅ |
| CLS_09_06_6_009 | runtime | override字段初始化顺序 | ✅ |
