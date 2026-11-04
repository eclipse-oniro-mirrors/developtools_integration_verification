# 8.13 switch Statements - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-18
**测试用例数：** 25（compile-pass: 11, compile-fail: 4, runtime: 10）
**执行结果：** 25/25 全部通过（100%）
**目的：** 通过用例执行（编译期 + 运行时）+ 跨语言对比，识别 ArkTS switch 语句作为静态语言的设计问题。

---

## 一、与业界静态语言的差异点

### 跨章节已知问题适用性检查

以下为其余章节已发现的跨章节设计问题在本节的适用性评估：

| 问题 ID | 描述 | 涉及章节 | 本节适用 | 说明 |
|---------|------|---------|---------|------|
| STMT-I1 | Block 内 type 声明 spec/impl 不匹配 | 8.3 | **否** | 8.13 不涉及块内类型声明 |
| STMT-I2 | 标签未引用不强制报错 | 8.6 | **否** | 8.13 不涉及循环标签定义与引用规则。注：switch 标签（`outer: switch`）由 §8.13 独立定义，其标签引用规则与循环标签不同——switch 标签仅用于 `break label` 跳出，不存在"未引用"的标签约束问题 |
| comma-op | 逗号运算符仅限 for 循环 | 8.2, 8.11 | **否** | 8.13 switch 体内部不使用逗号表达式作为独立语句 |
| Error.code | Error.code 访问器冲突 | 8.14 | **否** | 8.13 不涉及 Error 属性定义或访问 |
| null-case-new | null case 类型窄化与直接 new | **8.13** | **是** | 本节发现（见问题 4） |
| char-switch | char 与 int 在 switch 中可比较 | **8.13** | **是** | 本节发现（见问题 3） |

---

### 差异点 1：规范 TODO -- 仅含 default 子句的 switchBlock 行为缺陷

**用例：** 无（尚未编写测试用例——spec 标记为 TODO，需运行时修复后验证）
**类别：** B 类（spec 明确行为，但实现有已知缺陷）

**实际行为/预期行为：** ArkTS 规范 §8.13 标记了一个 TODO：当 switch 块仅包含一个 `default` 子句（无 `case` 子句）时，default 中的语句/代码块**不会被实际执行**。这违反了规范自身的语义规则：如果未发生匹配且存在 default 子句，执行应转移到 default 子句的语句。在仅含 default 的 switch 中，无须匹配任何 case 子句，因此 default 应始终执行。

**对比：**

| 语言 | 行为 |
|------|------|
| **Java (JLS SE21)** | 仅含 `default` 的 switch 正确执行 default 子句 |
| **Swift (5.x)** | 仅含 `default:` 的 switch 合法且执行其代码体 |
| **ArkTS** | 已知运行时缺陷：仅含 default 的 switch 块不执行 default 语句 |

**评价/建议：** 这是一个严重缺陷（直接违反规范语义），应在 ArkTS 运行时中修复。仅含 default 的 switch 中的 default 子句必须执行其语句。应添加对应的测试用例（如 `STMT_08_13_022_RUNTIME_default_only_switch`），并在运行时修复后进行验证。

---

### 差异点 2：规范 TODO -- case 中使用非字面量常量表达式会导致断言错误

**用例：** 无（尚未编写测试用例——spec 标记为 TODO）
**类别：** C 类（规范行为未明确 + 实现行为异常）

**实际行为/预期行为：** ArkTS 规范 §8.13 标记了一个 TODO 条目：当 case 标签使用非字面量表达式（如变量、函数调用或计算表达式）时，编译器可能触发断言错误（assertion error），而非给出规范的编译期错误诊断。规范未明确定义合法的 case 表达式范围——是仅允许字面量常量，还是遵循类似 Java 常量表达式的规则允许编译期常量表达式。

**对比：**

| 语言 | 行为 |
|------|------|
| **Java (JLS SE21)** | 明确定义可在 case 标签中使用的"常量表达式"，包括字面量、编译期常量（以常量表达式初始化的 static final 变量）以及枚举常量。非常量表达式被拒绝并给出清晰的编译期错误 |
| **Swift (5.x)** | case 模式不限于常量——可以包含范围、元组、类型注解以及 `where` 子句，具有本质上更富表达力的模式匹配系统 |
| **ArkTS** | 规范对此问题标记了 TODO，行为未定义；非字面量 case 表达式可能触发断言错误而非编译期错误 |

