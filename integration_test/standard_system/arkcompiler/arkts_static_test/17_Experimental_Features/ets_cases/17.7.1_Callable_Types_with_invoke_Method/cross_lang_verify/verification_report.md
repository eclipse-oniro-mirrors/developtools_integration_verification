# 17.7.1 Callable Types with $_invoke Method - 三环境实测验证报告

**验证日期：** 2026-06-23
**ArkTS 编译器：** es2panda
**ArkTS 运行时：** ark VM
**Java 编译器：** javac 21.0.11
**Java 运行时：** Java 21.0.11
**Swift：** 不可用（系统未安装 Swift 运行时）

---

## 一、ArkTS 实测结果（14 用例）

| 用例编号 | 类型 | 结果 | 详情 |
|---------|------|------|------|
| 001 | compile-pass | ✅ PASS | 无参 $_invoke 编译通过 |
| 002 | compile-pass | ✅ PASS | 有参有返回 $_invoke 编译通过 |
| 003 | compile-pass | ✅ PASS | 多重载编译通过 |
| 004 | compile-pass | ✅ PASS | 显式 $_invoke 编译通过 |
| 005 | compile-pass | ✅ PASS | void 返回编译通过 |
| 006 | compile-pass | ✅ PASS | 复杂参数编译通过 |
| 007 | compile-pass | ✅ PASS | 泛型类编译通过 |
| 008 | compile-pass | ✅ PASS | 实例 $_invoke 定义合法 |
| 009 | compile-fail | ✅ PASS | ESE0221: $_invoke + $_instantiate 互斥 |
| 010 | compile-fail | ✅ PASS | ESE0172: 实例 $_invoke 不使类可调用 |
| 011 | compile-fail | ✅ PASS | ESE170021: 静态方法不能引用类型参数 |
| 012 | runtime | ✅ PASS | 短形式=显式调用，4 assertions |
| 013 | runtime | ✅ PASS | 重载选择正确，5 assertions |
| 014 | runtime | ✅ PASS | new vs $_invoke 区分，4 assertions |

**总通过率：14/14 = 100%**

---

## 二、Java 实测结果

**文件：** `JavaInvokeCallable.java`
**编译：** ✅ javac 退出码 0
**运行：** ✅ java 退出码 0，输出 "SimpleInvoke called" + "All Java assertions passed"

### Java 关键发现

| 对比点 | ArkTS | Java |
|--------|-------|------|
| 类名直接调用 | `ClassName(args)` → 调用 `$_invoke` | ❌ 不支持，编译器报错 |
| 静态方法调用 | `ClassName.$_invoke(args)` | `ClassName.method(args)` ✅ |
| 函数式接口引用 | N/A（无对应概念） | `IntBinaryOp op = MathOp::add` ✅ |
| callable 概念 | 类级别（static $_invoke） | 无对应概念 |
| 实例 callable | 不支持（实例 $_invoke 不使类可调用） | 无对应概念 |

**Java 中 `ClassName()` 只表示构造函数调用或方法调用，不能重定向到任意静态方法。这是与 ArkTS 的根本差异。**

---

## 三、Swift 对照（未执行）

**文件：** `SwiftInvokeCallable.swift`
**状态：** ⚠️ 代码已编写但无法执行（系统未安装 Swift 运行时）
**基于：** Swift 5.10 文档，`callAsFunction` 特性（Swift 5.2+）

### Swift 关键对比（文档推断）

| 对比点 | ArkTS | Swift |
|--------|-------|-------|
| 类名直接调用 | `ClassName(args)` → `$_invoke` (static) | ❌ 不支持 |
| callable 概念 | 类级别（static $_invoke） | **实例级别**（`callAsFunction`） |
| 调用语法 | `ClassName(args)` | `instance(args)` |
| 声明位置 | `static $_invoke(...)` | `func callAsFunction(...)`（实例方法） |
| 泛型支持 | ❌ static 不能使用类型参数 | ✅ 实例方法可使用泛型参数 |
| 多重载 | ✅ | ✅ |
| 互斥约束 | $_invoke / $_instantiate 互斥 | N/A（无对应概念） |

### Swift callAsFunction 示例（预期行为）

```swift
struct Calculator {
    func callAsFunction(_ a: Int, _ b: Int) -> Int { return a + b }
}
let calc = Calculator()
calc(2, 3)  // → 5 (instance-level call)
// Calculator(2, 3)  // ❌ Would try init(2,3), not callAsFunction
```

**关键差异：Swift 的 `callAsFunction` 是实例级，ArkTS 的 `$_invoke` 是类级（static）。ArkTS 的设计更加便捷——无需先创建实例即可调用。**

---

## 四、三环境实测总结

| 语言 | 类级 callable | 实例级 callable | 编译/运行 |
|------|--------------|----------------|-----------|
| ArkTS | ✅ `static $_invoke` | ❌（定义合法但不使类可调用） | ✅ 14/14 通过 |
| Java | ❌ 不支持 | ❌ 不支持（但函数式接口+方法引用为替代方案） | ✅ 编译运行通过 |
| Swift | ❌ 不支持 | ✅ `callAsFunction` | ⚠️ 未执行（无运行时） |

**核心结论：ArkTS 的类级 callable (`static $_invoke`) 是三种语言中独有的特性。Java 和 Swift 均不支持直接以类名作为函数调用。**
