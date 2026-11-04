# 17.1.1 char Literals - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

**报告日期：** 2026-06-23
**测试用例数：** 15（5 compile-pass + 5 compile-fail + 5 runtime）
**通过率：** 93.3%（14/15，1 SPEC 不一致）
**编译器：** es2panda + ark VM (Linux native)
**Spec 依据：** arktsspecification.md §17.1.1

## 报告分类口径

| 分类 | 含义 | 处理方式 |
|------|------|----------|
| 符合 ArkTS spec 的语言设计差异 | 行为与 Java/Swift 不同，但符合 ArkTS spec 或当前明确语义 | 不标为缺陷，仅记录差异 |
| Spec 与实现不一致 | 用例与 spec 要求不一致，且当前实现未按 spec 报错/运行 | 保留 FAIL 用例并记录 issue_report |
| 已验证规范一致行为 | 用例验证 ArkTS 行为符合 spec | 记录为通过项 |

---

## 一、符合 ArkTS spec 的语言设计差异

### 差异 A：char 字面量使用 c'X' 语法（c 前缀）

**分类：** 符合 ArkTS spec 的语言设计差异

#### Spec 依据
§17.1.1 定义 char 字面量为 `c'X'` 语法，其中 X 是单 UTF-16 符号或转义序列。c 前缀明确区分 char 字面量和 string 字面量。

#### 实测行为
```typescript
let a: char = c'a'     // ✅ 编译通过
let b: char = c'\n'    // ✅ 编译通过
let c: char = c'\x7F'  // ✅ 编译通过
```

#### 跨语言对比

| 语言 | char 字面量语法 |
|------|----------------|
| ArkTS | `c'X'` — c 前缀区分 char/string |
| Java | `'X'` — 单引号即 char |
| Swift | `"X"` — 通过类型标注区分 Character |
| TypeScript | 无独立 char 类型 |

---

### 差异 B：十六进制转义 \xHH 是 ArkTS 独有

**分类：** 符合 ArkTS spec 的语言设计差异

#### 实测行为
```typescript
let a: char = c'\x41'  // ✅ 值为 65 ('A')
```

Java 不支持 `\xHH` 格式的字符转义（仅在字符串中有 `\uXXXX`），ArkTS 支持 `\xHH` 是一个额外的表达能力。

---

## 二、Spec 与实现不一致

### 不一致 D-001：c'\q' 非法转义序列被接受 ⚠️

**用例 ID：** EXP2_17_01_01_009_FAIL_INVALID_ESCAPE
**分类：** D 类（Spec 与实现不一致）

#### Spec 规则
§17.1.1 规定 char 字面量中 X 必须是有效的 UTF-16 符号或转义序列。`\q` 不是标准转义序列，应产生编译时错误。

#### 实际行为
```typescript
let invalid: char = c'\q'  // ✅ 编译通过，无任何错误或警告
```

#### 跨语言对比

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `c'\q'` | ⚠️ 编译通过（与 spec 不一致） |
| Java | `'\q'` | ❌ 编译错误：illegal escape character |
| Swift | N/A | N/A |

#### 建议
编译器应拒绝未定义的转义序列 `\q`，与 Java 行为一致。

---

## 三、已验证规范一致行为

经 es2panda + ark VM 实测，以下行为与 ArkTS spec §17.1.1 一致：

| 行为 | 验证方式 | 结果 |
|------|---------|------|
| 基本 ASCII char 字面量 (c'a', c'Z', c'0') | compile-pass (001) | ✅ 通过 |
| 转义序列 (c'\n', c'\t', c'\r', c'\\') | compile-pass (002) | ✅ 通过 |
| 十六进制转义 (c'\x41', c'\x7F', c'\x00', c'\xFF') | compile-pass (003) | ✅ 通过 |
| Unicode 转义 (c'A', c'a', c'') | compile-pass (004) | ✅ 通过 |
| 边界值 (c'\x00' U+0000, c'￿' U+FFFF) | compile-pass (005) | ✅ 通过 |
| 空字面量 c'' 编译失败 | compile-fail (006) | ✅ ESY0077 |
| 多字符 c'ab' 编译失败 | compile-fail (007) | ✅ ESY0261 |
| 超出范围 c'\u{FFFFF}' 编译失败 | compile-fail (008) | ✅ ESY0261 |
| 非法十六进制 c'\xGG' 编译失败 | compile-fail (010) | ✅ 编译错误 |
| ASCII 值运行时验证 | runtime (011) | ✅ 3 断言通过 |
| 转义序列值运行时验证 | runtime (012) | ✅ 4 断言通过 |
| 十六进制值运行时验证 | runtime (013) | ✅ 4 断言通过 |
| Unicode 值运行时验证 | runtime (014) | ✅ 3 断言通过 |
| 边界值运行时验证 | runtime (015) | ✅ 4 断言通过 |

---

## 四、跨语言对比摘要

| 维度 | ArkTS | Java | Swift | TypeScript |
|------|-------|------|-------|-----------|
| 编译验证 | ✅ es2panda — 14/15 (1 SPEC 不一致) | ✅ javac | N/A | N/A |
| 运行时验证 | ✅ ark VM — 5/5 runtime 通过 | ✅ JVM | N/A | N/A |
| Spec 一致性 | ⚠️ 1 处不一致 (c'\q') | ✅ JLS | N/A | N/A |
| 字面量语法 | c'X' | 'X' | Character("X") | 无 |

---

## 五、分类汇总

| 条目 | 分类 |
|------|------|
| 差异 A：c'X' 语法 | 符合 ArkTS spec 的语言设计差异 |
| 差异 B：十六进制转义 \xHH | 符合 ArkTS spec 的语言设计差异 |
| 不一致 D-001：c'\q' 被接受 | ⚠️ Spec 与实现不一致 |
| 已验证规范一致行为 | 14 项 |

---

## 六、关联记录

- 章节级异常汇总：[issue_report.md](../../issue_report.md)
- 测试执行报告：[test_report_17.1.1.md](test_report_17.1.1.md)
- 测试设计：[test_design_mindmap_17.1.1.md](test_design_mindmap_17.1.1.md)
- 跨语言对比：[comparison_report_arkts_java_swift.md](comparison_report_arkts_java_swift.md)
