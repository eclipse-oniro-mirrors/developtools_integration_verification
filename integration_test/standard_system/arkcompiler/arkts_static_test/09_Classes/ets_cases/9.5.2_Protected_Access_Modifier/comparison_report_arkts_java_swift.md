# 9.5.2 Protected Access Modifier - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-22
**测试基础：** 6 个用例（2 compile-pass + 2 compile-fail + 2 runtime）

---

## 一、概览

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| protected语义 | 类内+子类可见 | 类内+子类+同包可见 | ❌ 无protected |
| 子类访问protected | ✅ | ✅ | ❌(用fileprivate替代) |
| 外部访问protected | ❌ 编译错误 | ⚠️ 同包允许 | ❌ |

---

## 二、关键差异

- ⭐⭐ **Java protected含同包可见是核心差异**：Java 的 protected 成员在同一个包（package）内的其余类也可以访问，不仅限于子类。ArkTS 的 protected 仅限于类内和子类，语义更严格更清晰。
- ⭐ **Swift 无 protected**：Swift 用 `fileprivate`（文件内可见）和 `open`（模块外可继承重写）组合替代 protected 的功能。

---

## 三、核心结论

| 角度 | 结论 |
|------|------|
| **protected语义** | ArkTS(类内+子类) > Java(类内+子类+同包) >> Swift(无) |
| **子类访问** | ArkTS=Java(允许) >> Swift(用fileprivate) |
| **外部访问** | ArkTS=Swift(拒绝) >> Java(同包允许) |

### ArkTS 设计建议

1. ✅ **保留更严格的protected语义** — 仅类内+子类可见，比Java更清晰。
