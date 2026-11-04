# 2.4 Line Separators - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-22
**测试用例数：** 39（compile-pass: 25, compile-fail: 3, runtime: 11）
**更新版本：** v3.0 - 重新分类：区分"语言设计差异"与"规范一致性问题"
**目的：** 通过 4 种行终止符的系统测试，识别 ArkTS 在行终止符处理方面与 Java/Swift/TS 的行为差异，以及规范与实现的一致性问题。

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
| spec/lexical.md | §2.4 Line Separators | 定义行终止符列表 |
| spec/lexical.md | §2.11 Semicolons | 定义分号规则 |

---

## 二、符合 ArkTS Spec 的语言设计差异（与 Java/Swift/TS 不同）

以下差异点是 ArkTS 的有意设计选择，符合 spec 定义，与 Java/Swift/TS 行为不同但不构成设计缺陷。

### 差异 A：支持 LS (U+2028) 作行终止符，与 Java/Swift 不同 ✅ 符合 ArkTS Spec

**用例：** LEX_02_04_003_PASS_LS_SEPARATOR

**ArkTS Spec 描述：** spec/lexical.md 列出 LS (U+2028) 为合法行终止符。

**实际行为（编译通过）：**
```typescript
let a: number = 1{LS}let b: number = 2  // LS 作行终止符
```

**与业界静态语言对比：**
| 语言 | LS 处理 | 规范依据 |
|------|--------|---------|
| **ArkTS** | ✅ 行终止符 | spec/lexical.md |
| **Java** | ❌ 不支持 | JLS §3.4 |
| **Swift** | ❌ 不支持 | Swift Lang |
| **TypeScript** | ✅ 行终止符 | ECMAScript |

**差异说明：** ArkTS 选择与 TypeScript/ECMAScript 一致的 LS 处理策略，沿袭 ECMAScript 标准。这是语言设计选择，不是缺陷。

**分类：** ✅ 符合 ArkTS spec 的语言设计差异（与 TS/ECMAScript 一致）

---

### 差异 B：支持 PS (U+2029) 作行终止符，与 Java/Swift 不同 ✅ 符合 ArkTS Spec

**用例：** LEX_02_04_004_PASS_PS_SEPARATOR

**ArkTS Spec 描述：** spec/lexical.md 列出 PS (U+2029) 为合法行终止符。

**实际行为（编译通过）：**
```typescript
let a: number = 1{PS}let b: number = 2  // PS 作行终止符
```

**与业界静态语言对比：**
| 语言 | PS 处理 | 规范依据 |
|------|--------|---------|
| **ArkTS** | ✅ 行终止符 | spec/lexical.md |
| **Java** | ❌ 不支持 | JLS §3.4 |
| **Swift** | ❌ 不支持 | Swift Lang |
| **TypeScript** | ✅ 行终止符 | ECMAScript |

**差异说明：** ArkTS 选择与 TypeScript/ECMAScript 一致的 PS 处理策略，沿袭 ECMAScript 标准。这是语言设计选择，不是缺陷。

**分类：** ✅ 符合 ArkTS spec 的语言设计差异（与 TS/ECMAScript 一致）

---

### 差异 C：模板字符串内允许真实换行，与 Java 不同 ✅ 符合 ArkTS Spec

**用例：** LEX_02_04_018_PASS_LINE_SEP_IN_TEMPLATE_STRING

**ArkTS Spec 描述：** spec/lexical.md 定义模板字符串内可包含真实换行。

**实际行为（编译通过）：**
```typescript
let s: string = `hello
world`  // 模板字符串内换行
```

**与业界静态语言对比：**
| 语言 | 模板字符串换行 | 规范依据 |
|------|--------------|---------|
| **ArkTS** | ✅ 支持 | spec/lexical.md |
| **Java** | ❌ 需三引号 | JLS §3.10.6 |
| **Swift** | ✅ 支持 | Swift Lang |
| **TypeScript** | ✅ 支持 | ECMAScript |

