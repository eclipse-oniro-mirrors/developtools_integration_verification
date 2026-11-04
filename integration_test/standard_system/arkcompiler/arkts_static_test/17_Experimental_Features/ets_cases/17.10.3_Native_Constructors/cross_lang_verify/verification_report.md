# 17.10.3 Native Constructors - 三环境实测验证报告

**生成日期：** 2026-06-23

---

## ArkTS 实测结果

| 用例 | 结果 | 备注 |
|------|------|------|
| EXP2_17_10_03_001_PASS_NATIVE_CONSTRUCTOR_NO_PARAMS | compile-pass | native constructor() 无参数声明编译通过 |
| EXP2_17_10_03_002_PASS_NATIVE_CONSTRUCTOR_WITH_PARAMS | compile-pass | native constructor(x: int, y: double) 编译通过 |
| EXP2_17_10_03_003_PASS_NATIVE_CONSTRUCTOR_IN_SUBCLASS | compile-pass | 子类中 native constructor 编译通过 |
| EXP2_17_10_03_004_PASS_NATIVE_AND_REGULAR_CONSTRUCTOR | compile-pass | native 与 regular constructor 共存编译通过 |
| EXP2_17_10_03_005_PASS_NATIVE_CONSTRUCTOR_TYPE_USAGE | compile-pass | native constructor 类作为类型使用编译通过 |
| EXP2_17_10_03_006_FAIL_NATIVE_CONSTRUCTOR_NONEMPTY_BODY | compile-fail | ESE0084: Native constructor declaration cannot have a body (非空 body) |
| EXP2_17_10_03_007_FAIL_NATIVE_CONSTRUCTOR_EMPTY_BODY | compile-fail | ESE0084: Native constructor declaration cannot have a body (空 body {}) |
| EXP2_17_10_03_008_FAIL_NATIVE_CONSTRUCTOR_BODY_WITH_EXPR | compile-fail | ESE0084 (体含表达式) |
| EXP2_17_10_03_009_FAIL_NATIVE_CONSTRUCTOR_BODY_WITH_RETURN | compile-fail | ESE0084 (体含 return 语句) |
| EXP2_17_10_03_010_FAIL_NATIVE_CONSTRUCTOR_PARAMS_WITH_BODY | compile-fail | ESE0084 (参数 + 函数体) |
| EXP2_17_10_03_011_RUNTIME_NATIVE_CONSTRUCTOR_TYPE_REFERENCE | runtime (exit 0) | 类型引用正常（null 引用、空数组） |
| EXP2_17_10_03_012_RUNTIME_NATIVE_AND_REGULAR_CONSTRUCTOR | runtime (exit 0) | 通过 regular constructor 实例化正常 |
| EXP2_17_10_03_013_RUNTIME_NATIVE_CONSTRUCTOR_CLASS_METHODS | runtime (exit 0) | 类方法运行时引用正常 |

---

## Java 实测结果

**编译器/运行时:** Java 21.0.11 (javac 21.0.11)

| 测试场景 | 结果 | 备注 |
|----------|------|------|
| No-arg constructor equivalent | compile-pass + runtime PASS | Java constructor 必须有 body |
| Constructor with params | compile-pass + runtime PASS | `NativeCtorJava(21)` 值正确 (21, 42.0) |
| Subclass constructor | compile-pass + runtime PASS | extends 子类 constructor 正常 |
| Multiple constructors | compile-pass + runtime PASS | 无参 (0, 0.0) 和有参 (15, 30.0) 均正确 |
| Type usage (null ref, empty array) | compile-pass + runtime PASS | 类型引用正常 |
| native constructor syntax | **COMPILE ERROR** | Java: "modifier native not allowed here" |

**实际执行结果：**
```
PASS 001: no-arg constructor works (Java: body required)
PASS 002: constructor with params works
PASS 003: subclass constructor works
PASS 004: multiple constructors work (Java: all need bodies)
PASS 005: type usage works (null reference, empty array)

--- KEY DIFFERENCES: Java vs ArkTS native constructors ---
DIFF 1: Java does NOT support native constructors
  ArkTS: native constructor()  -- compiles (ESE0084 if body present)
  Java:  native ClassName() {} -- COMPILE ERROR: modifier native not allowed here
DIFF 2: Java constructors always have bodies (even if empty {})
  ArkTS: native constructor() has NO body
  Java:  constructor must have body, even empty {} body
DIFF 3: Java uses native init() pattern instead of native constructor
  Standard JNI pattern: constructor calls private native void nativeInit()

JAVA VERIFIED: All native constructor comparison tests passed
```

**观察：**
- **Java 不支持 native 构造函数**：这是 Java 与 ArkTS 之间的根本性差异。
- Java 的 `native` 修饰符只能应用于方法，不能应用于构造函数。
- Java 中模拟 native 构造的标准模式：构造函数调用 `private native void init()` 方法（JNI 模式）。
- Java 构造函数必须有 body（即使是空 `{}`）；ArkTS native constructor 必须无 body。
- ArkTS 的 native constructor 是一个**特殊**的语言特性，在 Java 中无直接对应。

---

## Swift 实测结果

**环境:** Swift **不可用**（系统中未安装 swift/swiftc）

Swift 代码已准备在 `NativeConstructorsSwift.swift` 中。Swift 使用以下等价模式：
- **无 `native` 关键字**：Swift 根本没有 `native` 关键字。
- **`init()` 必须有 body**：Swift 构造函数总是需要实现体。
- `@objc init()`：可用于 Objective-C interop，但仍有 body。
- Swift 面向协议设计：无 abstract/native 构造函数概念。

**关键差异：**
- ArkTS `native constructor()` 无 body；Swift `init()` **必须**有 body `{}`。
- Swift 中没有 native 概念，所有构造函数都需要完整实现。
- Swift 的 protocol 可以定义 `init()` 要求，但这属于 abstract 语义而非 native。

---

## 三环境综合对比

| 特性 | ArkTS | Java | Swift |
|------|-------|------|-------|
| native 关键字 | 有 (`native constructor`) | 有（但**不可**用于 constructor） | **无** |
| native constructor | **支持 (独有)** | **禁止 (编译错误)** | **禁止 (无 native 概念)** |
| 无 body 声明 | 是 (native constructor 无 body) | **否** (constructor 必须有 body) | **否** (init 必须有 body) |
| constructor 有 body 报错 | ESE0084 | N/A (constructor 必须有 body) | N/A (init 必须有 body) |
| native+regular constructor 共存 | 支持 | N/A (无 native constructor) | N/A |
| 子类 native constructor | 支持 | N/A | N/A |
| 类型引用 | 支持 (变量类型、数组元素类型) | 支持 | 支持 |
| JNI init() 替代模式 | N/A (直接支持 native constructor) | `constructor() { nativeInit(); }` | N/A |
