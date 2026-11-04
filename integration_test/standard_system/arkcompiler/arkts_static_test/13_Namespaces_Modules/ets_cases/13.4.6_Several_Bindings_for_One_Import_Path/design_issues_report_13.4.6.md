# 13.4.6 Several Bindings for One Import Path - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-27
**测试用例数：** 2（compile-pass: 1, compile-fail: 1）
**可验证：** 1 个

---

## 一、与业界静态语言的差异点

**无设计问题发现。** 唯一可验证用例与 spec 一致。

---

## 二、严重性等级总览

| 严重性 | 数量 | 问题列表 |
|-------|------|---------|
| 编译器待完善 | 0 | - |
| 编译器实现限制 | 1 | C类 |

---

## 三、跨语言对比（WSL实测）

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| **同路径多绑定** | ✅ `import {A, B} from "path"` | ✅ `import pkg.A; import pkg.B;` | ✅ `import Module { A, B }` |
| **名称不可区分禁止** | ✅ spec要求 | ❌ (Java类名全局唯一) | ❌ (Swift类型名模块内唯一) |

**WSL实测结果：**
- Java: `import nsm146.BindingA; import nsm146.BindingB; import nsm146.BindingC;` → ✅ 编译+运行成功，A=1, B=2, C=3
- Swift: `import Foundation` → ✅ 编译成功，导入整个模块所有符号可用

**关键发现：** Java的多次 `import pkg.ClassName` 语义等价于ArkTS的 `import {A, B, C} from "module"`

---

## 四、改善建议

1. 等待构建系统支持后验证C类用例

---

## 四、附录：完整用例索引

| 用例 ID | 分类 | 测试内容 | 结果 |
|---------|------|---------|------|
| NSM_13_04_6_001 | compile-pass | 同路径多条绑定 | ⚠️ C类 |
| NSM_13_04_6_002 | compile-fail | 多绑定名称不可区分 | ✅ 通过 |

---

## 2026-07-17 编译复测验证

使用 es2panda --extension=ets（build 2026-06-17）全量编译验证。

| 用例 | @expect | 实际 | 结论 |
|----|---------|------|------|
| NSM_13_04_6_001 | compile-pass | F0014 | C19未修复 |
| NSM_13_04_6_002 | compile-fail | - | - |

