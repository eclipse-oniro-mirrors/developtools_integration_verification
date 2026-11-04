# 2.6 Identifiers - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-22
**测试用例数：** 52（compile-pass: 30, compile-fail: 13, runtime: 9）
**更新版本：** v3.0 - 重新分类：区分"语言设计差异"与"规范一致性问题"
**目的：** 通过 IdentifierStart/IdentifierPart 全文法覆盖，识别 ArkTS 在标识符处理方面与 Java/Swift/TS 的行为差异，以及规范与实现的一致性问题。

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
| spec/lexical.md | §2.6 Identifiers | 定义标识符规则 |
| spec/lexical.md | §2.9 Names | 定义名称规则 |
| spec/types.md | §3.2 Primitive Types | 定义类型关键字 |

---

## 二、符合 ArkTS Spec 的语言设计差异（与 Java/Swift/TS 不同）

以下差异点是 ArkTS 的有意设计选择，符合 spec 定义，与 Java/Swift/TS 行为不同但不构成设计缺陷。

### 差异 A：支持 ZWJ/ZWNJ 在标识符中，与 Java/Swift 不同 ✅ 符合 ArkTS Spec

**用例：** LEX_02_06_011_PASS_ZWJ_IN_PART, LEX_02_06_037_RT_ZWJ_IDENTIFIER

**ArkTS Spec 描述：** spec/lexical.md 列出 ZWJ (U+200D) 和 ZWNJ (U+200C) 为合法 IdentifierPart 字符。

**实际行为（编译通过）：**
```typescript
let aZWJb: int = 100   // a + U+200D + b
let aZWNJb: int = 200  // a + U+200C + b
// 是不同变量
```

**与业界静态语言对比：**
| 语言 | ZWJ/ZWNJ 在标识符 | 规范依据 |
|------|-----------------|---------|
| **ArkTS** | ✅ 支持 | spec/lexical.md |
| **Java** | ❌ 不支持 | JLS §3.8 |
| **Swift** | ❌ 不支持 | Swift Lang |
| **TypeScript** | ✅ 支持 | ECMAScript |

**差异说明：** ArkTS 选择与 TypeScript 一致的 ZWJ/ZWNJ 策略，继承 ECMAScript 标准。这是语言设计选择，不是缺陷。

**分类：** ✅ 符合 ArkTS spec 的语言设计差异（与 TS 一致）

---

### 差异 B：支持 \u{...} 扩展转义标识符，与 Java/Swift 不同 ✅ 符合 ArkTS Spec

**用例：** LEX_02_06_009_PASS_UESCAPE_BRACE_START

**ArkTS Spec 描述：** spec/lexical.md 列出 \u{...} 为合法 IdentifierStart 转义形式。

**实际行为（编译通过）：**
```typescript
let \u{41}val: int = 2  // 扩展转义，等价于 Aval
```

**与业界静态语言对比：**
| 语言 | \u{...} 转义 | 规范依据 |
|------|------------|---------|
| **ArkTS** | ✅ 支持 | spec/lexical.md |
| **Java** | ❌ 不支持 | JLS §3.8 |
| **Swift** | ❌ 不支持 | Swift Lang |
| **TypeScript** | ✅ 支持 | ECMAScript |

**差异说明：** ArkTS 选择与 TypeScript 一致的 \u{...} 转义策略，继承 ECMAScript 标准。这是语言设计选择，不是缺陷。

**分类：** ✅ 符合 ArkTS spec 的语言设计差异（与 TS 一致）

---

### 差异 C：支持 $ 标识符，与 Swift 不同 ✅ 符合 ArkTS Spec

**用例：** LEX_02_06_006_PASS_DOLLAR_START

**ArkTS Spec 描述：** spec/lexical.md 列出 $ 为合法 IdentifierStart 字符。

