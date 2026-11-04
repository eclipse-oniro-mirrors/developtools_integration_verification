# 13.4.4 Import Type Directive - ArkTS与Java/Swift/TS行为差异及规范一致性报告

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
| **import type** | ✅ `import type {T} from "path"` | ❌ (无此概念, import=类型+值) | ❌ (无此概念, import=类型+值) |
| **import type与binding type冲突禁止** | ✅ spec要求 | — (Java不存在此冲突) | — |

**WSL实测结果：**
- Java: `ImportTypeTarget ref = new ImportTypeTarget();` → ✅ 编译+运行成功，import导入的类既是类型又是值，VALUE=10
- Swift: `let arr: [Int] = [1, 2, 3]` → ✅ 编译+运行成功，import导入=类型+值，count=3

**关键发现：** Java/Swift的import总是导入类型+值，不存在"只导入类型"的import type概念

---

## 四、改善建议

1. 等待构建系统支持后验证C类用例

---

## 四、附录：完整用例索引

| 用例 ID | 分类 | 测试内容 | 结果 |
|---------|------|---------|------|
| NSM_13_04_4_001 | compile-pass | import type合法使用 | ⚠️ C类 |
| NSM_13_04_4_002 | compile-pass | 混合导入 | ⚠️ C类 |
| NSM_13_04_4_003 | compile-fail | import type+binding type冲突 | ✅ 通过 |

---

## 2026-07-17 编译复测验证

使用 es2panda --extension=ets（build 2026-06-17）全量编译验证。

| 用例 | @expect | 实际 | 结论 |
|----|---------|------|------|
| NSM_13_04_4_001 | compile-pass | F0014 | C15未修复 |
| NSM_13_04_4_002 | compile-pass | F0014 | C16未修复 |
| NSM_13_04_4_003 | compile-fail | - | - |

