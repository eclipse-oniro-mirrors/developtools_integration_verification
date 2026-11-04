# 2.3 White Spaces - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-22
**测试用例数：** 38（compile-pass: 21, compile-fail: 10, runtime: 7）
**更新版本：** v3.0 - 重新分类：区分"语言设计差异"与"规范一致性问题"
**目的：** 通过 6 种空白符的系统测试，识别 ArkTS 在空白符处理方面与 Java/Swift/TS 的行为差异，以及规范与实现的一致性问题。

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
| spec/lexical.md | §2.3 White Spaces | 定义空白符列表 |
| spec/lexical.md | §2.2 Lexical Input Elements | 定义词法输入元素 |

---

## 二、符合 ArkTS Spec 的语言设计差异（与 Java/Swift/TS 不同）

以下差异点是 ArkTS 的有意设计选择，符合 spec 定义，与 Java/Swift/TS 行为不同但不构成设计缺陷。

### 差异 A：支持 NBSP (U+00A0) 作分隔符，与 Java/Swift 不同 ✅ 符合 ArkTS Spec

**用例：** LEX_02_03_005_PASS_NBSP_SEPARATOR, LEX_02_03_035_RT_NBSP_SEPARATED

**ArkTS Spec 描述：** spec/lexical.md 列出 NBSP (U+00A0) 为合法空白符。

**实际行为（编译通过）：**
```typescript
let{NBSP}x: number = 1  // 等同于 let x: number = 1
```

**与业界静态语言对比：**
| 语言 | NBSP 处理 | 规范依据 |
|------|----------|---------|
| **ArkTS** | ✅ 等同空格 | spec/lexical.md |
| **Java** | ❌ 不允许 | JLS §3.6 |
| **Swift** | ❌ 不允许 | Swift Lang |
| **TypeScript** | ✅ 等同空格 | TS 规范 |

**差异说明：** ArkTS 选择与 TypeScript 一致的 NBSP 处理策略，沿袭 ECMAScript 标准。这是语言设计选择，不是缺陷。

**分类：** ✅ 符合 ArkTS spec 的语言设计差异（与 TS 一致）

---

### 差异 B：支持 ZWNBSP (U+FEFF) 作分隔符，与 Java/Swift 不同 ✅ 符合 ArkTS Spec

**用例：** LEX_02_03_006_PASS_ZWNBSP_SEPARATOR, LEX_02_03_021_PASS_ZWNBSP_VARIOUS_POSITIONS

**ArkTS Spec 描述：** spec/lexical.md 列出 ZWNBSP (U+FEFF) 为合法空白符。

**实际行为（编译通过）：**
```typescript
let{ZWNBSP}b: number = 2  // ZWNBSP 作分隔符
let s: string = "ab{ZWNBSP}cd"  // ZWNBSP 在字符串内是内容
```

**与业界静态语言对比：**
| 语言 | ZWNBSP 处理 | 规范依据 |
|------|------------|---------|
| **ArkTS** | ✅ 既是 BOM 也是空白符 | spec/lexical.md |
| **Java** | ⚠️ 仅 BOM 位置合法 | JLS §3.6 |
| **Swift** | ⚠️ 仅 BOM 位置合法 | Swift Lang |
| **TypeScript** | ✅ 既是 BOM 也是空白符 | TS 规范 |

**差异说明：** ArkTS 选择与 TypeScript 一致的 ZWNBSP 处理策略，沿袭 ECMAScript 标准。这是语言设计选择，不是缺陷。

**分类：** ✅ 符合 ArkTS spec 的语言设计差异（与 TS 一致）

---

### 差异 C：支持 VT (U+000B) 作分隔符，与 Swift 不同 ✅ 符合 ArkTS Spec

**用例：** LEX_02_03_003_PASS_VTAB_SEPARATOR

**ArkTS Spec 描述：** spec/lexical.md 列出 VT (U+000B) 为合法空白符。

**实际行为（编译通过）：**
```typescript
let{VT}x: number = 1  // VT 作分隔符
```