**评价/建议：** 规范应明确定义哪些表达式可作为 case 标签使用。合理的方案是遵循 Java 的常量表达式规则：字面量以及具名编译期常量（以字面量或常量表达式初始化的 final/const 变量）。非常量 case 表达式应产生清晰的编译期错误，而非断言错误。建议补充测试用例覆盖 `const` 变量作为 case 标签、函数调用作为 case 标签、以及表达式计算作为 case 标签等场景。

---

### 差异点 3：char 与 int 在 switch 中可比较——spec/impl 矛盾

**用例：** STMT_08_13_019_PASS_char_case_on_int_switch（实测 compile-pass）
**类别：** A 类（spec 描述与实现行为矛盾）

**实际行为/预期行为：** 测试用例 STMT_08_13_019 在 int 类型 switch 表达式中使用 char 字面量 case 标签 `case c'a':`，实测结果为 **compile-pass**（编译通过）。然而，该用例的 `@design` 注释明确写道"规范要求 case 表达式类型必须可赋值给 switch 表达式类型，char 不能赋值给 int 故编译报错"，且 `@note` 注明"ArkTS char 不允许隐式 widening 到 int"。该用例的 `@id` 字段甚至标记为 `_FAIL_`（暗示预期编译失败），但 `@expect` 字段设为 `compile-pass` —— 该用例自身存在内部矛盾。

这暴露了一个规范与实现的根本冲突：

| 视角 | 结论 | 依据 |
|------|------|------|
| 规范 §8.13（类型可赋值性） | **应编译失败** | case 表达式类型（char）必须可赋值给 switch 表达式类型（int）。ArkTS 中 char 不可赋值给 int（无隐式 widening） |
| 实际编译器行为 | **编译通过** | char 字面量 `c'a'` 在 int switch 中可正常编译 |
| 测试用例标注 | **矛盾** | @id 写 FAIL，@expect 写 compile-pass，@design 说"应报错" |

**对比：**

| 语言 | char case 在 int switch 上 | 说明 |
|------|--------------------------|------|
| **Java (JLS SE21)** | ✅ 允许（编译通过） | char 通过 widening primitive conversion 可隐式转换为 int。`case 'a':` 在 int switch 上合法 |
| **Swift (5.x)** | ❌ 不允许 | Character 和 Int 是完全不同的类型，不可互换 |
| **ArkTS** | ✅ 实测编译通过 | 行为与 Java 一致，但与 ArkTS 自身规范中"case 类型必须可赋值"的表述矛盾 |

**评价/建议：** 实测行为（char case 在 int switch 编译通过）与 Java 一致，具有跨语言兼容性优势。但存在两种可能的问题根源：
1. **规范描述不准确**：规范 §8.13 的"case 表达式类型可赋值给 switch 表达式类型"规则可能过严，实际实现允许 char/int 之间的兼容（类似 Java 的 widening 语义）
2. **实现有 bug**：如果规范是正确的（char 不应赋值给 int），则编译器错误地接受了 char case

**建议方案：**
- 若设计意图是允许（对标 Java）：更新规范 §8.13，明确 char 可赋值给 int/byte/short，并修正 STMT_08_13_019 的 @id（去掉 _FAIL_）和 @design 注释
- 若设计意图是禁止（保持严格）：修复编译器以拒绝 char case 在 int switch 上，并将该用例移至 compile-fail
- 无论哪种选择，都必须解决该用例内部的 @id/@expect/@design 三方矛盾

---

### 差异点 4：null case 类型窄化与直接 new——编译器静态窄化导致 case null 不可达

**用例：** STMT_08_13_012_RUNTIME_null_case_matching, STMT_08_13_016_RUNTIME_object_instance_switch（均通过辅助函数规避）
**类别：** D 类（spec 未明确 + 行为有工程实践影响）

