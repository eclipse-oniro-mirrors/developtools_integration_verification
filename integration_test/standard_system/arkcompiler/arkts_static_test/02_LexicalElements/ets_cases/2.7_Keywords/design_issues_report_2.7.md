# 2.7 Keywords - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-22
**测试用例数：** 97（compile-pass: 50, compile-fail: 37, runtime: 10）
**更新版本：** v3.0 - 重新分类：区分"语言设计差异"与"规范一致性问题"
**目的：** 通过 4 类关键字（硬/类型/软/未来保留）的全覆盖测试，识别 ArkTS 在关键字处理方面与 Java/Swift/TS 的行为差异，以及规范与实现的一致性问题。

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
| spec/lexical.md | §2.7 Keywords | 定义关键字规则 |
| spec/types.md | §3.2 Primitive Types | 定义类型关键字 |
| spec/statements.md | §8 Statements | 定义控制流关键字 |

---

## 二、符合 ArkTS Spec 的语言设计差异（与 Java/Swift/TS 不同）

以下差异点是 ArkTS 的有意设计选择，符合 spec 定义，与 Java/Swift/TS 行为不同但不构成设计缺陷。

### 差异 A：支持 typeof 关键字，与 Java/Swift 不同 ✅ 符合 ArkTS Spec

**用例：** LEX_02_07_016_PASS_HARD_KW_TYPEOF_INSTANCEOF

**ArkTS Spec 描述：** spec/lexical.md 列出 typeof 为硬关键字。

**实际行为（编译通过）：**
```typescript
let x: int = 10
let t: string = typeof x  // typeof 返回类型字符串
```

**与业界静态语言对比：**
| 语言 | typeof 关键字 | 规范依据 |
|------|-------------|---------|
| **ArkTS** | ✅ 支持 | spec/lexical.md |
| **Java** | ❌ 不支持 | JLS §3.9 |
| **Swift** | ❌ 不支持 | Swift Lang |
| **TypeScript** | ✅ 支持 | ECMAScript |

**差异说明：** ArkTS 选择与 TypeScript 一致的 typeof 策略，继承 ECMAScript 标准。这是语言设计选择，不是缺陷。

**分类：** ✅ 符合 ArkTS spec 的语言设计差异（与 TS 一致）

---

### 差异 B：支持 namespace 软关键字，与 Java/Swift 不同 ✅ 符合 ArkTS Spec

**用例：** LEX_02_07_034_PASS_SOFT_KW_NAMESPACE

**ArkTS Spec 描述：** spec/lexical.md 列出 namespace 为软关键字。

**实际行为（编译通过）：**
```typescript
namespace MyNamespace {
  export function foo(): void {}
}
```

**与业界静态语言对比：**
| 语言 | namespace 关键字 | 规范依据 |
|------|-----------------|---------|
| **ArkTS** | ✅ 支持 | spec/lexical.md |
| **Java** | ❌ 不支持 | JLS §3.9 |
| **Swift** | ❌ 不支持 | Swift Lang |
| **TypeScript** | ✅ 支持 | ECMAScript |

**差异说明：** ArkTS 选择与 TypeScript 一致的 namespace 策略。这是语言设计选择，不是缺陷。

**分类：** ✅ 符合 ArkTS spec 的语言设计差异（与 TS 一致）

---

### 差异 C：支持 keyof 软关键字，与 Java/Swift 不同 ✅ 符合 ArkTS Spec

**用例：** LEX_02_07_037_PASS_SOFT_KW_FROM_KEYOF

**ArkTS Spec 描述：** spec/lexical.md 列出 keyof 为软关键字。

**实际行为（编译通过）：**
```typescript
type Keys = keyof MyInterface
```

**与业界静态语言对比：**
| 语言 | keyof 关键字 | 规范依据 |
|------|------------|---------|
| **ArkTS** | ✅ 支持 | spec/lexical.md |
| **Java** | ❌ 不支持 | JLS §3.9 |
| **Swift** | ❌ 不支持 | Swift Lang |
| **TypeScript** | ✅ 支持 | ECMAScript |

**差异说明：** ArkTS 选择与 TypeScript 一致的 keyof 策略。这是语言设计选择，不是缺陷。

**分类：** ✅ 符合 ArkTS spec 的语言设计差异（与 TS 一致）

---

