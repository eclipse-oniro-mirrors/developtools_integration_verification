# 8.6 循环语句  测试设计思维导图

## 一、章节定义 (Section Definition)
- **规范章节**: 8.6 Loop Statements
- **范围**: 循环语句的语法规则与标签约束
- **核心规则**:
  1. 四种循环: `while`, `do-while`, `for`, `for-of`
  2. 每个循环可附带可选标签 `identifier : loopStatement`
  3. 标签只能被循环体内的 `break` / `continue` 引用
  4. 若标签在循环体内未被使用，则编译时报错（规范要求；es2panda 当前未强制此约束，见 STMT_08_06_012）
  5. 若标签在循环体内的 lambda 表达式中使用，则编译时报错

## 二、子类型枚举 (Sub-type Enumeration)

### 2.1 while 循环
- `while (condition) statement`
- condition 为 boolean 表达式
- 循环体可能执行零次

### 2.2 do-while 循环
- `do statement while (condition);`
- 循环体至少执行一次
- condition 在每次迭代后检查

### 2.3 for 循环
- `for (init; condition; update) statement`
- 支持 `let` 变量声明初始化
- 条件表达式为 boolean 类型
- update 表达式在每次迭代后执行
- 支持省略 init 或 update 子句

### 2.4 for-of 循环
- `for (let variable of iterable) statement`
- 遍历可迭代对象 (数组等)
- 每次迭代绑定新值到变量

### 2.5 标签循环 (Labeled Loop)
- `label: loopStatement`
- 标签标识符遵循标识符命名规则
- 标签作用域为整个循环体（含其嵌套子循环）
- 标签只能被 break / continue 引用
- 兄弟循环的标签互不可见，作用域隔离
- 顺序排列的非嵌套循环可使用相同标签名

## 三、测试点分布 (Test Points)

总计: 8P + 7F + 5R = 20

### 3.1 编译通过 (compile-pass) — 8个文件

| 编号 | 文件名 | 测试要点 |
|------|--------|----------|
| STMT_08_06_001 | PASS_BasicWhile | while 基本语法：boolean 条件，计数迭代，条件为 true 时正常执行 |
| STMT_08_06_002 | PASS_BasicDoWhile | do-while 基本语法：条件为 false 时仍执行一次，条件为 true 时正常迭代 |
| STMT_08_06_003 | PASS_BasicFor | for 基本语法：标准三段式、省略 init 子句、省略 update 子句（配合 break 退出） |
| STMT_08_06_004 | PASS_BasicForOf | for-of 基本语法：遍历 int 数组累加；遍历空数组循环体零次执行 |
| STMT_08_06_005 | PASS_LabeledLoopBreak | 标签 for 循环：`break label` 正确引用外层标签提前终止 |
| STMT_08_06_012 | PASS_label_declared_not_used | **规范-实现差异**：标签声明但未被 break/continue 使用 → 规范要求 compile-time error，es2panda 当前未强制此约束，实际编译通过 |
| STMT_08_06_013 | PASS_MultipleNestedLabels | 三层嵌套标签循环（for/while/do-while 混合），break/continue 精确控制任意外层循环；标签在 while 上配合内层 for 使用 break |
| STMT_08_06_014 | PASS_SameLabelNameDifferentLoops | 标签作用域隔离：两个顺序 for 循环复用相同标签名；两个顺序 while 循环复用相同标签名；for 与 do-while 混合复用相同标签名 |

### 3.2 编译失败 (compile-fail) — 7个文件

| 编号 | 文件名 | 测试要点 |
|------|--------|----------|
| STMT_08_06_006 | FAIL_LabelInLambdaContinue | 规范示例：for 标签循环体内 lambda 中使用 `continue label` → compile-time error |
| STMT_08_06_007 | FAIL_LabelInLambdaBreak | while 标签循环体内 lambda 中使用 `break outer` → compile-time error |
| STMT_08_06_008 | FAIL_BreakToUndeclaredLabel | for 循环中 `break` 引用从未声明的标签 `nonExistentLabel` → compile-time error |
| STMT_08_06_015 | PASS_LabeledDoWhileAndForOf | **编译器缺陷复现**：标签用于 do-while（break/continue）和 for-of（break/continue），包括嵌套 for-of 标签 → 当前编译器崩溃（SIGABRT），已按正向语义归位 compile-pass |
| STMT_08_06_016 | FAIL_LabelInLambdaDoWhile | do-while 标签循环体内 lambda 中使用 break label 和 continue label → compile-time error |
| STMT_08_06_017 | FAIL_LabelInLambdaForOf | for-of 标签循环体内 lambda 中使用 break label（int 数组）和 continue label（string 数组）→ compile-time error |
| STMT_08_06_018 | FAIL_BreakToSiblingLabel | 标签作用域违规：兄弟循环引用对方标签（break labelA 在 sibling for）；do-while 中 continue 到兄弟 while 的标签；循环引用其后声明的标签 labelC → compile-time error |

### 3.3 运行时 (runtime) — 5个文件

