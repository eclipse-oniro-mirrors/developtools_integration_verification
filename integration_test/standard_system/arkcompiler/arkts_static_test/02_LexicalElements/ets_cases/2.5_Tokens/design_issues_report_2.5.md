# 2.5 Tokens - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-22
**测试用例数：** 50（compile-pass: 34, compile-fail: 4, runtime: 12）
**更新版本：** v3.0 - 重新分类：区分"语言设计差异"与"规范一致性问题"
**目的：** 通过 4 类 Token 的系统测试，识别 ArkTS 在 Token 处理方面与 Java/Swift/TS 的行为差异，以及规范与实现的一致性问题。

---

## 一、前言：ArkTS 规范引用要求

> ✅ 本报告中所有差异点必须明确标注规范来源
> ✅ 规范依据来自 `C:/Users/ymwangfa/.opencode/skills/arkts-static-spec/spec/`
> ❌ 不得在没有规范依据的情况下讨论语言设计问题

### 差异分类说明

| 分类 | 说明 | 处理方式 |
|------|------|---------|
| **语言设计差异** | 符合 ArkTS spec 的有意设计，与 Java/Swift/TS 行为不同 | 记录为差异点，无需修改 |
| **规范一致性问题** | ArkTS 实现与 spec 定义不一致 | 需要修复 |
| **待确认问题** | spec 未明确定义，需要补充规范 | 需要 spec 团队确认 |

### ArkTS 关键规范文档

| 文档 | 章节 | 说明 |
|------|------|------|
| spec/lexical.md | §2.5 Tokens | 定义 Token 分类 |
| spec/lexical.md | §2.8 Operators and Punctuators | 定义运算符和标点 |
| spec/lexical.md | §2.9 Names | 定义标识符规则 |

---

## 二、符合 ArkTS Spec 的语言设计差异（与 Java/Swift/TS 不同）

以下差异点是 ArkTS 的有意设计选择，符合 spec 定义，与 Java/Swift/TS 行为不同但不构成设计缺陷。

### 差异 A：支持 === 严格相等运算符，与 Java 不同 ✅ 符合 ArkTS Spec

**用例：** LEX_02_05_020_PASS_LONGEST_MATCH_TRIPLE_EQ

**ArkTS Spec 描述：** spec/lexical.md 列出 === 为合法运算符 Token。

**实际行为（编译通过）：**
```typescript
let result: boolean = 1 === 1  // 严格相等
```

**与业界静态语言对比：**
| 语言 | === 运算符 | 规范依据 |
|------|----------|---------|
| **ArkTS** | ✅ 支持 | spec/lexical.md |
| **Java** | ❌ 不支持 | JLS §3.5 |
| **Swift** | ✅ 支持 | Swift Lang |
| **TypeScript** | ✅ 支持 | ECMAScript |

**差异说明：** ArkTS 选择与 TypeScript/Swift 一致的 === 运算符策略，继承 ECMAScript 标准。这是语言设计选择，不是缺陷。

**分类：** ✅ 符合 ArkTS spec 的语言设计差异（与 TS/Swift 一致）

---

### 差异 B：支持 ?? 空值合并运算符，与 Java 不同 ✅ 符合 ArkTS Spec

**用例：** LEX_02_05_022_PASS_LONGEST_MATCH_NULLISH

**ArkTS Spec 描述：** spec/lexical.md 列出 ?? 为合法运算符 Token。

**实际行为（编译通过）：**
```typescript
let x: number = null ?? 42  // 空值合并
```

**与业界静态语言对比：**
| 语言 | ?? 运算符 | 规范依据 |
|------|----------|---------|
| **ArkTS** | ✅ 支持 | spec/lexical.md |
| **Java** | ❌ 不支持 | JLS §3.5 |
| **Swift** | ✅ 支持 | Swift Lang |
| **TypeScript** | ✅ 支持 | ECMAScript |

**差异说明：** ArkTS 选择与 TypeScript/Swift 一致的 ?? 运算符策略，继承 ECMAScript 标准。这是语言设计选择，不是缺陷。

**分类：** ✅ 符合 ArkTS spec 的语言设计差异（与 TS/Swift 一致）

---

### 差异 C：支持 ?. 可选链运算符，与 Java 不同 ✅ 符合 ArkTS Spec

**用例：** LEX_02_05_038_PASS_OPTIONAL_CHAINING

**ArkTS Spec 描述：** spec/lexical.md 列出 ?. 为合法运算符 Token。

**实际行为（编译通过）：**
```typescript
let city: string = person?.address?.city  // 可选链
```

**与业界静态语言对比：**
| 语言 | ?. 运算符 | 规范依据 |
|------|----------|---------|
| **ArkTS** | ✅ 支持 | spec/lexical.md |
| **Java** | ❌ 不支持 | JLS §3.5 |
| **Swift** | ✅ 支持 | Swift Lang |
| **TypeScript** | ✅ 支持 | ECMAScript |