**与业界静态语言对比：**
| 语言 | VT 处理 | 规范依据 |
|------|--------|---------|
| **ArkTS** | ✅ 合法空白符 | spec/lexical.md |
| **Java** | ❌ 不合法 | JLS §3.6 |
| **Swift** | ❌ 不合法 | Swift Lang |
| **TypeScript** | ✅ 合法空白符 | TS 规范 |

**差异说明：** ArkTS 选择与 TypeScript/Java 一致的 VT 处理策略，沿袭 ECMAScript 标准。这是语言设计选择，不是缺陷。

**分类：** ✅ 符合 ArkTS spec 的语言设计差异（与 TS/Java 一致）

---

### 差异 D：支持 FF (U+000C) 作分隔符，与 Swift 不同 ✅ 符合 ArkTS Spec

**用例：** LEX_02_03_004_PASS_FORMFEED_SEPARATOR

**ArkTS Spec 描述：** spec/lexical.md 列出 FF (U+000C) 为合法空白符。

**实际行为（编译通过）：**
```typescript
let{FF}x: number = 1  // FF 作分隔符
```

**与业界静态语言对比：**
| 语言 | FF 处理 | 规范依据 |
|------|--------|---------|
| **ArkTS** | ✅ 合法空白符 | spec/lexical.md |
| **Java** | ✅ 合法空白符 | JLS §3.6 |
| **Swift** | ❌ 不合法 | Swift Lang |
| **TypeScript** | ✅ 合法空白符 | TS 规范 |

**差异说明：** ArkTS 选择与 TypeScript/Java 一致的 FF 处理策略。这是语言设计选择，不是缺陷。

**分类：** ✅ 符合 ArkTS spec 的语言设计差异（与 TS/Java 一致）

---

## 三、待确认问题（需要 Spec 团队确认）

### 问题 E：spec 空白符列表与 Unicode 标准不完全对齐 ⚠️ 待确认

**用例：** 多个 compile-pass 用例

**问题描述：** spec/lexical.md 列出 6 种空白符，但 Unicode 标准 White_Space 属性涵盖 25 个码点。

**规范依据：**
- spec/lexical.md: 列出 6 种空白符
- Unicode 标准: White_Space 属性涵盖 25 个码点

**与业界静态语言对比：**
| 语言 | 空白符数量 | 规范依据 |
|------|-----------|---------|
| **ArkTS** | 6 | spec/lexical.md |
| **Java** | 5 | JLS §3.6 |
| **TypeScript** | 约 18+ | ECMAScript |
| **Swift** | 约 25 | Unicode 标准 |

**待确认事项：**
1. spec 是否需要明确说明为什么仅采纳 6 种空白符？
2. 是否需要明确其余 Unicode 空白符（如 U+3000 全角空格）的处理规则？

**分类：** ⚠️ 待确认（spec 未明确定义选择依据）

---

### 问题 F：ZWNBSP 双重身份的语义边界 ⚠️ 待确认

**用例：** LEX_02_03_006_PASS_ZWNBSP_SEPARATOR, LEX_02_03_038_RT_ZWNBSP_STRING_CONTENT

**问题描述：** ZWNBSP (U+FEFF) 同时是 BOM（字节序标记）和普通空白符，同一字符在不同上下文有不同语义。

**实际行为：**
```typescript
let{ZWNBSP}b: number = 2  // 作分隔符
let s: string = "ab{ZWNBSP}cd"  // 在字符串内是内容
```

**与业界静态语言对比：**
| 语言 | ZWNBSP 处理 | 规范依据 |
|------|------------|---------|
| **ArkTS** | 既是 BOM 也是空白符 | spec/lexical.md |
| **Java** | 仅作为 BOM | JLS §3.6 |
| **Swift** | 仅作 BOM | Swift Lang |

**待确认事项：**
1. spec 是否需要明确 ZWNBSP 在 BOM 和分隔符两个角色的语义边界？
2. 是否需要对文件中部的 ZWNBSP 发出 warning？

