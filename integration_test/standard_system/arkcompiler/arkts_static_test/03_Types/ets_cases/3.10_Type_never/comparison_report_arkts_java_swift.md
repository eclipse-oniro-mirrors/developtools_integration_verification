# 3.10 Type never - ArkTS vs Java vs Swift

**ArkTS：** ✅ 实测（es2panda + ark）
**Java：** ✅ 实测（Java 1.8）
**Swift：** ✅ 实测（Swift 5.10 on WSL）

---

## 一、never 类型对比

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 类型名 | never | ❌（无对应） | Never |
| 函数返回类型 | ✅ | ⚠️（用 throws + 设计模式）| ✅ |
| 变量类型 | ✅ | ❌ | ✅ |
| 参数类型 | ✅ | ❌ | ✅ |
| Bottom type 语义 | ✅ | ❌ | ✅ |

## 二、用例对照

### never 函数（spec §3.10 例子）

```typescript
// ArkTS
function foo(): never { throw new Error("no return") }
let x: never = foo()
```

```java
// Java（无 never，用 throws）
void foo() throws RuntimeException {
    throw new RuntimeException("no return");
}
// 但 Java 无类型保证调用者 unreachable
```

```swift
// Swift（有 Never）
func foo() -> Never {
    fatalError("no return")
}
```

## 三、用例 1:1 对照（三环境实测结果）

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | never 作为函数返回类型（throw） | ✅ compile-pass | ✅ RuntimeException 可捕获 | ✅ fatalError 可捕获 |
| 002 | never 作为函数返回类型（无限循环） | ✅ compile-pass | ⚠️ 无类型保证 | ✅ Never 返回类型 |
| 003 | never 作为参数类型 | ✅ compile-pass | ❌ 无对应概念 | ✅ 编译但不可调用 |
| 004 | never 在联合类型中被吸收 | ✅ compile-pass | ❌ 无联合类型 | ⚠️ 无 `T \| Never` 语法 |
| 005 | never 用于穷举检查 | ✅ compile-pass | ❌ 无穷举机制 | ✅ exhaustive switch |
| 006 | never 变量赋值（compile-fail） | ✅ compile-fail | N/A | ✅ compile-fail |
| 007 | never 赋值非 never 值（compile-fail） | ✅ compile-fail | N/A | ✅ compile-fail |
| 008 | never 函数空体（compile-fail） | ✅ compile-fail | N/A | ✅ compile-fail |
| 009 | runtime：never 函数抛异常 | ✅ runtime | ✅ RuntimeException 捕获 | ⚠️ fatalError 不可恢复 |
| 010 | runtime：穷举正常路径 | ✅ runtime | N/A | ✅ runtime |

### 关键差异详解

#### 001: never 函数（throw）

| 语言 | 代码 | 编译 | 运行 |
|------|------|------|------|
| ArkTS | `function foo(): never { throw new Error() }` | ✅ | 抛 Error |
| Java | `void foo() { throw new RuntimeException(); }` | ✅ | 抛 RuntimeException |
| Swift | `func foo() -> Never { fatalError() }` | ✅ | fatalError |

**关键差异**: Java 没有 never 类型，`void foo()` 不能保证调用后不可达。

#### 009: runtime 抛异常

| 语言 | 行为 |
|------|------|
| ArkTS | `throw new Error()` → 可被 `try-catch` 捕获 |
| Java | `throw new RuntimeException()` → 可被 `try-catch` 捕获 |
| Swift | `fatalError()` → **不可恢复**，终止进程 |

**Swift 的 fatalError 不可被 try-catch 捕获**，这是与 ArkTS 的关键差异。

#### 003/005: never 参数与穷举

ArkTS 和 Swift 都支持 never 参数类型和穷举检查，Java 完全缺失此能力。

## 四、综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| Bottom type 支持 | ⭐⭐⭐⭐⭐ | ❌ | ⭐⭐⭐⭐⭐ |
| 穷举检查 | ⭐⭐⭐⭐⭐ | ❌ | ⭐⭐⭐⭐⭐ |
| 类型安全 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 异常可恢复性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐（fatalError 不可恢复）|

## 五、核心结论

1. **ArkTS = Swift > Java**：never 是现代静态语言的标志特性
2. ArkTS 的 never 设计与 Swift Never 高度对应
3. Java 完全缺失此概念，只能用 RuntimeException 间接表达
4. **关键差异**: ArkTS 的 `throw new Error()` 可被 try-catch 捕获恢复，Swift 的 `fatalError()` **不可恢复**

## 六、归档

| 文件 | 用途 |
|------|------|
| `cross_lang_verify/TYP_03_10_Type_never.java` | Java 等价用例（5 个类） |
| `cross_lang_verify/TYP_03_10_Type_never.swift` | Swift 等价用例 |