**差异说明：** ArkTS 选择与 TypeScript/Swift 一致的模板字符串策略。这是语言设计选择，不是缺陷。

**分类：** ✅ 符合 ArkTS spec 的语言设计差异（与 TS/Swift 一致）

---

## 三、规范一致性问题（Spec 与实现不一致）

### 问题 D：char 字面量内允许真实 LF，与 spec 期望不一致 ⚠️ SPEC 不一致

**用例：** LEX_02_04_022_PASS_LF_IN_CHAR_LITERAL

**问题描述：** spec/lexical.md 未明确说明 char 字面量是否允许跨行内容，但编译器实际允许。

**实际行为（编译通过）：**
```typescript
let ch: char = c'<LF>'   // ⚠️ 编译通过（spec 应不允许）
```

**规范依据：**
- spec/lexical.md: 未明确定义 char 字面量跨行规则
- 字符串字面量行为: 单/双引号字符串内含真实 LF 编译失败

**与业界静态语言对比：**
| 语言 | char 内含真实换行 | 规范依据 |
|------|-----------------|---------|
| **ArkTS** | ⚠️ 编译器允许 | spec 未明确 |
| **Java** | ❌ 编译失败 | JLS §3.10.4 |
| **Swift** | N/A | Swift Lang |

**分类：** ⚠️ SPEC 不一致（编译器行为与 spec 期望不一致）

---

### 问题 E：CRLF 在 spec 中未单独定义为序列 ⚠️ SPEC 不一致

**用例：** LEX_02_04_005_PASS_CRLF_SEPARATOR

**问题描述：** spec/lexical.md 列出 4 种独立行终止符（LF、CR、LS、PS），并声明 "Any sequence of line separators is considered a single separator"，但未显式定义 CRLF 序列。

**实际行为（编译通过）：**
```typescript
let a: number = 1{CR}{LF}let b: number = 2  // CRLF 作行终止符
```

**规范依据：**
- spec/lexical.md: 隐含支持，未显式定义
- Java JLS §3.4: 显式 LineTerminatorSequence 产生式

**与业界静态语言对比：**
| 语言 | CRLF 在 spec 中 | 规范依据 |
|------|--------------|---------|
| **ArkTS** | ⚠️ 隐含支持 | spec/lexical.md |
| **Java** | ✅ 显式定义 | JLS §3.4 |
| **Swift** | ✅ 显式定义 | Swift Lang |

**分类：** ⚠️ SPEC 不一致（spec 缺乏显式定义可能引发误解）

---

## 四、待确认问题（需要 Spec 团队确认）

### 问题 F：行终止符与 §2.11 Semicolons 的交互未充分定义 ⚠️ 待确认

**用例：** 多个 compile-pass 和 runtime 用例

**问题描述：** spec/lexical.md §2.4 前向引用 §2.11 解释行终止符的特殊语义，但未在 §2.4 中提供简要说明。

**规范依据：**
- spec/lexical.md §2.4: "Line separators are often handled as white spaces, except where line separators have special meanings. See Semicolons for more details."
- spec/lexical.md §2.11: 定义分号规则

**待确认事项：**
1. ArkTS 是否支持 ASI（自动分号插入）？
2. 如果支持，ASI 的具体规则是什么？
3. spec 是否需要在 §2.4 中提供 ASI 行为的简要说明？

**分类：** ⚠️ 待确认（spec 未明确定义 ASI 行为）

---

### 问题 G：单行注释 // 在 LS/PS 处是否终止 ⚠️ 待确认

**用例：** LEX_02_04_014_PASS_LINE_SEP_AFTER_COMMENT

**问题描述：** spec/lexical.md 未明确说明单行注释 `//` 是否在 LS (U+2028) / PS (U+2029) 处终止。

**规范依据：**
- spec/lexical.md: 4 种行终止符均可作分隔符
- 未明确: // 在 LS/PS 处是否终止