**分类：** ⚠️ 待确认（spec 未明确定义双重身份的语义边界）

---

### 问题 G：NBSP 易与普通空格混淆 ⚠️ 待确认

**用例：** LEX_02_03_005_PASS_NBSP_SEPARATOR

**问题描述：** NBSP 在编辑器中视觉上与普通空格无差异，复制粘贴自网页/Word 文档常引入 NBSP。

**实际行为：**
```typescript
let{NBSP}x: number = 1  // 编译通过，但视觉上无法区分
```

**与业界静态语言对比：**
| 语言 | NBSP 处理 | 规范依据 |
|------|----------|---------|
| **ArkTS** | ✅ 等同空格 | spec/lexical.md |
| **Java** | ❌ 不允许 | JLS §3.6 |
| **Swift** | ❌ 不允许 | Swift Lang |

**待确认事项：**
1. 编译器是否需要对 NBSP 发出 warning？
2. 是否需要提供 lint 工具检测 NBSP 引入？

**分类：** ⚠️ 待确认（spec 未明确定义 warning 规则）

---

## 四、与业界静态语言差异点汇总

以下差异点是 ArkTS 与 Java/Swift/TS 的设计选择差异，不构成设计缺陷，但需要开发者了解。

### 4.1 空白符列表

| 空白符 | Unicode | ArkTS | Java | Swift | TypeScript | 说明 |
|--------|---------|-------|------|-------|------------|------|
| Space | U+0020 | ✅ | ✅ | ✅ | ✅ | 三语言一致 |
| Tab | U+0009 | ✅ | ✅ | ✅ | ✅ | 三语言一致 |
| VT | U+000B | ✅ | ❌ | ❌ | ✅ | ArkTS 与 TS 一致 |
| FF | U+000C | ✅ | ✅ | ❌ | ✅ | ArkTS 与 Java/TS 一致 |
| NBSP | U+00A0 | ✅ | ❌ | ❌ | ✅ | ArkTS 与 TS 一致 |
| ZWNBSP | U+FEFF | ✅ | ⚠️ | ⚠️ | ✅ | ArkTS 与 TS 一致 |

### 4.2 空白符语义

| 维度 | ArkTS | Java | Swift | TypeScript | 说明 |
|------|-------|------|-------|------------|------|
| 作 Token 分隔符 | ✅ | ✅ | ✅ | ✅ | 三语言一致 |
| 多个等价于一个 | ✅ | ✅ | ✅ | ✅ | 三语言一致 |
| 在 Token 内部禁止 | ✅ | ✅ | ✅ | ✅ | 三语言一致 |
| 在注释中允许 | ✅ | ✅ | ✅ | ✅ | 三语言一致 |
| 在字符串内是内容 | ✅ | ✅ | ✅ | ✅ | 三语言一致 |

---

## 五、已验证 ArkTS 行为（符合 Spec）

以下行为已通过编译期 + 运行时验证，符合 spec/lexical.md 规范：

| 行为 | 用例编号 | 状态 | 规范依据 |
|------|---------|------|---------|
| Space (U+0020) 作分隔符 | 001 | ✅ | spec/lexical.md |
| Tab (U+0009) 作分隔符 | 002 | ✅ | spec/lexical.md |
| VT (U+000B) 作分隔符 | 003 | ✅ | spec/lexical.md |
| FF (U+000C) 作分隔符 | 004 | ✅ | spec/lexical.md |
| NBSP (U+00A0) 作分隔符 | 005 | ✅ | spec/lexical.md |
| ZWNBSP (U+FEFF) 作分隔符 | 006 | ✅ | spec/lexical.md |
| 多空白符等价于单个 | 009 | ✅ | spec/lexical.md |
| 空白符被语法分析忽略 | 032~037 | ✅ | spec/lexical.md |
| 空白符不出现在 Token 内 | 022~025 | ✅ | spec/lexical.md |
| 空白符不出现在关键字内 | 026 | ✅ | spec/lexical.md |
| 空白符不分隔多字符运算符 | 027~029 | ✅ | spec/lexical.md |
| 空白符可在注释中 | 017~018 | ✅ | spec/lexical.md |
| 字符串内空白是内容 | 019, 038 | ✅ | spec/lexical.md |

