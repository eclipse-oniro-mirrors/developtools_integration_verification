# 17.1 Type char - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

**报告日期：** 2026-06-23
**测试用例数：** 13（5 compile-pass + 5 compile-fail + 3 runtime）
**通过率：** 100%（13/13）
**编译器：** es2panda + ark VM (Linux native)
**Spec 依据：** arktsspecification.md §17.1

## 报告分类口径

| 分类 | 含义 | 处理方式 |
|------|------|----------|
| 符合 ArkTS spec 的语言设计差异 | 行为与 Java/Swift 不同，但符合 ArkTS spec 或当前明确语义 | 不标为缺陷，仅记录差异 |
| Spec 与实现不一致 | 用例与 spec 要求不一致，且当前实现未按 spec 报错/运行 | 保留 FAIL 用例并记录 issue_report |
| 已验证规范一致行为 | 用例验证 ArkTS 行为符合 spec | 记录为通过项 |

---

## 一、符合 ArkTS spec 的语言设计差异

### 差异 A：char 是 class 类型而非原始整数类型

**分类：** 符合 ArkTS spec 的语言设计差异

#### Spec 依据
§17.1 明确声明：char is a class type, subtype of Object。char 不是数值类型（不同于 Java 设计），不能隐式转换为 int/long/short/byte。

#### 实测行为
```typescript
let a_char: char = c'a'     // ✅ 编译通过
let o: Object = a_char       // ✅ 编译通过（子类型）
let n: int = a_char          // ❌ 编译错误
let c: char = 65             // ❌ 编译错误
```

#### 跨语言对比

| 语言 | char 类型本质 | char->int | char->Object | char 算术 |
|------|------------|-----------|-------------|----------|
| ArkTS | class 类型 | ❌ 禁止 | ✅ 直接赋值 | ❌ 禁止 |
| Java | primitive 整数 | ✅ widening | ⚠️ 自动装箱 | ✅ 允许 |
| Swift | 无对应类型 | N/A | N/A | N/A |
| TypeScript | 无独立 char | N/A | N/A | N/A |

---

### 差异 B：char 不能隐式转换到任何数值类型

**分类：** 符合 ArkTS spec 的语言设计差异

#### 实测行为
```typescript
let ch: char = c'A'
let n: int = ch       // ❌ Type 'Char' cannot be assigned to 'Int'
let d: double = ch    // ❌ 编译错误
let l: long = ch      // ❌ 编译错误
```

Java 中 `char` 可以 widening 到 `int`、`long`、`float`、`double`。ArkTS 禁止此行为，增强了类型安全性。

---

### 差异 C：char 是保留关键字

**分类：** 符合 ArkTS spec 的语言设计差异

#### 实测行为
```typescript
let char: int = 65    // ❌ 编译错误：char is a predefined type
```

Java 同样禁止使用 `char` 作为变量名（是保留字），ArkTS 行为一致。

---

## 二、已验证规范一致行为

经 es2panda + ark VM 实测，以下行为与 ArkTS spec §17.1 一致：

| 行为 | 验证方式 | 结果 |
|------|---------|------|
| char 变量声明和初始化 | 5 compile-pass | ✅ 全部通过 |
| char 赋值给 Object（子类型） | compile-pass (002) | ✅ 通过 |
| char 作为函数参数/返回类型 | compile-pass (003) | ✅ 通过 |
| char 作为类字段类型 | compile-pass (004) | ✅ 通过 |
| char 作为泛型参数 (char[]) | compile-pass (005) | ✅ 通过 |
| int 不能赋给 char | compile-fail (006) | ✅ 编译错误 |
| char 不能赋给 int | compile-fail (007) | ✅ 编译错误 |
| string 不能赋给 char | compile-fail (008) | ✅ 编译错误 |
| boolean 不能赋给 char | compile-fail (009) | ✅ 编译错误 |
| char 不能作为变量名 | compile-fail (010) | ✅ 编译错误 |
| c'a' == 0x61 值验证 | runtime (011) | ✅ 通过 |
| char->Object instanceof 验证 | runtime (012) | ✅ 通过 |
| char[] 数组操作 | runtime (013) | ✅ 通过 |

---

## 三、跨语言对比摘要

| 维度 | ArkTS | Java | Swift | TypeScript |
|------|-------|------|-------|-----------|
| 编译验证 | ✅ es2panda — 13/13 通过 | ✅ javac | N/A | N/A |
| 运行时验证 | ✅ ark VM — 3/3 runtime 通过 | ✅ JVM | N/A | N/A |
| Spec 一致性 | ✅ 与 spec §17.1 一致 | ✅ JLS §4.2.1 | N/A | N/A |
| char 类型本质 | class | primitive | 无独立 char | 无独立 char |

---

## 四、分类汇总

| 条目 | 分类 |
|------|------|
| 差异 A：char 是 class 类型 | 符合 ArkTS spec 的语言设计差异 |
| 差异 B：char 不能隐式转换到数值类型 | 符合 ArkTS spec 的语言设计差异 |
| 差异 C：char 是保留关键字 | 符合 ArkTS spec 的语言设计差异 |
| 已验证规范一致行为 | 13 项全部通过 |

---

## 五、关联记录

- 章节级异常汇总：[issue_report.md](../../issue_report.md)
- 测试执行报告：[test_report_17.1.md](test_report_17.1.md)
- 测试设计：[test_design_mindmap_17.1.md](test_design_mindmap_17.1.md)
- 跨语言对比：[comparison_report_arkts_java_swift.md](comparison_report_arkts_java_swift.md)