**实际行为/预期行为：** 当 switch 表达式为 `T | null` union 类型时，若直接使用 `new T()` 初始化该变量，ArkTS 编译器会进行**静态类型窄化**（static type narrowing）——编译器通过值流分析推断 `new T()` 的结果绝不可能是 null，从而将变量的实际类型从 `T | null` 窄化为 `T`。结果：`case null:` 分支在编译期被识别为不可达代码。

当前所有涉及 null case 匹配的运行时测试用例（012、016）均通过**辅助函数**规避此问题：

```typescript
// 规避方式（通过函数返回值保留 union 类型）
function makeObjOrNull(returnNull: boolean): MyClass | null {
  if (returnNull) { return null }
  return new MyClass(42)  // 编译器无法窄化函数返回类型
}

let a: MyClass | null = makeObjOrNull(true)  // union 类型保留
switch (a) {
  case null: /* 可达 */ break
  default:   break
}
```

若直接使用 `new`：

```typescript
let a: MyClass | null = new MyClass(42)  // 编译器窄化为 MyClass
switch (a) {
  case null: /* 编译器认为不可达 */ break  // 可能收到警告或错误
  default:   break
}
```

**对比：**

| 语言 | `let a: T|null = new T()` 后 `a` 的类型 | case null 可达性 |
|------|----------------------------------------|-----------------|
| **ArkTS** | 编译器窄化为 `T`（值流分析覆盖类型标注） | case null 被视为不可达 |
| **Java (JLS SE21)** | 保持 `T`（Java 无 union 类型；`T` 引用始终可为 null） | N/A（Java 无 `T\|null` 语法） |
| **Swift (5.x)** | 保持 `T?`（类型标注优先于值流分析） | case nil 始终可达（即使初始化为非 nil 值） |

**评价/建议：** ArkTS 的静态类型窄化是有意设计（提升类型安全性），但在此场景下造成了实际工程问题：
1. 用户无法直接测试"一个可能为 null 的变量"的完整 switch 逻辑——必须借助辅助函数"欺骗"编译器
2. 类型标注 `T | null` 被编译器的事实分析覆盖，违背了开发者对类型标注的直觉预期
3. 当前所有 null case 测试都依赖辅助函数，表明这是已知的规避模式但未被正式记录为设计问题

**建议方案：**
- **短期**：在规范中明确文档化此行为——编译器会对 union 类型变量进行值流窄化，`case null` 在编译器可证明非 null 时可能被标记为不可达
- **中期**：考虑是否为 switch 语句提供例外——当 switch 表达式类型为 `T | null` 时，即使编译器能静态证明当前值非 null，仍保留 `case null` 的可达性（与 Swift 对齐）
- **长期**：评估是否应让类型标注优先于值流分析（标注优先 vs 推断优先的设计哲学选择）

---

### 差异点 5：不要求穷尽性（与 Swift 不同）⭐ LOW

**用例：** 所有 compile-pass 用例（尤其是 STMT_08_13_018_PASS_boolean_switch_extended —— 仅含 `case true` 无 `case false`）
**类别：** 设计观察（Design Observation），非缺陷

**实际行为/预期行为：** ArkTS 不要求 switch 语句穷尽（即覆盖 switch 表达式的所有可能值）。若无 case 匹配且无 default 子句，执行静默地无操作穿透（no-op fall-through）。这与 Java 的传统 switch 语义一致，但与 Swift 显著不同。测试用例 STMT_08_13_018 验证了仅含 `case true` 的 boolean switch 合法编译通过——`false` 值在运行时走 default 或无操作。

**对比：**

| 语言 | 行为 |
|------|------|
| **Java (JLS SE21)** | 传统 switch 不要求穷尽性。增强 switch（`->` 语法）和 switch 表达式要求穷尽性 |
| **Swift (5.x)** | 编译期要求穷尽性。所有可能值必须被 case 子句覆盖，或必须存在 default 子句 |
| **ArkTS** | 不检查穷尽性。无匹配且无 default 时静默穿透，不产生任何效果 |

**评价/建议：** 建议考虑为有限值集合类型（尤其是 boolean 和 enum 类型）的非穷尽 switch 语句添加可选的编译器警告或 lint 规则。对于没有 default 子句的 boolean switch，编译器可以警告仅覆盖了 `true` 和 `false` 之一。