**与业界静态语言对比：**
| 语言 | // 在 LS/PS 处终止 | 规范依据 |
|------|------------------|---------|
| **ArkTS** | ⚠️ spec 未明确 | spec/lexical.md |
| **TypeScript** | ✅ 任意 LineTerminator 终止 | ECMAScript |
| **Java** | N/A | JLS §3.4 |

**待确认事项：**
1. spec 是否需要明确单行注释在所有 4 种行终止符处终止？

**分类：** ⚠️ 待确认（spec 未明确定义）

---

## 五、与业界静态语言差异点汇总

以下差异点是 ArkTS 与 Java/Swift/TS 的设计选择差异，不构成设计缺陷，但需要开发者了解。

### 5.1 行终止符列表

| 终止符 | Unicode | ArkTS | Java | Swift | TypeScript | 说明 |
|--------|---------|-------|------|-------|------------|------|
| LF | U+000A | ✅ | ✅ | ✅ | ✅ | 三语言一致 |
| CR | U+000D | ✅ | ✅ | ✅ | ✅ | 三语言一致 |
| LS | U+2028 | ✅ | ❌ | ❌ | ✅ | ArkTS 与 TS 一致 |
| PS | U+2029 | ✅ | ❌ | ❌ | ✅ | ArkTS 与 TS 一致 |
| CRLF | U+000D U+000A | ✅ | ✅ | ✅ | ✅ | 三语言一致 |

### 5.2 行终止符语义

| 维度 | ArkTS | Java | Swift | TypeScript | 说明 |
|------|-------|------|-------|------------|------|
| 作 Token 分隔符 | ✅ | ✅ | ✅ | ✅ | 三语言一致 |
| 任意序列等价单分隔 | ✅ | ✅ | ✅ | ✅ | 三语言一致 |
| 字符串字面量内禁止 | ✅ | ✅ | ✅ | ✅ | 三语言一致 |
| 模板字符串内允许 | ✅ | ❌ | ✅ | ✅ | ArkTS 与 TS/Swift 一致 |

---

## 六、已验证 ArkTS 行为（符合 Spec）

以下行为已通过编译期 + 运行时验证，符合 spec/lexical.md 规范：

| 行为 | 用例编号 | 状态 | 规范依据 |
|------|---------|------|---------|
| LF (U+000A) 作行分隔 | 001 | ✅ | spec/lexical.md |
| CR (U+000D) 作行分隔 | 002 | ✅ | spec/lexical.md |
| LS (U+2028) 作行分隔 | 003 | ✅ | spec/lexical.md |
| PS (U+2029) 作行分隔 | 004 | ✅ | spec/lexical.md |
| CRLF 作单一分隔 | 005, 025 | ✅ | spec/lexical.md |
| 任意连续序列等价单分隔 | 007~011, 029 | ✅ | spec/lexical.md |
| 行终止符与空白符共存 | 012~013 | ✅ | spec/lexical.md |
| 单行注释后行终止符 | 014 | ✅ | spec/lexical.md |
| 括号内允许换行 | 015 | ✅ | spec/lexical.md |
| 数组字面量内允许换行 | 016 | ✅ | spec/lexical.md |
| 函数参数列表内换行 | 017 | ✅ | spec/lexical.md |
| 模板字符串内允许真实换行 | 018, 027 | ✅ | spec/lexical.md |
| 普通字符串支持 \n 转义 | 019 | ✅ | spec/lexical.md |
| 单引号字符串禁止跨行 | 020 | ✅ | spec/lexical.md |
| 双引号字符串禁止跨行 | 021 | ✅ | spec/lexical.md |
| // 注释禁止反斜杠续行 | 023 | ✅ | spec/lexical.md |
| 多行注释跨行不影响执行 | 026 | ✅ | spec/lexical.md |
| 连续空行不影响语句 | 028 | ✅ | spec/lexical.md |

---

## 七、差异分类汇总