**差异说明：** ArkTS 选择与 TypeScript/Swift 一致的 ?. 运算符策略，继承 ECMAScript 标准。这是语言设计选择，不是缺陷。

**分类：** ✅ 符合 ArkTS spec 的语言设计差异（与 TS/Swift 一致）

---

### 差异 D：支持模板字面量，与 Java 不同 ✅ 符合 ArkTS Spec

**用例：** LEX_02_05_041_PASS_TEMPLATE_LITERALS

**ArkTS Spec 描述：** spec/lexical.md 列出模板字面量为合法字面量 Token。

**实际行为（编译通过）：**
```typescript
let greeting: string = `Hello, ${name}!`  // 模板字面量
```

**与业界静态语言对比：**
| 语言 | 模板字面量 | 规范依据 |
|------|----------|---------|
| **ArkTS** | ✅ 支持 | spec/lexical.md |
| **Java** | ❌ 不支持 | JLS §3.5 |
| **Swift** | ✅ 支持 | Swift Lang |
| **TypeScript** | ✅ 支持 | ECMAScript |

**差异说明：** ArkTS 选择与 TypeScript/Swift 一致的模板字面量策略，继承 ECMAScript 标准。这是语言设计选择，不是缺陷。

**分类：** ✅ 符合 ArkTS spec 的语言设计差异（与 TS/Swift 一致）

---

### 差异 E：支持 $ 标识符，与 Swift 不同 ✅ 符合 ArkTS Spec

**用例：** LEX_02_05_003_PASS_IDENTIFIER_DOLLAR

**ArkTS Spec 描述：** spec/lexical.md 列出 $ 为合法标识符字符。

**实际行为（编译通过）：**
```typescript
let $element: number = 1  // $ 标识符
```

**与业界静态语言对比：**
| 语言 | $ 标识符 | 规范依据 |
|------|---------|---------|
| **ArkTS** | ✅ 支持 | spec/lexical.md |
| **Java** | ✅ 支持 | JLS §3.8 |
| **Swift** | ❌ 不支持 | Swift Lang |
| **TypeScript** | ✅ 支持 | ECMAScript |

**差异说明：** ArkTS 选择与 TypeScript/Java 一致的 $ 标识符策略。这是语言设计选择，不是缺陷。

**分类：** ✅ 符合 ArkTS spec 的语言设计差异（与 TS/Java 一致）

---

## 三、待确认问题（需要 Spec 团队确认）

### 问题 F：Spec 未列出完整的 Operator 和 Punctuator Token 表 ⚠️ 待确认

**用例：** 多个 compile-pass 用例

**问题描述：** spec/lexical.md §2.5 仅声明 4 类 Token 存在，具体的 Operator/Punctuator 集合需要查看 §2.8。

**规范依据：**
- spec/lexical.md §2.5: 概览
- spec/lexical.md §2.8: 详细

**待确认事项：**
1. §2.5 是否需要增加 Operator/Punctuator 完整速查表？
2. 是否需要在 §2.5 中列出所有运算符和标点符号？

**分类：** ⚠️ 待确认（spec 未提供完整速查表）

---

### 问题 G：最长匹配原则与 char 字面量交互未充分定义 ⚠️ 待确认

**用例：** LEX_02_05_020_PASS_LONGEST_MATCH_TRIPLE_EQ

**问题描述：** spec/lexical.md 声明最长匹配原则，但未明确 char 字面量 `c'A'` 在 tokenization 时的优先级。

**规范依据：**
- spec/lexical.md: "The next token is always the longest sequence of characters that form a valid token."

**待确认事项：**
1. char 字面量前缀 `c` 在最长匹配中的优先级是什么？
2. 当遇到 `let cVar = c'A'` 时，是否会因最长匹配优先识别为 `cvar` 标识符？

**分类：** ⚠️ 待确认（spec 未明确定义 char 字面量优先级）

---

### 问题 H：装饰器 `@` 字符的 Token 归类未明确 ⚠️ 待确认

**用例：** LEX_02_05_028_FAIL_INVALID_AT_CHAR

**问题描述：** spec/lexical.md 未将 `@` 列入 Operator 或 Punctuator，但 §18 Annotations 使用 `@` 表示装饰器/注解。

**规范依据：**
- spec/lexical.md §2.5: 未列出 `@`
- spec/lexical.md §18: 使用 `@` 表示注解

**待确认事项：**
1. `@` 是一个语法标记（syntactic marker）但不是常规 Token？
2. 还是被归为某类 Token？

**分类：** ⚠️ 待确认（spec 未明确定义 `@` 的归类）

---

