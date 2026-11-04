# 8.13 switch 语句 测试设计思维导图

## 概述
本节定义 **switch 语句 (switch Statement)** 的语法和语义：

**语法形式：**
- `switchStatement: (identifier ':')? 'switch' '(' expression ')' switchBlock`
- `switchBlock: '{' caseClause* defaultClause? caseClause* '}'`
- `caseClause: 'case' expression (',' expression)* ':' statement*`
- `defaultClause: 'default' ':' statement*`

**核心语义：**
- Switch expression can be of **ANY type** (int, string, boolean, char, enum, class|null, etc.)
- Optional identifier label allows `break` to transfer control out of a nested switch or loop
- Compile-time error if case expression type is not assignable to switch expression type
- First match (top-down) transfers control to that caseClause
- If no break, execution **falls through** to the next caseClause
- If no match and defaultClause present -> execute defaultClause
- If no match and no defaultClause -> switch body does nothing (skips entirely)
- One may have several case clauses with the same expression value
- Only one defaultClause is permitted (duplicate default -> syntax error)

## 核心规则

### switch 表达式的类型支持
| switch 类型 | case 类型 | 示例 |
|------------|-----------|------|
| int | int literal | `case 1: case 2:` |
| string | string literal | `case "hello": case "world":` |
| boolean | true / false | `case true: case false:` |
| char | char literal | `case c'a': case c'\n':` |
| enum | enum member | `case Direction.NORTH:` |
| class \| null | null / object | `case null: default:` (non-null) |

### 控制流规则
| 规则 | 说明 |
|------|------|
| 第一个匹配 | 从上到下扫描 caseClause，第一个匹配成功则转移控制 |
| break 退出 | case 语句体末尾的 break 退出整个 switch |
| fall-through | case 无 break 时，执行完毕后继续执行下一个 caseClause |
| default 兜底 | 仅当所有 case 均未匹配时执行 default（可出现在任意位置） |
| 无匹配无 default | switch body 不执行任何操作，直接跳过 |
| 标签化 break | break label 跳出带标签的外层 switch 或外层循环 |

## 测试点覆盖

### 1. 编译通过测试 (compile-pass) — 11 项

#### 1.1 基本 int 类型 switch (STMT_08_13_001_PASS_basic_int_switch)
- 测试点：int 类型 switch 表达式，case 使用整型字面量，break 退出
- 覆盖：基本 switch 语法、case 匹配、break 终止、default 子句兜底

#### 1.2 Fall-through 穿透 (STMT_08_13_002_PASS_fall_through)
- 测试点：case 无 break 时的 fall-through 穿透执行
- 覆盖：fall-through 机制、case 1 匹配后无 break 继续执行 case 2

#### 1.3 string 类型 switch (STMT_08_13_003_PASS_string_switch)
- 测试点：string 类型作为 switch 表达式，case 使用字符串字面量
- 覆盖：任意类型 switch 表达式支持、字符串 case 匹配

#### 1.4 boolean 类型 switch (STMT_08_13_004_PASS_boolean_switch)
- 测试点：boolean 类型作为 switch 表达式，case 使用 true/false 字面量
- 覆盖：布尔类型 switch、两个分支全覆盖

#### 1.5 带标签的 switch 内层跳出 (STMT_08_13_005_PASS_labeled_break_switch)
- 测试点：外层标签 + 嵌套 switch 中使用 break outer 跳出外层 switch
- 覆盖：带可选标识符的 switch、标签化 break 跳出嵌套 switch

#### 1.6 相同 case 值 (STMT_08_13_006_PASS_identical_case_values)
- 测试点：允许多个相同的 case 表达式——规范允许 "several case clauses with the same expression"
- 覆盖：两个 case 1 连续出现、case null 重复出现

#### 1.7 class|null union 实例 switch (STMT_08_13_007_PASS_object_instance_switch)
- 测试点：switch 表达式为 class|null union 类型
- 覆盖：通过函数返回 T|null 避免编译器静态窄化、case null 匹配

