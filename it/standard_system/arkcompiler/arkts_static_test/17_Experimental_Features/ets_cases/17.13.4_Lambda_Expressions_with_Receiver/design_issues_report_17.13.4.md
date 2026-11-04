# 17.13.4 Lambda Expressions with Receiver — ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-25
**测试用例数：** 13（6 compile-pass + 4 compile-fail + 3 runtime）
**通过率：** 92.3%（12/13，1 例 SPEC 不一致）
**编译器：** es2panda --extension=ets (Linux native)
**Spec 依据：** arktsspecification.md §17.13.4

## 报告分类口径

| 分类 | 含义 | 处理方式 |
|------|------|----------|
| 符合 ArkTS spec 的语言设计差异 | 行为与 Java/Swift 不同，但符合 ArkTS spec 或当前明确语义 | 不标为缺陷，仅记录差异 |
| Spec 与实现不一致 | 用例与 spec 要求不一致，且当前实现未按 spec 报错/运行 | 保留 FAIL 用例并记录 issue_report |
| 已验证规范一致行为 | 用例验证 ArkTS 行为符合 spec | 记录为通过项 |

---

## 一、符合 ArkTS spec 的语言设计差异

### 差异 A：带 receiver 的 lambda 表达式 `(this: T) => { ... }` 是 ArkTS 独有的匿名函数形式

**分类：** 符合 ArkTS spec 的语言设计差异

#### Spec 依据

§17.13.4 定义了带 receiver 的 lambda 表达式语法：`(this: ReceiverType, paramList?) => { ... }`。在 lambda body 中可以访问 `this` 来引用 receiver 对象的成员。

#### 实测行为

```typescript
class Greeter { public name: string = "World" }

let greet = (this: Greeter): void => {
  console.log("Hello, " + this.name)
}

let g = new Greeter()
greet(g)  // ✅ 普通调用语法——输出 "Hello, World"
// g.greet() // ❌ lambda 变量不支持方法调用语法（实测结果）
```

#### 跨语言对比

| 语言 | 带 receiver 的匿名函数/lambda | 说明 |
|------|---------------------------|------|
| ArkTS | `(this: T, ...) => { ... }` | 内置语法，body 中可通过 this 访问 receiver |
| Java | N/A — 无等价语法 | Java lambda `(params) -> { ... }` 无 receiver 概念 |
| Swift | N/A — 无等价语法 | Swift closure `{ (self: T) in ... }` 中的 self 仅是参数名，非 receiver 语义 |
| TypeScript | N/A — 无此语法 | TS 的 this 参数在箭头函数中无特殊含义 |

**说明：** Java 的 lambda 表达式完全不具备 receiver 概念——`(String s) -> s.length()` 中的第一个参数只是普通参数。Swift 闭包可以命名参数为 `self`，但没有语言级 receiver 语义支持。 的 "Function Literals with Receiver"（`val greet: Greeter.() -> Unit = { ... }`）是最接近 ArkTS 的设计，但两者语法差异显著。

---

### 差异 B：Lambda 变量不支持方法调用语法 `obj.lambdaVar()`

**分类：** 符合 ArkTS spec 的语言设计差异

#### 实测行为

```typescript
let fn: (this: C) => void = (this: C): void => { this.value++ }
let c = new C()
// c.fn()  // ❌ 编译错误——lambda 变量不支持方法调用语法
fn(c)      // ✅ 编译通过——普通调用语法
```

与顶层 receiver 函数不同（支持 `obj.f()` 方法调用语法），lambda 变量只能通过普通调用语法使用。这是 spec 明确的设计限制。实测结果与 spec 一致。

---

## 二、Spec 与实现不一致

### 不一致 A：原始类型作为 lambda receiver 类型——spec 要求报错但编译器通过 ⚠️

**分类：** Spec 与实现不一致

**用例 ID：** EXP2_17_13_4_007_FAIL_LAMBDA_PRIMITIVE_RECEIVER

**问题：** spec 要求原始类型不能作为 lambda receiver 类型并应产生编译错误。但 es2panda 2026-06-25 实测结果为此用例编译通过，未报错。

**关联：** 这与 §17.13.2 的 int/string receiver 异常通过问题一致（同根因——es2panda 未实现 receiver 类型的白名单检查）。

**建议：** es2panda 应在 lambda 表达式的 receiver 类型位置也实现白名单检查。

---

## 三、已验证规范一致行为

经 es2panda + ark VM 实测，以下行为与 ArkTS spec §17.13.4 一致：

| 行为 | 验证方式 | 结果 |
|------|---------|------|
| 基本 lambda receiver 定义和使用 | compile-pass (001) | ✅ 通过 |
| lambda 通过普通调用语法调用 | compile-pass (002) | ✅ 通过 |
| lambda 通过普通调用语法（另一种写法） | compile-pass (003) | ✅ 通过 |
| lambda 访问 receiver 成员（显式 this） | compile-pass (004) | ✅ 通过 |
| lambda 带额外参数 | compile-pass (005) | ✅ 通过 |
| lambda 赋值给变量 | compile-pass (006) | ✅ 通过 |
| 外围 this 在 receiver lambda 中 (ESE0202) | compile-fail (008) | ✅ 编译错误 |
| receiver lambda 用于无 receiver 上下文 (ESE0318) | compile-fail (009) | ✅ 编译错误 |
| 无效 lambda receiver 语法 (ESY0158) | compile-fail (010) | ✅ 编译错误 |
| 原始类型作为 lambda receiver（spec 要求报错） | compile-fail (007) | ⚠️ 异常通过 |
| lambda receiver 运行时执行验证 | runtime (011) | ✅ 通过 |
| this 绑定运行时验证 | runtime (012) | ✅ 通过 |
| 两种调用语法运行时验证 | runtime (013) | ✅ 通过 |

---

## 四、跨语言对比摘要

| 维度 | ArkTS | Java | Swift | TypeScript |
|------|-------|------|-------|-----------|
| 编译验证 | ✅ es2panda — 12/13 通过（1 例 SPEC 不一致） | N/A | N/A | N/A |
| 运行时验证 | ✅ ark VM — 3/3 runtime 通过 | N/A | N/A | N/A |
| Spec 一致性 | ⚠️ 与 spec 部分不一致（原始类型 receiver 未拦截） | N/A | N/A | N/A |
| Lambda receiver 语法 | `(this: T) => { ... }` | 无等价语法 | 无等价语法 | 无等价语法 |

---

## 五、分类汇总

| 条目 | 分类 |
|------|------|
| 差异 A：带 receiver 的 lambda 是 ArkTS 独有的匿名函数形式 | 符合 ArkTS spec 的语言设计差异 |
| 差异 B：Lambda 变量不支持方法调用语法 | 符合 ArkTS spec 的语言设计差异 |
| 不一致 A：原始类型作为 lambda receiver 异常通过 | Spec 与实现不一致 |
| 已验证规范一致行为 | 9 项通过（cp 6 + cf 3 预期报错） |

---

## 六、关联记录

- 章节级异常汇总：[issue_report.md](../../issue_report.md)
- 测试执行报告：[test_report_17.13.4.md](test_report_17.13.4.md)
- 测试设计：[test_design_mindmap_17.13.4.md](test_design_mindmap_17.13.4.md)
- 跨语言对比：[comparison_report_arkts_java_swift.md](comparison_report_arkts_java_swift.md)
