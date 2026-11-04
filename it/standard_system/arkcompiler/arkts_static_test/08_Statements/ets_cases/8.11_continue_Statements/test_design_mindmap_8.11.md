# 8.11 continue 语句 测试设计思维导图

## 1. 规格定义
- 语法: continueStatement: 'continue' identifier?
- 不带标签: 将控制权转移到包含它的最近循环 (while/do/for/for-of) 的下一次迭代
- 带标签: 将控制权转移到匹配标签标识的循环的下一次迭代
- 编译时错误:
  - continue 出现在循环语句 (loopStatement) 之外
  - continue 标签不匹配任何封闭循环 (enclosing loop) 的标签
- 运行时行为 (for 循环): continue 触发后 forUpdate 表达式在条件重新评估前执行
- 运行时行为 (do-while): continue 将控制权转移到 while(condition) 条件检查，而非循环体第一条语句

## 2. 测试策略总览

### 2.1 编译通过 (compile-pass) — 6 个测试点
- 基本场景: 无标签 continue 在 for / while / do-while 循环中
- 标签场景: 带标签 continue 在嵌套 for 循环中跳转到外层
- 深层嵌套: 多层嵌套循环中 continue 跳到中间层和最外层标签的混合使用
- do-while 标签: 带标签 continue 跳转到外层 do-while 循环 (对应规格示例)

### 2.2 编译失败 (compile-fail) — 7 个测试点
- continue 在循环语句外部 (无封闭循环)
- continue 在顶层作用域直接使用
- continue 使用不存在的标签名
- continue 标签指向非循环语句 (块语句 block)
- continue 标签指向普通块语句 {} (块本身非 loopStatement)
- for 循环中 continue 与复合 (逗号分隔) forUpdate 表达式
- for 循环中 continue 验证 forUpdate 执行 (运行时语义作为编译失败用例)

### 2.3 运行时 (runtime) — 5 个测试点
- for 循环中 continue 跳过特定迭代
- 嵌套循环中带标签 continue 跳转到外层
- while 循环中 continue 跳过偶数迭代
- do-while 循环中 continue 跳转到条件判断 (非循环体首条)
- 带标签 continue 在嵌套 do-while (外层) + for (内层) 中跳转到 do-while 条件检查

## 3. 详细测试点

### 3.1 编译通过 (compile-pass) — 6P

| 编号 | @id | 描述 |
|------|-----|------|
| STMT_08_11_001 | STMT_08_11_001_PASS_basic_continue_in_for_loop | 无标签 continue 在 for 循环中 — 跳过偶数次迭代 |
| STMT_08_11_002 | STMT_08_11_002_PASS_continue_with_label_in_nested_for | 带标签 continue 在嵌套 for 循环中 — 跳到外层循环下一次迭代 |
| STMT_08_11_003 | STMT_08_11_003_PASS_continue_in_while_loop | 无标签 continue 在 while 循环中 — 跳过偶数迭代 |
| STMT_08_11_004 | STMT_08_11_004_PASS_continue_in_do_while_loop | 无标签 continue 在 do-while 循环中 — 跳过偶数迭代 |
| STMT_08_11_005 | STMT_08_11_005_PASS_continue_with_label_deeply_nested | 带标签 continue 在 3 层嵌套循环中 — 混合使用 continue middle 和 continue outer |
| STMT_08_11_006 | STMT_08_11_006_PASS_continue_with_label_in_do_while | 带标签 continue 跳转到外层 do-while 循环 — 对应规格示例 STATEMENTS.md line 358-368 |

### 3.2 编译失败 (compile-fail) — 7F

