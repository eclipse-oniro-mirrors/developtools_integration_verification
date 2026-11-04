# 17.13.1 Functions with Receiver — ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-25
**测试用例数：** 15（7 compile-pass + 4 compile-fail + 4 runtime）
**通过率：** 100%（15/15）
**编译器：** es2panda --extension=ets (Linux native)
**Spec 依据：** arktsspecification.md §17.13.1

## 报告分类口径

| 分类 | 含义 | 处理方式 |
|------|------|----------|
| 符合 ArkTS spec 的语言设计差异 | 行为与 Java/Swift 不同，但符合 ArkTS spec 或当前明确语义 | 不标为缺陷，仅记录差异 |
| Spec 与实现不一致 | 用例与 spec 要求不一致，且当前实现未按 spec 报错/运行 | 保留 FAIL 用例并记录 issue_report |
| 已验证规范一致行为 | 用例验证 ArkTS 行为符合 spec | 记录为通过项 |

---

## 一、符合 ArkTS spec 的语言设计差异

### 差异 A：Receiver 函数是 ArkTS 独有的顶层扩展机制

**分类：** 符合 ArkTS spec 的语言设计差异

#### Spec 依据

§17.13 明确声明：ArkTS 允许通过顶层函数为已存在的类/接口添加方法，以 `this: Type` 作为第一参数。支持两种调用语法：普通调用 `f(obj)` 和 方法调用 `obj.f()`。这是 ArkTS 独有的特性。

#### 实测行为

```typescript
class StringBuilder {
  public value: string = ""
  public append(s: string): void { this.value += s }
}

// 顶层 receiver 函数——不为 StringBuilder 类添加新成员，而是扩展其可用方法
function greet(this: StringBuilder): void {
  this.append("Hello")
}

let sb = new StringBuilder()
greet(sb)       // ✅ 普通调用语法
sb.greet()      // ✅ 方法调用语法（仅顶层函数支持）
```

#### 跨语言对比

| 语言 | Receiver 函数等价物 | 调用语法 | 类型 |
|------|-------------------|---------|------|
| ArkTS | `function f(this: T)` 顶层函数 | `f(obj)` 和 `obj.f()` | 静态分发 |
| Java | N/A — 无等价语法 | N/A | N/A |
| Swift | extension 方法（语义相近但语法不同） | `obj.f()` | 静态分发 |
| TypeScript | N/A — 无此语法（TS 的 this 参数仅用于类型标注，不改变调用语义） | N/A | N/A |

**说明：** Java 完全无 receiver 函数等价语法。要给已存在类添加方法，只能通过继承或包装（Decorator 模式）。Swift 的 `extension` 可以向已有类型添加方法，但语法完全不同——不需要 `this: Type` 参数，直接在 extension 块内定义方法即可。ArkTS 的 receiver 函数是特殊的顶层扩展机制：函数定义在类外部，通过 `this: Type` 第一参数声明其接收者，进而获得方法调用语法糖。

---

### 差异 B：仅顶层 receiver 函数支持方法调用语法

**分类：** 符合 ArkTS spec 的语言设计差异

#### 实测行为

```typescript
// 顶层 receiver 函数：✅ 支持 obj.f() 方法调用语法
function greet(this: StringBuilder): void { /* ... */ }
sb.greet()  // ✅ 编译通过

// lambda 变量：❌ 不支持 obj.lambdaVar() 方法调用语法
let fn: (this: StringBuilder) => void = (this: StringBuilder): void => { /* ... */ }
sb.fn()  // ❌ 编译错误（实测结果）
fn(sb)   // ✅ 普通调用语法
```

ArkTS receiver 函数的方法调用语法 `obj.f()` 仅在顶层函数定义时有效。赋给变量的 receiver 函数类型只能通过普通调用语法调用。这与 spec 一致。

#### 跨语言对比

| 语言 | 方法调用语法支持范围 |
|------|-------------------|
| ArkTS | 仅顶层 receiver 函数 |
| Java | N/A |
| Swift | extension 方法天然支持 `.` 语法 |
| TypeScript | N/A |

