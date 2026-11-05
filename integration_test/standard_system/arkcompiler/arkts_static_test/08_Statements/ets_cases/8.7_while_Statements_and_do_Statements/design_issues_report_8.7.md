# 8.7 while Statements and do Statements - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-18
**测试用例数：** 24（15 compile-pass + 2 compile-fail + 7 runtime）
**执行结果：** 24/24 通过（100%）
**目的：** 通过用例执行（编译期 + 运行时）+ 跨语言对比，识别 ArkTS 静态语言的设计问题。

---

## 一、与业界静态语言的差异点

**未发现严重设计缺陷。** ArkTS 第 8.7 节 while 与 do-while 语句的实现与规范定义一致。但是，以下设计观察值得关注。

### 观察 A：Extended Conditional Expressions 扩展了循环条件的合法类型范围 ⭐ DESIGN

**用例：** STMT_08_07_006, STMT_08_07_007, STMT_08_07_008, STMT_08_07_014, STMT_08_07_015（compile-pass）

**实际行为：** ArkTS 允许 `number`、`string`、`bigint` 和 `enum` 类型作为 while/do-while 循环的条件表达式，而非仅限于 `boolean`。例如：

```typescript
while (1) { }           // number 字面量 — compile-pass (非零为 truthy)
while ("abc") { }       // string 字面量 — compile-pass (非空字符串为 truthy)
let x: number = 5.0;
while (x) { }           // number 变量 — compile-pass
let b: bigint = 42n;
while (b) { }           // bigint — compile-pass
while (Color.Green) { } // enum — compile-pass (非零值为 truthy)
```

这些用例原设计期望为 compile-fail（`@id` 字段仍保留 `FAIL` 标记，`@design` 仍写"期望编译报错"），但实际编译器允许其通过编译。这是因为 ArkTS 规范中的 Extended Conditional Expressions 机制将 number、string、bigint、enum 纳入了合法的条件表达式类型集合。

**对比：**

| 语言 | number 作为 while 条件 | string 作为 while 条件 | enum 作为 while 条件 |
|------|----------------------|----------------------|---------------------|
| **ArkTS** | ✅ 允许（非零 truthy） | ✅ 允许（非空 truthy） | ✅ 允许（非零 truthy） |
| **Java (JLS SE21)** | ❌ 编译错误 | ❌ 编译错误 | ❌ 编译错误 |
| **Swift (5.x)** | ❌ 编译错误 | ❌ 编译错误 | ❌ 编译错误 |

**评价：** 这是 ArkTS 从 TypeScript/JavaScript 继承的设计特征（truthy/falsy 语义），与 Java/Swift 的严格布尔条件形成对比。该行为与规范中 Extended Conditional Expressions 的定义一致，不属于缺陷。但需要注意：
- 跨语言对比报告（comparison_report_arkts_java_swift_8.7.md）第 133-137 行声称 `while (1) { }` 和 `do { } while ("abc")` 在 ArkTS 中为编译错误——该描述与实际编译器行为不符，需要修正。
- 测试用例 006、007、008 的 `@id` 字段分别标注 `FAIL_while_condition_number`、`FAIL_do_while_condition_string`、`FAIL_while_condition_non_bool_var`，与实际的 `@expect compile-pass` 不一致，建议统一命名。

---

### 观察 B：仅覆盖语法层面的 compile-fail 测试，缺少类型层面的反向用例

**用例：** STMT_08_07_009_FAIL, STMT_08_07_010_FAIL（compile-fail）

**实际行为：** 当前仅有的 2 个 compile-fail 用例均测试语法错误（while 缺少括号、do 缺少 while 关键字），未覆盖 Extended Conditional Expressions 范围之外的类型（如 class 实例、数组、对象字面量、函数引用等）作为循环条件时的编译拒绝行为。

**对比：**
- Java 明确拒绝所有非 boolean 类型作为循环条件。
- Swift 明确拒绝所有非 Bool 类型作为循环条件。
- ArkTS 允许 Extended Conditional Expressions 类型（number/string/bigint/enum），但对 class 实例、数组、对象字面量等其余类型的条件行为未在 compile-fail 测试中覆盖。

**评价/建议：** 应补充以下类型的 compile-fail 用例：(a) class 实例作为 while/do-while 条件；(b) 数组变量作为条件；(c) 对象字面量作为条件。这有助于明确界定 Extended Conditional Expressions 的边界。

---

