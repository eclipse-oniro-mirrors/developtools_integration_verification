# 7.18 typeof Expression — 三语言对比报告

## 1. 概览

`typeof` 表达式用于在运行时获取表达式的类型名称字符串。ArkTS 原生支持 `typeof` 关键字；Java 用 `getClass().getSimpleName()`；Swift 用 `type(of:)`。

| 语言 | 关键字/API | 语法 | null 处理 | 原始类型名 | 返回格式 |
|------|-----------|------|-----------|-----------|---------|
| **ArkTS** | `typeof` 关键字 | `typeof expr` | "object" | "int"/"byte" | 小写 |
| **Java** | `getClass().getSimpleName()` | `expr.getClass().getSimpleName()` | ❌ NPE | "Integer"/"Byte" | 类首字大写 |
| **Swift** | `type(of:)` 函数 | `type(of: expr)` | ❌ nil 无信息 | "Int"/"Double" | 类型名 |

## 2. 章节对应关系

| 概念 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 编译时已知类型 | ✅ string→"string" | ✅ getClass() 编译 | ✅ type(of:) 编译 |
| 运行时确定类型 | ✅ Object/union/类型参数 | ✅ getClass() | ✅ type(of:) |
| 原始数值类型 | ✅ "int"/"byte"/"float"/"long"/"double"→"number" | ❌ 装箱 "Integer"/"Byte" | ✅ "Int" |
| 布尔类型 | ✅ "boolean" | ✅ "Boolean" | ✅ "Bool" |
| 函数类型 | ✅ "function" | ✅ 类名 | ✅ "()->()" |
| null 类型 | ✅ "object" | ❌ NullPointerException | ❌ nil 无类型 |
| undefined/void | ✅ "undefined" | ❌ N/A | ❌ N/A |
| bigint | ✅ "bigint" | ❌ BigInteger 类名 | ❌ N/A |
| 枚举类型 | ✅ 基类型名 "int"/"string" | ✅ 类名 | ❌ N/A |
| 重载函数 | ❌ compile-time error | ✅ 可行 | ✅ 可行 |
| 类型参数(泛型) | ✅ 运行时确定 | ❌ 类型擦除 | ✅ type(of:) 可行 |

## 3. 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 原生 typeof 关键字 | ✅ | ❌ | ❌ |
| 小写类型名 | ✅ | ❌（首字大写）| ❌（首字大写）|
| null 安全 | ✅ "object" | ❌ NPE | ❌ nil 无信息 |
| 原始类型区分 | ✅ "int"≠"byte"≠"float" | ❌ 都装箱 | ✅ "Int"≠"Float" |
| 函数类型 | ✅ "function" | ✅ 对象类名 | ✅ "()->()" |
| undefined | ✅ "undefined" | ❌ N/A | ❌ N/A |
| 重载函数 typeof | ❌ 编译错误 | ✅ 可行 | ✅ 可行 |

## 4. 用例对照

### 4.1 typeof 关键字 — ArkTS 独有

| 语言 | 获取类型名 |
|------|-----------|
| ArkTS | `typeof s` → "string" |
| Java | `s.getClass().getSimpleName()` → "String" |
| Swift | `type(of: s)` → "String" |

ArkTS 是唯一使用 `typeof` 作为关键字的语言（继承自 JavaScript）。

### 4.2 typeof null — ArkTS 优于 Java/Swift

| 语言 | `typeof null` | 结果 |
|------|--------------|------|
| ArkTS | `typeof null` | `"object"` ✅ |
| Java | `null.getClass()` | `NullPointerException` ❌ |
| Swift | `type(of: nil)` | 编译错误/无信息 ❌ |

ArkTS 的 `typeof null → "object"` 是 JavaScript 兼容语义，在 null 安全方面优于 Java/Swift。

### 4.3 原始数值类型名 — ArkTS 优于 Swift 优于 Java

| 类型 | ArkTS | Java | Swift |
|------|-------|------|-------|
| int | "int" | "Integer" | "Int" |
| byte | "byte" | "Byte" | "Int8" |
| float | "float" | "Float" | "Float" |
| double | "number" (not "double") | "Double" | "Double" |
| char | "char" | "Character" | "Character" |

ArkTS 的 double → "number" 特殊映射是值得注意的设计选择。