---

## 六、差异分类汇总

| 分类 | 数量 | 差异列表 |
|------|------|---------|
| ✅ 符合 ArkTS Spec 的语言设计差异 | 4 | 差异 A（NBSP）、差异 B（ZWNBSP）、差异 C（VT）、差异 D（FF） |
| ⚠️ 待确认问题 | 3 | 问题 E（Unicode 标准不对齐）、问题 F（ZWNBSP 双重身份）、问题 G（NBSP 易混淆） |
| 与业界静态语言差异点 | 多项 | 见第四章汇总表 |

---

## 七、建议

### 7.1 明确 spec 选择依据

spec/lexical.md 应明确说明为什么仅采纳 6 种空白符，不采纳 Unicode 标准的 25 种。

### 7.2 明确 ZWNBSP 双重身份

spec/lexical.md 应明确 ZWNBSP 在 BOM 和分隔符两个角色的语义边界。

### 7.3 提供 warning 规则

编译器应对 NBSP 和文件中部的 ZWNBSP 发出 warning，鼓励规范化。

---

## 八、用例索引

| 用例 ID | 差异/问题 | 分类 | 关联规范 |
|---------|----------|------|---------|
| LEX_02_03_005 | 差异 A: NBSP 分隔符 | ✅ 语言设计差异 | spec/lexical.md |
| LEX_02_03_035 | 差异 A: NBSP 运行时 | ✅ 语言设计差异 | spec/lexical.md |
| LEX_02_03_006 | 差异 B: ZWNBSP 分隔符 | ✅ 语言设计差异 | spec/lexical.md |
| LEX_02_03_021 | 差异 B: ZWNBSP 多位置 | ✅ 语言设计差异 | spec/lexical.md |
| LEX_02_03_003 | 差异 C: VT 分隔符 | ✅ 语言设计差异 | spec/lexical.md |
| LEX_02_03_004 | 差异 D: FF 分隔符 | ✅ 语言设计差异 | spec/lexical.md |
| LEX_02_03_038 | 问题 F: ZWNBSP 字符串 | ⚠️ 待确认 | spec/lexical.md |
| - | 问题 E: Unicode 标准不对齐 | ⚠️ 待确认 | spec/lexical.md |
| - | 问题 G: NBSP 易混淆 | ⚠️ 待确认 | spec/lexical.md |

---

## 九、Cross-Language 对比表格

### 差异 A: NBSP 处理（与 TS 一致，与 Java/Swift 不同）

| 语言 | NBSP 作分隔符 | 规范依据 |
|------|-------------|---------|
| **ArkTS** | ✅ 等同空格 | spec/lexical.md |
| **Java** | ❌ 不允许 | JLS §3.6 |
| **Swift** | ❌ 不允许 | Swift Lang |
| **TypeScript** | ✅ 等同空格 | TS 规范 |

### 差异 B: ZWNBSP 处理（与 TS 一致，与 Java/Swift 不同）

| 语言 | ZWNBSP 作分隔符 | ZWNBSP 作 BOM | 规范依据 |
|------|----------------|---------------|---------|
| **ArkTS** | ✅ | ✅ | spec/lexical.md |
| **Java** | ❌ | ✅ | JLS §3.6 |
| **Swift** | ❌ | ✅ | Swift Lang |
| **TypeScript** | ✅ | ✅ | TS 规范 |

---

**报告生成人：** GLM5.1
**最后更新：** 2026-06-22
**下一步行动：**
1. 明确 spec 选择 6 种空白符的依据
2. 明确 ZWNBSP 双重身份的语义边界
3. 评估编译器对 NBSP/ZWNBSP 的 warning 规则
