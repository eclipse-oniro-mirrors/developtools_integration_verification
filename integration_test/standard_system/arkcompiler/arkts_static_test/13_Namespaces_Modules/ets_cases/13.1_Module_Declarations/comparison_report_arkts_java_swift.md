# 13.1 Module Declarations - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-27
**规范来源：** ArkTS Static Spec §13.1 Module Declarations, Java JLS SE21 §7 Packages, Swift Language Reference - Modules
**测试基础：** 6 个用例（4 compile-pass + 1 compile-fail + 1 runtime 真实执行）
**WSL实测验证：** ✅ 已在 WSL Ubuntu (Java Java 1.8.0_492 + Swift 6.0.3) 中真实编译运行验证

---

## 一、概览：三语言定位

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 模块声明语法 | `module "name" { ... }` | `package pkg;` | `module MyModule {}` (SwiftPM) |
| ambient 声明 | ✅ `declare` 关键字 | ❌ 无此概念 | ❌ 无此概念 |
| 模块导出 | ✅ `export module` | ✅ `public` 修饰符 | ✅ `public` / `open` |
| 模块初始化 | ✅ 按声明顺序 | ✅ 类初始化顺序 | ✅ lazy初始化 |
| 模块入口 | ✅ `main()` | ✅ `public static void main()` | ✅ `@main` |

---

## 二、章节对应关系

| ArkTS §13.1 | Java JLS SE21 | Swift Reference | 核心议题 |
|-------------|---------------|-----------------|----------|
| Module Declarations | §7 Packages | Modules (SwiftPM) | 模块声明基本语法 |
| Ambient Declarations | — | — | declare关键字 |
| Module Initialization | §12 Execution | Program Execution | 模块初始化顺序 |

---

## 三、关键差异矩阵

### 3.1 语法 / 声明

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 模块声明关键字 | `module` | `package` | `module` (SwiftPM) |
| declare 关键字 | ✅ | ❌ | ❌ |
| export module | ✅ | — | — |
| 隐式模块（无header） | ✅ | ✅ (默认包) | ✅ (单文件模块) |

### 3.2 编译期约束

| 约束 | ArkTS | Java | Swift |
|------|-------|------|-------|
| ambient与非ambient混合 | ⚠️ spec要求但未实现(D类) | ✅ 无此限制(多文件同包) | ✅ 无此限制(同模块多文件) |
| 模块名格式 | StringLiteral | — | — |

---

## 四、用例 1:1 对照

### 用例 ①：基本模块声明 (NSM_13_01_001_PASS)

**ArkTS（编译通过）：**
```typescript
// 模块作用域 — 所有顶层声明在模块内
class MyClass {}
```

**Java：**
```java
package com.example;
class MyClass {}
```

**Swift：**
```swift
// SwiftPM模块 — 文件本身即为模块成员
class MyClass {}
```

⭐ **差异**：ArkTS 模块声明可选，Java package 必须声明，Swift 通过 SwiftPM manifest 定义模块。

---

### 用例 ②：模块初始化执行 (NSM_13_01_006_RUNTIME)

**ArkTS（ark VM 实测通过）：**
```typescript
let x: int = 42
assert(x == 42)
```

**Java：**
```java
static int x = 42;
assert x == 42;
```

**Swift：**
```swift
let x = 42
assert(x == 42)
```

⭐ **三语言模块初始化语义一致** — 顶层声明按顺序执行/初始化。

---

## 五、严格度对比

```
ArkTS 更严格 ──────────────── Java/Swift 更宽松

领域 1: ambient 声明
  ArkTS (spec要求ambient混合禁止) >> Java (无此概念) = Swift (无此概念)

领域 2: 模块声明
  ArkTS (可选moduleHeader) ≈ Java (可选package) ≈ Swift (SwiftPM manifest)

领域 3: 模块初始化
  ArkTS (声明顺序) = Java (类初始化顺序) = Swift (lazy初始化)
```

---

## 六、继承/组合评分

| 维度 | ArkTS | Java | Swift | 说明 |
|------|-------|------|-------|------|
| 模块声明简洁度 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | 三语言模块声明方式不同但各具简洁性 |
| ambient 支持 | ⭐⭐⭐⭐⭐ | — | — | ArkTS 独有的 ambient 声明机制 |
| 模块初始化 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | 三语言初始化语义一致 |
| 运行时验证 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | runtime 用例通过 |

---

## 七、核心结论

| 角度 | 结论 |
|------|------|
| **模块声明语法** | ArkTS 灵活 — moduleHeader可选，Java用package，Swift用SwiftPM |
| **ambient 声明** | ArkTS 独有 — Java/Swift 无此概念 |
| **ambient混合检查** | spec要求但未实现 — 需编译器修复 |
| **模块初始化** | 三语言语义一致 |

### 关键启示

1. **ambient 声明是 ArkTS 继承自 TypeScript 的特性**，Java 和 Swift 无对应概念。
2. **模块初始化顺序在三语言中一致** — 按声明顺序执行。

### WSL实测验证 🔬

| 测试 | ArkTS | Java | Swift |
|------|-------|------|-------|
| ambient混合(D5) | ⚠️ FAIL_PASSED(spec禁止但编译器不报错) | ✅ 无ambient概念，多文件同包天然支持 | ✅ 同模块多文件天然支持 |
| Java同包多文件 | — | ✅ NSM_A.java + NSM_B.java同包编译通过 | — |
| Swift文件级作用域 | — | — | ✅ 顶层代码正常运行 |
| Swift访问控制 | — | — | ✅ internal=1, public=2正常运行 |

**ArkTS设计建议：**

1. ⚠️ **编译器应实现 ambient 混合检查** — 当前缺失导致 D5 不一致。
2. ✅ **保留可选 moduleHeader** — 灵活性优于 Java 的强制 package。

---

## 附录：规范文档

| 语言 | 规范来源 |
|------|---------|
| ArkTS | ArkTS Static Spec §13.1 Module Declarations |
| Java | JLS SE21 §7 Packages |
| Swift | The Swift Programming Language: Modules, SwiftPM |