### 4.4 运行时类型 — 三语言一致

```typescript
// ArkTS
function foo(o: Object): void {
    typeof o  // 运行时取决于实际值
}
```

```java
// Java
void foo(Object o) {
    o.getClass().getSimpleName();  // 运行时取决于实际值
}
```

```swift
// Swift
func foo(_ o: Any) {
    type(of: o)  // 运行时取决于实际值
}
```

三语言在运行时类型获取上语义一致。

### 4.5 类型参数(泛型) — ArkTS/Swift 优于 Java

| 语言 | 泛型类型参数 typeof |
|------|--------------------|
| ArkTS | ✅ `typeof this.val` 运行时确定（类型擦除但 typeof 在运行时生效）|
| Java | ❌ 类型擦除后无法获取 T 的实际类型 |
| Swift | ✅ `type(of: self.val)` 具体化获取 |

ArkTS 的 typeof 在类型参数上正确返回运行时实际类型，优于 Java 的类型擦除限制。

## 5. 三环境实测结果

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | typeof string | ✅ compile-pass | ✅ | ✅ |
| 002 | typeof bigint/number | ✅ compile-pass | ❌ 语义不同 | ❌ 语义不同 |
| 003 | typeof int/byte/float | ✅ compile-pass | ✅ | ✅ |
| 005 | typeof Object/function | ✅ compile-pass | ✅ | ✅ |
| 006 | typeof null/undefined | ✅ compile-pass | ⚠️ NPE | ❌ N/A |
| 007 | typeof enum | ✅ compile-pass | ✅ | ❌ N/A |
| 008 | typeof union | ✅ compile-pass | ❌ 无 union | ❌ 语法不同 |
| 021 | typeof 重载函数 | ❌ compile-fail | ✅ 可行 | ✅ 可行 |
| 031 | string→"string" runtime | ✅ runtime | ✅ | ✅ |
| 032 | int→"int" runtime | ✅ runtime | ✅ ("Integer") | ✅ ("Int") |
| 034 | null→"object" runtime | ✅ runtime | ❌ NPE | ❌ N/A |
| 035 | enum→"int" runtime | ✅ runtime | ✅ (不同语义) | ❌ N/A |
| 036 | Object 运行时类型 | ✅ runtime | ✅ | ✅ |
| 037 | union 运行时类型 | ✅ runtime | ❌ N/A | ❌ 语法不同 |
| 038 | 类型参数运行时 | ✅ runtime | ❌ 类型擦除 | ✅ |

## 6. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 语法简洁性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ |
| null 安全性 | ⭐⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐ |
| 原始类型区分度 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| 运行时类型支持 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 泛型类型支持 | ⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐⭐ |
| 编译时检查 | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |

## 7. 核心结论

1. **typeof 关键字是 ArkTS 独有**：Java/Swift 均无此关键字，需方法调用
2. **null 安全性**：ArkTS `typeof null → "object"` 安全，Java/Swift 抛异常
3. **原始类型名称**：ArkTS 提供具体类型名（"int"/"byte"），Java 装箱后丢失
4. **运行时类型**：三语言对 Object/Any 的运行时类型获取一致
5. **重载函数限制**：ArkTS 禁止 typeof 重载函数名，Java/Swift 允许
6. **类型参数**：ArkTS typeof 运行时确定，优于 Java 类型擦除
7. **0 D 类 Spec 不一致**：15/15 用例全部通过

## 8. ArkTS 设计建议

- 当前实现基本符合 spec 规范
- `typeof` 关键字是易用的语法糖，建议保持
- `typeof null → "object"` 是 JS 兼容的设计选择（非 bug）
- `typeof double → "number"` 的映射需要开发者注意（不返回 "double"）
- 建议未来扩展 `as char` 转换支持以完善 char 类型测试覆盖
- 重载函数 typeof 的限制是合理的安全措施
## 9. 三环境实测验证

cross_lang_verify/（2026-07-29 实测）：Java 5/5 ✅，Swift 4/4 ✅

ArkTS typeof 语法最简洁（继承 JS typeof）。Java 需 getClass().getSimpleName()，Swift 需 type(of:)。typeof null 在 ArkTS 安全返回 object，Java 抛 NPE。
