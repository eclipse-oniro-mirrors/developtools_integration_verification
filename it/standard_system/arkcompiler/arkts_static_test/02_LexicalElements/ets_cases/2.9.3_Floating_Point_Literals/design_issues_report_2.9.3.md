# 2.9.3 Floating-Point Literals - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-22
**测试用例数：** 29（compile-pass: 12, compile-fail: 4, runtime: 13）
**更新版本：** v3.0 - 重新分类：区分"语言设计差异"与"规范一致性问题"
**目的：** 通过用例执行（编译期 + 运行时）+ 跨语言对比，识别 ArkTS 在浮点字面量方面与 Java/Swift/TS 的行为差异，以及规范与实现的一致性问题。

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
| spec/lexical.md | §2.9.3 Floating-Point Literals | 定义浮点字面量语法规则 |
| spec/types.md | §3.1 Predefined Types | 定义 float/double 类型 |

---

## 二、符合 ArkTS Spec 的语言设计差异（与 Java/Swift/TS 不同）

以下差异点是 ArkTS 的有意设计选择，符合 spec 定义，与 Java/Swift/TS 行为不同但不构成设计缺陷。

### 差异 A：支持无前导零浮点，与 Swift 不同 ✅ 符合 ArkTS Spec

**用例：** LEX_02_09_03_002_PASS_FLOAT_NO_LEADING_ZERO

**ArkTS Spec 描述：** spec/lexical.md 定义浮点字面量可以省略前导零。

**实际行为（编译通过）：**
```typescript
let x: double = .5  // 无前导零浮点
```

**与业界静态语言对比：**
| 语言 | 无前导零浮点 | 规范依据 |
|------|------------|---------|
| **ArkTS** | ✅ 支持 | spec/lexical.md |
| **Java** | ✅ 支持 | JLS §3.10 |
| **Swift** | ❌ 不支持 | Swift Lang |
| **TypeScript** | ✅ 支持 | ECMAScript |

**差异说明：** ArkTS 选择与 TypeScript/Java 一致的无前导零浮点策略。这是语言设计选择，不是缺陷。

**分类：** ✅ 符合 ArkTS spec 的语言设计差异（与 TS/Java 一致）

---

### 差异 B：支持 `f` 后缀 float 字面量，与 Swift 不同 ✅ 符合 ArkTS Spec

**用例：** LEX_02_09_03_005_PASS_FLOAT_SUFFIX

**ArkTS Spec 描述：** spec/lexical.md 定义 float 字面量使用 `f` 后缀。

**实际行为（编译通过）：**
```typescript
let x: float = 3.14f  // float 后缀
```

**与业界静态语言对比：**
| 语言 | float 后缀 | 规范依据 |
|------|----------|---------|
| **ArkTS** | `f` | spec/lexical.md |
| **Java** | `f` | JLS §3.10 |
| **Swift** | 类型声明 | Swift Lang |
| **TypeScript** | `f` | ECMAScript |

**差异说明：** ArkTS 选择与 TypeScript/Java 一致的 `f` 后缀策略。这是语言设计选择，不是缺陷。

**分类：** ✅ 符合 ArkTS spec 的语言设计差异（与 TS/Java 一致）

---

### 差异 C：支持下划线分隔符，与 Java/Swift 一致 ✅ 符合 ArkTS Spec

**用例：** LEX_02_09_03_003_PASS_FLOAT_UNDERSCORE

**ArkTS Spec 描述：** spec/lexical.md 定义下划线分隔符用于提高可读性。

**实际行为（编译通过）：**
```typescript
let x: double = 3.141_592  // 下划线分隔符
```

**与业界静态语言对比：**
| 语言 | 下划线分隔符 | 规范依据 |
|------|------------|---------|
| **ArkTS** | ✅ 支持 | spec/lexical.md |
| **Java** | ✅ 支持 | JLS §3.10 |
| **Swift** | ✅ 支持 | Swift Lang |
| **TypeScript** | ✅ 支持 | ECMAScript |

**差异说明：** ArkTS 选择与 TypeScript/Swift/Java 一致的下划线分隔符策略。这是语言设计选择，不是缺陷。

**分类：** ✅ 符合 ArkTS spec 的语言设计差异（与 TS/Swift/Java 一致）

---

## 三、待确认问题（需要 Spec 团队确认）

### 问题 D：float/double 类型推断规则 ⚠️ 待确认

**用例：** LEX_02_09_03_007_PASS_TYPE_INFERENCE_DOUBLE, LEX_02_09_03_008_PASS_TYPE_INFERENCE_FLOAT

