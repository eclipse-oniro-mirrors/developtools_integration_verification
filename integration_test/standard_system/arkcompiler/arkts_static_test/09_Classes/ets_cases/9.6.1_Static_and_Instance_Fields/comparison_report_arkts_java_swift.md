# 9.6.1 Static and Instance Fields - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-22
**测试基础：** 7 个用例（3 compile-pass + 2 compile-fail + 2 runtime）
**跨语言实测：** T007/S007 实测通过

---

## 一、概览

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| static字段 | ✅ 类级共享 | ✅ 类级共享 | ✅ static var 共享 |
| instance字段 | ✅ 实例独立 | ✅ 实例独立 | ✅ var 实例独立 |
| 类名访问static | ✅ | ✅ | ✅ |
| 实例访问static | ❌ 编译错误 | ⚠️ warning | ❌ 编译错误 |
| static使用泛型参数 | ❌ 编译错误 | ✅ 允许 | ✅ 允许 |

---

## 二、关键差异

- ⭐ **ArkTS 禁止实例访问static字段**：Java 仅产生 warning，Swift 也禁止。
- ⭐ **ArkTS 禁止static使用泛型参数**：Java 和 Swift 无此限制。

---

## 三、核心结论

| 角度 | 结论 |
|------|------|
| **static共享** | 三语言语义一致 |
| **实例访问static** | ArkTS=Swift(禁止) >> Java(warning) |
| **泛型参数** | ArkTS禁止 >> Java/Swift允许 |

### 建议

1. ✅ 保留实例访问static禁止 — 与 Swift 一致。
2. ⚠️ 考虑放开static泛型参数限制 — Java/Swift均允许。