**实际行为（编译通过）：**
```typescript
let $x: int = 1
let $: int = 2
let $$: int = 3
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

### 差异 D：支持 Unicode 转义等价性，与 Java 一致 ✅ 符合 ArkTS Spec

**用例：** LEX_02_06_035_RT_UESCAPE_EQUIVALENCE

**ArkTS Spec 描述：** spec/lexical.md 定义 Unicode 转义序列与直接字符等价。

**实际行为（运行时验证）：**
```typescript
let \u0041var: int = 100  // 标识符 = "Avar"（Unicode 转义解码）
Avar = Avar + 50           // ✅ 同一变量
```

**与业界静态语言对比：**
| 语言 | \u0041 ≡ A | 规范依据 |
|------|----------|---------|
| **ArkTS** | ✅ 支持 | spec/lexical.md |
| **Java** | ✅ 支持 | JLS §3.8 |
| **Swift** | ❌ 不支持 | Swift Lang |
| **TypeScript** | ✅ 支持 | ECMAScript |

**差异说明：** ArkTS 选择与 TypeScript/Java 一致的 Unicode 转义等价性策略。这是语言设计选择，不是缺陷。

**分类：** ✅ 符合 ArkTS spec 的语言设计差异（与 TS/Java 一致）

---

### 差异 E：类型关键字保护比 TypeScript 更严格 ✅ 符合 ArkTS Spec

**用例：** LEX_02_06_031_FAIL_TYPE_KEYWORD

**ArkTS Spec 描述：** spec/types.md 定义 int/byte/char 等为类型关键字。

**实际行为（编译失败）：**
```typescript
let int: int = 1   // ❌ ArkTS 编译失败
```

**与业界静态语言对比：**
| 关键字 | ArkTS | TypeScript | Java |
|-------|-------|-----------|------|
| `int` | ❌ | ✅ | ❌ |
| `double` | ❌ | ✅ | ❌ |
| `byte` | ❌ | ✅ | ❌ |
| `char` | ❌ | ✅ | ❌ |
| `string` | ⚠️ | ❌ | ✅ |

**差异说明：** ArkTS 选择比 TypeScript 更严格的关键字保护策略。这是语言设计选择，不是缺陷。

**分类：** ✅ 符合 ArkTS spec 的语言设计差异（比 TS 更严格）

---

## 三、待确认问题（需要 Spec 团队确认）

### 问题 F：Unicode 类别未在 spec 中详尽列出 ⚠️ 待确认

**用例：** 多个 compile-pass 用例

**问题描述：** spec/lexical.md §2.6 列出 5 种 Letter 类别（Lu/Ll/Lt/Lm/Lo），但并未提及：
- Nl (Letter Number) - 如罗马数字 Ⅰ Ⅱ
- Mn (Combining Mark) - 组合符号
- Mc (Spacing Mark) - 间距标记
- Pc (Connector Punctuation) - 连接符标点（除 `_` 外）

**规范依据：**
- spec/lexical.md §2.6: 列出 5 种 Letter 类别
- Java/TS 标准: 标识符通常允许 Mn/Mc/Pc 在 IdentifierPart 中

**待确认事项：**
1. spec 是否需要明确 Mn/Mc/Pc 类别支持情况？
2. 是否需要提供 IdentifierStart 和 IdentifierPart 的完整 Unicode 类别清单？

**分类：** ⚠️ 待确认（spec 未详尽列出所有 Unicode 类别）

---

### 问题 G：Unicode 转义后的字符必须满足 ID_Start/ID_Continue 规则 ⚠️ 待确认

**用例：** LEX_02_06_032_FAIL_UESCAPE_DIGIT_START

**问题描述：** spec/lexical.md 未明确说明 Unicode 转义后的字符是否必须满足 ID_Start/ID_Continue 规则。

**规范依据：**
- spec/lexical.md: 未明确定义转义后字符的规则

**待确认事项：**
1. spec 是否需要明确：转义后的字符必须满足 ID_Start/ID_Continue 规则，不仅仅是合法 Unicode 码点？
2. 是否需要显式说明：转义为数字字符（如 \u0030）不能作标识符起始？

**分类：** ⚠️ 待确认（spec 未明确定义转义后字符的规则）

---

### 问题 H：ZWJ/ZWNJ 在标识符中的使用风险 ⚠️ 待确认

**用例：** LEX_02_06_011_PASS_ZWJ_IN_PART

**问题描述：** ZWJ/ZWNJ 是零宽字符，在编辑器中视觉上无差异，可能导致潜在 bug。

**规范依据：**
- spec/lexical.md: 允许 ZWJ/ZWNJ 在标识符中

**待确认事项：**
1. spec 是否需要添加 ZWJ/ZWNJ 使用风险注意事项？
2. 是否需要建议 lint 工具警告含 ZWJ/ZWNJ 的标识符？

**分类：** ⚠️ 待确认（spec 未明确定义风险警告）

---

## 四、与业界静态语言差异点汇总

以下差异点是 ArkTS 与 Java/Swift/TS 的设计选择差异，不构成设计缺陷，但需要开发者了解。

### 4.1 IdentifierStart 字符

| 字符类别 | ArkTS | Java | Swift | TypeScript | 说明 |
|--------|-------|------|-------|------------|------|
| Lu (Uppercase Letter) | ✅ | ✅ | ✅ | ✅ | 四语言一致 |
| Ll (Lowercase Letter) | ✅ | ✅ | ✅ | ✅ | 四语言一致 |
| Lt (Titlecase Letter) | ✅ | ✅ | ✅ | ✅ | 四语言一致 |
| Lm (Modifier Letter) | ✅ | ✅ | ✅ | ✅ | 四语言一致 |
| Lo (Other Letter) | ✅ | ✅ | ✅ | ✅ | 四语言一致 |
| Nl (Letter Number) | ⚠️ | ✅ | ⚠️ | ✅ | 待确认 |
| `$` 字符 | ✅ | ✅ | ❌ | ✅ | ArkTS 与 TS/Java 一致 |
| `_` 字符 | ✅ | ✅ | ✅ | ✅ | 四语言一致 |
| `\uHHHH` 转义 | ✅ | ✅ | ❌ | ✅ | ArkTS 与 TS/Java 一致 |
| `\u{...}` 转义 | ✅ | ❌ | ❌ | ✅ | ArkTS 与 TS 一致 |

### 4.2 IdentifierPart 字符

| 字符类别 | ArkTS | Java | Swift | TypeScript | 说明 |
|--------|-------|------|-------|------------|------|
| 全部 IdentifierStart | ✅ | ✅ | ✅ | ✅ | 四语言一致 |
| Nd (Decimal Digit) | ✅ | ✅ | ✅ | ✅ | 四语言一致 |
| Mn (Combining Mark) | ⚠️ | ✅ | ✅ | ✅ | 待确认 |
| Mc (Spacing Mark) | ⚠️ | ✅ | ✅ | ✅ | 待确认 |
| Pc (Connector Punct) | ⚠️ | ✅ | ✅ | ✅ | 待确认 |
| **ZWJ (U+200D)** | ✅ | ❌ | ❌ | ✅ | ArkTS 与 TS 一致 |
| **ZWNJ (U+200C)** | ✅ | ❌ | ❌ | ✅ | ArkTS 与 TS 一致 |

### 4.3 关键字保护

| 关键字类别 | ArkTS | Java | Swift | TypeScript | 说明 |
|----------|-------|------|-------|------------|------|
| 硬关键字（class, let） | ❌ 禁止 | ❌ | ❌ | ❌ | 四语言一致 |
| 类型关键字（int, byte, char） | ❌ 禁止 | ❌ | ❌ (无此类) | ✅ 允许 | ArkTS 比 TS 更严格 |
| 软关键字 | ⚠️ 上下文相关 | ⚠️ | ⚠️ | ⚠️ | 四语言一致 |

---

## 五、已验证 ArkTS 行为（符合 Spec）

以下行为已通过编译期 + 运行时验证，符合 spec/lexical.md 规范：

| 行为 | 用例编号 | 状态 | 规范依据 |
|------|---------|------|---------|
| Lu 类大写字母 | 001 | ✅ | spec/lexical.md |
| Ll 类小写字母 | 002 | ✅ | spec/lexical.md |
| Lt 类标题字母 | 003 | ✅ | spec/lexical.md |
| Lm 类修饰字母 | 004 | ✅ | spec/lexical.md |
| Lo 类其余字母 | 005 | ✅ | spec/lexical.md |
| $ 起始 | 006 | ✅ | spec/lexical.md |
| _ 起始 | 007 | ✅ | spec/lexical.md |
| \uHHHH 转义起始 | 008 | ✅ | spec/lexical.md |
| \u{...} 扩展转义起始 | 009 | ✅ | spec/lexical.md |
| Nd 在 IdentifierPart | 010 | ✅ | spec/lexical.md |
| ZWJ 在 IdentifierPart | 011 | ✅ | spec/lexical.md |
| ZWNJ 在 IdentifierPart | 012 | ✅ | spec/lexical.md |
| 转义在 IdentifierPart | 013~014 | ✅ | spec/lexical.md |
| 多类别混合标识符 | 015~017 | ✅ | spec/lexical.md |
| 类/接口/函数/字段名 | 018~021 | ✅ | spec/lexical.md |
| 枚举名/成员名 | 022 | ✅ | spec/lexical.md |
| 命名空间名 | 023 | ✅ | spec/lexical.md |
| 数字开头失败 | 024 | ✅ | spec/lexical.md |
| 运算符开头失败 | 025 | ✅ | spec/lexical.md |
| Unicode Nd 字符开头失败 | 026 | ✅ | spec/lexical.md |
| 标识符内空格/连字符/点失败 | 027~029 | ✅ | spec/lexical.md |
| 硬关键字/类型关键字失败 | 030~031 | ✅ | spec/lexical.md |
| 转义为数字字符失败 | 032 | ✅ | spec/lexical.md |
| 孤立代理转义失败 | 033 | ✅ | spec/lexical.md |
| 空 \u{} 失败 | 034 | ✅ | spec/lexical.md |
| Unicode 转义等价性 | 035 | ✅ | spec/lexical.md |
| 多语言标识符运行 | 036, 038 | ✅ | spec/lexical.md |
| ZWJ ≠ ZWNJ 不同变量 | 037 | ✅ | spec/lexical.md |
| 含数字标识符运行 | 039 | ✅ | spec/lexical.md |
| 长标识符 | 048 | ✅ | spec/lexical.md |
| 大小写敏感 | 049 | ✅ | spec/lexical.md |
| 作用域规则 | 050 | ✅ | spec/lexical.md |

---

## 六、差异分类汇总

| 分类 | 数量 | 差异列表 |
|------|------|---------|
| ✅ 符合 ArkTS Spec 的语言设计差异 | 5 | 差异 A（ZWJ/ZWNJ）、差异 B（\u{...}）、差异 C（$）、差异 D（转义等价性）、差异 E（类型关键字） |
| ⚠️ 待确认问题 | 3 | 问题 F（Unicode 类别）、问题 G（转义后字符规则）、问题 H（ZWJ/ZWNJ 风险） |
| 与业界静态语言差异点 | 多项 | 见第四章汇总表 |

---

## 七、建议

### 7.1 增加 Unicode 类别清单

spec/lexical.md §2.6 应增加 IdentifierStart/IdentifierPart 完整 Unicode 类别清单，包括 Mn/Mc/Pc 类别。

### 7.2 明确转义后字符规则

spec/lexical.md 应明确：Unicode 转义后的字符必须满足 ID_Start/ID_Continue 规则，不仅仅是合法 Unicode 码点。

### 7.3 添加 ZWJ/ZWNJ 风险注意事项

spec/lexical.md 应添加 ZWJ/ZWNJ 使用风险注意事项，建议 lint 工具警告含 ZWJ/ZWNJ 的标识符。

---

## 八、用例索引

| 用例 ID | 差异/问题 | 分类 | 关联规范 |
|---------|----------|------|---------|
| LEX_02_06_011/037 | 差异 A: ZWJ/ZWNJ | ✅ 语言设计差异 | spec/lexical.md |
| LEX_02_06_009 | 差异 B: \u{...} 转义 | ✅ 语言设计差异 | spec/lexical.md |
| LEX_02_06_006 | 差异 C: $ 标识符 | ✅ 语言设计差异 | spec/lexical.md |
| LEX_02_06_035 | 差异 D: 转义等价性 | ✅ 语言设计差异 | spec/lexical.md |
| LEX_02_06_031 | 差异 E: 类型关键字 | ✅ 语言设计差异 | spec/types.md |
| - | 问题 F: Unicode 类别 | ⚠️ 待确认 | spec/lexical.md |
| LEX_02_06_032 | 问题 G: 转义后字符规则 | ⚠️ 待确认 | spec/lexical.md |
| LEX_02_06_011 | 问题 H: ZWJ/ZWNJ 风险 | ⚠️ 待确认 | spec/lexical.md |

---

## 九、Cross-Language 对比表格

### 差异 A: ZWJ/ZWNJ（与 TS 一致，与 Java/Swift 不同）

| 语言 | ZWJ/ZWNJ 在标识符 | 规范依据 |
|------|-----------------|---------|
| **ArkTS** | ✅ 支持 | spec/lexical.md |
| **Java** | ❌ 不支持 | JLS §3.8 |
| **Swift** | ❌ 不支持 | Swift Lang |
| **TypeScript** | ✅ 支持 | ECMAScript |

### 差异 B: \u{...} 扩展转义（与 TS 一致，与 Java/Swift 不同）

| 语言 | \u{...} 转义 | 规范依据 |
|------|------------|---------|
| **ArkTS** | ✅ 支持 | spec/lexical.md |
| **Java** | ❌ 不支持 | JLS §3.8 |
| **Swift** | ❌ 不支持 | Swift Lang |
| **TypeScript** | ✅ 支持 | ECMAScript |

### 差异 C: $ 标识符（与 TS/Java 一致，与 Swift 不同）

| 语言 | $ 标识符 | 规范依据 |
|------|---------|---------|
| **ArkTS** | ✅ 支持 | spec/lexical.md |
| **Java** | ✅ 支持 | JLS §3.8 |
| **Swift** | ❌ 不支持 | Swift Lang |
| **TypeScript** | ✅ 支持 | ECMAScript |

### 差异 D: Unicode 转义等价性（与 TS/Java 一致，与 Swift 不同）

| 语言 | \u0041 ≡ A | 规范依据 |
|------|----------|---------|
| **ArkTS** | ✅ 支持 | spec/lexical.md |
| **Java** | ✅ 支持 | JLS §3.8 |
| **Swift** | ❌ 不支持 | Swift Lang |
| **TypeScript** | ✅ 支持 | ECMAScript |

### 差异 E: 类型关键字保护（比 TS 更严格）

| 关键字 | ArkTS | TypeScript | Java |
|-------|-------|-----------|------|
| `int` | ❌ | ✅ | ❌ |
| `double` | ❌ | ✅ | ❌ |
| `byte` | ❌ | ✅ | ❌ |
| `char` | ❌ | ✅ | ❌ |

---

**报告生成人：** GLM5.1
**最后更新：** 2026-06-22
**下一步行动：**
1. 增加 Unicode 类别清单
2. 明确转义后字符规则
3. 添加 ZWJ/ZWNJ 风险注意事项
