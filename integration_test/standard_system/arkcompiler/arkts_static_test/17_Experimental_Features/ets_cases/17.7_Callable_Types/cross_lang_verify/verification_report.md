# 17.7 Callable Types - 三环境实测报告

**测试日期：** 2026-06-23

---

## 环境信息

| 语言 | 编译器/运行时 | 版本 |
|------|-------------|------|
| ArkTS | es2panda + ark VM | 2026-06-18 build |
| Java | javac + java (Java) | 21.0.11 |
| Swift | swiftc | **不可用** (未安装) |

---

## 用例执行结果

### 用例组 1: 静态 invoke 模式

| 语言 | 代码 | 编译结果 | 运行结果 |
|------|------|---------|---------|
| ArkTS | `C()` calls `static $_invoke(): int` | PASS | PASS (returns 42) |
| Java | `C.invoke()` static method call | PASS | PASS (returns 42) |
| Swift | `C.invoke()` static method call | **未测试** | **未测试** |

### 用例组 2: 静态 factory 模式

| 语言 | 代码 | 编译结果 | 运行结果 |
|------|------|---------|---------|
| ArkTS | `C()` calls `static $_instantiate(factory): C` | PASS | PASS |
| Java | `C.create()` static factory method | PASS | PASS |
| Swift | `C.create()` static factory method | **未测试** | **未测试** |

### 用例组 3: 重载解析

| 语言 | 代码 | 编译结果 | 运行结果 |
|------|------|---------|---------|
| ArkTS | `C()`, `C(5)`, `C(3,7)` dispatch to correct $_invoke | PASS | PASS |
| Java | `C.invoke()`, `C.invoke(5)`, `C.invoke(3,7)` overload | PASS | PASS |
| Swift | `C.invoke()`, `C.invoke(5)`, `C.invoke(3,7)` overload | **未测试** | **未测试** |

### 用例组 4: new vs callable 区分

| 语言 | 代码 | 编译结果 | 运行结果 |
|------|------|---------|---------|
| ArkTS | `new C()` calls constructor, `C()` calls $_invoke | PASS | PASS |
| Java | `new C()` calls constructor, `C.method()` calls static | PASS | PASS |
| Swift | `C()` calls init, `C.method()` calls static | **未测试** | **未测试** |

---

## Java 实测输出

### JavaInvokePattern.java
```
PASS: Java invoke/factory patterns verified
```

### JavaNewVsStatic.java
```
PASS: new vs static method distinction verified
```

---

## 关键发现

1. **ArkTS 独有特性**：将类本身变为可调用（`C()` 等价于 `C.$_invoke()`）是 ArkTS 独有语法。Java 和 Swift 都只能通过 `ClassName.method()` 调用静态方法。

2. **$_instantiate 的 factory 参数**：ArkTS `$_instantiate` 需要 `f: () => Self` 工厂函数作为第一个隐式参数。这是 ArkTS 特有的设计，与 Java/Swift 的静态工厂方法模式不同。

3. **重载机制一致**：ArkTS、Java、Swift 均支持方法重载，按参数类型/数量分发。

4. **new 语义一致**：三种语言中 `new C()` 都调用构造函数，与静态方法/工厂方法调用明确区分。

5. **Swift callAsFunction 差异**：Swift 的 `callAsFunction` 是实例级方法（`instance()` 触发），而非类型级。ArkTS 的 `$_invoke` 是类型级（`ClassName()` 触发），两者语义完全不同。