### 差异 D：支持 of 软关键字，与 Java/Swift 不同 ✅ 符合 ArkTS Spec

**用例：** LEX_02_07_038_PASS_SOFT_KW_OF

**ArkTS Spec 描述：** spec/lexical.md 列出 of 为软关键字。

**实际行为（编译通过）：**
```typescript
for (let x of arr) {
  console.log(x)
}
```

**与业界静态语言对比：**
| 语言 | of 关键字 | 规范依据 |
|------|----------|---------|
| **ArkTS** | ✅ 支持 | spec/lexical.md |
| **Java** | ❌ 不支持 | JLS §3.9 |
| **Swift** | ❌ 不支持 | Swift Lang |
| **TypeScript** | ✅ 支持 | ECMAScript |

**差异说明：** ArkTS 选择与 TypeScript 一致的 of 策略。这是语言设计选择，不是缺陷。

**分类：** ✅ 符合 ArkTS spec 的语言设计差异（与 TS 一致）

---

### 差异 E：类型关键字保护比 TypeScript 更严格 ✅ 符合 ArkTS Spec

**用例：** LEX_02_07_023_FAIL_TYPE_KW_INT

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

### 问题 F：catch 同时列在硬关键字表和软关键字表 ⚠️ 待确认

**用例：** LEX_02_07_015_PASS_HARD_KW_TRY_CATCH

**问题描述：** spec/lexical.md 表 1（硬关键字）和表 3（软关键字）都列出 `catch`。

**规范依据：**
- spec/lexical.md §2.7 表 1: 硬关键字包含 catch
- spec/lexical.md §2.7 表 3: 软关键字包含 catch

**待确认事项：**
1. catch 应只列在硬关键字表还是软关键字表？
2. 若是硬关键字，则 `let catch = 1` 必须失败
3. 若是软关键字，则 `let catch = 1` 在非 try-catch 上下文应允许

**分类：** ⚠️ 待确认（spec 表 1 和表 3 矛盾）

---

### 问题 G：var 在未来保留软关键字表但当前禁用 ⚠️ 待确认

**用例：** LEX_02_07_048_FAIL_VAR_DECLARATION

**问题描述：** spec/lexical.md 表 4 列出 var 为未来保留软关键字，但当前作变量声明会失败。

**规范依据：**
- spec/lexical.md §2.7 表 4: 未来保留软关键字包含 var

**待确认事项：**
1. "未来保留" 暗示当前可作标识符或软关键字，但实测当前已作为不可用的关键字
2. 若不打算实现 var 作变量声明 → 应明确说明 var 仅用于禁用，不是"未来保留"
3. 若计划支持 var → spec 应说明启用条件（如版本号）

**分类：** ⚠️ 待确认（spec 与实现矛盾）

---

### 问题 H：类型关键字的别名设计冗余 ⚠️ 待确认

**用例：** LEX_02_07_028_PASS_TYPE_INT_ALIAS

**问题描述：** spec/types.md 列出主名+别名都是硬关键字，但别名设计的目的不清晰。

**规范依据：**
- spec/types.md: 列出主名+别名都是硬关键字

**待确认事项：**
1. 别名设计的目的不清晰：与 TypeScript 兼容？与 Java 兼容？
2. 建议 spec 明确推荐使用哪种形式（主名还是别名）

**分类：** ⚠️ 待确认（spec 未明确定义别名设计目的）

---

## 四、与业界静态语言差异点汇总

以下差异点是 ArkTS 与 Java/Swift/TS 的设计选择差异，不构成设计缺陷，但需要开发者了解。

### 4.1 硬关键字

| 关键字 | ArkTS | Java | Swift | TypeScript | 说明 |
|-------|-------|------|-------|------------|------|
| class | ❌ | ❌ | ❌ | ❌ | 四语言一致 |
| let | ❌ | ✅ | ✅ | ❌ | ArkTS 与 TS 一致 |
| const | ❌ | ✅ | ❌ | ❌ | ArkTS 与 TS 一致 |
| function | ❌ | ✅ | ✅ | ❌ | ArkTS 与 TS 一致 |
| if/else/while/for | ❌ | ❌ | ❌ | ❌ | 四语言一致 |
| return/break/continue | ❌ | ❌ | ❌ | ❌ | 四语言一致 |
| new | ❌ | ❌ | ❌ | ❌ | 四语言一致 |
| null/true/false | ❌ | ❌ | ❌ | ❌ | 四语言一致 |
| instanceof | ❌ | ❌ | ✅ | ❌ | ArkTS 与 TS/Java 一致 |
| typeof | ❌ | ❌ | ❌ | ❌ | ArkTS 与 TS 一致 |

