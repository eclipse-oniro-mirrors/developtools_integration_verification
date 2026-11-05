# 8.14 throw Statements - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-18
**测试用例数：** 19（7 compile-pass + 6 compile-fail + 6 runtime）
**目的：** 通过用例执行（编译期 + 运行时）+ 跨语言对比，识别 ArkTS throw 语句作为静态语言的设计问题。

---

## 一、与业界静态语言的差异点

### 差异点 1：Error.code 访问器继承冲突 ⭐ MEDIUM
**用例：** STMT_08_14_010（间接相关）
**实际行为/预期行为：** ArkTS 标准库 `Error` 类（`std.core.Error`）定义了 `get code(): int` 和 `set code(val: int)` 访问器属性，由私有字段 `code_: int` 支持。任何直接或间接继承 `Error` 的用户子类都继承此访问器，且无法用同名字段声明遮蔽它。试图在子类中定义 `public code: int` 或不兼容类型（如 `string`）将与继承的 getter/setter 产生编译时冲突。此约束是标准库设计的结果，但规范 STATEMENTS.md §8.14 并未提及——该节只讨论了 throw 表达式的类型约束（必须可赋值给 `Error`），而未涉及 `Error` 基类本身的成员签名。

**Error 类 code 访问器定义**（`std/core/Error.ets` 第 142–155 行）：

```typescript
get code(): int {
    return this.code_
}

set code(val: int) {
    this.code_ = val
}
```

**实际影响：**

1. 调用 `new Error("message")`（不传 code 参数）时，`code` 隐式设置为 `0`（来自内部构造函数链：`this("Error", 0, message, options)`）。用户访问已捕获错误的 `.code` 属性时返回 `0`，并非 `undefined`，这可能出人意料。
2. 自定义 Error 子类不能用简单字段声明`code`属性——必须使用与继承的 getter/setter 兼容的类型（`int`）。在用例 STMT_08_14_010 中，子类变通使用了 `errCode` 而非 `code` 以避免冲突。
3. 直接使用 `new Error("msg")` 时无法设置字符串类型的错误代码——任何希望在自定义 Error 子类中使用 `code: string` 的场景都与继承签名冲突。

**对比：**

| 语言 | Error 基类 code 属性 | 子类可否覆盖 |
|------|---------------------|-------------|
| **ArkTS** | `get/set code(): int`（访问器），始终存在，默认为 `0` | 否——访问器已继承；字段声明与访问器冲突 |
| **Java** | `Throwable` 无 `code` 属性；异常代码需自行实现（无冲突风险） | 是——子类可自由添加任意命名字段 |
| **Swift** | `Error` 协议不要求 `code` 字段；相关类型如 `NSError` 使用 `code: Int` | 是——采用协议合规方式，`enum` 可包含关联值，无访问器继承问题 |

**评价/建议：**
这是 ArkTS 标准库 `Error` 类的设计特性，在规范 §8.14 层面表现为实际限制，但规范本身未作说明。规范中关于 throw 表达式类型必须可赋值给 `Error` 的约束，与 `Error` 基类实际提供的 API 表面之间存在文档断层——开发者阅读规范时无法得知 throw 机制与 Error 成员签名的交互细节。

建议在 STATEMENTS.md §8.14 或配套标准库文档中记录：
- `Error` 类提供 `code: int` 作为内置访问器属性
- 子类定义同名 `code` 字段会与继承访问器冲突
- 若需存储自定义错误代码，用户应使用替代名称（如 `errCode`），如用例 STMT_08_14_010 所示

---

### 跨章节关联问题检查

以下为全报告范围内已知的跨章节设计问题，逐项检查与 §8.14 的相关性：