| 编号 | @id | 描述 |
|------|-----|------|
| STMT_08_11_006 | STMT_08_11_006_FAIL_continue_outside_loop | continue 在循环语句外部 (函数体中无封闭循环) — 编译时错误 |
| STMT_08_11_007a | STMT_08_11_007_FAIL_continue_in_for_with_compound_update | for 循环中 continue 与复合 (逗号分隔) forUpdate 表达式 — 验证更新表达式执行 |
| STMT_08_11_007b | STMT_08_11_007_FAIL_continue_with_nonexistent_label | continue 使用不存在的标签名 — 编译时错误 |
| STMT_08_11_008 | STMT_08_11_008_FAIL_continue_with_non_loop_label | continue 标签指向非循环语句 (块语句 block 标签，for 循环在其内部) |
| STMT_08_11_009 | STMT_08_11_009_FAIL_continue_at_top_level | continue 在顶层作用域 (模块级) — 语法错误 ESY0165 + 语义错误 ESE0161 |
| STMT_08_11_010 | STMT_08_11_010_FAIL_continue_with_label_on_non_loop_block | continue 标签指向普通块语句 {} (块本身非 loopStatement) — 编译时错误 |
| STMT_08_11_013 | STMT_08_11_013_FAIL_continue_in_for_verifies_update_execution | for 循环中 continue 必须执行 forUpdate 后再检查条件 — 运行时语义验证 (归类为编译失败用例) |

> **编号说明:** 存在编号重叠现象 — STMT_08_11_006 同时用于 compile-pass 和 compile-fail；STMT_08_11_007 在 compile-fail 中有两个不同测试文件。此外 STMT_08_11_007_FAIL_continue_in_for_with_compound_update 的 @id 字段误写为 "PASS" 前缀；STMT_08_11_013_FAIL_continue_in_for_verifies_update_execution 的 @id 字段误写为 "RUNTIME" 前缀。当前文件位置 (@expect 值和目录) 为准。

### 3.3 运行时 (runtime) — 5R

| 编号 | @id | 描述 |
|------|-----|------|
| STMT_08_11_009 | STMT_08_11_009_RUNTIME_continue_in_for_loop_skip_iteration | for 循环中 continue 跳过特定迭代 (跳过 i==3) — 验证 sum 结果 |
| STMT_08_11_010 | STMT_08_11_010_RUNTIME_continue_with_label_nested_loops | 嵌套 for 循环中 continue outer — 验证仅 j=0 被执行 |
| STMT_08_11_011 | STMT_08_11_011_RUNTIME_continue_in_while_loop_skip_even | while 循环中 continue 跳过偶数 — 验证奇数之和 = 25 |
| STMT_08_11_012 | STMT_08_11_012_RUNTIME_continue_in_do_while_jumps_to_condition | do-while 循环中 continue 跳转到 while(condition) 条件检查 — 验证计数器状态 |
| STMT_08_11_014 | STMT_08_11_014_RUNTIME_continue_with_label_do_while_nested | 带标签 continue outer 在 do-while 嵌套 for 中 — 跳转到 do-while 条件 (while(false) 退出) |

## 4. 边界值和异常场景

### 4.1 边界值
- continue 在循环体第一条语句 (无条件跳过)
- continue 在 if-else 分支中 (条件性跳过)
- continue 在嵌套循环中跳到不同层级的标签 (middle / outer 混合)
- do-while 中 continue 不重新执行循环体 (跳转到条件检查)
- for 循环中 continue 仍执行 forUpdate 表达式后再检查条件

### 4.2 异常场景
- continue 在循环外部 (函数体中无封闭循环) → 编译错误
- continue 在顶层作用域 (模块级) → 语法错误 ESY0165 + 语义错误 ESE0161
- continue + 标签指向不存在的标签名 → 编译错误
- continue + 标签指向非循环语句 (块语句 block) → 编译错误
- continue + 标签指向普通块 {} (块本身非 loopStatement) → 编译错误

## 5. 文件命名约定

- 目录: `8.11_continue_Statements/`
  - `compile-pass/`: `STMT_08_11_NNN_PASS_xxx.ets`
  - `compile-fail/`: `STMT_08_11_NNN_FAIL_xxx.ets`
  - `runtime/`: `STMT_08_11_NNN_RUNTIME_xxx.ets`
- 编号连续递增，跨类别统一编号 (当前存在部分编号重叠)
- 5 标签注释块: `@id`, `@expect`, `@section`, `@design`, `@note`