### 4.2 类型关键字

| 类型关键字 | ArkTS | Java | Swift | TypeScript | 说明 |
|----------|-------|------|-------|------------|------|
| int / Int | ❌ | ❌ | ✅ | ✅ | ArkTS 比 TS/Java 严格 |
| string / String | ❌ | ✅ | ✅ | ✅ | ArkTS 比 TS 严格 |
| boolean / Boolean | ❌ | ✅ | ✅ | ✅ | ArkTS 比 TS 严格 |
| Object / object | ❌ | ✅ | ✅ | ✅ | ArkTS 比 TS 严格 |
| void | ❌ | ✅ | ✅ | ❌ | ArkTS 与 TS 一致 |
| byte / short / long / float / double / char | ❌ | ❌ | ✅ | ✅ | ArkTS 比 TS/Java 严格 |

### 4.3 软关键字

| 软关键字 | ArkTS | Java | Swift | TypeScript | 说明 |
|--------|-------|------|-------|------------|------|
| type | ✅ | ❌ | ✅ | ✅ | ArkTS 与 TS/Swift 一致 |
| namespace | ✅ | ❌ | ❌ | ✅ | ArkTS 与 TS 一致 |
| readonly | ✅ | ❌ | ✅ | ✅ | ArkTS 与 TS/Swift 一致 |
| get / set | ✅ | ❌ | ✅ | ✅ | ArkTS 与 TS/Swift 一致 |
| keyof | ✅ | ❌ | ❌ | ✅ | ArkTS 与 TS 一致 |
| of | ✅ | ❌ | ❌ | ✅ | ArkTS 与 TS 一致 |
| from | ✅ | ❌ | ❌ | ✅ | ArkTS 与 TS 一致 |
| finally | ✅ | ❌ | ❌ | ✅ | ArkTS 与 TS 一致 |
| catch | ✅ | ❌ | ❌ | ✅ | ArkTS 与 TS 一致 |
| declare | ✅ | ❌ | ❌ | ✅ | ArkTS 与 TS 一致 |
| module | ✅ | ❌ | ❌ | ✅ | ArkTS 与 TS 一致 |
| out | ✅ | ❌ | ❌ | ✅ | ArkTS 与 TS 一致 |

### 4.4 未来保留关键字

| 未来保留关键字 | ArkTS | Java | Swift | TypeScript | 说明 |
|-------------|-------|------|-------|------------|------|
| is | ✅ | ✅ | ✅ | ✅ | 四语言一致 |
| memo | ✅ | ✅ | ✅ | ✅ | 四语言一致 |
| struct | ✅ | ✅ | ✅ | ✅ | 四语言一致 |
| var | ❌ | ✅ | ✅ | ⚠️ | ArkTS 比 TS 严格 |
| yield | ✅ | ✅ | ✅ | ✅ | 四语言一致 |

---

## 五、已验证 ArkTS 行为（符合 Spec）

以下行为已通过编译期 + 运行时验证，符合 spec/lexical.md 规范：

| 行为 | 用例编号 | 状态 | 规范依据 |
|------|---------|------|---------|
| 10 个核心硬关键字保护 | 001~010 | ✅ | spec/lexical.md |
| 12 类硬关键字使用场景 | 011~022 | ✅ | spec/lexical.md |
| 5 个核心类型关键字保护 | 023~027 | ✅ | spec/types.md |
| 5 组类型关键字别名等价 | 028~032 | ✅ | spec/types.md |
| 8 个软关键字在合法上下文 | 033~040 | ✅ | spec/lexical.md |
| 4 个软关键字作标识符 | 041~044 | ✅ | spec/lexical.md |
| 4 个未来保留作标识符 | 045/046/047/049 | ✅ | spec/lexical.md |
| var 作变量声明失败 | 048 | ✅ | spec/lexical.md |
| 大小写敏感（3 用例）| 050~052 | ✅ | spec/lexical.md |
| typeof / instanceof 运行时 | 053~054 | ✅ | spec/lexical.md |
| super/this 运行时 | 055 | ✅ | spec/lexical.md |
| 类型别名运行时同义 | 056 | ✅ | spec/types.md |
| 软关键字作标识符运行时 | 057 | ✅ | spec/lexical.md |
| of 关键字 | 097 | ✅ | spec/lexical.md |
| do-while 关键字 | 099 | ✅ | spec/lexical.md |
| switch-case 关键字 | 100 | ✅ | spec/lexical.md |
| throw 关键字 | 101 | ✅ | spec/lexical.md |