| 跨章节问题 | 涉及章节 | 是否影响 §8.14 | 说明 |
|-----------|---------|-----------------|------|
| **STMT-I1**：Block 内 type 声明 spec/impl 不一致 | 8.3 | **否** | throw 语句不涉及 block 内 type 别名声明，此问题范围限定于 §8.3 |
| **STMT-I2**：Label 未使用不强制报错 | 8.6 | **否** | throw 语句不使用 label 语法，此问题范围限定于 §8.6 |
| **逗号运算符仅限于 for 循环** | 8.2, 8.11 | **否（间接约束）** | 逗号运算符限制是全局 ArkTS 规则，throw 表达式同样受此约束，但 throw 表达式本身是单一表达式，不涉及逗号运算符场景 |
| **null case 类型收窄与直接 new** | 8.13 | **否** | 此问题涉及 switch 语句的 null case 标签与 instanceof 类型收窄的交互，与 throw 语句无直接关联 |
| **char 与 int 在 switch 中可比较** | 8.13 | **否** | 此问题限定于 switch 语句的 case 标签类型检查，与 throw 语句无关 |

---

## 二、符合ArkTS spec的语言设计差异（与规范一致）

| 用例 ID | 行为描述 | 状态 |
|---------|----------|------|
| STMT_08_14_001 | 直接抛出 Error 实例 `throw new Error()` | ✅ 一致 |
| STMT_08_14_002 | 通过 Error 类型变量抛出 `throw e` | ✅ 一致 |
| STMT_08_14_003 | 抛出自定义 Error 子类（编译通过） | ✅ 一致 |
| STMT_08_14_004 | 抛出标准 Error 子类 RangeError | ✅ 一致 |
| STMT_08_14_005 | 抛出 string 类型（编译拒绝） | ✅ 一致 |
| STMT_08_14_006 | 抛出 null（编译拒绝） | ✅ 一致 |
| STMT_08_14_007 | 抛出 undefined（编译拒绝） | ✅ 一致 |
| STMT_08_14_008 | 单层 try-catch 捕获 throw，运行时验证 | ✅ 一致 |
| STMT_08_14_009 | catch 中 rethrow 由外层 catch 捕获 | ✅ 一致 |
| STMT_08_14_010 | Error 子类带额外属性（errCode, timestamp）后 throw，类型仍可赋值给 Error | ✅ 一致 |
| STMT_08_14_011 | return 之后的 throw 不可达（编译通过，死代码不执行） | ✅ 一致 |
| STMT_08_14_012 | 抛出 number 类型（编译拒绝） | ✅ 一致 |
| STMT_08_14_013 | 抛出 boolean 类型（编译拒绝） | ✅ 一致 |
| STMT_08_14_014 | 嵌套函数内 throw 传播至外层 try-catch | ✅ 一致 |
| STMT_08_14_015 | 多层嵌套 try-catch，throw 穿透传播 | ✅ 一致 |
| STMT_08_14_016 | throw 后控制即时转移（后续语句不执行） | ✅ 一致 |
| STMT_08_14_017 | throw Error 时使用字符串拼接构造消息，类型仍为 Error | ✅ 一致 |
| STMT_08_14_018 | 深层嵌套 throw 经多级调用栈传播 | ✅ 一致 |
| STMT_08_14_019 | 抛出普通对象（编译拒绝） | ✅ 一致 |

### 评估检查点

| 检查点 | 结果 |
|--------|------|
| throw 表达式类型必须可赋值给 Error | ✅ 符合规范，001/002/003/004/010/017 验证通过 |
| throw 非 Error 类型（string/null/undefined/number/boolean/plain object）编译拒绝 | ✅ 符合规范，005/006/007/012/013/019 验证通过 |
| throw 后控制即时转移，后续语句不可达 | ✅ 符合规范，011/016 验证通过 |
| 单层 try-catch 正确捕获 | ✅ 符合规范，008 验证通过 |
| catch 内 rethrow 外层捕获 | ✅ 符合规范，009 验证通过 |
| 嵌套函数内 throw 传播 | ✅ 符合规范，014 验证通过 |
| 多层嵌套 try-catch 传播 | ✅ 符合规范，015/018 验证通过 |
| Error 子类扩展字段不影响赋值兼容性 | ✅ 符合规范，010 验证通过 |

---

## 三、严重性等级总览

| 严重性 | 数量 | 涉及用例 |
|--------|------|----------|
| ⭐ HIGH | 0 | — |
| ⭐ MEDIUM | 1 | STMT_08_14_010（间接）—— Error.code 访问器继承冲突 |
| 设计观察 | 0 | — |
| 设计观察（非问题） | 2 | A、B |