## 二、符合ArkTS spec的语言设计差异（与规范一致）

| 用例 ID | 行为描述 | 状态 |
|---------|---------|------|
| STMT_08_07_001 | 基本 while 循环：布尔变量条件、比较表达式条件、false 字面量条件 | ✅ PASS |
| STMT_08_07_002 | while 空循环体：空块 `{}` 和空语句 `;` 均合法 | ✅ PASS |
| STMT_08_07_003 | 基本 do-while 循环：布尔变量条件和比较表达式条件 | ✅ PASS |
| STMT_08_07_004 | do-while 空循环体：空块 `{}` 和空语句 `;` 均合法 | ✅ PASS |
| STMT_08_07_005 | 嵌套循环：while 内嵌 while、do-while 内嵌 do-while、do-while 内嵌 while | ✅ PASS |
| STMT_08_07_006 | while 条件为 number 字面量（Extended Conditional Expression） | ✅ PASS |
| STMT_08_07_007 | do-while 条件为 string 字面量（Extended Conditional Expression） | ✅ PASS |
| STMT_08_07_008 | while 条件为 number 类型变量（Extended Conditional Expression） | ✅ PASS |
| STMT_08_07_009 | while 内嵌 if 中使用 break 提前退出循环 | ✅ PASS |
| STMT_08_07_010 | do-while 循环体中使用 continue 跳转到条件检查 | ✅ PASS |
| STMT_08_07_011 | while 循环体包含 try-catch 异常处理 | ✅ PASS |
| STMT_08_07_012 | do-while 循环体包含 try-catch 异常处理 | ✅ PASS |
| STMT_08_07_013 | while 条件使用复合逻辑表达式（`&&`、`||`、`!`、括号嵌套） | ✅ PASS |
| STMT_08_07_014 | while 条件为 bigint 类型（Extended Conditional Expression） | ✅ PASS |
| STMT_08_07_015 | while 条件为 enum 类型（Extended Conditional Expression） | ✅ PASS |
| STMT_08_07_009_FAIL | while 缺少括号 `while true {}` → 语法错误 | ✅ PASS |
| STMT_08_07_010_FAIL | do 缺少 while 关键字 → 语法错误 | ✅ PASS |
| STMT_08_07_009_RT | while(false) 循环体执行 0 次，外部变量不受影响 | ✅ PASS |
| STMT_08_07_010_RT | do-while(false) 循环体至少执行 1 次 | ✅ PASS |
| STMT_08_07_011_RT | 相同初始条件下 while 执行 0 次 vs do-while 执行 1 次 | ✅ PASS |
| STMT_08_07_012_RT | do-while 体内 continue 跳转到条件表达式处 | ✅ PASS |
| STMT_08_07_013_RT | 嵌套循环中 break 仅退出最内层，外层继续执行 | ✅ PASS |
| STMT_08_07_016_RT | do-while 体内 break 在第一次迭代即退出，验证 at-least-once 语义 | ✅ PASS |
| STMT_08_07_017_RT | while 零次迭代全方位验证（false 字面量、变量 false、多场景） | ✅ PASS |

### 与规范一致的要点总结

1. **语法正确性**：`whileStatement`（`'while' '(' expression ')' statement`）与 `doStatement`（`'do' statement 'while' '(' expression ')' ';'`）严格遵循规范定义的语法。缺少括号或缺少 while 关键字的非法构造在编译期被正确拒绝。

2. **条件类型检查**：规范要求表达式类型为 `boolean` 或 Extended Conditional Expressions 中提及的类型。测试确认 boolean（字面量/变量/比较/逻辑表达式）、number、string、bigint、enum 均可作为合法条件。

3. **语义区分**：while 先判断后执行（条件 false 时执行 0 次），do-while 先执行后判断（条件 false 时至少执行 1 次），运行时测试充分验证。

4. **空循环体支持**：空块 `{}` 和空语句 `;` 均为合法的循环体形式。

5. **控制流交互**：循环体内可使用 break（退出循环）、continue（跳转到条件判断）、try-catch（异常处理），与规范定义一致。

6. **嵌套循环**：while 与 do-while 可自由嵌套，break 仅退出最内层循环。

---

## 三、严重性等级总览

