# 7.9 this Expression — 三语言对比报告

## 1. 概览

this 表达式在实例方法中引用当前对象。三语言的 this/self 语义基本一致：

| 语言 | 关键字 | 定位 |
|------|--------|------|
| **ArkTS** | `this` | 实例方法、构造器、lambda、对象字面量方法、接口默认方法 |
| **Java** | `this` | 实例方法、构造器、内部类、lambda |
| **Swift** | `self` | 实例方法、构造器、闭包（需显式捕获）|

## 2. 章节对应关系

| 上下文 | ArkTS | Java | Swift |
|--------|-------|------|-------|
| 实例方法 | `this.field` | `this.field` | `self.field` |
| 构造器 | `this.field = v` | `this.field = v` | `self.field = v` |
| 字段 init lambda | `this` OK | `this` OK | `self` 需捕获 |
| 对象字面量方法 | `this` → 字面量类型 | `this` → 匿名类 | 无等价语法 |
| 对象字面量 lambda | `this` → 包围类 | `this` → 包围类 | 需显式捕获 |
| 接口默认方法 | `this` OK | `default` 方法 `this` OK | protocol extension |
| 静态方法 | ❌ 编译时错误 | ❌ 编译时错误 | ❌ 编译时错误 |
| 顶层作用域 | ❌ 编译时错误 | ❌ 编译时错误 | ❌ 编译时错误 |

## 3. 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 实例方法 this | ✅ | ✅ | ✅ (self) |
| 构造器 this | ✅ | ✅ | ✅ (self) |
| Lambda this | ✅ 指向包围类 | ✅ 指向包围类 | ⚠️ 需显式捕获 |
| 对象字面量方法 this | ✅ | ✅ | N/A |
| 接口默认方法 this | ✅ | ✅ | ✅ protocol ext |
| 静态方法禁止 | ✅ | ✅ | ✅ |
| 顶层作用域禁止 | ✅ | ✅ | ✅ |

## 4. 用例对照

### 4.1 实例方法 this

| 语言 | 代码 | 说明 |
|------|------|------|
| ArkTS | `this.field` | ✅ this 指向当前实例 |
| Java | `this.field` | ✅ this 指向当前实例 |
| Swift | `self.field` | ✅ self 指向当前实例 |

三语言语义一致。

### 4.2 Lambda/闭包 this 行为 ⭐

| 语言 | 代码 | this 指向 |
|------|------|-----------|
| ArkTS | `() => this.field` | ✅ 指向包围类 |
| Java | `() -> this.field` | ✅ 指向包围类 |
| Swift | `{ [self] in self.field }` | ⚠️ 需显式捕获 self |

**差异**：ArkTS/Java 的 lambda 中 `this` 自动指向包围类；Swift 闭包需显式 `[self]` 捕获。

### 4.3 对象字面量方法 this ⭐

| 语言 | 代码 | 说明 |
|------|------|------|
| ArkTS | `{ getX(): int { return this.x } }` | ✅ this 指向字面量自身 |
| Java | `new Object() { int getX() { return this.x; } }` | ✅ this 指向匿名类 |
| Swift | N/A | ❌ 无等价语法 |

### 4.4 静态方法 this 编译错误

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `static foo(): void { this.x }` | ❌ 编译时错误 |
| Java | `static void foo() { this.x }` | ❌ 编译时错误 |
| Swift | `static func foo() { self.x }` | ❌ 编译时错误 |

三语言均禁止在静态上下文中使用 this/self。

## 5. 三环境实测结果

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | 实例方法 this | ✅ compile-pass | ✅ | ✅ |
| 002 | 构造器 this | ✅ compile-pass | ✅ | ✅ |
| 003 | 字段 lambda this | ✅ compile-pass | ✅ | ✅ |
| 004 | 对象字面量方法 this | ✅ compile-pass | ✅ | N/A |
| 005 | 对象字面量 lambda this | ✅ compile-pass | ✅ | ⚠️ 需捕获 |
| 006 | 接口默认方法 this | ✅ compile-pass | ✅ | ✅ |
| 007 | 顶层作用域 this | ❌ 编译时错误 | ❌ 编译时错误 | ❌ 编译时错误 |
| 008 | 静态方法 this | ❌ 编译时错误 | ❌ 编译时错误 | ❌ 编译时错误 |
| 009 | 实例方法 this 运行时 | ✅ runtime | ✅ | ✅ |
| 010 | 构造器 this 运行时 | ✅ runtime | ✅ | ✅ |
| 011 | 对象字面量方法 this 运行时 | ✅ runtime | ✅ | N/A |

## 6. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 基本语义一致性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| Lambda/闭包 this | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ |
| 编译时检查 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 对象字面量支持 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐ |

## 7. 核心结论

1. **三语言 this/self 语义高度一致**：实例方法和构造器中引用当前对象。
2. **Lambda/闭包 this 规则类似**：ArkTS 和 Java 中 lambda 的 `this` 指向包围类；Swift 需显式 `self.` 捕获。
3. **非法上下文检查一致**：静态方法和顶层作用域均禁止 `this`。

## 8. ArkTS 设计建议

- this 表达式语义与 Java/Swift 高度一致，设计成熟。
- 对象字面量方法中 this 的支持是 ArkTS 的优势特性。
- 静态方法和顶层作用域禁止 this 的检查与主流语言一致。