---

### 差异 C：Receiver 函数为静态分发，实例方法优先级更高

**分类：** 符合 ArkTS spec 的语言设计差异

#### 实测行为

```typescript
class C {
  public foo(): void { console.log("instance method") }
}
function foo(this: C): void { console.log("receiver function") }
let c = new C()
c.foo()  // 调用实例方法 foo，而非 receiver 函数
```

当类实例方法名称与 receiver 函数冲突时，实例方法优先级更高。这是编译器决定的静态分发策略，与 spec 一致。

---

## 二、Spec 与实现不一致

无。本章节所有 15 个用例均按 spec 预期行为通过编译或正确报错。

---

## 三、已验证规范一致行为

经 es2panda + ark VM 实测，以下行为与 ArkTS spec §17.13.1 一致：

| 行为 | 验证方式 | 结果 |
|------|---------|------|
| 基本 receiver 函数方法调用语法 `sb.greet()` | compile-pass (001) | ✅ 通过 |
| 普通调用语法 `greet(sb)` | compile-pass (002) | ✅ 通过 |
| 泛型 receiver 函数 `<T>` | compile-pass (003) | ✅ 通过 |
| 通过 `this` 访问公有成员 | compile-pass (004) | ✅ 通过 |
| 带额外参数的 receiver 函数 | compile-pass (005) | ✅ 通过 |
| 命名空间中的 receiver 函数 | compile-pass (006) | ✅ 通过 |
| 多类型 receiver 函数 | compile-pass (007) | ✅ 通过 |
| 访问私有成员应报错 (ESE0293) | compile-fail (008) | ✅ 编译错误 |
| this 不是第一个参数应报错 (ESY0158) | compile-fail (009) | ✅ 编译错误 |
| 缺少 this 参数应报错 (ESE0203) | compile-fail (010) | ✅ 编译错误 |
| this 参数名称错误应报错 (ESE0087) | compile-fail (011) | ✅ 编译错误 |
| 方法调用语法运行时正确执行 | runtime (012) | ✅ 通过 |
| 普通调用语法运行时正确执行 | runtime (013) | ✅ 通过 |
| this 绑定正确性验证 | runtime (014) | ✅ 通过 |
| 泛型 receiver 函数运行时验证 | runtime (015) | ✅ 通过 |

---

## 四、跨语言对比摘要

| 维度 | ArkTS | Java | Swift | TypeScript |
|------|-------|------|-------|-----------|
| 编译验证 | ✅ es2panda — 15/15 通过 | N/A | N/A | N/A |
| 运行时验证 | ✅ ark VM — 4/4 runtime 通过 | N/A | N/A | N/A |
| Spec 一致性 | ✅ 与 spec §17.13.1 一致 | N/A | N/A | N/A |
| Receiver 函数等价物 | 顶层 `function f(this: T)` | 无等价语法 | extension 方法（语法不同） | 无等价语法 |

---

## 五、分类汇总

| 条目 | 分类 |
|------|------|
| 差异 A：Receiver 函数是 ArkTS 独有的顶层扩展机制 | 符合 ArkTS spec 的语言设计差异 |
| 差异 B：仅顶层 receiver 函数支持方法调用语法 | 符合 ArkTS spec 的语言设计差异 |
| 差异 C：Receiver 函数为静态分发，实例方法优先级更高 | 符合 ArkTS spec 的语言设计差异 |
| 已验证规范一致行为 | 15 项全部通过 |

---

## 六、关联记录

- 章节级异常汇总：[issue_report.md](../../issue_report.md)
- 测试执行报告：[test_report_17.13.1.md](test_report_17.13.1.md)
- 测试设计：[test_design_mindmap_17.13.1.md](test_design_mindmap_17.13.1.md)
- 跨语言对比：[comparison_report_arkts_java_swift.md](comparison_report_arkts_java_swift.md)