---

### 差异点 6：显式允许重复 case 标签

**用例：** STMT_08_13_006_PASS_identical_case_values, STMT_08_13_013_RUNTIME_identical_case_values
**类别：** 设计观察（Design Observation），非缺陷

**实际行为/预期行为：** ArkTS 规范明确指出允许重复的 case 标签：`case null:` / `case null: // 可以有多个具有相同表达式的 case 子句`。实测用例 006（compile-pass）和 013（runtime）验证了此行为：多个相同值的 case 子句可合法出现，第一个匹配的 case 执行后即跳出（若含 break），后续重复 case 始终不可达。

**对比：**

| 语言 | 行为 |
|------|------|
| **Java (JLS SE21)** | 重复的 case 标签产生编译期错误 |
| **Swift (5.x)** | 重复的模式产生编译期错误（警告该模式不会被匹配） |
| **ArkTS** | 显式允许重复的 case 标签，无错误或警告 |

**评价/建议：** 重复的 case 标签应产生编译期错误或至少产生警告，因为这表示死代码且极可能是程序员的编程错误。当前 100% 测试通过率仅表示"实现与规范一致"——规范本身在此点的设计选择值得商榷。

---

### 差异点 7：默认穿透（fall-through）语义，无 `fallthrough` 关键字

**用例：** STMT_08_13_002_PASS_fall_through, STMT_08_13_010_RUNTIME_fall_through_and_default, STMT_08_13_014_RUNTIME_fall_through_deep
**类别：** 设计观察（Design Observation），非缺陷

**实际行为/预期行为：** ArkTS 采用 Java 的传统穿透语义：若 case 子句不以 `break` 结束，执行将穿透至下一个 case 子句。实测用例 002（compile-pass）、010（runtime 基本穿透）和 014（runtime 深层穿透——连续 3 个 case 无 break、穿透到 default、中间匹配穿透）完整验证了此行为。

**对比：**

| 语言 | 行为 |
|------|------|
| **Java (JLS SE21)** | 传统 switch 具有穿透行为。Java 14+ 增加了 `->` switch 标签，使用单个表达式/代码块且无穿透 |
| **Swift (5.x)** | 无隐式穿透。case 执行完毕后自动退出 switch。需要显式 `fallthrough` 关键字才能继续到下一个 case |
| **ArkTS** | 采用传统 C/Java 风格隐式穿透；无 `fallthrough` 关键字 |

**评价/建议：** 虽然改变此行为会破坏与 TypeScript/JavaScript 传统的兼容性，但添加编译器警告——当检测到穿透（下一个 `case` 标签之前无 `break`）时——将有助于防止常见 bug。

---

## 二、符合ArkTS spec的语言设计差异（与规范一致）

以下行为基于已执行的 25 个测试用例，与 ArkTS 规范（第 8.13 节）预期行为一致：

### compile-pass（11/11 通过）

| 用例 ID | 行为描述 | 状态 |
|---------|---------|------|
| STMT_08_13_001 | int 类型 switch 表达式，case 匹配与 break 终止，含 default 子句 | ✅ |
| STMT_08_13_002 | case 穿透（fall-through）：case 1 无 break 时流至 case 2 | ✅ |
| STMT_08_13_003 | string 类型 switch 表达式，含字符串字面量 case 标签 | ✅ |
| STMT_08_13_004 | boolean 类型 switch 表达式，含 true/false case 标签 | ✅ |
| STMT_08_13_005 | 带标签的 switch，`break outer` 将控制权转移出嵌套 switch | ✅ |
| STMT_08_13_006 | 重复 case 值——规范允许相同 case 表达式多次出现 | ✅ |
| STMT_08_13_007 | class\|null union 类型 switch 表达式通过辅助函数，case null 匹配 | ✅ |
| STMT_08_13_008 | 带标签的 break 跳出外层循环（for/while），switch 内嵌于循环 | ✅ |
| STMT_08_13_017 | char 类型 switch 表达式，case 使用 char 字面量（c'a', c'b', c'\n'） | ✅ |
| STMT_08_13_018 | boolean switch 扩展：仅含 true 分支（非全覆盖）、true->false 穿透 | ✅ |
| STMT_08_13_019 | int switch 表达式中使用 char 字面量 case（**spec/impl 矛盾，见问题 3**） | ⚠️ |