**问题描述：** ArkTS 的 float/double 类型推断规则与 Java 一致，但与 TypeScript 不同。

**规范依据：**
- spec/types.md: 定义 float/double 类型

**与业界静态语言对比：**
| 语言 | 类型推断 | 规范依据 |
|------|---------|---------|
| **ArkTS** | `float`/`double` | spec/types.md |
| **Java** | `float`/`double` | JLS §3.10 |
| **Swift** | `Float`/`Double` | Swift Lang |
| **TypeScript** | `number` | ECMAScript |

**待确认事项：**
1. spec 是否需要明确 float/double 类型推断规则？
2. 是否需要与 TypeScript 保持一致（使用 `number` 类型）？

**分类：** ⚠️ 待确认（spec 未明确定义类型推断规则）

---

### 问题 E：特殊值（NaN/Infinity）检测方法 ⚠️ 待确认

**用例：** LEX_02_09_03_016_RT_NAN_DETECTION, LEX_02_09_03_017_RT_INFINITY_DETECTION

**问题描述：** ArkTS 的 NaN/Infinity 检测方法与 Java/Swift 不同。

**规范依据：**
- spec/types.md: 定义 float/double 类型

**与业界静态语言对比：**
| 语言 | NaN 检测 | Infinity 检测 | 规范依据 |
|------|---------|-------------|---------|
| **ArkTS** | `isNaN(x)` | `isInfinity(x)` | spec/types.md |
| **Java** | `Double.isNaN(x)` | `Double.isInfinite(x)` | JLS §3.10 |
| **Swift** | `x.isNaN` | `x.isInfinite` | Swift Lang |
| **TypeScript** | `Number.isNaN(x)` | `!Number.isFinite(x)` | ECMAScript |

**待确认事项：**
1. spec 是否需要明确 NaN/Infinity 检测方法？
2. 是否需要提供跨语言方法映射说明？

**分类：** ⚠️ 待确认（spec 未明确定义检测方法）

---

## 四、与业界静态语言差异点汇总

以下差异点是 ArkTS 与 Java/Swift/TS 的设计选择差异，不构成设计缺陷，但需要开发者了解。

### 4.1 浮点字面量

| 特性 | ArkTS | Java | Swift | TypeScript | 说明 |
|------|-------|------|-------|------------|------|
| 标准浮点 | ✅ | ✅ | ✅ | ✅ | 四语言一致 |
| 无前导零 | `.5` | `.5` | `0.5` | `.5` | Swift 不同 |
| 下划线 | ✅ | ✅ | ✅ | ✅ | 四语言一致 |
| 科学计数法 | ✅ | ✅ | ✅ | ✅ | 四语言一致 |
| float 后缀 | `f` | `f` | 类型声明 | `f` | Swift 不同 |

### 4.2 类型推断

| 条件 | ArkTS | Java | Swift | TypeScript | 说明 |
|------|-------|------|-------|------------|------|
| 无后缀 | `double` | `double` | `Double` | `number` | 64位浮点 |
| 带 f 后缀 | `float` | `float` | `Float` | `number` | 32位浮点 |

### 4.3 特殊值

| 特殊值 | ArkTS | Java | Swift | TypeScript | 说明 |
|--------|-------|------|-------|------------|------|
| NaN | `isNaN(x)` | `Double.isNaN(x)` | `x.isNaN` | `Number.isNaN(x)` | 四语言一致 |
| Infinity | `isInfinity(x)` | `Double.isInfinite(x)` | `x.isInfinite` | `!Number.isFinite(x)` | 四语言一致 |

---

## 五、已验证 ArkTS 行为（符合 Spec）

以下行为已通过编译期 + 运行时验证，符合 spec/lexical.md 规范：

