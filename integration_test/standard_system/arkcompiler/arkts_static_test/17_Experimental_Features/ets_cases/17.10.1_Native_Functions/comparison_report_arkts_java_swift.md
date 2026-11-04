# 17.10.1 Native Functions - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-23
**规范来源：** ArkTS Static Spec §17.10.1, Java JLS JNI (Java Native Interface), Swift Language Reference (C Interoperability)
**测试基础：** 13 个用例（5 compile-pass + 5 compile-fail + 3 runtime 真实执行）
**实测环境：** ArkTS (es2panda + ark), Java (Java 21), Swift (N/A - 未安装)

---

## 一、概览：三语言定位

| 语言 | 原生函数系统定位 | 设计哲学 |
|------|-----------------|---------|
| **ArkTS** | 实验特性，`native function` 顶层声明，无函数体，平台依赖实现 | 编译器已知的顶层 native 关键字，声明与实现分离 |
| **Java** | 核心特性，`native` 关键字仅可用于方法（非顶层函数），JNI 绑定 C/C++ | 无顶层函数概念，native 方法需在类中，通过 System.loadLibrary 加载 |
| **Swift** | 无 `native` 关键字。使用 `@_cdecl` 属性或 bridging header 进行 C 互操作 | Swift 函数必须有 body；平台互操作通过属性/模块映射完成 |

---

## 二、章节对应关系

| ArkTS §17.10.1 概念 | Java | Swift | 备注 |
|-------------------|------|-------|------|
| `native function` 顶层声明 | N/A（Java 无顶层函数）| N/A（Swift 无 native 关键字） | ArkTS 独有语法 |
| 无函数体（body-less） | 是（`native` 方法禁止 body）| **否**（Swift func 必须有 body） | ArkTS/Java 一致 |
| `native function foo(p: T): R` | `static native R foo(T p)` 在类中 | `func foo(p: T) -> R { ... }` (必须有 body) | Java 最接近等价 |
| `export native function` | `public static native` | N/A | public = 导出 |
| 禁止 body (compile error) | ESE0083 | "native methods cannot have a body" | N/A（无 native 概念） |
| 禁止 native+async | ESY0203 | N/A（Java 无 async 关键字） | N/A |
| 必须显式返回类型 | ESE0018 | Java 所有方法必须有返回类型 | Swift func 必须有返回类型 |
| 运行时未实现错误 | LinkerUnresolvedMethodError | UnsatisfiedLinkError | N/A |
| 泛型 native function | `native function <T> foo(arr: T[]): T` | `<T> T foo(T[] arr)` (类型擦除) | Swift 泛型 func (无 native 概念) |

---

## 三、关键差异矩阵

### 3.1 原生函数声明模型

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 顶层函数支持 | **是** (`native function`) | **否**（必须在类中） | **否**（虽有顶层 func 但无 native） |
| 声明语法 | `native function name(params): ret` | `native ret name(params);` (在类中) | N/A |
| 无函数体 | 是（编译期强制） | 是（编译期强制） | **否**（必须有 body） |
| 平台绑定机制 | 运行时链接器 | JNI System.loadLibrary() | Bridging Header / Module Map |
| 命名约定 | 标准函数名 | 标准方法名 | @_cdecl / @_silgen_name |

> **核心差异**：ArkTS 是唯一支持**顶层** native 函数声明的语言。Java 的 native 必须包装在类方法中，Swift 根本没有 native 概念。

### 3.2 编译器约束

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 禁止函数体 | ESE0083 (编译错误) | "native methods cannot have a body" (编译错误) | N/A |
| 禁止表达式体 (=) | ESY0227 (Unexpected token '=') | 同上（语法不匹配） | N/A |
| 禁止 native+async | ESY0203 (编译错误) | N/A (无 async) | N/A |
| 必须显式返回类型 | ESE0018 (编译错误) | Java 所有方法必须有返回类型 | Swift func 必须有返回类型 |
| 返回类型不匹配 | ESE0318 (类型赋值错误) | 编译错误 | 编译错误 |