### compile-fail（4/4 通过）

| 用例 ID | 行为描述 | 状态 |
|---------|---------|------|
| STMT_08_13_006_FAIL | string case 表达式用于 int switch 表达式——类型不匹配 | ✅ |
| STMT_08_13_007_FAIL | int case 表达式用于 string switch 表达式——类型不匹配 | ✅ |
| STMT_08_13_008_FAIL | boolean case 用于 number switch 表达式——类型不匹配 | ✅ |
| STMT_08_13_009_FAIL | 重复 default 子句——语法错误 ESY0171 Multiple default clauses | ✅ |

### runtime（10/10 通过 —— ark VM 真实执行 + assert）

| 用例 ID | 行为描述 | 状态 |
|---------|---------|------|
| STMT_08_13_009 | 基本 int switch：case 2 正确匹配、case 99 无匹配走 default | ✅ |
| STMT_08_13_010 | fall-through 与 default：匹配穿透、无匹配 default 执行、匹配跳过 default | ✅ |
| STMT_08_13_011 | 带标签 break 跳出嵌套 switch：break outer vs 普通 break 对比 | ✅ |
| STMT_08_13_012 | null case 匹配：null 匹配 case null、实例匹配 default（辅助函数规避窄化） | ✅ |
| STMT_08_13_013 | 相同 case 值运行时匹配：第一个匹配即执行、非重复正常、null 重复 case | ✅ |
| STMT_08_13_014 | 深层 fall-through：连续 3 case 无 break、穿透入 default、无 default 穿透 | ✅ |
| STMT_08_13_015 | 带标签 break 跳出外层循环运行时：break outer for、break outer2 while | ✅ |
| STMT_08_13_016 | 对象实例 switch 运行时：null->case null、实例->default（辅助函数规避窄化） | ✅ |
| STMT_08_13_020 | string 类型 switch 运行时：精确匹配、无匹配 default、无匹配无 default、空字符串 | ✅ |
| STMT_08_13_021 | enum 类型 switch 运行时：成员匹配、default 兜底、enum fall-through、显式值 enum | ✅ |

---

## 三、严重性等级总览

| 严重性 | 数量 | 涉及用例 / 问题 |
|--------|------|----------------|
| 编译器待完善 | 1 | 问题 1：仅含 default 的 switchBlock 行为缺陷（spec TODO，待运行时修复） |
| 语言差异 | 3 | 问题 2：非字面量 case 表达式断言错误（spec TODO） |
|  |  | 问题 3：char 与 int 在 switch 中可比较——spec/impl 矛盾（**新发现**） |
|  |  | 问题 4：null case 类型窄化与直接 new——编译器窄化导致 case null 不可达（**新发现**） |
| 设计观察 | 3 | 问题 5：不要求穷尽性（设计观察） |
|  |  | 问题 6：显式允许重复 case 标签（设计观察） |
|  |  | 问题 7：默认穿透语义，无 fallthrough 关键字（设计观察） |

> **注：** 本批次 25 个测试用例 100% 通过（compile-pass 11/11, compile-fail 4/4, runtime 10/10）。所有标注为"设计观察"的问题均为有意设计选择（与 Java 传统对齐），非实现缺陷。问题 3 和 4 为本版新增发现——基于真实编译运行中暴露的 spec/impl 矛盾与工程规避模式。

---

## 四、跨语言对比结论

ArkTS 的 switch 语句在整体设计上与 **Java 传统 switch** 最为接近，而非 Swift 的模式匹配系统。关键分歧点总结如下：