| 分类 | 数量 | 差异列表 |
|------|------|---------|
| ✅ 符合 ArkTS Spec 的语言设计差异 | 3 | 差异 A（LS）、差异 B（PS）、差异 C（模板字符串换行） |
| ⚠️ SPEC 不一致 | 2 | 问题 D（char 字面量 LF）、问题 E（CRLF 未显式定义） |
| ⚠️ 待确认问题 | 2 | 问题 F（ASI 行为）、问题 G（// 在 LS/PS 处终止） |
| 与业界静态语言差异点 | 多项 | 见第五章汇总表 |

---

## 八、建议

### 8.1 明确 spec 中的 CRLF 定义

spec/lexical.md 应增加 LineTerminatorSequence 产生式说明，显式定义 CRLF 序列。

### 8.2 明确 char 字面量跨行规则

spec/lexical.md 应明确说明 char 字面量内的行终止符规则，与字符串字面量保持一致。

### 8.3 补充 ASI 行为说明

spec/lexical.md 应在 §2.4 中提供 ASI 行为的简要说明，避免读者必须跳到 §2.11。

### 8.4 明确单行注释终止规则

spec/lexical.md 应明确说明单行注释在所有 4 种行终止符处终止。

---

## 九、用例索引

| 用例 ID | 差异/问题 | 分类 | 关联规范 |
|---------|----------|------|---------|
| LEX_02_04_003 | 差异 A: LS 分隔符 | ✅ 语言设计差异 | spec/lexical.md |
| LEX_02_04_004 | 差异 B: PS 分隔符 | ✅ 语言设计差异 | spec/lexical.md |
| LEX_02_04_018 | 差异 C: 模板字符串换行 | ✅ 语言设计差异 | spec/lexical.md |
| LEX_02_04_022 | 问题 D: char 字面量 LF | ⚠️ SPEC 不一致 | spec/lexical.md |
| LEX_02_04_005 | 问题 E: CRLF 未显式定义 | ⚠️ SPEC 不一致 | spec/lexical.md |
| LEX_02_04_028 | 问题 F: ASI 行为 | ⚠️ 待确认 | spec/lexical.md |
| LEX_02_04_014 | 问题 G: // 在 LS/PS 处终止 | ⚠️ 待确认 | spec/lexical.md |

---

## 十、Cross-Language 对比表格

### 差异 A: LS 处理（与 TS 一致，与 Java/Swift 不同）

| 语言 | LS 作行终止符 | 规范依据 |
|------|-------------|---------|
| **ArkTS** | ✅ 支持 | spec/lexical.md |
| **Java** | ❌ 不支持 | JLS §3.4 |
| **Swift** | ❌ 不支持 | Swift Lang |
| **TypeScript** | ✅ 支持 | ECMAScript |

### 差异 B: PS 处理（与 TS 一致，与 Java/Swift 不同）

| 语言 | PS 作行终止符 | 规范依据 |
|------|-------------|---------|
| **ArkTS** | ✅ 支持 | spec/lexical.md |
| **Java** | ❌ 不支持 | JLS §3.4 |
| **Swift** | ❌ 不支持 | Swift Lang |
| **TypeScript** | ✅ 支持 | ECMAScript |

### 差异 C: 模板字符串换行（与 TS/Swift 一致，与 Java 不同）

| 语言 | 模板字符串换行 | 规范依据 |
|------|--------------|---------|
| **ArkTS** | ✅ 支持 | spec/lexical.md |
| **Java** | ❌ 需三引号 | JLS §3.10.6 |
| **Swift** | ✅ 支持 | Swift Lang |
| **TypeScript** | ✅ 支持 | ECMAScript |

---

**报告生成人：** GLM5.1
**最后更新：** 2026-06-22
**下一步行动：**
1. 明确 spec 中的 CRLF 定义
2. 明确 char 字面量跨行规则
3. 补充 ASI 行为说明
4. 明确单行注释终止规则