### 3.3 运行时行为

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| native 声明不影响运行 | 是（exit 0） | 是（类加载成功） | N/A |
| 调用未实现 native | LinkerUnresolvedMethodError | UnsatisfiedLinkError | N/A |
| 错误可 try/catch 捕获 | 是 | 是 (catch Throwable/Error) | N/A |
| native 与普通函数共存 | 是（013 验证通过） | 是（同一类中） | N/A |

### 3.4 语言表达力

| 特性 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 顶层 native function | **是 (独有)** | 否 | 否 |
| 泛型 native function | 是 | 是（类型擦除） | N/A |
| export native function | 是 | public static native | N/A |
| 多个不同签名 native | 是 | 是 | N/A |

---

## 四、用例 1:1 对照（关键用例的三语言代码对比）

### 用例 001：基本原生函数声明

| 语言 | 代码 |
|------|------|
| ArkTS | `native function nativePrint(msg: string): void` |
| Java | `public static native void nativePrint(String msg);` (在类中) |
| Swift | N/A（Swift 无 native 关键字，需要用 `@_cdecl` 或 bridging header） |

### 用例 002：带参数和返回类型的原生函数

| 语言 | 代码 |
|------|------|
| ArkTS | `native function add(a: int, b: int): int` |
| Java | `public static native int add(int a, int b);` |
| Swift | N/A（最接近: `func add(_ a: Int32, _ b: Int32) -> Int32 { return a + b }` 但必须有 body） |

### 用例 004：泛型原生函数

| 语言 | 代码 |
|------|------|
| ArkTS | `native function firstElement<T>(arr: T[]): T` |
| Java | `public static native <T> T firstElement(T[] arr);` |
| Swift | `func firstElement<T>(arr: [T]) -> T? { return arr.first }` (必须有 body) |

### 用例 006：native function 带 block body

| 语言 | 行为 |
|------|------|
| ArkTS | **编译错误** ESE0083: Native, Abstract and Declare methods cannot have body |
| Java | **编译错误**: "native methods cannot have a body" |
| Swift | N/A（Swift func 必须有 body，无此约束） |

### 用例 008：native + async 组合

| 语言 | 行为 |
|------|------|
| ArkTS | **编译错误** ESY0203: 'native' flags must be used for functions only at top-level |
| Java | N/A（Java 无 async 关键字） |
| Swift | N/A（Swift async/await 是完全不同的 async 模型，无 native 概念） |

---

## 五、用例 1:1 对照（三环境实测结果）

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | 基本 native function 声明 | compile-pass | compile-pass | N/A |
| 002 | 带参数和返回类型的 native function | compile-pass | compile-pass | N/A |
| 003 | 多个不同签名的 native function | compile-pass | compile-pass | N/A |
| 004 | 泛型 native function | compile-pass | compile-pass | N/A |
| 005 | export native function | compile-pass | compile-pass | N/A |
| 006 | native function 带 block body | compile-fail ESE0083 | compile-fail (design note) | N/A |
| 007 | native function 带 expression body | compile-fail ESY0227 | compile-fail (design note) | N/A |
| 008 | native + async 组合 | compile-fail ESY0203 | N/A (无 async) | N/A |
| 009 | native function 无显式返回类型 | compile-fail ESE0018 | compile-fail (design note) | N/A |
| 010 | native function 返回类型不匹配 | compile-fail ESE0318 | compile-fail | N/A |
| 011 | native function 声明存在性验证 (运行时) | runtime (exit 0) | runtime (exit 0) | N/A |
| 012 | 调用未实现的 native function (运行时) | runtime (exit 0) | runtime (exit 0, UnsatisfiedLinkError) | N/A |
| 013 | native 与普通 function 共存 (运行时) | runtime (exit 0) | runtime (exit 0) | N/A |

### 关键差异详解

#### 用例 001-005: 顶层 native function (ArkTS 独有)

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `native function add(a: int, b: int): int` | 顶层声明，无 body，编译通过 |
| Java | `class X { static native int add(int a, int b); }` | 必须在类中，无 body，编译通过 |
| Swift | N/A | Swift 无 native 关键字，func 必须有 body |

