# 17.1.2 char Operations - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

**报告日期：** 2026-06-23
**测试用例数：** 16（6 compile-pass + 5 compile-fail + 5 runtime）
**通过率：** 100%（16/16）
**编译器：** es2panda + ark VM (Linux native)
**Spec 依据：** arktsspecification.md §17.1.2

## 报告分类口径

| 分类 | 含义 | 处理方式 |
|------|------|----------|
| 符合 ArkTS spec 的语言设计差异 | 行为与 Java/Swift 不同，但符合 ArkTS spec 或当前明确语义 | 不标为缺陷，仅记录差异 |
| Spec 与实现不一致 | 用例与 spec 要求不一致，且当前实现未按 spec 报错/运行 | 保留 FAIL 用例并记录 issue_report |
| 已验证规范一致行为 | 用例验证 ArkTS 行为符合 spec | 记录为通过项 |

---

## 一、符合 ArkTS spec 的语言设计差异

### 差异 A：char 禁止算术运算

**分类：** 符合 ArkTS spec 的语言设计差异

#### Spec 依据
§17.1.2 仅列出相等运算符（==, !=, ===）和关系运算符（<, >, <=, >=）对 char 有效。未列出算术运算符，实测中 char 的算术运算产生编译错误。

#### 实测行为
```typescript
let c1: char = c'a'
let c2: char = c'b'
let sum: char = c1 + c2   // ❌ 编译错误
let diff: char = c1 - 1   // ❌ 编译错误
let prod: char = c1 * 2   // ❌ 编译错误
```

#### 跨语言对比

| 语言 | char + char | char - int | char * int | char / int |
|------|-----------|-----------|-----------|-----------|
| ArkTS | ❌ 编译错误 | ❌ 编译错误 | ❌ 编译错误 | ❌ 编译错误 |
| Java | ✅ 结果为 int | ✅ 结果为 int | ✅ 结果为 int | ✅ 结果为 int |
| Swift | N/A | N/A | N/A | N/A |

**结论：** ArkTS 禁止 char 算术运算，与 Java 不同但增强了类型安全性。这是符合 ArkTS spec 的设计选择。

---

### 差异 B：char 与数值类型比较的特殊语义

**分类：** 符合 ArkTS spec 的语言设计差异

#### Spec 依据
§17.1.2 规定：当 char 与数值类型比较时，比较按该数值类型的整数进行。例如 `c'a' > 3.14` (97 > 3.14) = true。

#### 实测行为
```typescript
let c: char = c'a'
c == 0x61     // ✅ true (spec 示例)
c > 3.14      // ✅ true (spec 示例)
c < 200.5     // ✅ true
c == 97.0     // ✅ true
```

Java 中 char 与数值比较的行为相同（因为 char 是整数类型）。ArkTS 中 char 虽不是整数类型，但 spec 明确允许此类比较。

---

## 二、已验证规范一致行为

经 es2panda + ark VM 实测，以下行为与 ArkTS spec §17.1.2 一致：

| 行为 | 验证方式 | 结果 |
|------|---------|------|
| char == char, char != char | compile-pass (001) | ✅ 通过 |
| char <, >, <=, >= char | compile-pass (002) | ✅ 通过 |
| char === char 严格相等 | compile-pass (003) | ✅ 通过 |
| char == int | compile-pass (004) | ✅ 通过 |
| char <, >, <=, >= int | compile-pass (005) | ✅ 通过 |
| char >, <, == double | compile-pass (006) | ✅ 通过 |
| char == string 编译失败 | compile-fail (007) | ✅ 编译错误 |
| char == boolean 编译失败 | compile-fail (008) | ✅ 编译错误 |
| char + char 编译失败 | compile-fail (009) | ✅ 编译错误 |
| char - int 编译失败 | compile-fail (010) | ✅ 编译错误 |
| char * int 编译失败 | compile-fail (011) | ✅ 编译错误 |
| c'a' == 0x61 运行时验证 | runtime (012) | ✅ spec 示例通过 |
| c'a' < c'b' 运行时验证 | runtime (013) | ✅ spec 示例通过 |
| c'a' > 3.14 运行时验证 | runtime (014) | ✅ spec 示例通过 |
| 无符号比较 U+FFFF > U+0041 | runtime (015) | ✅ 通过 |
| c'X' === c'X' 严格相等 | runtime (016) | ✅ 通过 |

---

## 三、跨语言对比摘要

| 维度 | ArkTS | Java | Swift | TypeScript |
|------|-------|------|-------|-----------|
| 编译验证 | ✅ es2panda — 16/16 通过 | ✅ javac | N/A | N/A |
| 运行时验证 | ✅ ark VM — 5/5 runtime 通过 | ✅ JVM | N/A | N/A |
| Spec 一致性 | ✅ 与 spec §17.1.2 完全一致 | ✅ JLS §15 | N/A | N/A |
| 比较运算符 | ==, !=, ===, <, >, <=, >= | ==, !=, <, >, <=, >= | 仅 ==, != | N/A |
| 算术运算符 | 禁止 | 允许 | N/A | N/A |

---

## 四、分类汇总

| 条目 | 分类 |
|------|------|
| 差异 A：char 禁止算术运算 | 符合 ArkTS spec 的语言设计差异 |
| 差异 B：char 与数值比较语义 | 符合 ArkTS spec 的语言设计差异 |
| 已验证规范一致行为 | 16 项全部通过 |

---

## 五、关联记录

- 章节级异常汇总：[issue_report.md](../../issue_report.md)
- 测试执行报告：[test_report_17.1.2.md](test_report_17.1.2.md)
- 测试设计：[test_design_mindmap_17.1.2.md](test_design_mindmap_17.1.2.md)
- 跨语言对比：[comparison_report_arkts_java_swift.md](comparison_report_arkts_java_swift.md)