| 特性 | ArkTS | Java (传统 switch) | Swift (5.x) |
|------|-------|-------------------|------------|
| case 穿透行为 | 隐式穿透（需 break 终止） | 隐式穿透（需 break 终止） | 无隐式穿透（需显式 fallthrough） |
| 穷尽性检查 | 无 | 无（增强 switch 有） | 编译期强制穷尽 |
| 重复 case 标签 | 允许 | 编译期错误 | 编译期错误 |
| 仅含 default 的 switch | 已知运行时缺陷（TODO） | 正确执行 | 正确执行 |
| case 表达式类型 | 未明确定义（有 TODO） | 明确定义（常量表达式） | 模式匹配（范围、元组等） |
| 类型不匹配 case | 编译期错误（int/string/boolean） | 编译期错误 | 编译期错误 |
| char case 在 int switch | ⚠️ 实测通过，与规范矛盾 | 允许（widening） | 不允许 |
| null case 类型窄化 | ⚠️ 编译器窄化导致 case null 不可达 | N/A（无 union 类型） | 标注优先，case nil 可达 |
| 带标签的 break | 支持 | 支持 | 不支持（语言无 goto 式跳转） |
| switch 表达式类型范围 | 任意类型 | 受限类型（基本类型+String+枚举） | Equatable 类型 |

**整体评价：** ArkTS switch 语句继承了 TypeScript/JavaScript 的 C 风格语义基础，并在类型安全方面对齐 Java 的方向。但存在以下需要关注的问题：
- 1 个 严重性的已知运行时缺陷（仅含 default 的 switch 不执行）
- 3 个 问题：规范未定义行为（非字面量 case）、spec/impl 矛盾（char vs int）、编译器窄化工程问题（null case + direct new）
- 3 个 设计观察（穷尽性、重复标签、穿透语义）属于保守的兼容性决策

---

## 五、改进方向建议

### 短期（需立即修复）

1. **修复仅含 default 的 switch 运行时缺陷**：当 switch 块仅包含 default 子句时，default 语句必须被执行。这是直接的规范违规，应作为最高优先级缺陷处理。补充测试用例 `STMT_08_13_022_RUNTIME_default_only_switch`。

2. **解决 char vs int switch 的 spec/impl 矛盾（问题 3）**：
   - 若意图允许（对标 Java）：更新规范 §8.13 明确 char/int 赋值兼容性，修正 STMT_08_13_019 的 @id/@design 自相矛盾
   - 若意图禁止：修复编译器拒绝 char case 在 int switch 上，将 019 移至 compile-fail

3. **定义合法的 case 表达式（问题 2）**：明确规范中 case 标签可接受的表达式形式（建议采用 Java 风格的常量表达式规则），并将非字面量 case 表达式的断言错误改为规范的编译期错误诊断。

### 中期（建议增强）

4. **文档化 null case 类型窄化行为（问题 4）**：在规范中明确描述编译器对 union 类型变量的值流窄化行为及其对 switch `case null` 可达性的影响。考虑提供官方推荐的测试/使用模式。

5. **添加编译器警告：检测穿透**：当 case 子句不以 `break` 结束时（即存在隐式穿透），发出编译器警告。这可以在不改变语言语义的前提下帮助捕获常见编程错误。

6. **添加编译器警告：重复 case 标签**：当同一 switch 中出现重复的 case 表达式值时，发出编译期警告或错误，以标识死代码。

7. **添加 lint/警告：非穷尽 switch**：对 boolean 和 enum 类型的 switch 表达式，当未覆盖所有可能值且无 default 子句时，发出警告。

### 长期（设计层面考虑）

8. **评估引入无穿透 switch 形式**：参考 Java 14+ 的 `->` 语法或 Swift 的自动退出行为，考虑增加一种不依赖 `break` 的 case 形式，以减少穿透相关的编程错误。

9. **补齐测试覆盖盲区**：添加以下场景的测试用例：
   - 仅含 default 子句的 switch（无 case 子句）——验证问题 1 修复
   - 含非字面量 case 表达式的 switch——验证问题 2 修复
   - 直接 `new T()` 作为 `T|null` switch 表达式——验证问题 4 行为
   - 空 switch 块（无 case 且无 default）
   - 3 层以上嵌套 switch 中的 break/continue 交互
   - int 边界值（MIN_VALUE, MAX_VALUE）作为 switch 表达式
   - class 类型 switch 表达式 + case 对象字面量
   - enum 类型 case 在非对应 enum switch 表达式上的类型检查

---