## 四、与业界静态语言差异点汇总

以下差异点是 ArkTS 与 Java/Swift/TS 的设计选择差异，不构成设计缺陷，但需要开发者了解。

### 4.1 运算符 Token

| 运算符 | ArkTS | Java | Swift | TypeScript | 说明 |
|--------|-------|------|-------|------------|------|
| === | ✅ | ❌ | ✅ | ✅ | ArkTS 与 TS/Swift 一致 |
| !== | ✅ | ❌ | ✅ | ✅ | ArkTS 与 TS/Swift 一致 |
| ?? | ✅ | ❌ | ✅ | ✅ | ArkTS 与 TS/Swift 一致 |
| ?. | ✅ | ❌ | ✅ | ✅ | ArkTS 与 TS/Swift 一致 |
| => | ✅ | ✅ | ❌ | ✅ | ArkTS 与 TS/Java 一致 |
| ++ | ✅ | ✅ | ❌ | ✅ | ArkTS 与 TS/Java 一致 |
| -- | ✅ | ✅ | ❌ | ✅ | ArkTS 与 TS/Java 一致 |

### 4.2 字面量 Token

| 字面量类型 | ArkTS | Java | Swift | TypeScript | 说明 |
|----------|-------|------|-------|------------|------|
| 模板字面量 | ✅ | ❌ | ✅ | ✅ | ArkTS 与 TS/Swift 一致 |
| BigInt | ✅ | ✅ | ✅ | ✅ | 三语言一致 |
| null | ✅ | ✅ | ❌ | ✅ | ArkTS 与 TS/Java 一致 |
| undefined | ✅ | ❌ | ❌ | ✅ | ArkTS 与 TS 一致 |

### 4.3 标识符

| 标识符类型 | ArkTS | Java | Swift | TypeScript | 说明 |
|----------|-------|------|-------|------------|------|
| $ 标识符 | ✅ | ✅ | ❌ | ✅ | ArkTS 与 TS/Java 一致 |
| Unicode 标识符 | ✅ | ✅ | ✅ | ✅ | 三语言一致 |
| 数字开头 | ❌ | ❌ | ❌ | ❌ | 三语言一致 |

---

## 五、已验证 ArkTS 行为（符合 Spec）

以下行为已通过编译期 + 运行时验证，符合 spec/lexical.md 规范：

| 行为 | 用例编号 | 状态 | 规范依据 |
|------|---------|------|---------|
| 简单字母标识符 | 001 | ✅ | spec/lexical.md |
| 含数字标识符 | 002 | ✅ | spec/lexical.md |
| 含 $ 标识符 | 003 | ✅ | spec/lexical.md |
| 含 _ 标识符 | 004 | ✅ | spec/lexical.md |
| 声明关键字 | 005 | ✅ | spec/lexical.md |
| 控制流关键字 | 006 | ✅ | spec/lexical.md |
| 类型声明关键字 | 007 | ✅ | spec/lexical.md |
| 跳转关键字 | 008 | ✅ | spec/lexical.md |
| 算术运算符 | 009 | ✅ | spec/lexical.md |
| 比较运算符 | 010 | ✅ | spec/lexical.md |
| 逻辑运算符 | 011 | ✅ | spec/lexical.md |
| 赋值运算符 | 012 | ✅ | spec/lexical.md |
| 位运算符 | 013 | ✅ | spec/lexical.md |
| 标点符号 | 014 | ✅ | spec/lexical.md |
| 整数字面量 | 015 | ✅ | spec/lexical.md |
| 浮点字面量 | 016 | ✅ | spec/lexical.md |
| 字符串字面量 | 017 | ✅ | spec/lexical.md |
| 布尔字面量 | 018 | ✅ | spec/lexical.md |
| null/undefined | 019 | ✅ | spec/lexical.md |
| 最长匹配 === | 020 | ✅ | spec/lexical.md |
| 最长匹配 >>> | 021 | ✅ | spec/lexical.md |
| 最长匹配 ?? ?. | 022 | ✅ | spec/lexical.md |
| 最长匹配 => | 023 | ✅ | spec/lexical.md |
| 最长匹配 ++ -- | 024 | ✅ | spec/lexical.md |
| Token 紧凑连接 | 025 | ✅ | spec/lexical.md |
| 4 类 Token 混合 | 026 | ✅ | spec/lexical.md |
| 数字后接字母失败 | 027 | ✅ | spec/lexical.md |
| @ 字符失败 | 028 | ✅ | spec/lexical.md |
| 未闭合字符串失败 | 029 | ✅ | spec/lexical.md |
| 非法转义失败 | 030 | ✅ | spec/lexical.md |
| === 严格相等 | 031 | ✅ | spec/lexical.md |
| 位运算 | 032 | ✅ | spec/lexical.md |
| 字面量值 | 033 | ✅ | spec/lexical.md |
| 复合赋值 | 034 | ✅ | spec/lexical.md |
| 关键字控制流 | 035 | ✅ | spec/lexical.md |
| instanceof | 036 | ✅ | spec/lexical.md |