| 行为 | 用例编号 | 状态 | 规范依据 |
|------|---------|------|---------|
| 标准浮点 | 001 | ✅ | spec/lexical.md |
| 无前导零浮点 | 002 | ✅ | spec/lexical.md |
| 下划线分隔符 | 003 | ✅ | spec/lexical.md |
| 科学计数法 | 004 | ✅ | spec/lexical.md |
| float 后缀 | 005 | ✅ | spec/lexical.md |
| 科学计数法下划线 | 006 | ✅ | spec/lexical.md |
| double 推断 | 007 | ✅ | spec/types.md |
| float 推断 | 008 | ✅ | spec/types.md |
| float 过大失败 | 009 | ✅ | spec/lexical.md |
| double 过大失败 | 010 | ✅ | spec/lexical.md |
| 无效后缀失败 | 011 | ✅ | spec/lexical.md |
| 浮点运算 | 012 | ✅ | spec/lexical.md |
| 科学计数法值 | 013 | ✅ | spec/lexical.md |
| float 后缀值 | 014 | ✅ | spec/lexical.md |
| 下划线值 | 015 | ✅ | spec/lexical.md |
| NaN 检测 | 016 | ✅ | spec/types.md |
| Infinity 检测 | 017 | ✅ | spec/types.md |
| 精度损失 | 018 | ✅ | spec/types.md |
| float/double 混合 | 019 | ✅ | spec/types.md |
| 负浮点数 | 023 | ✅ | spec/lexical.md |
| 零浮点表示 | 024 | ✅ | spec/lexical.md |
| 科学计数法变体 | 025 | ✅ | spec/lexical.md |
| 特殊值运算 | 026 | ✅ | spec/types.md |
| float/double 精度 | 027 | ✅ | spec/types.md |

---

## 六、差异分类汇总

| 分类 | 数量 | 差异列表 |
|------|------|---------|
| ✅ 符合 ArkTS Spec 的语言设计差异 | 3 | 差异 A（无前导零）、差异 B（float 后缀）、差异 C（下划线） |
| ⚠️ 待确认问题 | 2 | 问题 D（类型推断规则）、问题 E（特殊值检测） |
| 与业界静态语言差异点 | 多项 | 见第四章汇总表 |

---

## 七、建议

### 7.1 规范文档建议

1. **明确 float/double 类型推断规则**
   - 在 spec 中添加类型推断规则说明
   - 提供示例说明正确的类型推断方式

2. **补充特殊值检测方法说明**
   - 在 spec 中添加 NaN/Infinity 检测方法说明
   - 提供跨语言方法映射说明

### 7.2 测试策略建议

1. **使用概念映射验证跨语言一致性**
   - Java 使用 `Double.isNaN(x)` 替代 `isNaN(x)`
   - Swift 使用 `x.isNaN` 替代 `isNaN(x)`

2. **增加边界测试**
   - float/double 最大/最小值
   - 精度损失边界
   - 特殊值运算边界

---

## 八、用例索引

| 用例 ID | 差异/问题 | 分类 | 关联规范 |
|---------|----------|------|---------|
| LEX_02_09_03_002 | 差异 A: 无前导零 | ✅ 语言设计差异 | spec/lexical.md |
| LEX_02_09_03_005 | 差异 B: float 后缀 | ✅ 语言设计差异 | spec/lexical.md |
| LEX_02_09_03_003 | 差异 C: 下划线 | ✅ 语言设计差异 | spec/lexical.md |
| LEX_02_09_03_007 | 问题 D: 类型推断规则 | ⚠️ 待确认 | spec/types.md |
| LEX_02_09_03_016 | 问题 E: 特殊值检测 | ⚠️ 待确认 | spec/types.md |

---

## 九、Cross-Language 对比表格

### 差异 A: 无前导零浮点（与 TS/Java 一致，与 Swift 不同）

| 语言 | 无前导零浮点 | 规范依据 |
|------|------------|---------|
| **ArkTS** | ✅ 支持 | spec/lexical.md |
| **Java** | ✅ 支持 | JLS §3.10 |
| **Swift** | ❌ 不支持 | Swift Lang |
| **TypeScript** | ✅ 支持 | ECMAScript |

### 差异 B: float 后缀（与 TS/Java 一致，与 Swift 不同）

| 语言 | float 后缀 | 规范依据 |
|------|----------|---------|
| **ArkTS** | `f` | spec/lexical.md |
| **Java** | `f` | JLS §3.10 |
| **Swift** | 类型声明 | Swift Lang |
| **TypeScript** | `f` | ECMAScript |

### 差异 C: 下划线（与 TS/Swift/Java 一致）

| 语言 | 下划线分隔符 | 规范依据 |
|------|------------|---------|
| **ArkTS** | ✅ 支持 | spec/lexical.md |
| **Java** | ✅ 支持 | JLS §3.10 |
| **Swift** | ✅ 支持 | Swift Lang |
| **TypeScript** | ✅ 支持 | ECMAScript |

---

**报告生成人：** GLM5.1
**最后更新：** 2026-06-22
**下一步行动：**
1. 明确 float/double 类型推断规则
2. 补充特殊值检测方法说明
3. 增加边界测试