---

## 六、差异分类汇总

| 分类 | 数量 | 差异列表 |
|------|------|---------|
| ✅ 符合 ArkTS Spec 的语言设计差异 | 5 | 差异 A（typeof）、差异 B（namespace）、差异 C（keyof）、差异 D（of）、差异 E（类型关键字） |
| ⚠️ 待确认问题 | 3 | 问题 F（catch 矛盾）、问题 G（var 矛盾）、问题 H（别名冗余） |
| 与业界静态语言差异点 | 多项 | 见第四章汇总表 |

---

## 七、建议

### 7.1 修复 spec 矛盾

spec/lexical.md 应移除 catch 在表 3 的重复列出，只保留在硬关键字表。

### 7.2 明确 var 当前定位

spec/lexical.md 应明确 var 当前定位（"禁用"而非"未来保留"）。

### 7.3 说明 final 实现状态

spec/lexical.md 应明确 final 的当前状态（是否仅声明保留还是已实现）。

### 7.4 提供迁移工具

提供 TS→ArkTS 迁移工具自动重命名 `int`/`string` 等冲突标识符。

---

## 八、用例索引

| 用例 ID | 差异/问题 | 分类 | 关联规范 |
|---------|----------|------|---------|
| LEX_02_07_016 | 差异 A: typeof | ✅ 语言设计差异 | spec/lexical.md |
| LEX_02_07_034 | 差异 B: namespace | ✅ 语言设计差异 | spec/lexical.md |
| LEX_02_07_037 | 差异 C: keyof | ✅ 语言设计差异 | spec/lexical.md |
| LEX_02_07_038 | 差异 D: of | ✅ 语言设计差异 | spec/lexical.md |
| LEX_02_07_023 | 差异 E: 类型关键字 | ✅ 语言设计差异 | spec/types.md |
| LEX_02_07_015 | 问题 F: catch 矛盾 | ⚠️ 待确认 | spec/lexical.md |
| LEX_02_07_048 | 问题 G: var 矛盾 | ⚠️ 待确认 | spec/lexical.md |
| LEX_02_07_028 | 问题 H: 别名冗余 | ⚠️ 待确认 | spec/types.md |

---

## 九、Cross-Language 对比表格

### 差异 A: typeof（与 TS 一致，与 Java/Swift 不同）

| 语言 | typeof 关键字 | 规范依据 |
|------|-------------|---------|
| **ArkTS** | ✅ 支持 | spec/lexical.md |
| **Java** | ❌ 不支持 | JLS §3.9 |
| **Swift** | ❌ 不支持 | Swift Lang |
| **TypeScript** | ✅ 支持 | ECMAScript |

### 差异 B: namespace（与 TS 一致，与 Java/Swift 不同）

| 语言 | namespace 关键字 | 规范依据 |
|------|-----------------|---------|
| **ArkTS** | ✅ 支持 | spec/lexical.md |
| **Java** | ❌ 不支持 | JLS §3.9 |
| **Swift** | ❌ 不支持 | Swift Lang |
| **TypeScript** | ✅ 支持 | ECMAScript |

### 差异 C: keyof（与 TS 一致，与 Java/Swift 不同）

| 语言 | keyof 关键字 | 规范依据 |
|------|------------|---------|
| **ArkTS** | ✅ 支持 | spec/lexical.md |
| **Java** | ❌ 不支持 | JLS §3.9 |
| **Swift** | ❌ 不支持 | Swift Lang |
| **TypeScript** | ✅ 支持 | ECMAScript |

### 差异 D: of（与 TS 一致，与 Java/Swift 不同）

| 语言 | of 关键字 | 规范依据 |
|------|----------|---------|
| **ArkTS** | ✅ 支持 | spec/lexical.md |
| **Java** | ❌ 不支持 | JLS §3.9 |
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
1. 修复 spec 矛盾（catch）
2. 明确 var 当前定位
3. 说明 final 实现状态
4. 提供迁移工具