| 严重性 | 数量 | 涉及用例 |
|--------|------|---------|
| ⭐ HIGH | 0 | — |
| ⭐ MEDIUM | 0 | — |
| 设计观察 | 1 | 观察 B：缺少类型层面 compile-fail 用例（class/array/object 条件拒绝） |
| Design Observation（设计观察） | 1 | 观察 A：Extended Conditional Expressions 扩展循环条件类型范围 |
| 累积已知问题（重现） | 0 | 本节未触发 STMT-I1、STMT-I2 或其余已知设计问题 |

---

## 四、跨语言对比结论

### 核心对比

| 特性 | ArkTS | Java (JLS SE21) | Swift (5.x) |
|------|-------|-----------------|-------------|
| 前测循环 | `while (expr) stmt` | `while (expr) stmt` | `while expr { stmts }` |
| 后测循环 | `do stmt while (expr);` | `do stmt while (expr);` | `repeat { stmts } while expr` |
| 条件括号 | 必须 | 必须 | 可选 |
| 条件类型约束 | `boolean` 或 Extended Conditional Expressions | 仅 `boolean` | 仅 `Bool` |
| 非布尔条件（number/string） | ✅ 允许（truthy/falsy） | ❌ 编译错误 | ❌ 编译错误 |
| 空语句 `;` 作循环体 | ✅ 允许 | ✅ 允许 | ❌ 不允许（必须 `{}`） |
| 空块 `{}` 作循环体 | ✅ 允许 | ✅ 允许 | ✅ 允许 |
| 标签/break/continue | 支持 | 支持 | 支持 |

### 关键差异说明

1. **Extended Conditional Expressions（ArkTS 独有）**：ArkTS 允许 number、string、bigint、enum 作为循环条件（非零/非空为 truthy），这是从 TypeScript/JavaScript 继承的行为。Java 和 Swift 均严格限制为 boolean/Bool 类型。该设计降低了从 TypeScript 迁移的摩擦，但可能引入隐式类型转换导致的逻辑错误。

2. **后测循环关键字**：ArkTS 与 Java 一致使用 `do ... while`；Swift 使用 `repeat ... while` 以避免与错误处理 `do-catch` 冲突。

3. **循环体灵活性**：ArkTS 与 Java 一致允许任意单条语句（包括空语句 `;`）作为循环体；Swift 强制要求大括号。

4. **与 Java 兼容性评分：8.5/10**（主要差异：Extended Conditional Expressions）
   **与 Swift 兼容性评分：6.5/10**（差异：Extended Conditional Expressions、空语句体、repeat vs do 关键字、括号要求）

---

## 五、改进方向建议

### 短期（当前迭代）

1. **修正测试用例元数据不一致**：用例 006、007、008 的 `@id` 字段标注 `FAIL` 但 `@expect` 为 `compile-pass`，且 `@design` 与 `@note` 仍描述"期望编译报错"。应统一为与 Extended Conditional Expressions 行为一致的描述。
2. **修正跨语言对比报告**：comparison_report_arkts_java_swift_8.7.md 第 133-137 行声称 `while (1) { }` 在 ArkTS 中为编译错误，与实际测试结果不符，需更正。

### 中期（后续版本）

3. **补充类型层面的 compile-fail 测试**：添加 class 实例、数组、对象字面量等非 Extended Conditional Expressions 类型作为 while/do-while 条件的 compile-fail 用例，明确类型边界。
4. **补充边界场景测试**：(a) `null`/`undefined` 作为 while/do-while 条件的行为；(b) while 条件为 `void` 类型函数调用返回值；(c) do-while 条件中使用 `as` 类型断言。

### 长期（语言演进）

5. **评估 Extended Conditional Expressions 的一致性**：当前 Extended Conditional Expressions 在 if、while、do-while、for 等语句中均生效，但 spec 中关于哪些类型属于 Extended Conditional Expressions 的列表不够明确。建议在规范中显式枚举支持的类型，或提供交叉引用。
6. **关注开发者反馈**：如果开发者对隐式 truthy/falsy 的行为表达困惑（如 `while (someNumber)` 可能在 number 为 0 时意外跳过），可考虑添加可选的编译器 lint 警告。

---

**总体结论：** 未发现需要修改规范的设计问题。ArkTS 第 8.7 节 while 与 do-while 语句的实现与规范完全一致，24 个测试用例 100% 通过。Extended Conditional Expressions 机制使循环条件类型范围大于 Java/Swift，这是有意的设计选择而非缺陷。需要立即处理的事项是修正测试用例元数据不一致（短期建议 1）和跨语言对比报告中的错误描述（短期建议 2）。