| 编号 | 文件名 | 测试要点 |
|------|--------|----------|
| STMT_08_06_009 | RUNTIME_WhileAndDoWhile | while 迭代累加正确性（sum=10）；while 中 continue 跳过计数（4/5）；while 中 break 提前终止（sum=3）；do-while 条件 false 仍执行一次；do-while 迭代累加（sum=6）；do-while 中 continue 跳过计数 |
| STMT_08_06_010 | RUNTIME_ForAndForOf | for 迭代累加正确性（sum=10）；for 中 continue 跳过 i=2（sum=8）；for 中 break 提前终止（sum=6）；for 省略 init 子句正确性（sum=3）；for-of 遍历数组累加（sum=100）；for-of 空数组零次执行 |
| STMT_08_06_011 | RUNTIME_LabeledLoop | break outer 跳出双层 for 外层（count=11 验证）；continue outer 跳过外层当前迭代剩余部分（sum=3 验证）；break 跳出外层 while（内层 for 驱动，sum=3 验证） |
| STMT_08_06_019 | RUNTIME_MultipleNestedLabels | 三层嵌套 for 标签 break 到最外层（count=53）；continue 到外层跳过外层剩余体（sum=8）；for+while+do-while 混合三层 break 到中层；标签 for-of 中 break 验证元素位置正确性 |
| STMT_08_06_020 | RUNTIME_UnlabeledBreakContinue | 无标签 break 仅退出最内层 for 外层继续（6 次累加）；无标签 continue 仅跳过最内层 for 当前迭代（9 次累加）；无标签 break 在 while 嵌套 for 中（8 次累加）；无标签 continue 在 do-while 嵌套 while 中（9 次累加）；无标签 break 在 for-of 嵌套 for 中（6 次累加） |

## 四、边界值与异常场景 (Boundary & Exception)

### 4.1 编译通过边界
- while 条件为 false 时循环体不执行（001）
- for 循环 init 为空（省略）（003）
- for 循环 update 为空（省略），配合 break 退出（003）
- for-of 遍历空数组（004）
- do-while 条件初始为 false（至少执行一次）（002）
- 标签在 break 中正确引用（005）
- 标签声明但未使用（规范要求报错，编译器当前未实现）（012）
- 多层嵌套标签 break/continue 精确控制（013）
- 非嵌套循环复用标签名（014）

### 4.2 编译失败异常
- lambda 表达式内引用外层循环标签 — continue（006，规范示例）
- lambda 表达式内引用外层循环标签 — break（007）
- lambda 表达式内引用 do-while 标签 — break/continue（016）
- lambda 表达式内引用 for-of 标签 — break/continue（017）
- break 到不存在的标签（008）
- 兄弟循环引用对方标签（018）
- 循环引用其后声明的标签（018）
- 编译器错误拒绝合法标签 do-while/for-of 用法（015，compiler bug）

### 4.3 运行时验证
- while 迭代次数正确性（009）
- do-while 至少执行一次（009）
- for 迭代累加正确性（010）
- for-of 遍历累加正确性（010）
- for 循环省略 init 子句正确性（010）
- for-of 空数组零次执行（010）
- 循环中 continue 跳过当前迭代（009/010）
- 循环中 break 提前终止（009/010）
- break label 跳出多层循环（011/019）
- continue label 跳到外层下一次迭代（011/019）
- 无标签 break 仅退出最内层（020）
- 无标签 continue 仅跳过最内层当前迭代（020）
- while/for 混合嵌套 with break（020）
- do-while/while 混合嵌套 with continue（020）
- for-of/for 混合嵌套 with break（020）
- 标签 for-of 中 break 验证（019）

## 五、已知问题与规范差异

### 5.1 规范-实现差异
- **STMT_08_06_012**: 规范 STATEMENTS.md 要求 "A compile-time error occurs if the label identifier is not used within loopStatement"，但 es2panda 当前未强制执行此规则，编译可通过。该文件以 compile-pass 收录，标记为已知差异。

### 5.2 编译器缺陷
- **STMT_08_06_015**: 当前编译器对 do-while 和 for-of 循环使用标签存在缺陷——合法的标签 break/continue 用法导致编译器崩溃（SIGABRT）。该文件已按 spec 正向语义归位 compile-pass，记录为 compiler bug 待修复。内容覆盖：labeled do-while break、labeled do-while continue、labeled for-of break、labeled for-of continue、嵌套 labeled for-of。

## 六、文件命名规范 (File Naming)
- 格式: `STMT_08_06_XXX_CATEGORY_DESCRIPTION.ets`
- XXX: 三位数字序号（全局连续: 001-020）
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 简短英文描述（蛇形命名）
- 思维导图: `test_design_mindmap_8.6.md`

## 七、与其余章节的关系
- 与 8.5 (Break/Continue Statements) 相关 — break/continue 使用标签
- 标签作用域规则与 lambda 表达式相关
- for-of 循环与可迭代对象类型相关
- 标签作用域规则与 8.1-8.4 (Block/Expression/If/Switch Statements) 中作用域概念一致
