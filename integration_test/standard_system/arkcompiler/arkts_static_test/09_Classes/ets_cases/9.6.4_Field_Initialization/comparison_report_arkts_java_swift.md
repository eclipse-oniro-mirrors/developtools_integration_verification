# 9.6.4 Field Initialization - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-22
**规范来源：** ArkTS Static Spec 9.6.4, Java JLS SE21 §8.3.2 Field Initialization, Swift Language Reference - Initialization
**测试基础：** 5 个用例（2 compile-pass + 1 compile-fail + 2 runtime）
**跨语言实测：** WSL Ubuntu — ⭐⭐ CLS-G5 D类差异 (T010/S010/S015)

---

## 一、概览：三语言定位

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 字段初始化器 | ✅ `name: Type = expr` | ✅ `Type name = expr` | ✅ `var name: Type = expr` |
| 默认值 | ✅ (0/null/undefined) | ✅ (0/null/false) | ✅ (0/nil) |
| this在初始化器中 | ⚠️ es2panda允许(spec要求warning) | ✅ 允许 | ❌ **编译错误** |
| 初始化顺序 | 先基类后派生类 | 先基类后派生类 | 先基类后派生类 |

---

## 二、章节对应关系

| ArkTS 9.6.4 | Java JLS | Swift Reference | 核心议题 |
|-------------|----------|-----------------|----------|
| Field Initialization | §8.3.2 Field Initialization | Initialization - Default Values | 初始化器表达式 |
| this在初始化器中 | §15.8.3 this | Initialization - self | CLS-G5 D类差异 |

---

## 三、⭐⭐ 关键差异矩阵 — CLS-G5 D类差异

### 3.1 this/super 在字段初始化器中

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| this在初始化器中 | ⚠️ es2panda允许(spec要求warning) | ✅ 允许(无warning) | ❌ **编译错误** |
| super在初始化器中 | ⚠️ es2panda允许(spec要求warning) | ✅ 允许 | ❌ **编译错误** |
| 实测结果 | CLS_09_06_4_003标注⚠️ | T010实测通过 | S010/S015实测编译失败 |

**跨语言实测对比（2026-06-22 WSL 实测）：**
| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS es2panda | `class T { f0 = this }` | ✅ 编译通过（无 warning）⚠️ |
| Java | `class T { T f0 = this }` | ✅ 编译通过 + 运行通过（无 warning/error） |
| Swift | `class T { var f0: T = self }` | ❌ **编译错误** — self 不能在属性初始化器中使用 |

**实测结论：** Swift 比 ArkTS spec 更严格（compile error vs warning）。es2panda 应至少增加 warning 提示。

---

## 四、用例 1:1 对照

### 用例 ①：⭐ this 在初始化器中 (CLS_09_06_4_003_FAIL) — D类差异

**ArkTS（⚠️ spec要求编译失败/warning，es2panda允许通过）：**
```typescript
class Bad003 { f0 = this }  // ⚠️ spec要求warning，es2panda通过
```

**Java（✅ 完全允许 — WSL实测确认）：**
```java
class Bad003 { Bad003 f0 = this; }  // ✅ 编译通过 + 运行通过
```

**Swift（❌ 编译错误 — WSL实测确认）：**
```swift
class Bad003 { var f0: Bad003 = self }  // ❌ error: 'self' used before 'super.init' call
```

⭐⭐ **核心差异**: Swift 最严格（编译错误），Java 最宽松（完全允许），ArkTS spec 在中间（要求 warning），但 es2panda 当前不产生任何提示。

---

## 五、核心结论

| 角度 | 结论 |
|------|------|
| **字段初始化器** | 三语言基本语义一致 |
| **⭐ this在init中** | Swift(编译错误) > ArkTS spec(warning) > Java(允许) > es2panda(无提示)⚠️ |

### ArkTS 设计建议

1. ⚠️ **建议 es2panda 增加 this/super 在初始化器中的 warning** — spec 已明确要求，但 es2panda 当前不产生任何提示。
2. ⚠️ **考虑是否提升为 compile error** — Swift 的编译错误策略更安全，可避免初始化顺序问题。

---

## 附录

| ArkTS | §9.6.4 | Java | §8.3.2/§15.8.3 | Swift | Initialization |