## 6. 文件清单

| # | 文件名 | 类型 | 描述 |
|---|--------|------|------|
| 001 | STMT_08_11_001_PASS_basic_continue_in_for_loop.ets | pass | for 循环中无标签 continue 跳过偶数 |
| 002 | STMT_08_11_002_PASS_continue_with_label_in_nested_for.ets | pass | 嵌套 for 循环中 continue outer 跳转到外层 |
| 003 | STMT_08_11_003_PASS_continue_in_while_loop.ets | pass | while 循环中无标签 continue 跳过偶数 |
| 004 | STMT_08_11_004_PASS_continue_in_do_while_loop.ets | pass | do-while 循环中无标签 continue 跳过偶数 |
| 005 | STMT_08_11_005_PASS_continue_with_label_deeply_nested.ets | pass | 3 层嵌套循环中 continue middle/outer 混合 |
| 006 | STMT_08_11_006_PASS_continue_with_label_in_do_while.ets | pass | 带标签 continue 跳转到外层 do-while |
| 006 | STMT_08_11_006_FAIL_continue_outside_loop.ets | fail | continue 在循环外部 (无封闭循环) |
| 007a | STMT_08_11_007_FAIL_continue_in_for_with_compound_update.ets | fail | for 循环中 continue 与复合 forUpdate |
| 007b | STMT_08_11_007_FAIL_continue_with_nonexistent_label.ets | fail | continue 使用不存在的标签名 |
| 008 | STMT_08_11_008_FAIL_continue_with_non_loop_label.ets | fail | continue 标签指向非循环语句 |
| 009 | STMT_08_11_009_FAIL_continue_at_top_level.ets | fail | continue 在顶层作用域 (语法 + 语义错误) |
| 010 | STMT_08_11_010_FAIL_continue_with_label_on_non_loop_block.ets | fail | continue 标签指向普通 block {} |
| 013 | STMT_08_11_013_FAIL_continue_in_for_verifies_update_execution.ets | fail | for 循环中 continue 验证 forUpdate 执行 |
| 009 | STMT_08_11_009_RUNTIME_continue_in_for_loop_skip_iteration.ets | runtime | for 循环中 continue 跳过特定迭代 |
| 010 | STMT_08_11_010_RUNTIME_continue_with_label_nested_loops.ets | runtime | 嵌套循环中 continue outer 运行时行为 |
| 011 | STMT_08_11_011_RUNTIME_continue_in_while_loop_skip_even.ets | runtime | while 循环中 continue 跳过偶数 |
| 012 | STMT_08_11_012_RUNTIME_continue_in_do_while_jumps_to_condition.ets | runtime | do-while 中 continue 跳转到条件检查 |
| 014 | STMT_08_11_014_RUNTIME_continue_with_label_do_while_nested.ets | runtime | 带标签 continue 在嵌套 do-while 中 |

**总计: 6P + 7F + 5R = 18 个测试用例，全部通过 (100%)**

## 7. 已知问题

1. **编号重叠:** STMT_08_11_006 同时用于 compile-pass (continue_with_label_in_do_while) 和 compile-fail (continue_outside_loop)。STMT_08_11_007 在 compile-fail 中有两个不同文件 (compound_update 和 nonexistent_label)。建议后续统一重新编号。
2. **@id 元数据错误:**
   - `STMT_08_11_007_FAIL_continue_in_for_with_compound_update.ets` 的 @id 字段为 `STMT_08_11_007_PASS_...` (应为 FAIL)
   - `STMT_08_11_013_FAIL_continue_in_for_verifies_update_execution.ets` 的 @id 字段为 `STMT_08_11_013_RUNTIME_...` (应为 FAIL)
3. **ST_08_11_007 (compound_update) 和 ST_08_11_013 (verifies_update_execution)** 都测试 for 循环中 continue 与 forUpdate 表达式的交互语义，但前者被列为 compile-fail 分类。两者语义相近，归属分类待统一。
