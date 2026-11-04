# 17.1.2 char Operations - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-23
**规范来源：** ArkTS Static Spec §17.1.2, Java JLS SE21 §15, Swift Language Reference (Basic Operators)
**测试基础：** 16 个用例（6 compile-pass + 5 compile-fail + 5 runtime）

---

## 一、概览：三语言定位

| 语言 | char 操作语义 | 限制 |
|------|------------|------|
| **ArkTS** | 比较运算（==, !=, ===, <, >, <=, >=），禁止算术 | 仅比较，无算术 |
| **Java** | 所有整数运算（包括比较和算术） | char 是完整的整数类型 |
| **Swift** | Character 仅支持 ==, != | 无关系运算，无算术 |

---

## 二、章节对应关系

| ArkTS 17.1.2 | Java §15 | Swift | 备注 |
|-------------|---------|-------|------|
| char == char | ✅ (unsigned 16-bit) | ✅ (unsigned 16-bit) | N/A | 语义一致 |
| char < char | ✅ (unsigned 16-bit) | ✅ (unsigned 16-bit) | ❌ Character 不实现 Comparable | 关键差异 |
| char == int | ✅ | ✅ | N/A | ArkTS/Java 一致 |
| char + char | ❌ 编译错误 | ✅ 结果为 int | N/A | 关键差异 |
| char == string | ❌ 编译错误 | ❌ 编译错误 | N/A | 一致 |

---

## 三、关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| ==, != | ✅ char vs char, char vs numeric | ✅ char vs char, char vs numeric | ✅ Character vs Character |
| <, >, <=, >= | ✅ char vs char, char vs numeric | ✅ char vs char, char vs numeric | ❌ 不支持 |
| === | ✅ 支持 | N/A (无此运算符) | === 用于引用比较 |
| 算术运算 (+ - * /) | ❌ 禁止 | ✅ 允许（结果为 int） | N/A |
| 与 string 比较 | ❌ 编译错误 | ❌ 编译错误 | N/A |
| 无符号 16 位语义 | ✅ | ✅ | N/A |

---

## 四、用例 1:1 对照（三环境实测结果）

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | char == char | ✅ compile-pass | ✅ compile-pass | N/A |
| 002 | char <, >, <=, >= char | ✅ compile-pass | ✅ compile-pass | N/A |
| 003 | char === char | ✅ compile-pass | N/A | N/A |
| 004 | char == int | ✅ compile-pass | ✅ compile-pass | N/A |
| 005 | char <, >, <=, >= int | ✅ compile-pass | ✅ compile-pass | N/A |
| 006 | char >, <, == double | ✅ compile-pass | ✅ compile-pass | N/A |
| 007 | char == string | ✅ compile-fail | ✅ compile-fail | N/A |
| 008 | char == boolean | ✅ compile-fail | ✅ compile-fail | N/A |
| 009 | char + char | ✅ compile-fail | ✅ compile-pass | N/A |
| 010 | char - int | ✅ compile-fail | ✅ compile-pass | N/A |
| 011 | char * int | ✅ compile-fail | ✅ compile-pass | N/A |
| 012 | c'a' == 0x61 | ✅ runtime true | ✅ runtime true | N/A |
| 013 | c'a' < c'b' | ✅ runtime true | ✅ runtime true | N/A |
| 014 | c'a' > 3.14 | ✅ runtime true | ✅ runtime true | N/A |
| 015 | U+FFFF > U+0041 (unsigned) | ✅ runtime true | ✅ runtime true | N/A |
| 016 | c'X' === c'X' | ✅ runtime true | N/A | N/A |

### 关键差异详解

#### 用例 009-011: char 算术运算 ⭐

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `c'a' + c'b'` | ❌ 编译错误（char 不支持算术运算） |
| Java | `'a' + 'b'` | ✅ 编译通过，结果为 int 195 |
| Swift | N/A | N/A |

**结论：** ArkTS 明确禁止 char 上的算术运算，这增强了类型安全性但降低了灵活性。Java 允许 char 参与算术运算（因为 char 是整数类型）。

#### 用例 006: char > double ⭐

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `c'a' > 3.14` | ✅ 编译通过，运行时 true（spec 示例） |
| Java | `'a' > 3.14` | ✅ 编译通过，运行时 true |
| Swift | N/A | N/A |

**结论：** char 与浮点数的比较在 ArkTS 和 Java 中都允许，行为一致。

---

## 五、综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 比较运算完整性 | ★★★★★ | ★★★★★ | ★☆☆☆☆ |
| 类型安全性 | ★★★★★ | ★★★☆☆ | ★★★★★ |
| 表达能力 | ★★★★☆ | ★★★★★ | N/A |

---

## 六、核心结论

1. **ArkTS char 操作语义设计合理**：允许比较（包括与数值类型的比较），禁止算术，在当前规范下一致。
2. **与 Java 的主要差异在算术运算**：Java char 作为整数类型支持算术，ArkTS 明确禁止，这是故意的设计选择。
3. **spec 示例全部验证通过**：`c == 0x41`, `c < c1`, `c > 3.14` 三个 spec 示例均正确实现。
4. **无符号 16 位比较语义正确**：U+FFFF (65535) > U+0041 (65)，与预期一致。