---

## 六、差异分类汇总

| 分类 | 数量 | 差异列表 |
|------|------|---------|
| ✅ 符合 ArkTS Spec 的语言设计差异 | 5 | 差异 A（===）、差异 B（??）、差异 C（?.）、差异 D（模板字面量）、差异 E（$ 标识符） |
| ⚠️ 待确认问题 | 3 | 问题 F（Token 表）、问题 G（char 字面量优先级）、问题 H（@ 归类） |
| 与业界静态语言差异点 | 多项 | 见第四章汇总表 |

---

## 七、建议

### 7.1 增加 Token 速查表

spec/lexical.md §2.5 应增加 Operator/Punctuator 完整速查表，详细规则保留在 §2.8。

### 7.2 明确 char 字面量优先级

spec/lexical.md 应明确 char 字面量前缀 `c` 在最长匹配中的优先级。

### 7.3 明确 @ 归类

spec/lexical.md 应明确 `@` 字符的 Token 归类（建议归入 Punctuator）。

---

## 八、用例索引

| 用例 ID | 差异/问题 | 分类 | 关联规范 |
|---------|----------|------|---------|
| LEX_02_05_020 | 差异 A: === 严格相等 | ✅ 语言设计差异 | spec/lexical.md |
| LEX_02_05_022 | 差异 B: ?? 空值合并 | ✅ 语言设计差异 | spec/lexical.md |
| LEX_02_05_038 | 差异 C: ?. 可选链 | ✅ 语言设计差异 | spec/lexical.md |
| LEX_02_05_041 | 差异 D: 模板字面量 | ✅ 语言设计差异 | spec/lexical.md |
| LEX_02_05_003 | 差异 E: $ 标识符 | ✅ 语言设计差异 | spec/lexical.md |
| - | 问题 F: Token 表 | ⚠️ 待确认 | spec/lexical.md |
| LEX_02_05_020 | 问题 G: char 字面量优先级 | ⚠️ 待确认 | spec/lexical.md |
| LEX_02_05_028 | 问题 H: @ 归类 | ⚠️ 待确认 | spec/lexical.md |

---

## 九、Cross-Language 对比表格

### 差异 A: === 严格相等（与 TS/Swift 一致，与 Java 不同）

| 语言 | === 运算符 | 规范依据 |
|------|----------|---------|
| **ArkTS** | ✅ 支持 | spec/lexical.md |
| **Java** | ❌ 不支持 | JLS §3.5 |
| **Swift** | ✅ 支持 | Swift Lang |
| **TypeScript** | ✅ 支持 | ECMAScript |

### 差异 B: ?? 空值合并（与 TS/Swift 一致，与 Java 不同）

| 语言 | ?? 运算符 | 规范依据 |
|------|----------|---------|
| **ArkTS** | ✅ 支持 | spec/lexical.md |
| **Java** | ❌ 不支持 | JLS §3.5 |
| **Swift** | ✅ 支持 | Swift Lang |
| **TypeScript** | ✅ 支持 | ECMAScript |

### 差异 C: ?. 可选链（与 TS/Swift 一致，与 Java 不同）

| 语言 | ?. 运算符 | 规范依据 |
|------|----------|---------|
| **ArkTS** | ✅ 支持 | spec/lexical.md |
| **Java** | ❌ 不支持 | JLS §3.5 |
| **Swift** | ✅ 支持 | Swift Lang |
| **TypeScript** | ✅ 支持 | ECMAScript |

### 差异 D: 模板字面量（与 TS/Swift 一致，与 Java 不同）

| 语言 | 模板字面量 | 规范依据 |
|------|----------|---------|
| **ArkTS** | ✅ 支持 | spec/lexical.md |
| **Java** | ❌ 不支持 | JLS §3.5 |
| **Swift** | ✅ 支持 | Swift Lang |
| **TypeScript** | ✅ 支持 | ECMAScript |

### 差异 E: $ 标识符（与 TS/Java 一致，与 Swift 不同）

| 语言 | $ 标识符 | 规范依据 |
|------|---------|---------|
| **ArkTS** | ✅ 支持 | spec/lexical.md |
| **Java** | ✅ 支持 | JLS §3.8 |
| **Swift** | ❌ 不支持 | Swift Lang |
| **TypeScript** | ✅ 支持 | ECMAScript |

---

**报告生成人：** GLM5.1
**最后更新：** 2026-06-22
**下一步行动：**
1. 增加 Token 速查表
2. 明确 char 字面量优先级
3. 明确 @ 归类
