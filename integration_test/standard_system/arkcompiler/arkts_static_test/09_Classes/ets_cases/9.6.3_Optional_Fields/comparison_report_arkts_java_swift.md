# 9.6.3 Optional Fields - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-22
**测试基础：** 5 个用例（2 compile-pass + 1 compile-fail + 2 runtime）
**跨语言实测：** T009/S009 实测通过

---

## 一、概览

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| optional语法 | `name?: Type` | `Type name = null` | `var name: Type? = nil` |
| 默认值 | undefined | null | nil |
| 赋值给non-nullish | ❌ 编译错误 | ⚠️ 可能NPE | ⚠️ 需解包 |

---

## 二、核心结论

| 角度 | 结论 |
|------|------|
| **optional≈nullable≈T?** | 三语言语义一致 |
| **默认值** | ArkTS(undefined) ≈ Java(null) ≈ Swift(nil) |

### 建议

1. ✅ 保留optional语法 — 与Swift T?语义一致。