#### 1.8 带标签 break 跳出外层循环 (STMT_08_13_008_PASS_labeled_break_outer_loop)
- 测试点：switch 内使用带标签的 break 跳出外层 for/while 循环
- 覆盖：outer: for 循环内嵌 switch + break outer、outer2: while 循环场景

#### 1.9 char 类型 switch (STMT_08_13_017_PASS_char_switch)
- 测试点：char 类型作为 switch 表达式，case 使用 char 字面量
- 覆盖：char 字面量 case（c'a', c'b', c'A', c'\n'）、任意类型 switch 支持

#### 1.10 boolean 类型 switch 扩展 (STMT_08_13_018_PASS_boolean_switch_extended)
- 测试点：boolean switch 的扩展用法
- 覆盖：仅含 true case 无 false case（非全覆盖）、true→false fall-through 穿透布尔分支

#### 1.11 char case 在 int switch 上 (STMT_08_13_019_PASS_char_case_on_int_switch)
- 测试点：int 类型 switch 表达式中 case 使用 char 字面量
- 覆盖：char 字面量 case 在 int switch 上的编译行为

### 2. 编译失败测试 (compile-fail) — 4 项

#### 2.1 string case 在 int switch 上 (STMT_08_13_006_FAIL_string_case_on_int_switch)
- 错误：string 类型字面量不能赋值给 int 类型 switch 表达式
- 规范依据：Compile-time error if case expression type not assignable to switch expression type

#### 2.2 int case 在 string switch 上 (STMT_08_13_007_FAIL_int_case_on_string_switch)
- 错误：int 类型字面量不能赋值给 string 类型 switch 表达式
- 规范依据：同上

#### 2.3 boolean case 在 number switch 上 (STMT_08_13_008_FAIL_boolean_case_on_number_switch)
- 错误：boolean 类型字面量不能赋值给 number 类型 switch 表达式
- 规范依据：同上

#### 2.4 重复 default 子句 (STMT_08_13_009_FAIL_duplicate_default)
- 错误：switch 语句中出现两个 default 子句 -> Syntax error ESY0171 Multiple default clauses
- 规范依据：Only one defaultClause is permitted in a switch block

### 3. 运行时测试 (runtime) — 10 项

#### 3.1 基本 int switch 匹配执行 (STMT_08_13_009_RUNTIME_basic_switch)
- 测试：case 2 正确匹配并执行对应分支、case 99 未匹配时执行 default
- 验证：结果字符串符合预期，break 正确退出

#### 3.2 Fall-through 与 default 子句 (STMT_08_13_010_RUNTIME_fall_through_and_default)
- 测试：case 1 无 break 穿透到 case 2 累积字符串、未匹配时 default 执行、匹配时 default 被跳过
- 验证：三层行为同时验证

#### 3.3 带标签 break 跳出嵌套 switch (STMT_08_13_011_RUNTIME_labeled_break_switch)
- 测试：break outer 跳出外层 switch、普通 break 仅退出内层 switch 回到外层继续执行
- 验证：标签化与普通 break 对比验证，确认 "should_not_reach" 不会被执行

#### 3.4 null case 匹配 (STMT_08_13_012_RUNTIME_null_case_matching)
- 测试：class|null union 类型 switch 表达式，null 匹配 case null，实例匹配 default
- 验证：通过函数返回值避免编译器静态窄化，确认 null/非null 分支行为

#### 3.5 相同 case 值运行时匹配 (STMT_08_13_013_RUNTIME_identical_case_values)
- 测试：重复 case 1 值中第一个匹配即执行、非重复值正常匹配、重复 null case 值
- 验证：三个子测试——第一个重复 case 命中、非重复 case 正常匹配、null 重复 case

#### 3.6 深层 Fall-through (STMT_08_13_014_RUNTIME_fall_through_deep)
- 测试：连续 3 个 case 无 break 穿透（A->B->C）、fall-through 穿透到 default、无 default 时穿透到 switch 结束、从中间 case 开始穿透
- 验证：四个子测试覆盖 full fall-through 链、穿透入 default、无 default 穿透、中间匹配穿透

