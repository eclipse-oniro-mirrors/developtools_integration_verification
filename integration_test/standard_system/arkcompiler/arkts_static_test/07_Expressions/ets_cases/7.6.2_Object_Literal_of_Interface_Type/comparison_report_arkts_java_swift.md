# 7.6.2 Object Literal of Interface Type — 三语言对比报告

## 1. 概览

Object Literal of Interface Type 定义了接口类型上下文推断对象字面量类型（匿名类）的规则。三语言差异显著：

| 语言 | 定位 |
|------|------|
| **ArkTS** | 原生支持接口对象字面量：`let b: Person = {name: "Bob", age: 25}`，隐式创建匿名类实现接口 |
| **Java** | 无对象字面量语法，使用匿名内部类 `new Person() { ... }` 实现接口 |
| **Swift** | 无对象字面量语法，使用具体类实现协议 |

## 2. 章节对应关系

| 规则 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 接口上下文推断 | `{name: "Bob", age: 25}` | `new Person() { ... }` | `PersonImpl()` |
| 可选属性跳过 | `sex?` → 跳过为 undefined | `null` 默认值 | `nil` 默认值 |
| 非可选不可跳过 | 编译时错误 | 需实现 | 需实现 |
| 方法实现 | `{ method() {} }` | `new I() { void method() {} }` | 具体类实现 |
| 默认方法跳过 | 自动继承 | `default` 方法自动继承 | 协议扩展自动继承 |
| 默认方法覆盖 | `{ method() { ... } }` | `@Override` | 类中重写 |
| override-compatible | 宽参数类型实现多个重载 | 多态支持 | 泛型+协议 |
| this 引用 | 匿名类实例 | 匿名类实例 | self |
| 新方法禁止 | 编译时错误 | 可加（不报错） | 可加（不报错） |
| setter-only 属性 | 可写不可读 | 仅有 setter 方法 | 需 { set } |
| getter-only 属性 | 可读不可写 | 仅有 getter 方法 | 需 { get } |
| 普通属性 | 可读写 | getter+setter | get+set |
| getter/setter 类型一致 | 编译时强制 | 方法签名不同无强制 | 协议要求一致 |

## 3. 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 语法简洁性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ |
| 可选属性处理 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| 默认方法兼容 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 读写属性控制 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| 新方法检查 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ |

## 4. 用例对照

### 4.1 对象字面量语法（ArkTS 独有）

| 语言 | 代码 | 说明 |
|------|------|------|
| ArkTS | `let b: Person = {name: "Bob", age: 25}` | 原生隐式匿名类 |
| Java | `Person p = new Person() { ... }` | 匿名内部类（冗长） |
| Swift | `let p = PersonImpl()` | 需预定义实现类 |

### 4.2 属性读写形式

ArkTS 在接口中区分 setter-only / getter-only / readonly / regular 四种属性形式，每种决定了匿名类的字段行为：

| 形式 | 创建 | 读取 | 写入 | ArkTS | Java | Swift |
|------|------|------|------|-------|------|-------|
| setter-only | `{attr: 42}` | ❌ 编译错误 | ❌ 无公开方法 | ✅ | ❌ 无等价 | ❌ 属性至少需 get |
| getter-only | `{attr: 42}` | ✅ 有值 | ❌ 编译错误 | ✅ | ❌ 方法签名不同 | ✅ `{ get }` |
| readonly | `{attr: 42}` | ✅ 有值 | ❌ 编译错误 | ✅ | `final` 字段 | `let` |
| regular | `{attr: 42}` | ✅ | ✅ | ✅ | ✅ getter+setter | ✅ get+set |

### 4.3 新方法检查（ArkTS 独有）

ArkTS 禁止在对象字面量中定义接口不存在的方法，Java/Swift 允许：

| 语言 | `const i: I = { foo(): void {} }`（`interface I {}`） |
|------|------------------------------------------------------|
| ArkTS | ❌ 编译时错误（严格检查） |
| Java | ✅ 匿名类可加额外方法 |
| Swift | ✅ 协议实现可加额外方法 |

### 4.4 Override-compatible 签名

ArkTS 允许单个更宽参数类型的方法实现多个重载，Java/Swift 通过多态/泛型实现类似效果：

| 语言 | 机制 |
|------|------|
| ArkTS | `{ foo(p: Base): Drv1 {} }` 同时实现 `foo(Drv1)→Base` 和 `foo(Drv2)→Base` |
| Java | 单方法通过多态自动覆盖所有参数类型 |
| Swift | 关联类型或泛型约束 |

## 5. 三环境实测结果

由于接口对象字面量语法为 ArkTS 独有特性，Java 和 Swift 无直接等价语法，因此本节不进行三语言实测对比。相关 cross_lang_verify 目录包含各语言对应匿名类/协议实现方式的参考实现。

## 6. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 接口实现简洁性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ |
| 属性形式丰富度 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ |
| 默认方法支持 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 编译时安全检查 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| 匿名类能力 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐ |

## 7. 核心结论

1. **ArkTS 接口对象字面量语法是独有优势**：Java 和 Swift 均需更冗长的匿名类/协议实现。
2. **属性读写形式的细粒度控制**：setter-only/getter-only/readonly/regular 四种形式在对象字面量中编译时检查，Java/Swift 需通过方法签名约束。
3. **新方法检查更严格**：ArkTS 禁止对象字面量引入新方法，Java/Swift 允许。
4. **override-compatible 签名**：ArkTS 的宽参数类型实现多继承重载的设计简洁高效。
5. **可选属性处理**：三语言均用 undefined/null/nil 表示省略的可选属性。

## 8. ArkTS 设计建议

- 当前设计完善，无缺陷。
- 对象字面量+匿名类的隐式创建机制显著减少了样板代码。
- 编译时多维检查（属性名、方法实现、读写形式、类型匹配）提供了系统的安全保证。

## 9. 三环境实测验证

实测代码和报告见 `cross_lang_verify/` 目录（2026-07-28 实测）：

| 文件 | 实测结果 |
|------|:--------:|
| `JavaInterfaceLiteralTest.java` + `.class` | 6/6 ✅ |
| `SwiftInterfaceLiteralTest.swift` + 二进制 | 6/6 ✅ |
| `verification_report.md` | 三环境结果对照 |

**实测关键验证点：**
- ArkTS 接口对象字面量语法独占：`{name:"Bob",age:25}` — Java 匿名内部类 / Swift struct 实现类
- 默认方法跳过：Java `default` 方法 / Swift `extension` 协议扩展（语义等价）
- 默认方法覆盖：三语言均支持