---

## 四、跨语言对比结论

### 设计观察 A：严格限定 throw 类型为 Error 及其子类

ArkTS 要求 `throw` 表达式类型必须可赋值给 `Error`，这与 Java 和 Swift 有显著差异：

| 语言 | throw 类型约束 | 备注 |
|------|---------------|------|
| **ArkTS** | 仅允许 `Error` 及其子类 | 明确禁止 `null`、`undefined`、`string`、`number`、`boolean`、普通对象 |
| **Java** | 仅允许 `Throwable` 及其子类（`Exception`, `Error`, `RuntimeException` 等） | 不允许 `throw` 任意对象 |
| **Swift** | 任何符合 `Error` 协议的类型均可抛出 | 通常为 `enum` 或 `struct` |

**评价：** 这是合理的安全设计，缩小了 throw 的表达范围，但增强了类型安全性。与 Java 的受检异常设计不同，ArkTS 不区分受检/非受检异常。新增用例（012/013/019）进一步验证了 ArkTS 对更多非 Error 类型（number、boolean、普通对象）的编译期拒绝，约束覆盖完整。

### 设计观察 B：null 和 undefined 的显式拒绝

ArkTS 在规范中明确禁止 `throw null` 和 `throw undefined`，并产生编译时错误。

| 语言 | `throw null` / `throw undefined` | 检测时机 |
|------|----------------------------------|----------|
| **ArkTS** | ❌ 编译拒绝 | 编译期 |
| **Java** | `throw null` 允许（运行时抛 `NullPointerException`） | 运行时 |
| **Swift** | ❌ 不允许 `throw nil`（`Error` 协议要求具体值） | 编译期 |

**评价：** ArkTS 在编译期就拦截了 `null`/`undefined` 抛出，优于 Java 的运行时才暴露问题。

### Error 基类 API 表面对比

| 特性 | ArkTS Error | Java Throwable | Swift Error |
|------|------------|---------------|-------------|
| 内置 code 属性 | `get/set code(): int`，始终存在 | 无 | 无协议要求（由合规类型自行决定） |
| code 默认值 | `0`（通过构造函数链） | 不适用 | 不适用 |
| 子类覆盖 code | 冲突（访问器继承） | 自由 | 自由 |
| 构造函数 | 需要 code (int)、message、options | message、cause | 由合规类型自行定义 |

---

## 五、改进方向建议

| 维度 | 评价 |
|------|------|
| 与规范一致性 | 完全一致（19/19 执行 100% 通过） |
| 设计严密性 | 良好 — 编译期拦截 null/undefined/number/boolean/普通对象 抛出 |
| Java/Swift 对比 | ArkTS 约束介于 Java（Throwable 层级）与 Swift（Error 协议）之间 |
| Error 基类文档化 | ⚠️ 待改善 — code 访问器继承冲突需在规范中明确说明 |

### 短期建议
- 在 STATEMENTS.md §8.14 中添加关于 `Error` 基类成员签名（尤其是 `code: int` 访问器）的说明，避免开发者误用 `code` 字段名导致与继承访问器冲突。
- 纠正 STMT_08_14_010 测试注释中 `@note` 所述的"子类扩展字段不影响对 Error 的赋值兼容性"——虽然确实不影响赋值兼容性，但应同时说明为什么用例使用 `errCode` 而非 `code`。

### 中期建议
- 可考虑补充更多 Error 子类（如 `TypeError`、`SyntaxError` 等）的覆盖测试，验证子类继承链上的 throw 行为是否始终受编译期约束。
- 补充 `e.code` 属性在 catch 块中的访问测试，确保 Error.code 访问器在异常处理流程中行为一致（关联 §8.15.1）。

### 长期建议
- 关注 ArkTS 未来是否会引入类似 Java 受检异常的机制（checked exceptions），如需引入则应在规范中明确 throw 表达式的类型传播规则。
- 评估 `Error.code` 访问器设计：若 ArkTS 社区更倾向于在 Error 子类中自由定义 `code` 字段（而非受限于继承的 `int` 类型访问器），考虑是否将 `code` 从 `Error` 基类移除，改由 `BusinessError` 等子类专门承担错误码职责。