#### 3.7 带标签 break 跳出外层循环运行时 (STMT_08_13_015_RUNTIME_labeled_break_outer_loop)
- 测试：break outer 跳出 for 循环、break outer2 跳出 while 循环、普通 break 仅退出 switch 循环继续、嵌套循环中 break outer3
- 验证：循环计数验证、循环变量终值验证、嵌套循环标签验证

#### 3.8 对象实例 switch 运行时 (STMT_08_13_016_RUNTIME_object_instance_switch)
- 测试：class|null union 的 case null 匹配与 default（实例）匹配
- 验证：null 匹配 case null、实例匹配 default

#### 3.9 string 类型 switch 运行时匹配 (STMT_08_13_020_RUNTIME_string_switch_matching)
- 测试：字符串精确 case 匹配、未匹配时 default 执行、无匹配无 default 时 switch 体无操作、空字符串 case 匹配
- 验证：四个子测试覆盖完整 string switch 行为

#### 3.10 enum 类型 switch 运行时匹配 (STMT_08_13_021_RUNTIME_enum_switch)
- 测试：枚举成员精确匹配、未匹配时 default 兜底、枚举 fall-through 穿透、显式值枚举 case 匹配
- 验证：两个枚举类型（无值枚举 Direction、显式值枚举 Status）、四个子测试

## 三、边界值与异常场景

### 边界值
- switch 表达式为 int 边界值（-2147483648, 2147483647）
- 空 switch block（无 case 无 default）—— compile-pass 测试中无此场景
- 仅有 default 无 case —— 当前未覆盖
- 多层嵌套 switch（switch 内嵌 switch）
- 连续 fall-through 跨越多个 case（3+ 层穿透）
- fall-through 穿透到 default 子句
- case 无 break 且无 default 时穿透到 switch body 结束
- boolean switch 非全覆盖（仅有 true 分支，无 false 分支）
- 空字符串 "" 作为 case 匹配
- char 转义字面量 case（如 c'\n'）

### 异常场景（应产生编译错误）
- case 表达式类型不可赋值给 switch 表达式类型（string on int, int on string, boolean on number）
- switch 中出现多个 default 子句
- （待扩展）case 表达式类型不可赋值给 switch 表达式类型：enum on int, class on string 等

### 异常场景（运行时无错误但有明确行为）
- switch 表达式未匹配任何 case 且无 default -> 无操作跳过 switch
- fall-through 穿透到 default 子句（匹配到 case 后穿透穿过后续 case 直到 default）
- 相同 case 值重复：第一个出现的 case 匹配后即跳出，后续重复 case 不会执行
- boolean switch 仅含 true 分支时 false 走 default

## 四、命名约定
- 前缀：`STMT_08_13_`
- 编译通过：`STMT_08_13_YYY_PASS_{DESCRIPTION}.ets`
- 编译失败：`STMT_08_13_YYY_FAIL_{DESCRIPTION}.ets`
- 运行时：`STMT_08_13_YYY_RUNTIME_{DESCRIPTION}.ets`
- 编号 YYY 从 001 开始，跨类别共享编号空间

## 五、编号规划
- compile-pass: 001 ~ 008, 017 ~ 019（共 11 项）
- compile-fail: 006 ~ 009（共 4 项，与 pass 共享编号范围）
- runtime: 009 ~ 016, 020 ~ 021（共 10 项）

## 六、当前覆盖率汇总
| 类别 | 数量 | 编号范围 |
|------|------|----------|
| compile-pass | 11 | 001, 002, 003, 004, 005, 006, 007, 008, 017, 018, 019 |
| compile-fail | 4 | 006, 007, 008, 009 |
| runtime | 10 | 009, 010, 011, 012, 013, 014, 015, 016, 020, 021 |
| **总计** | **25** | |