#### 用例 006: native 带 body 被禁止

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `native function foo(): void { console.log("x") }` | ESE0083: Native, Abstract and Declare methods cannot have body |
| Java | `native void foo() { }` | compile error: native methods cannot have a body |
| Swift | N/A | Swift 所有 func 都需要 body |

#### 用例 008: native+async 禁止

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `native async function baz(): void` | ESY0203: 'native' flags must be used for functions only at top-level |
| Java | N/A | Java 无 async 关键字 |
| Swift | N/A | Swift 无 native 关键字，但有独立 async 模型 |

---

## 六、综合评分

| 维度 | ArkTS | Java | Swift | 评价 |
|------|-------|------|-------|------|
| native 声明简洁性 | 5 | 3.5 | 1 | ArkTS 顶层 native function 最直接；Java 需包装在类中；Swift 无 native 概念 |
| 编译器安全性 | 5 | 5 | 3 | ArkTS/Java 编译期强约束（无 body、无 async 组合）；Swift 无对应约束 |
| 无函数体约束一致性 | 5 | 5 | 1 | ArkTS/Java 完全一致地要求 native 无 body；Swift 必须要有 body |
| 泛型支持 | 5 | 5 | 3 | ArkTS/Java 都支持泛型 native；Swift 泛型不能用于 C interop |
| 顶层函数表达力 | 5 | 1 | 1 | ArkTS 独有顶层 native function；Java/Swift 均不支持 |
| 运行时错误处理 | 4 | 4 | 1 | ArkTS/Java 都能捕获未实现 native 的错误；Swift 不适用 |

---

## 七、核心结论

1. **ArkTS 是唯一支持顶层 native function 的语言**：Java 的 native 必须封装在类方法中，Swift 根本没有 native 关键字。这使得 ArkTS 在 native 函数声明方面具有最直接的语法表达力。

2. **ArkTS 与 Java 在 native 约束上高度一致**：
   - 两者都禁止 native 声明有函数体（ArkTS ESE0083 ~= Java "native methods cannot have a body"）
   - 两者都要求显式返回类型（ArkTS ESE0018 ~= Java 方法签名强制要求）
   - 运行时未实现错误的语义一致（LinkerUnresolvedMethodError ~= UnsatisfiedLinkError）

3. **ArkTS 的独有优势**：
   - 顶层 native function 声明（Java/Swift 均不支持）
   - `export native function` 的语法糖
   - 与普通 function 自然共存，不影响程序正常执行

4. **ArkTS 与 Swift 的主要差异**：
   - ArkTS 有 `native` 关键字；Swift 用 `@_cdecl` / bridging header
   - ArkTS native function 无 body；Swift func 必须有 body
   - Swift 的 C interop 是导出方向（@_cdecl），ArkTS native 是导入方向（声明外部实现）

5. **native+async 禁止是 ArkTS 的合理设计选择**：由于 native 函数由平台同步实现，异步组合没有实际意义。Java 没有 async 概念，Swift 用独立 async 模型。

---

## 八、ArkTS 设计建议

1. **保持顶层 native function 语法**：这是 ArkTS 的差异化优势。Java 开发者需要用类包装，Swift 开发者需要 C interop 配置，而 ArkTS 开发者可以最直接地声明 native 函数。

2. **考虑 native+async 的明确文档化**：当前 ESY0203 错误信息 "'native' flags must be used for functions only at top-level" 不够直观。建议错误信息明确说明 "native functions cannot be async"，帮助开发者理解设计意图。

3. **ESE0083 错误消息的措辞**：当前消息 "Native, Abstract and Declare methods cannot have body" 使用了 "methods" 一词，但对顶层 native function 同样生效。建议统一措辞为 "Native, Abstract and Declare declarations cannot have body" 以涵盖函数和方法。

4. **考虑与 Java JNI 的互操作性文档**：ArkTS native function 和 Java native method 语义高度一致，可以编写迁移指南帮助 Java 开发者理解对应关系（native function ~= static native method）。

5. **保持泛型 native function 支持**：这是 ArkTS 相对于 Swift C interop 的一个重要优势，Swift 的泛型无法直接暴露给 C ABI。
