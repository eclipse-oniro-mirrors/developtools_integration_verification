# 9.6.2 Readonly Constant Fields - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-22
**测试基础：** 6 个用例（2 compile-pass + 2 compile-fail + 2 runtime）
**跨语言实测：** T008/S008 实测通过

---

## 一、概览

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| readonly语法 | `readonly name: Type = init` | `final Type name = init` | `let name: Type = init` |
| static readonly | ✅ | ✅ `static final` | ✅ `static let` |
| readonly重赋值 | ❌ 编译错误 | ❌ 编译错误(final) | ❌ 编译错误(let) |
| 构造器赋值 | ✅ | ✅ | ✅ |

---

## 二、关键差异

- ⭐ **ArkTS readonly ≈ Java final ≈ Swift let**：三语言只读字段语义一致。
- ⭐ **Java static final 是常量标准组合**：ArkTS 的 `static readonly` 和 Swift 的 `static let` 等价。

---

## 三、核心结论

| 角度 | 结论 |
|------|------|
| **readonly/final/let** | 三语言语义一致 |
| **static readonly** | 三语言等价 |
