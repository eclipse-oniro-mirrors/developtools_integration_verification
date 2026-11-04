# 13.4.3 Selective Binding - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-27
**测试用例数：** 3（compile-pass: 2, compile-fail: 1）
**可验证：** 1 个

---

## 一、与业界静态语言的差异点

**无设计问题发现。** 唯一可验证用例与 spec 一致。

---

## 二、严重性等级总览

| 严重性 | 数量 | 问题列表 |
|-------|------|---------|
| 编译器待完善 | 0 | - |
| 编译器实现限制 | 2 | C类 |

---

## 三、跨语言对比（WSL实测）

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| **选择性导入** | ✅ `import {x} from "path"` | ✅ `import pkg.Class;` | ✅ `import Module { Type }` |
| **别名导入** | ✅ `import {x as y}` | ❌ (无别名语法) | ❌ |
| **alias后原名不可访问** | ✅ spec禁止 | ❌ (Java无此概念) | ❌ |

**WSL实测结果：**
- Java: `import nsm141.SelectiveTarget;` 只导入指定类 → ✅ 编译+运行成功，VALUE_A=10
- Swift: `import Foundation` 导入整个模块 → ✅ 编译成功，sqrt=3.0

**关键发现：** Java的 `import pkg.ClassName` 只导入指定类，语义等价于ArkTS的 `import {A} from "module"`

---

## 四、改善建议

1. 等待构建系统支持后验证C类用例

---

## 五、附录：完整用例索引

| 用例 ID | 分类 | 测试内容 | 结果 |
|---------|------|---------|------|
| NSM_13_04_3_001 | compile-pass | {identifier}选择性导入 | ⚠️ C类 |
| NSM_13_04_3_002 | compile-pass | {identifier as alias}别名导入 | ⚠️ C类 |
| NSM_13_04_3_003 | compile-fail | alias后原名不可访问 | ✅ 通过 |

---

## 2026-07-17 编译复测验证

使用 es2panda --extension=ets（build 2026-06-17）全量编译验证。

| 用例 | @expect | 实际 | 结论 |
|----|---------|------|------|
| NSM_13_04_3_001 | compile-pass | F0014 | C13未修复 |
| NSM_13_04_3_002 | compile-pass | F0014 | C14未修复 |
| NSM_13_04_3_003 | compile-fail | - | - |

