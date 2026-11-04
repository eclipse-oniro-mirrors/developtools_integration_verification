# 17.4.1 Runtime Evaluation of Array Creation Expressions - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

**报告日期：** 2026-06-25
**测试用例数：** 12（3 compile-pass + 2 compile-fail + 7 runtime）
**通过率：** 100%（12/12）
**编译器：** es2panda + ark VM (Linux native)
**Spec 依据：** arktsspecification.md §17.4.1

## 报告分类口径

| 分类 | 含义 | 处理方式 |
|------|------|----------|
| 符合 ArkTS spec 的语言设计差异 | 行为与 Java/Swift 不同，但符合 ArkTS spec 或当前明确语义 | 不标为缺陷，仅记录差异 |
| Spec 与实现不一致 | 用例与 spec 要求不一致，且当前实现未按 spec 报错/运行 | 保留 FAIL 用例并记录 issue_report |
| 待确认问题 | 需要补充 stdlib/spec/实现依据后才能定性 | 暂不判定为缺陷 |
| 已验证规范一致行为 | 用例验证 ArkTS 行为符合 spec | 记录为通过项 |

---

## 一、符合 ArkTS spec 的语言设计差异

### 差异 A：维度表达式仅求值一次

**分类：** 符合 ArkTS spec 的语言设计差异

#### Spec 依据
§17.4.1 规定 array creation expression 的维度表达式在数组创建过程中仅被求值一次。即使维度表达式含有副作用（如变量自增），也只执行一次。

#### 实测行为
```typescript
let counter = 0
function sideEffect(): int { counter++; return 5 }
let a = new int[sideEffect()](0)
// counter == 1（仅求值一次）
```

| 语言 | 维度表达式求值次数 |
|------|-----------------|
| ArkTS | 恰好一次 |
| Java | new int[n] 中 n 求值一次 |
| Swift | Array(repeating:count:) 中 count 求值一次 |

三国语言行为一致。

---

### 差异 B：维度表达式先于元素表达式求值

**分类：** 符合 ArkTS spec 的语言设计差异

#### Spec 依据
§17.4.1 规定 array creation expression 中维度表达式在元素表达式之前被求值。

#### 实测行为
```typescript
let log: string[] = []
function dim(): int { log.push("dim"); return 2 }
function elem(): int { log.push("elem"); return 0 }
let a = new int[dim()](elem())
// log == ["dim", "elem"]（维度先于元素求值）
```

| 语言 | 求值顺序 |
|------|--------|
| ArkTS | 维度 -> 元素 |
| Java | 维度 -> 元素 (new int[n] + fill) |
| Swift | count -> repeatedValue (Array repeating) |

三国语言行为一致。

---

### 差异 C：零维度数组创建空数组

**分类：** 符合 ArkTS spec 的语言设计差异

#### 实测行为
```typescript
let a = new int[0](0)    // 创建空数组，length == 0
```

| 语言 | 零长度数组 |
|------|----------|
| ArkTS | 合法，创建空数组 |
| Java | 合法，new int[0] |
| Swift | 合法，Array(repeating:count: 0) |
| TypeScript | 合法，new Array(0) |

三国语言均支持零长度数组。

---

### 差异 D：运行时负维度抛出 NegativeArraySizeError

**分类：** 符合 ArkTS spec 的语言设计差异

#### 实测行为
```typescript
let n: int = -5
let a = new int[n](0)    // 运行时抛出 NegativeArraySizeError
```

| 语言 | 运行时负维度行为 |
|------|---------------|
| ArkTS | NegativeArraySizeError |
| Java | NegativeArraySizeException |
| Swift | fatal error / precondition failure |

ArkTS 的 NegativeArraySizeError 与 Java 的 NegativeArraySizeException 语义一致，命名相似。

---

## 二、已验证规范一致行为

经 es2panda + ark VM 实测，以下行为与 ArkTS spec §17.4.1 一致：

| 行为 | 验证方式 | 结果 |
|------|---------|------|
| 基本 int 数组创建表达式编译 | compile-pass (001) | 通过 |
| 变量维度数组创建编译 | compile-pass (002) | 通过 |
| type alias 元素类型数组创建编译 | compile-pass (003) | 通过 |
| 常量负维度编译期拒绝 (ESE0247+ESE708183) | compile-fail (010) | 正确拒绝 |
| float 维度编译期拒绝 (ESE0046) | compile-fail (011) | 正确拒绝 |
| 正维度数组长度和元素值验证 | runtime (020) | 通过 |
| 零维度空数组验证 | runtime (021) | 通过 |
| 运行时负维度 NegativeArraySizeError | runtime (022) | 通过 |
| 维度表达式仅求值一次 | runtime (023) | 通过 |
| 大维度（1000）数组创建 | runtime (024) | 通过 |
| 维度表达式带计算 (2+3=5) | runtime (025) | 通过 |
| 求值顺序（维度先于元素） | runtime (026) | 通过 |

---

## 三、跨语言对比摘要

| 维度 | ArkTS | Java | Swift | TypeScript |
|------|-------|------|-------|-----------|
| 维度表达式求值次数 | 恰好一次 | 恰好一次 | 恰好一次 | 恰好一次 |
| 求值顺序 | 维度 -> 元素 | 维度 -> 元素 | count -> repeatedValue | 参数从左到右 |
| 零维度数组 | 合法 | 合法 | 合法 | 合法 |
| 运行时负维度 | NegativeArraySizeError | NegativeArraySizeException | fatal error | 不抛异常（空数组） |
| 编译期负常量维度 | 拒绝 (ESE0247+ESE708183) | 拒绝 | 拒绝 | 不拒绝 |
| 编译验证 | 12/12 全部通过 | javac | swiftc | tsc |
| Spec 一致性 | 与 spec 完全一致 | 与 JLS 一致 | 一致 | N/A |

---

## 四、分类汇总

| 条目 | 分类 |
|------|------|
| 差异 A：维度表达式仅求值一次（与 Java/Swift 一致） | 符合 ArkTS spec 的语言设计差异 |
| 差异 B：维度表达式先于元素表达式求值（与 Java/Swift 一致） | 符合 ArkTS spec 的语言设计差异 |
| 差异 C：零维度数组创建空数组（与 Java/Swift 一致） | 符合 ArkTS spec 的语言设计差异 |
| 差异 D：运行时负维度 NegativeArraySizeError（与 Java 语义一致） | 符合 ArkTS spec 的语言设计差异 |
| 已验证规范一致行为 | 12 项全部通过 |

---

## 五、关联记录

- 章节级异常汇总：[issue_report.md](../../issue_report.md)
- 测试执行报告：[test_report_17.4.1.md](test_report_17.4.1.md)
- 测试设计：[test_design_mindmap_17.4.1.md](test_design_mindmap_17.4.1.md)
