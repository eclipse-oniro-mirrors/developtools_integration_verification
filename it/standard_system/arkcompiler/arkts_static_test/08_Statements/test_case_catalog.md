# 08 语句 - 测试用例目录

**最后编译验证：** 2026-06-25（es2panda `--extension=ets`，Linux native）
**总用例数：** 557（223P + 154F + 180R）
**编译实测：** compile-pass 222/223 通过（含 1 编译器崩溃 C-8.06-02，已归位 compile-pass）；compile-fail 154 按预期失败 + 1 异常通过（C-8.06-01）；runtime 180/180 编译通过。详见 [issue_report.md](issue_report.md)
**覆盖章节：** §8.1-§8.15.3（18 个子章节）
---

## 子章节用例分布

| 章节 | 标题 | P | F | R | 合计 |
|------|------|---|---|---|------|
| §8.10 | break Statements | 10 | 10 | 10 | 30 |
| §8.11 | continue Statements | 10 | 10 | 10 | 30 |
| §8.12 | return Statements | 10 | 10 | 10 | 30 |
| §8.13 | switch Statements | 12 | 10 | 10 | 32 |
| §8.14 | throw Statements | 10 | 10 | 10 | 30 |
| §8.15.1 | catch Clause | 11 | 9 | 10 | 30 |
| §8.15.2 | finally Clause | 12 | 8 | 10 | 30 |
| §8.15.3 | try Execution | 12 | 8 | 10 | 30 |
| §8.15 | try Statements | 10 | 10 | 10 | 30 |
| §8.1 | Normal/Abrupt Execution | 12 | 8 | 10 | 30 |
| §8.2 | Expression Statements | 12 | 8 | 10 | 30 |
| §8.3 | Block | 10 | 10 | 10 | 30 |
| §8.4 | Constant/Variable Declarations | 10 | 10 | 10 | 30 |
| §8.5 | if Statements | 22 | 4 | 10 | 36 |
| §8.6 | Loop Statements | 10 | 10 | 10 | 30 |
| §8.7 | while/do Statements | 22 | 4 | 10 | 36 |
| §8.8 | for Statements | 18 | 5 | 10 | 33 |
| §8.9 | for-of Statements | 10 | 10 | 10 | 30 |
| **合计** | | **223** | **154** | **180** | **557** |
---

## 完整用例清单

### §8.10 break Statements（10P + 10F + 10R）

| 用例 ID | 分类 | 测试内容 |
|---------|------|---------|
| STMT_08_10_001_PASS_break_basic_while | compile-pass | 在while循环中使用无标签break，跳出最内层循环 |
| STMT_08_10_002_PASS_break_labelled | compile-pass | 在嵌套循环中使用带标签的break，跳出外层标记的循环 |
| STMT_08_10_003_PASS_break_for_loop | compile-pass | 在for循环中使用无标签break，跳出for循环 |
| STMT_08_10_004_PASS_break_for_of | compile-pass | 在for-of循环中使用无标签break，跳出for-of循环 |
| STMT_08_10_005_PASS_break_switch | compile-pass | 在switch语句中使用break跳出case块，防止fallthrough |
| STMT_08_10_006_PASS_break_deep_nested_unlabeled | compile-pass | 在三层嵌套for循环中使用无标签break，应跳出最内层循环 |
| STMT_08_10_007_PASS_break_deep_nested_labeled | compile-pass | 在三层嵌套循环中使用带标签的break跳出中间层标记的循环 |
| STMT_08_10_020_PASS_BREAK_IN_DO_WHILE | compile-pass | do-while 循环中使用 break |
| STMT_08_10_021_PASS_BREAK_IN_FOR_OF | compile-pass | for-of 循环中使用 break |
| STMT_08_10_022_PASS_BREAK_WITH_LABEL_NESTED | compile-pass | 嵌套循环中使用带 label 的 break |
| STMT_08_10_006_FAIL_break_outside_loop | compile-fail | break语句出现在任何循环或switch语句外部，应产生编译错误 |
| STMT_08_10_007_FAIL_break_label_not_found | compile-fail | break的标签不匹配任何封闭语句的标签，产生编译错误 |
| STMT_08_10_008_FAIL_break_label_non_loop | compile-fail | break标签指向一个非循环/switch语句的标签（如标记的块语句），产生编译错误 |
| STMT_08_10_009_FAIL_break_at_top_level | compile-fail | break 语句在顶层（非循环/switch 内）应产生编译错误 — STATEMENTS.md: "If a break statement is used  |
| STMT_08_10_010_FAIL_break_label_not_found_deep | compile-fail | 在三层嵌套循环中使用带标签break，但标签不存在于任何外层循环 — 应产生编译错误 |
| STMT_08_10_011_FAIL_break_deep_nested_outside | compile-fail | 在深层嵌套的if/else块中使用break语句（不在任何循环或switch内） — 应产生编译错误 |
| STMT_08_10_023_FAIL_BREAK_OUTSIDE_LOOP | compile-fail | 在循环外使用 break 应产生编译错误 |
| STMT_08_10_024_FAIL_BREAK_WRONG_LABEL | compile-fail | break 引用不存在的 label 应产生编译错误 |
| STMT_08_10_025_FAIL_BREAK_LABEL_OUTER_NOT_LOOP | compile-fail | break label 的目标不是循环应产生编译错误 |
| STMT_08_10_026_FAIL_BREAK_IF_IN_LOOP | compile-fail | break 在函数顶层而非循环中应产生编译错误 |
| STMT_08_10_009_RUNTIME_break_while_control | runtime | 验证无标签break在while循环中能正确跳出，退出后循环变量和计数器的值正确 |
| STMT_08_10_010_RUNTIME_break_labelled_outer | runtime | 验证带标签的break能正确跳出外层标记循环，跳过内层剩余迭代 |
| STMT_08_10_011_RUNTIME_break_switch_control | runtime | 验证break在switch语句中能正确跳出case块，防止fallthrough到下一个case |
| STMT_08_10_012_RUNTIME_break_deep_nested_unlabeled | runtime | 验证三层嵌套for循环中无标签break只跳出最内层，外层循环继续执行 |
| STMT_08_10_013_RUNTIME_break_deep_nested_labeled_outer | runtime | 验证三层嵌套循环中带标签break直接跳出最外层标记的循环，中层和内层都被终止 |
| STMT_08_10_014_RUNTIME_break_deep_nested_labeled_mid | runtime | 3层嵌套循环中 labeled break 跳出中间层 |
| STMT_08_10_027_RUNTIME_BREAK_INNER_LOOP | runtime | break 只退出最内层循环 |
| STMT_08_10_028_RUNTIME_BREAK_WITH_LABEL | runtime | 带 label break 退出外层循环 |
| STMT_08_10_029_RUNTIME_BREAK_SWITCH | runtime | switch 中使用 break 退出 |
| STMT_08_10_030_RUNTIME_BREAK_WHILE | runtime | while 中使用 break 终止循环 |

### §8.11 continue Statements（10P + 10F + 10R）

| 用例 ID | 分类 | 测试内容 |
|---------|------|---------|
| STMT_08_11_001_PASS_basic_continue_in_for_loop | compile-pass | 验证无标签的continue语句在for循环中的基本用法，跳过偶数次迭代 |
| STMT_08_11_002_PASS_continue_with_label_in_nested_for | compile-pass | 验证带标签的continue语句在嵌套for循环中跳转到外层循环的下一次迭代 |
| STMT_08_11_003_PASS_continue_in_while_loop | compile-pass | 验证无标签的continue语句在while循环中的基本用法，跳过特定条件迭代 |
| STMT_08_11_004_PASS_continue_in_do_while_loop | compile-pass | 验证无标签的continue语句在do-while循环中的基本用法，跳过特定条件迭代 |
| STMT_08_11_005_PASS_continue_with_label_deeply_nested | compile-pass | 验证带标签的continue语句在多层嵌套循环中跳转到中间层和外层标签的混合使用 |
| STMT_08_11_006_PASS_continue_with_label_in_do_while | compile-pass | 验证带标签的continue语句在do-while循环中正确编译，标签定位到外层do-while循环 |
| STMT_08_11_019_PASS_CONTINUE_WHILE | compile-pass | while 循环中使用 continue |
| STMT_08_11_020_PASS_CONTINUE_FOR_OF | compile-pass | for-of 循环中使用 continue |
| STMT_08_11_021_PASS_CONTINUE_LABELED | compile-pass | 带 label 的 continue |
| STMT_08_11_022_PASS_CONTINUE_DO_WHILE | compile-pass | do-while 循环中使用 continue |
| STMT_08_11_006_FAIL_continue_outside_loop | compile-fail | 验证continue语句在循环语句外部使用时产生编译时错误 |
| STMT_08_11_007_FAIL_continue_in_for_with_compound_update | compile-fail | 验证for循环中continue语句与复合（逗号分隔）forUpdate表达式一起正确编译 |
| STMT_08_11_007_FAIL_continue_with_nonexistent_label | compile-fail | 验证continue语句使用不存在的标签标注时产生编译时错误 |
| STMT_08_11_008_FAIL_continue_with_non_loop_label | compile-fail | 验证continue语句使用非循环语句的标签时产生编译时错误（标签标记的是块语句而非循环） |
| STMT_08_11_009_FAIL_continue_at_top_level | compile-fail | continue 语句在顶层（非循环内）应产生编译错误 — STATEMENTS.md: "If there is no enclosing loopState |
| STMT_08_11_010_FAIL_continue_with_label_on_non_loop_block | compile-fail | 验证continue语句使用的标签标记在非循环语句（普通块语句）上时产生编译时错误 |
| STMT_08_11_013_FAIL_continue_in_for_verifies_update_execution | compile-fail | 验证for循环中continue语句触发后，forUpdate表达式在条件重新评估前被执行 |
| STMT_08_11_023_FAIL_CONTINUE_OUTSIDE_LOOP | compile-fail | continue 在循环外使用应产生编译错误 |
| STMT_08_11_024_FAIL_CONTINUE_WRONG_LABEL | compile-fail | continue 引用不存在的 label 应产生编译错误 |
| STMT_08_11_025_FAIL_CONTINUE_LABEL_IN_LAMBDA | compile-fail | continue label 在 lambda 中使用应产生编译错误 |
| STMT_08_11_009_RUNTIME_continue_in_for_loop_skip_iteration | runtime | 验证在for循环中使用无标签continue跳过特定迭代（跳过3）的运行时行为 |
| STMT_08_11_010_RUNTIME_continue_with_label_nested_loops | runtime | 验证嵌套循环中使用带标签的continue跳转到外层循环的运行时行为 |
| STMT_08_11_011_RUNTIME_continue_in_while_loop_skip_even | runtime | 验证在while循环中使用无标签continue跳过偶数的运行时行为 |
| STMT_08_11_012_RUNTIME_continue_in_do_while_jumps_to_condition | runtime | 验证do-while循环中continue语句将控制权转移到while条件检查，而非循环体第一条语句 |
| STMT_08_11_014_RUNTIME_continue_with_label_do_while_nested | runtime | 验证在do-while嵌套for循环中使用带标签continue跳转到外层do-while条件检查的运行时行为 |
| STMT_08_11_026_RUNTIME_CONTINUE_SKIP | runtime | continue 跳过当前迭代 |
| STMT_08_11_027_RUNTIME_CONTINUE_LABELED_OUTER | runtime | continue label 跳到外层循环 |
| STMT_08_11_028_RUNTIME_CONTINUE_ODD_ONLY | runtime | continue 收集奇数 |
| STMT_08_11_029_RUNTIME_CONTINUE_DO_WHILE_CHECK | runtime | continue 在 do-while 中仍然检查条件 |
| STMT_08_11_030_RUNTIME_CONTINUE_EMPTY_LOOP | runtime | continue 在空循环体中 |

### §8.12 return Statements（10P + 10F + 10R）

| 用例 ID | 分类 | 测试内容 |
|---------|------|---------|
| STMT_08_12_001_PASS_return_in_void_function | compile-pass | 测试void函数中无表达式的return语句 |
| STMT_08_12_002_PASS_return_undefined_in_void_function | compile-pass | 测试void函数中return undefined语句 |
| STMT_08_12_003_PASS_return_expression_matching_type | compile-pass | 测试返回表达式类型匹配函数返回类型的return语句 |
| STMT_08_12_004_PASS_return_in_constructor | compile-pass | 测试构造函数中无表达式的return语句 |
| STMT_08_12_005_PASS_multiple_return_paths | compile-pass | 测试函数中多个return语句分支持续编译通过 |
| STMT_08_12_006_PASS_return_in_lambda_expression | compile-pass | 测试lambda表达式中return语句的使用，涵盖有表达式return和plain return |
| STMT_08_12_007_PASS_return_subclass_assignable_to_base | compile-pass | 测试return表达式为子类类型时可赋值给父类返回类型 |
| STMT_08_12_008_PASS_return_in_union_return_type_function | compile-pass | 测试返回类型为union类型(T|undefined)的函数中return语句的使用 |
| STMT_08_12_015_PASS_constructor_return_no_expression | compile-pass | 测试带参数的构造函数中无表达式的return语句 — STATEMENTS.md: constructor return 允许无表达式形式 |
| STMT_08_12_016_PASS_return_in_lambda_inside_function | compile-pass | 测试函数体内定义的lambda表达式中return语句的使用 |
| STMT_08_12_006_FAIL_return_undefined_in_constructor | compile-fail | 测试构造函数中return undefined产生编译错误 |
| STMT_08_12_007_FAIL_return_without_expression_in_typed_function | compile-fail | 测试非void/非undefined返回类型函数中无表达式return产生编译错误 |
| STMT_08_12_008_FAIL_return_type_not_assignable | compile-fail | 测试return表达式类型不可赋值给函数返回类型时产生编译错误 |
| STMT_08_12_009_FAIL_return_at_top_level | compile-fail | return 语句在顶层（非函数/方法体内）应产生编译错误 — STATEMENTS.md: "top-level statements cannot cont |
| STMT_08_12_010_FAIL_return_type_mismatch_in_lambda | compile-fail | 测试lambda表达式中return类型不可赋值给声明的返回类型时产生编译错误 |
| STMT_08_12_017_FAIL_return_with_expression_in_void_function | compile-fail | 测试void函数中带表达式的return语句产生编译错误 |
| STMT_08_12_025_FAIL_RETURN_VALUE_IN_VOID | compile-fail | void 函数中 return 带表达式应产生编译错误 |
| STMT_08_12_026_FAIL_RETURN_TYPE_MISMATCH | compile-fail | return 类型不匹配应产生编译错误 |
| STMT_08_12_027_FAIL_RETURN_UNDEFINED_IN_CONSTRUCTOR | compile-fail | 构造器中 return undefined 应产生编译错误 |
| STMT_08_12_028_FAIL_NO_RETURN_NON_VOID | compile-fail | 非 void 函数没有 return 语句应产生编译错误 |
| STMT_08_12_009_RUNTIME_return_value | runtime | 运行时验证return语句正确返回值 |
| STMT_08_12_010_RUNTIME_return_early_control_flow | runtime | 运行时验证void函数中return语句提前退出控制流 |
| STMT_08_12_011_RUNTIME_conditional_multiple_returns | runtime | 运行时验证多个条件return路径返回值正确性 |
| STMT_08_12_012_RUNTIME_return_in_lambda | runtime | 运行时验证lambda表达式中return语句正确返回计算结果 |
| STMT_08_12_013_RUNTIME_return_subclass_assignable_to_base | runtime | 运行时验证return子类对象给父类返回类型的动态多态行为 |
| STMT_08_12_014_RUNTIME_return_union_type | runtime | 运行时验证返回类型为union(T|undefined)的函数中return语句行为 |
| STMT_08_12_018_RUNTIME_return_from_multiple_control_flow_paths | runtime | 运行时验证从多种控制流路径（for循环、while循环、if-else分支）中return值的正确性 |
| STMT_08_12_019_RUNTIME_return_in_nested_if_else | runtime | 运行时验证嵌套if-else中所有分支return值类型兼容且正确 |
| STMT_08_12_029_RUNTIME_RETURN_IMPLICIT_UNDEFINED | runtime | void 函数隐式返回 undefined |
| STMT_08_12_030_RUNTIME_RETURN_CONDITIONAL | runtime | 条件 return 分支 |

### §8.13 switch Statements（12P + 10F + 10R）

| 用例 ID | 分类 | 测试内容 |
|---------|------|---------|
| STMT_08_13_001_PASS_basic_int_switch | compile-pass | 基本int类型switch表达式，case匹配后使用break退出，验证基础switch语法 |
| STMT_08_13_002_PASS_fall_through | compile-pass | int类型switch中case无break时的fall-through穿透执行流程验证 |
| STMT_08_13_003_PASS_string_switch | compile-pass | string类型switch表达式，case分支使用字符串字面量，验证任意类型的switch表达式支持 |
| STMT_08_13_004_PASS_boolean_switch | compile-pass | boolean类型switch表达式，case分支使用true/false字面量，验证布尔类型switch支持 |
| STMT_08_13_005_PASS_labeled_break_switch | compile-pass | 带标签标识符的switch，break outer跳出嵌套switch到外层switch，验证标识符break |
| STMT_08_13_006_PASS_identical_case_values | compile-pass | switch 中允许多个相同的 case 表达式 — STATEMENTS.md line 459 "One may have several case cla |
| STMT_08_13_007_PASS_object_instance_switch | compile-pass | switch 表达式为 class|null union（严格遵循 STATEMENTS.md §8.13 示例模式） |
| STMT_08_13_008_PASS_labeled_break_outer_loop | compile-pass | switch 内使用带标签的 break 跳出外层循环（for/while）— STATEMENTS.md line 435: "break statement |
| STMT_08_13_017_PASS_char_switch | compile-pass | char类型switch表达式，case分支使用char字面量，验证char类型switch支持 |
| STMT_08_13_018_PASS_boolean_switch_extended | compile-pass | boolean类型switch表达式的扩展用法：仅含true case无false case（编译通过）、仅含false case加default、fall-t |
| STMT_08_13_019_PASS_char_case_on_int_switch | compile-pass | int 类型 switch 表达式中使用 char 字面量 case，编译通过 |
| STMT_08_13_022_PASS_switch_case_block_declaration | compile-pass | switch case 块内 let 声明 — 各 case 块创建独立块作用域 |
| STMT_08_13_006_FAIL_string_case_on_int_switch | compile-fail | int类型switch表达式中case使用string类型字面量，case类型不可赋值给switch类型应报编译时错误 |
| STMT_08_13_007_FAIL_int_case_on_string_switch | compile-fail | string类型switch表达式中case使用int类型字面量，case类型不可赋值给switch类型应报编译时错误 |
| STMT_08_13_008_FAIL_boolean_case_on_number_switch | compile-fail | number类型switch表达式中case使用boolean类型字面量，case类型不可赋值给switch类型应报编译时错误 |
| STMT_08_13_009_FAIL_duplicate_default | compile-fail | switch 语句中多个 default 子句应产生编译错误 — STATEMENTS.md 只允许一个 defaultClause |
| STMT_08_13_027_FAIL_SWITCH_CASE_TYPE_MISMATCH | compile-fail | switch case 类型不匹配应产生编译错误 |
| STMT_08_13_028_FAIL_SWITCH_DUPLICATE_DEFAULT | compile-fail | switch 多个 default 子句应产生编译错误 |
| STMT_08_13_029_FAIL_SWITCH_STRING_VS_INT_CASE | compile-fail | switch string 与 int case 不匹配应产生编译错误 |
| STMT_08_13_030_FAIL_SWITCH_BOOL_VS_STRING | compile-fail | switch boolean 与 string case 不匹配应产生编译错误 |
| STMT_08_13_031_FAIL_SWITCH_BREAK_WRONG_LABEL | compile-fail | switch 中 break label 引用不存在的 label 应产生编译错误 |
| STMT_08_13_032_FAIL_SWITCH_CASE_NON_CONSTANT | compile-fail | switch case 使用非字面量非常量表达式 |
| STMT_08_13_009_RUNTIME_basic_switch | runtime | 验证switch基本匹配执行流程：正确匹配case执行对应分支，未匹配时执行default子句 |
| STMT_08_13_010_RUNTIME_fall_through_and_default | runtime | 验证switch的fall-through无break穿透执行行为和default子句的匹配/未匹配行为 |
| STMT_08_13_011_RUNTIME_labeled_break_switch | runtime | 验证带标签标识符的switch中break outer跳出嵌套switch到外层switch的功能 |
| STMT_08_13_012_RUNTIME_null_case_matching | runtime | switch 匹配 null 值 — 严格参照 STATEMENTS.md §8.13 示例 |
| STMT_08_13_013_RUNTIME_identical_case_values | runtime | switch 中多个相同 case 表达式的运行时匹配行为 — STATEMENTS.md line 459 "One may have several cas |
| STMT_08_13_014_RUNTIME_fall_through_deep | runtime | switch 的多层 fall-through 穿透执行和穿透到 default 的行为 — STATEMENTS.md lines 476-478 |
| STMT_08_13_015_RUNTIME_labeled_break_outer_loop | runtime | switch 内使用带标签的 break 跳出外层循环（for/while）— STATEMENTS.md line 435: identifier label |
| STMT_08_13_016_RUNTIME_object_instance_switch | runtime | switch class|null 实例运行时验证（通过函数返回避免类型窄化） |
| STMT_08_13_020_RUNTIME_string_switch_matching | runtime | 运行时验证string类型switch的case精确匹配、default兜底、以及无匹配无default时跳过switch |
| STMT_08_13_021_RUNTIME_enum_switch | runtime | 运行时验证enum类型switch表达式的case精确匹配、default兜底、fall-through穿透枚举分支 |

### §8.14 throw Statements（10P + 10F + 10R）

| 用例 ID | 分类 | 测试内容 |
|---------|------|---------|
| STMT_08_14_001_PASS_throw_new_error | compile-pass | 测试直接抛出new Error()实例，验证throw Error类型表达式通过编译 |
| STMT_08_14_002_PASS_throw_error_variable | compile-pass | 测试将Error实例赋值给变量后再抛出，验证变量形式的throw通过编译 |
| STMT_08_14_003_PASS_throw_custom_error | compile-pass | 测试抛出自定义Error子类，验证子类类型可赋值给Error |
| STMT_08_14_004_PASS_throw_range_error | compile-pass | 测试抛出RangeError标准Error子类，验证标准Error子类通过编译 |
| STMT_08_14_010_PASS_throw_error_with_extra_properties | compile-pass | 测试抛出携带额外属性的自定义Error子类，验证子类扩展字段不影响对Error的赋值兼容性 |
| STMT_08_14_011_PASS_throw_after_return_unreachable | compile-pass | 测试return后的throw语句在语法上合法，验证编译器不因死代码而拒绝throw语法 |
| STMT_08_14_017_PASS_throw_error_string_concat | compile-pass | 测试throw Error时使用字符串拼接构造错误消息，验证动态消息不影响对Error的赋值兼容性 |
| STMT_08_14_020_PASS_THROW_ERROR_SUBCLASS | compile-pass | throw Error 子类实例 |
| STMT_08_14_021_PASS_THROW_IN_IF | compile-pass | 在 if 语句中使用 throw |
| STMT_08_14_022_PASS_THROW_IN_LOOP | compile-pass | 在循环中使用 throw（被 catch 捕获） |
| STMT_08_14_005_FAIL_throw_string | compile-fail | 测试抛出string类型表达式，验证非Error类型导致编译错误 |
| STMT_08_14_006_FAIL_throw_null | compile-fail | 测试抛出null，验证null不允许抛出导致编译错误 |
| STMT_08_14_007_FAIL_throw_undefined | compile-fail | 测试抛出undefined，验证undefined不允许抛出导致编译错误 |
| STMT_08_14_012_FAIL_throw_number | compile-fail | 测试抛出number字面量，验证非Error类型导致编译错误 |
| STMT_08_14_013_FAIL_throw_boolean | compile-fail | 测试抛出boolean字面量，验证非Error类型导致编译错误 |
| STMT_08_14_019_FAIL_throw_plain_object | compile-fail | 测试抛出普通对象字面量（非Error实例），验证非Error类型对象导致编译错误 |
| STMT_08_14_023_FAIL_THROW_NULL | compile-fail | throw null 应产生编译错误（null 不可分配给 Error） |
| STMT_08_14_024_FAIL_THROW_UNDEFINED | compile-fail | throw undefined 应产生编译错误 |
| STMT_08_14_025_FAIL_THROW_STRING | compile-fail | throw string 应产生编译错误（非 Error 类型） |
| STMT_08_14_026_FAIL_THROW_INT | compile-fail | throw int 值应产生编译错误 |
| STMT_08_14_008_RUNTIME_throw_caught | runtime | 测试throw被try-catch捕获，验证异常传播到最近catch块 |
| STMT_08_14_009_RUNTIME_throw_rethrow | runtime | 测试catch块中rethrow重新抛出，验证异常可重新传播到外层try-catch |
| STMT_08_14_014_RUNTIME_throw_from_nested_function | runtime | 测试在独立函数中throw，验证异常沿调用栈传播到外层try-catch |
| STMT_08_14_015_RUNTIME_multi_nested_try_catch | runtime | 测试多层嵌套try-catch，验证throw由最近的catch块捕获 |
| STMT_08_14_016_RUNTIME_throw_immediate_control_transfer | runtime | 测试throw立即转移控制权，验证throw之后的语句不被执行 |
| STMT_08_14_018_RUNTIME_throw_deeply_nested | runtime | 测试三层嵌套try-catch中throw的传播路径，验证异常逐层被捕获并重新抛出后最终被最外层catch捕获 |
| STMT_08_14_027_RUNTIME_THROW_CAUGHT | runtime | throw 被 catch 捕获 |
| STMT_08_14_028_RUNTIME_THROW_CUSTOM_ERROR | runtime | throw 自定义 Error 子类 |
| STMT_08_14_029_RUNTIME_THROW_UNCAUGHT | runtime | throw 未被 catch 导致 UncaughtExceptionError |
| STMT_08_14_030_RUNTIME_RETHROW | runtime | catch 中重新 throw 被外层 catch 捕获 |

### §8.15.1 catch Clause（11P + 9F + 10R）

| 用例 ID | 分类 | 测试内容 |
|---------|------|---------|
| STMT_08_15_1_001_PASS_basic_catch | compile-pass | 验证基本的 try-catch 结构编译通过。catch 子句捕获 Error 类型对象，在块内访问 error 对象。 |
| STMT_08_15_1_002_PASS_catch_instanceof | compile-pass | 验证 catch 块内使用 instanceof 对 Error 子类型进行类型收窄，分别处理不同类型错误。 |
| STMT_08_15_1_003_PASS_catch_finally | compile-pass | 验证 try-catch-finally 完整结构编译通过，catch 捕获错误后 finally 确保执行清理逻辑。 |
| STMT_08_15_1_004_PASS_catch_rethrow | compile-pass | 验证 catch 块内可以重新抛出捕获的 Error 对象，由外层调用者处理。 |
| STMT_08_15_1_005_PASS_catch_error_properties | compile-pass | 验证 catch 块内访问 Error 对象的 message、name 和 stack 属性编译通过。 |
| STMT_08_15_1_015_PASS_catch_multiple_subclasses | compile-pass | 验证 catch 块中使用 instanceof 对三个以上 Error 子类型进行类型收窄，代码能够通过编译。 |
| STMT_08_15_1_016_PASS_catch_throw_translated_error | compile-pass | 验证 catch 块中捕获原始错误后抛出新的不同 Error 类型（错误转换），代码能够通过编译。 |
| STMT_08_15_1_018_PASS_CATCH_INSTANCEOF | compile-pass | catch 块中使用 instanceof 检查错误类型 |
| STMT_08_15_1_019_PASS_CATCH_MULTIPLE_TYPES | compile-pass | catch 块处理多种异常类型 |
| STMT_08_15_1_020_PASS_CATCH_TYPE_NARROWING | compile-pass | catch 块中通过 instanceof 进行类型收窄 |
| STMT_08_15_1_024_PASS_CATCH_RETURN | compile-pass | catch 块外 unreachable 语句 |
| STMT_08_15_1_006_FAIL_catch_wrong_type_string | compile-fail | 验证 catch 参数类型注解为 string 时产生编译错误。catch 标识符类型必须是 Error。 |
| STMT_08_15_1_007_FAIL_catch_type_annotation_number | compile-fail | 验证 catch 参数类型注解为 number 时产生编译错误。catch 标识符类型必须是 Error。 |
| STMT_08_15_1_008_FAIL_catch_type_annotation_boolean | compile-fail | 验证 catch 参数类型注解为 boolean 时产生编译错误。catch 标识符类型必须是 Error。 |
| STMT_08_15_1_017_FAIL_catch_type_annotation_object | compile-fail | 验证 catch 参数类型注解为 object（非 Error 类型）时产生编译错误。 |
| STMT_08_15_1_021_FAIL_CATCH_WITH_TYPE | compile-fail | catch 带类型标注已弃用应报错 |
| STMT_08_15_1_022_FAIL_CATCH_NO_IDENTIFIER | compile-fail | catch 缺少标识符应产生编译错误 |
| STMT_08_15_1_023_FAIL_CATCH_OUTSIDE_TRY | compile-fail | catch 在 try 外部使用应产生编译错误 |
| STMT_08_15_1_025_FAIL_CATCH_VAR_ESCAPE | compile-fail | catch 标识符在 catch 块外使用应产生编译错误 |
| STMT_08_15_1_026_FAIL_CATCH_AS_EXPR | compile-fail | catch 作为表达式应产生编译错误 |
| STMT_08_15_1_009_RUNTIME_basic_catch | runtime | 验证 catch 子句在运行时正确捕获抛出的 Error 对象，并获取 error.message 属性值。 |
| STMT_08_15_1_010_RUNTIME_instanceof | runtime | 验证 catch 块中使用 instanceof 区分不同的 Error 子类型，分别处理 RangeError 和 TypeError。 |
| STMT_08_15_1_011_RUNTIME_rethrow | runtime | 验证 catch 块内重新抛出 Error 对象后，外层 catch 正确捕获并处理该错误。 |
| STMT_08_15_1_012_RUNTIME_error_translation | runtime | 验证 catch 块捕获错误后抛出不同类型的错误（错误转换），外层 catch 能正确捕获转换后的新版错误。 |
| STMT_08_15_1_013_RUNTIME_multiple_instanceof_subclasses | runtime | catch块内对多个Error子类做instanceof类型判断的运行时验证 |
| STMT_08_15_1_014_RUNTIME_catch_return_value | runtime | 验证 catch 块根据 instanceof 类型收窄返回不同的值，函数调用方能正确接收返回值。 |
| STMT_08_15_1_027_RUNTIME_CATCH_BLOCK_RUNS | runtime | 异常发生时 catch 块执行 |
| STMT_08_15_1_028_RUNTIME_CATCH_NO_ERROR | runtime | 无异常时 catch 块不执行 |
| STMT_08_15_1_029_RUNTIME_CATCH_ERROR_PROPAGATION | runtime | 内层 catch 未捕获的错误向外传播 |
| STMT_08_15_1_030_RUNTIME_CATCH_IN_LOOP | runtime | 循环中每次 catch 独立处理异常 |

### §8.15.2 finally Clause（12P + 8F + 10R）

| 用例 ID | 分类 | 测试内容 |
|---------|------|---------|
| STMT_08_15_2_001_PASS_basic_finally | compile-pass | 测试基本的try-catch-finally结构：try块正常执行，catch块不触发，finally块在try之后执行。验证finally子句在正常完成时能够 |
| STMT_08_15_2_002_PASS_finally_after_catch | compile-pass | 测试在try块抛出异常后，catch块捕获异常并处理，finally块在catch之后仍然执行。验证catch块存在时finally子句仍能正确编译。 |
| STMT_08_15_2_003_PASS_finally_after_return | compile-pass | 测试try块中包含return语句时，finally块在return之前执行。验证finally子句的语义优先级：即使有return流程，finally仍会在方 |
| STMT_08_15_2_004_PASS_finally_no_catch | compile-pass | 测试没有catch块、仅有try-finally的结构。try块正常执行后，finally块执行。验证try-finally（无catch）语法在编译器中正确识 |
| STMT_08_15_2_005_PASS_finally_nested | compile-pass | 测试嵌套的try-catch-finally结构：外层try中包含内层try-catch-finally，内层finally执行后外层finally仍执行。验证 |
| STMT_08_15_2_012_PASS_finally_throw_inside | compile-pass | 测试finally块内部抛出异常：语句finally子句可在finally块中使用throw语句。验证finally块中的throw是合法的语法形式，可用于fi |
| STMT_08_15_2_013_PASS_finally_return_override | compile-pass | 测试finally块中包含return语句：当finally块中有return时，会覆盖try块或catch块中的return值。验证编译器允许finally块 |
| STMT_08_15_2_014_PASS_finally_loop_break_continue | compile-pass | 测试finally块在循环中与break和continue组合：验证finally子句在循环作用域中使用break/continue是合法的语法结构。final |
| STMT_08_15_2_019_PASS_FINALLY_RETURN | compile-pass | finally 块中的 return |
| STMT_08_15_2_020_PASS_FINALLY_NO_THROW | compile-pass | try-finally 无异常正常执行 |
| STMT_08_15_2_023_PASS_FINALLY_THROW | compile-pass | finally 中 throw 未捕获时传播 |
| STMT_08_15_2_027_PASS_FINALLY_RETURN | compile-pass | finally 中 return 会覆盖 try 中的 return |
| STMT_08_15_2_006_FAIL_finally_reserved_word | compile-fail | 在finally块中使用保留关键字"string"作为变量名，违反ArkTS关键字约束。验证编译器能检测finally作用域中的非法标识符。 |
| STMT_08_15_2_007_FAIL_finally_local_class | compile-fail | 在finally块中定义局部类，违反ArkTS无局部类的约束。验证编译器能检测finally作用域中的非法类定义。 |
| STMT_08_15_2_008_FAIL_finally_nested_func | compile-fail | 在finally块中定义嵌套函数，违反ArkTS无嵌套函数的约束。验证编译器能检测finally作用域中的非法函数定义。 |
| STMT_08_15_2_021_FAIL_FINALLY_WITHOUT_TRY | compile-fail | finally 在 try 外使用应产生编译错误 |
| STMT_08_15_2_022_FAIL_FINALLY_DUPLICATE | compile-fail | 同一 try 多个 finally 应产生编译错误 |
| STMT_08_15_2_024_FAIL_FINALLY_MISSING_BLOCK | compile-fail | finally 缺少块体应产生编译错误 |
| STMT_08_15_2_025_FAIL_FINALLY_BEFORE_CATCH | compile-fail | finally 在 catch 之前应产生编译错误 |
| STMT_08_15_2_026_FAIL_FINALLY_INVALID_SYNTAX | compile-fail | finally 语法错误（缺 try）应产生编译错误 |
| STMT_08_15_2_009_RUNTIME_finally_executes | runtime | 运行时验证finally子句始终执行：分别在try正常完成和异常完成两种场景下检查finally块是否被执行。使用boolean标记验证finally代码路径确 |
| STMT_08_15_2_010_RUNTIME_finally_with_return | runtime | 运行时验证当try或catch块中包含return语句时，finally子句仍在方法返回之前执行。通过设计辅助函数使用flag标记检测finally的执行时机。 |
| STMT_08_15_2_011_RUNTIME_finally_with_error | runtime | 运行时验证当catch块中抛出新错误时，finally子句仍在该新错误传播之前执行。使用标志变量记录finally执行，确保异常路径下finally的语义正确。 |
| STMT_08_15_2_015_RUNTIME_finally_throw_inside | runtime | 运行时验证finally块中抛出异常时的行为：当finally块中执行throw时，新异常会覆盖try/catch中的原异常（无论是正常完成还是catch中抛出 |
| STMT_08_15_2_016_RUNTIME_finally_return_override | runtime | 运行时验证finally块中的return覆盖try或catch中的return值：当finally包含return语句时，该return值成为最终的返回值，覆 |
| STMT_08_15_2_017_RUNTIME_finally_loop_break | runtime | 运行时验证循环内finally子句在break时的执行：finally块在break将控制权转移出循环之前保证执行。通过计数器追踪finally执行次数和bre |
| STMT_08_15_2_018_RUNTIME_finally_loop_continue | runtime | 运行时验证循环内finally子句在continue时的执行：finally块在continue将控制权转移到下一次迭代之前保证执行。通过计数器验证每次迭代的f |
| STMT_08_15_2_028_RUNTIME_FINALLY_ALWAYS_RUNS | runtime | finally 在异常时仍然运行 |
| STMT_08_15_2_029_RUNTIME_FINALLY_NO_EXCEPTION | runtime | finally 在无异常时运行 |
| STMT_08_15_2_030_RUNTIME_FINALLY_RETURN_VALUE | runtime | finally 中的 return 覆盖 try return |

### §8.15.3 try Execution（12P + 8F + 10R）

| 用例 ID | 分类 | 测试内容 |
|---------|------|---------|
| STMT_08_15_3_001_PASS_try_block_normal_completion | compile-pass | 验证规则1：try 块正常完成时整个 try 语句正常完成。try-finally 结构中 try 块不抛出异常，catch 不存在。 |
| STMT_08_15_3_002_PASS_try_catch_error_handled | compile-pass | 验证规则2：try 块抛出异常 x，catch 子句被执行，catch 体正常完成，整个 try 语句正常完成。 |
| STMT_08_15_3_003_PASS_error_propagated_no_catch | compile-pass | 验证规则3：try 块抛出异常但没有 catch 子句时，异常传播到外围作用域。try-finally 结构编译通过。 |
| STMT_08_15_3_004_PASS_finally_abrupt_completion | compile-pass | 验证规则4：finally 子句执行时异常完成，导致整个 try 语句异常完成。catch 已处理原始异常，但 finally 抛出新异常。 |
| STMT_08_15_3_016_PASS_TRY_NORMAL_FLOW | compile-pass | try 正常完成流程 |
| STMT_08_15_3_017_PASS_TRY_CATCH_NORMAL | compile-pass | try-catch 正常完成 |
| STMT_08_15_3_018_PASS_TRY_PROPAGATION | compile-pass | try 中异常向外层传播 |
| STMT_08_15_3_019_PASS_TRY_FINALLY_NORMAL | compile-pass | try-finally 正常执行流程 |
| STMT_08_15_3_020_PASS_TRY_CATCH_RECOVER | compile-pass | try-catch 后程序正常恢复 |
| STMT_08_15_3_021_PASS_TRY_NESTED_FINALLY | compile-pass | 嵌套 try 各自 finally 执行 |
| STMT_08_15_3_022_PASS_TRY_ABRUPT | compile-pass | try 块异常无 handler 传播 |
| STMT_08_15_3_023_PASS_FINALLY_ABRUPT | compile-pass | finally 异常完成导致 try 语句异常完成 |
| STMT_08_15_3_005_FAIL_try_no_catch_no_finally | compile-fail | 验证 try 块既没有 catch 子句也没有 finally 子句时产生编译错误。规范要求 try 语句必须至少包含 catch 或 finally。 |
| STMT_08_15_3_006_FAIL_try_catch_local_class | compile-fail | 验证在 catch 块内定义局部类导致编译错误。ArkTS 禁止局部类定义。 |
| STMT_08_15_3_007_FAIL_try_finally_nested_function | compile-fail | 验证在 finally 块内定义嵌套函数导致编译错误。ArkTS 禁止嵌套函数定义。 |
| STMT_08_15_3_024_FAIL_TRY_CATCH_BLOCK_SCOPE | compile-fail | try 块内变量在 catch 中不可访问 |
| STMT_08_15_3_025_FAIL_CATCH_BLOCK_VAR_ESCAPE | compile-fail | catch 块变量逃逸应产生编译错误 |
| STMT_08_15_3_026_FAIL_TRY_WITHOUT_BLOCK | compile-fail | try 无块体应产生编译错误 |
| STMT_08_15_3_027_FAIL_FINALLY_WITHOUT_BLOCK | compile-fail | finally 无块体应产生编译错误 |
| STMT_08_15_3_028_FAIL_TRY_AFTER_FINALLY | compile-fail | try-finally 后不能有 catch |
| STMT_08_15_3_008_RUNTIME_try_normal_completion | runtime | 验证规则1：try 块正常完成（无异常抛出）时 catch 子句不执行，整个 try 语句正常完成。 |
| STMT_08_15_3_009_RUNTIME_try_catch_normal_completion | runtime | 验证规则2：try 块抛出异常 x，catch 子句捕获并执行，catch 体正常完成，整个 try 语句正常完成。 |
| STMT_08_15_3_010_RUNTIME_error_propagated_and_finally_abrupt | runtime | 验证规则3和规则4：规则3—无 catch 子句时异常传播到调用者作用域；规则4—finally 子句异常完成时整个 try 异常完成。 |
| STMT_08_15_3_011_RUNTIME_error_propagation_two_levels_no_catch | runtime | 验证规则5扩展：无 catch 子句时异常通过两层调用链传播。C 层 try-finally 抛出异常（无 catch），传播经 B 层（无 try-catch |
| STMT_08_15_3_012_RUNTIME_error_propagation_three_levels_no_catch | runtime | 验证规则5扩展：无 catch 子句时异常通过三层调用链传播。D 层 try-finally 抛出异常（无 catch），穿过 C、B 两层（均无 try-ca |
| STMT_08_15_3_013_RUNTIME_finally_abrupt_overrides_catch_normal_v2 | runtime | 验证规则6：finally 子句异常完成导致整个 try 语句异常完成，覆盖 catch 子句的正常完成。本测试在 try-catch-finally 中验证  |
| STMT_08_15_3_014_RUNTIME_catch_body_abrupt_completion | runtime | 验证规则2扩展：catch 子句体自身异常完成（抛出异常）时，整个 try 语句异常完成。catch 中抛出的新异常取代原始异常向外传播。 |
| STMT_08_15_3_015_RUNTIME_try_normal_finally_abrupt | runtime | 验证规则6扩展：try 块正常完成（无异常抛出），finally 子句异常完成（抛出异常），导致整个 try 语句异常完成。catch 子句不存在或被跳过。 |
| STMT_08_15_3_029_RUNTIME_ABRUPT_TRY_PROPAGATION | runtime | 异常完成 try 向外部传播 |
| STMT_08_15_3_030_RUNTIME_TRY_ABRUPT_NO_CATCH | runtime | try-finally 无 catch 异常向外传播 |

### §8.15 try Statements（10P + 10F + 10R）

| 用例 ID | 分类 | 测试内容 |
|---------|------|---------|
| STMT_08_15_001_PASS_try_catch | compile-pass | 验证基本的 try-catch 结构编译通过 |
| STMT_08_15_002_PASS_try_finally | compile-pass | 验证基本的 try-finally 结构编译通过 |
| STMT_08_15_003_PASS_try_catch_finally | compile-pass | 验证完整的 try-catch-finally 结构编译通过 |
| STMT_08_15_004_PASS_try_nested | compile-pass | 验证嵌套 try 语句结构编译通过 |
| STMT_08_15_005_PASS_try_catch_return | compile-pass | 验证 try-catch 中包含 return 语句编译通过 |
| STMT_08_15_006_PASS_try_in_if_statement | compile-pass | 验证 try-catch 语句可以放在 if 语句体内，与其余控制流结构组合 |
| STMT_08_15_017_PASS_try_finally_only | compile-pass | 验证仅含 finally 子句（无 catch）的 try 语句编译通过 |
| STMT_08_15_023_PASS_TRY_FINALLY | compile-pass | try-finally 无 catch |
| STMT_08_15_024_PASS_TRY_CATCH_FINALLY | compile-pass | try-catch-finally 完整结构 |
| STMT_08_15_025_PASS_TRY_NESTED | compile-pass | 嵌套 try 语句 |
| STMT_08_15_006_FAIL_try_no_catch_no_finally | compile-fail | 验证 try 块没有 catch 也没有 finally 时产生编译错误 |
| STMT_08_15_007_FAIL_try_catch_local_class | compile-fail | 验证 try 块内定义局部类产生编译错误 |
| STMT_08_15_008_FAIL_try_finally_local_type_alias | compile-fail | 验证 finally 块内定义局部类型别名产生编译错误 |
| STMT_08_15_009_FAIL_try_catch_nested_function | compile-fail | 验证 catch 块内定义嵌套函数产生编译错误 |
| STMT_08_15_010_FAIL_catch_variable_out_of_scope | compile-fail | 验证 catch 子句中的 error 标识符在 catch 块外部不可访问，产生编译错误 |
| STMT_08_15_018_FAIL_catch_identifier_outside_block | compile-fail | 验证 catch(e) 中的标识符 e 在 catch 块外部赋值和使用均产生编译错误 |
| STMT_08_15_026_FAIL_TRY_NO_CATCH_NO_FINALLY | compile-fail | try 无 catch 无 finally 应产生编译错误 |
| STMT_08_15_027_FAIL_TRY_EMPTY | compile-fail | try 语句缺少 catch 和 finally 应产生编译错误 |
| STMT_08_15_028_FAIL_CATCH_WITH_TYPE_ANNOTATION | compile-fail | catch (e: Error) 类型标注已弃用应产生编译错误 |
| STMT_08_15_029_FAIL_CATCH_MISSING_BLOCK | compile-fail | catch 缺少块体应产生编译错误 |
| STMT_08_15_010_RUNTIME_try_catch_no_error | runtime | 验证 try 块未抛出异常时 catch 子句不执行 |
| STMT_08_15_011_RUNTIME_try_catch_error | runtime | 验证 try 块抛出异常时 catch 子句捕获并处理 |
| STMT_08_15_012_RUNTIME_try_finally_always | runtime | 验证 finally 子句始终执行（无论是否抛出异常） |
| STMT_08_15_013_RUNTIME_try_finally_error_propagation | runtime | 验证 try-finally（无 catch）中抛出错误时 finally 执行且错误向上传播 |
| STMT_08_15_014_RUNTIME_try_finally_normal | runtime | 验证 try-finally（无 catch）正常完成时 finally 子句始终执行 |
| STMT_08_15_015_RUNTIME_try_catch_only_sequential | runtime | 验证 try-catch-only（无 finally）在连续多个 try-catch 中的行为 |
| STMT_08_15_016_RUNTIME_try_catch_finally_error | runtime | 验证 try-catch-finally 中抛出错误时三个块均正确执行 |
| STMT_08_15_019_RUNTIME_try_normal_completion_after | runtime | 验证 try-catch-finally 正常完成（无异常）后 try 语句之后的代码正常执行 |
| STMT_08_15_020_RUNTIME_try_nested_inner_catch | runtime | 验证嵌套 try-catch 中内层 catch 捕获异常后外层 catch 不执行 |
| STMT_08_15_030_RUNTIME_TRY_FINALLY_ALWAYS | runtime | finally 在异常发生时仍然执行 |

### §8.1 Normal/Abrupt Execution（12P + 8F + 10R）

| 用例 ID | 分类 | 测试内容 |
|---------|------|---------|
| STMT_08_01_001_PASS_normal_completion | compile-pass | 验证各类语句正常完成的编译通过：赋值语句、表达式语句、块语句、if语句、for循环等均正常完成 |
| STMT_08_01_002_PASS_abrupt_in_try_catch | compile-pass | 验证 try-catch 结构处理异常完成的编译通过：throw语句在try块中产生异常完成，被catch捕获 |
| STMT_08_01_003_PASS_break_continue_return | compile-pass | 验证 break/continue/return 跳转语句的正常完成语义——跳转语句本身以正常完成执行 |
| STMT_08_01_004_PASS_nested_control_flow | compile-pass | 验证嵌套控制流结构中正常完成与异常完成的混合使用：循环嵌套try-catch，循环嵌套条件判断 |
| STMT_08_01_012_PASS_multiple_abrupt_sources | compile-pass | 验证同一函数体内存在多种异常完成源（return、throw、break、continue）共存时编译通过 |
| STMT_08_01_013_PASS_return_abrupt_nested | compile-pass | 验证 return 语句在嵌套控制流结构（if-else内、循环内、try块内、嵌套if内）中触发异常完成的编译通过 |
| STMT_08_01_015_PASS_NORMAL_COMPLETION | compile-pass | 正常完成的语句执行（赋值语句正常完成） |
| STMT_08_01_016_PASS_DISCARDED_RESULT | compile-pass | 表达式语句的结果被丢弃 |
| STMT_08_01_017_PASS_MULTIPLE_EXPR_STMTS | compile-pass | 多个表达式语句顺序执行 |
| STMT_08_01_018_PASS_CONDITIONAL_STMT_SEQUENCE | compile-pass | 条件语句序列正常执行 |
| STMT_08_01_023_PASS_THROW_IN_FUNC | compile-pass | throw 语句导致异常完成 |
| STMT_08_01_024_PASS_DIV_ZERO_ABRUPT | compile-pass | 除零导致异常完成 |
| STMT_08_01_005_FAIL_throw_non_error | compile-fail | 验证抛出非 Error 类型的值导致编译错误：throw 语句异常完成时只能抛出 Error 或其子类 |
| STMT_08_01_006_FAIL_break_outside_loop | compile-fail | 验证 break 语句在循环或switch外部使用导致编译错误：break 的异常完成语义要求在循环/switch作用域内 |
| STMT_08_01_007_FAIL_continue_outside_loop | compile-fail | 验证 continue 语句在循环外部使用导致编译错误：continue 的跳转语义要求在循环作用域内 |
| STMT_08_01_019_FAIL_STMT_OUTSIDE_FUNC | compile-fail | 在函数外部使用 return 语句应产生编译错误 |
| STMT_08_01_020_FAIL_BREAK_OUTSIDE_LOOP | compile-fail | 在循环外部使用 break 语句应产生编译错误 |
| STMT_08_01_021_FAIL_CONTINUE_OUTSIDE_LOOP | compile-fail | 在循环外部使用 continue 语句应产生编译错误 |
| STMT_08_01_022_FAIL_VOID_IN_ASSIGNMENT | compile-fail | void 函数返回值不能用于赋值 |
| STMT_08_01_025_FAIL_INVALID_EXPR_STMT | compile-fail | 无效表达式语句 |
| STMT_08_01_008_RUNTIME_normal_completion_flow | runtime | 验证正常完成的语句按预期顺序执行并产生正确结果 |
| STMT_08_01_009_RUNTIME_abrupt_completion_try_catch | runtime | 验证 throw 语句产生异常完成，try-catch 捕获异常完成之后执行流恢复正常完成 |
| STMT_08_01_010_RUNTIME_return_abrupt_completion | runtime | 验证 return 语句触发异常完成 (abrupt completion)：函数内 return 之后的代码不执行，调用方获得正常控制权 |
| STMT_08_01_011_RUNTIME_finally_always_executes | runtime | 验证 finally 块在异常完成后始终执行：throw 后执行、catch 中再次 throw 后仍执行、try 正常完成后也执行 |
| STMT_08_01_014_RUNTIME_multiple_abrupt_paths | runtime | 验证同一函数体内存在多条可能的异常完成路径时，运行时实际命中的路径产生正确的异常完成行为 |
| STMT_08_01_026_RUNTIME_NORMAL_FLOW | runtime | 正常执行流程验证 |
| STMT_08_01_027_RUNTIME_DISCARDED_EXPR | runtime | 表达式语句结果丢弃不影响变量值 |
| STMT_08_01_028_RUNTIME_STMT_ORDER | runtime | 语句执行顺序验证 |
| STMT_08_01_029_RUNTIME_COND_EXECUTION | runtime | 条件语句中只有匹配分支执行 |
| STMT_08_01_030_RUNTIME_ABRUPT_ABORT | runtime | 异常完成中止后续语句 |

### §8.2 Expression Statements（12P + 8F + 10R）

| 用例 ID | 分类 | 测试内容 |
|---------|------|---------|
| STMT_08_02_001_PASS_assignment_expression | compile-pass | 测试赋值表达式作为语句，包括简单赋值、链式赋值、条件赋值和解构赋值 |
| STMT_08_02_002_PASS_increment_decrement | compile-pass | 测试自增自减表达式作为语句，包括前缀和后缀形式 |
| STMT_08_02_003_PASS_function_call | compile-pass | 测试函数调用表达式作为语句，包括无参函数、带参函数和方法调用 |
| STMT_08_02_004_PASS_compound_assignment | compile-pass | 测试复合赋值表达式作为语句，包括算术和位运算复合赋值 |
| STMT_08_02_005_PASS_expression_sequence | compile-pass | 测试多种表达式语句组合和连续使用 |
| STMT_08_02_012_PASS_constructor_call | compile-pass | 测试构造函数调用(new)作为表达式语句，返回值被丢弃 |
| STMT_08_02_013_PASS_property_access_chain | compile-pass | 测试属性访问和方法链式调用作为表达式语句，返回值被丢弃 |
| STMT_08_02_014_PASS_literal_expression | compile-pass | 测试数组字面量和各类字面量作为表达式语句，值被丢弃 |
| STMT_08_02_018_PASS_ARITH_EXPR_STMT | compile-pass | 算术表达式作为语句 |
| STMT_08_02_019_PASS_CALL_EXPR_STMT | compile-pass | 函数调用作为表达式语句 |
| STMT_08_02_020_PASS_AUTO_SEMI | compile-pass | 表达式语句缺少分号时由编译器自动补全，编译通过 |
| STMT_08_02_025_PASS_STRING_CONCAT | compile-pass | string + int 为合法字符串拼接表达式，作为语句结果丢弃，编译通过 |
| STMT_08_02_006_FAIL_delete_operator | compile-fail | 测试delete运算符在表达式语句中不被支持，应产生编译错误 |
| STMT_08_02_007_FAIL_super_illegal | compile-fail | 测试super关键字在非法上下文中作为表达式语句应编译失败 |
| STMT_08_02_008_FAIL_undefined_variable | compile-fail | 测试访问未定义变量的表达式作为语句应编译失败 |
| STMT_08_02_017_FAIL_comma_expression_outside_for | compile-fail | 运行时验证逗号表达式作为语句时从左到右求值，最终结果被丢弃 |
| STMT_08_02_021_FAIL_TYPE_MISMATCH_STMT | compile-fail | 类型不匹配的赋值表达式语句应产生编译错误 |
| STMT_08_02_022_FAIL_CALL_NONEXISTENT | compile-fail | 调用不存在的函数应产生编译错误 |
| STMT_08_02_023_FAIL_EXPR_STMT_FIELD_ON_VOID | compile-fail | 对 void 函数返回值访问字段应产生编译错误 |
| STMT_08_02_024_FAIL_NESTED_CALL_INVALID_ARGS | compile-fail | 函数调用参数类型不匹配应产生编译错误 |
| STMT_08_02_009_RUNTIME_assignment | runtime | 验证赋值表达式作为语句时的副作用，值被正确写入变量且表达式结果被丢弃不影响后续执行 |
| STMT_08_02_010_RUNTIME_increment | runtime | 验证自增自减表达式作为语句时的副作用，变量值正确变化 |
| STMT_08_02_011_RUNTIME_call | runtime | 验证函数调用表达式作为语句时的副作用，全局状态被正确修改 |
| STMT_08_02_015_RUNTIME_constructor_call | runtime | 运行时验证new表达式作为语句时构造函数副作用正确执行，返回值被丢弃 |
| STMT_08_02_016_RUNTIME_property_chain | runtime | 运行时验证属性访问和方法链式调用作为表达式语句的副作用，返回值被丢弃 |
| STMT_08_02_026_RUNTIME_EXPR_STMT_SIDE_EFFECT | runtime | 表达式语句副作用验证 |
| STMT_08_02_027_RUNTIME_CHAINED_EXPR_STMT | runtime | 链式表达式语句执行 |
| STMT_08_02_028_RUNTIME_DISCARDED_CALL_RESULT | runtime | 丢弃函数调用返回值 |
| STMT_08_02_029_RUNTIME_AUTO_SEMI_INSERTION | runtime | 自动分号插入 |
| STMT_08_02_030_RUNTIME_COMPOUND_EXPR_STMT | runtime | 复合赋值作为表达式语句 |

### §8.3 Block（10P + 10F + 10R）

| 用例 ID | 分类 | 测试内容 |
|---------|------|---------|
| STMT_08_03_001_PASS_basic_block | compile-pass | 基本块语句，多个语句在块中按文本顺序执行：赋值、表达式、变量声明、函数调用、控制流 |
| STMT_08_03_002_PASS_nested_blocks | compile-pass | 嵌套块语句：块中嵌套块，多层嵌套，不同作用域级别 |
| STMT_08_03_003_PASS_void_function_body | compile-pass | void 函数体作为块，不包含 return 语句（隐式返回），以及包含 return; 无返回值 |
| STMT_08_03_004_PASS_block_type_declarations | compile-pass | 块内变量遮蔽（shadowing）— 内层块声明与外层同名的 let 变量，块结束后外层变量恢复可见 |
| STMT_08_03_005_PASS_empty_block | compile-pass | 空块语句：完全空的块 {}，以及仅有注释的块，验证边界情况 |
| STMT_08_03_011_PASS_redeclare_var_after_block | compile-pass | 块内声明的 let 变量在块结束后不可见，外层作用域可以声明同名变量，验证块作用域边界 |
| STMT_08_03_016_PASS_NESTED_BLOCKS | compile-pass | 嵌套块语句 |
| STMT_08_03_017_PASS_BLOCK_SCOPE_SHADOW | compile-pass | 块作用域变量遮蔽 |
| STMT_08_03_018_PASS_EMPTY_BLOCK | compile-pass | 空块语句 |
| STMT_08_03_019_PASS_BLOCK_AFTER_IF | compile-pass | if 语句后的块 |
| STMT_08_03_006_FAIL_nested_function_in_block | compile-fail | 块内声明嵌套函数应编译失败（ArkTS 不允许嵌套函数） |
| STMT_08_03_007_FAIL_local_class_in_block | compile-fail | 块内声明局部类应编译失败（ArkTS 不允许块级类声明） |
| STMT_08_03_008_FAIL_local_type_alias_in_block | compile-fail | 块内声明局部类型别名应编译失败（ArkTS 不允许块级 type alias） |
| STMT_08_03_012_FAIL_access_block_var_outside | compile-fail | 块内声明的 let 变量作用域限定在块内，块外访问该变量应产生编译错误 |
| STMT_08_03_020_FAIL_DUPLICATE_IN_BLOCK | compile-fail | 块内重复声明同名变量应产生编译错误 |
| STMT_08_03_021_FAIL_BLOCK_VAR_ESCAPE | compile-fail | 块内变量逃逸到外部应产生编译错误 |
| STMT_08_03_022_FAIL_UNBALANCED_BRACES | compile-fail | 不匹配的大括号应产生编译错误 |
| STMT_08_03_023_FAIL_BLOCK_AS_EXPR | compile-fail | 块不能作为表达式使用应产生编译错误 |
| STMT_08_03_024_FAIL_IF_WITHOUT_BLOCK_TYPE_IN_BLOCK | compile-fail | 块内 type declaration 被拒绝 |
| STMT_08_03_025_FAIL_INTERFACE_IN_BLOCK | compile-fail | 块内 interface 声明被拒绝 |
| STMT_08_03_009_RUNTIME_block_execution_order | runtime | 验证块中语句按文本顺序执行，变量值随顺序逐步变更 |
| STMT_08_03_010_RUNTIME_block_throw_error | runtime | 验证块中执行到 throw 错误时停止执行，后续语句不执行 |
| STMT_08_03_013_RUNTIME_multi_level_shadowing | runtime | 验证跨 4 层级嵌套块的变量遮蔽与恢复：每层声明同名变量，退出后外层变量恢复为进入前的值 |
| STMT_08_03_014_RUNTIME_throw_exit_nested_block | runtime | 验证 throw 从嵌套块中间位置退出：后续语句不执行，控制权转移到外层 catch |
| STMT_08_03_015_RUNTIME_return_from_nested_block | runtime | 验证 void 函数中嵌套块内的 return 语句提前退出整个函数：return 之后的语句均不执行 |
| STMT_08_03_026_RUNTIME_BLOCK_SEQUENTIAL | runtime | 块语句顺序执行验证 |
| STMT_08_03_027_RUNTIME_BLOCK_SCOPE_CLEANUP | runtime | 块作用域变量离开块后不可访问 |
| STMT_08_03_028_RUNTIME_BLOCK_IN_LOOP | runtime | 循环中的块创建新作用域每次迭代 |
| STMT_08_03_029_RUNTIME_BLOCK_RETURN_FROM_BLOCK | runtime | 从块中 return 返回函数 |
| STMT_08_03_030_RUNTIME_BLOCK_WITH_IF_ELSE | runtime | if-else 与块作用域组合 |

### §8.4 Constant/Variable Declarations（10P + 10F + 10R）

| 用例 ID | 分类 | 测试内容 |
|---------|------|---------|
| STMT_08_04_001_PASS_basic_let | compile-pass | 测试let基本声明功能：使用let声明变量，验证类型推断和基本赋值 |
| STMT_08_04_002_PASS_basic_const | compile-pass | 测试const基本声明功能：使用const声明常量，验证不可变性 |
| STMT_08_04_003_PASS_shadowing_in_block | compile-pass | 测试块作用域中变量遮蔽：外层let和内层const同名变量合法 |
| STMT_08_04_004_PASS_let_type_annotation | compile-pass | 测试let带显式类型注解的声明 |
| STMT_08_04_005_PASS_const_complex_types | compile-pass | 测试const与复杂类型：数组、联合类型、对象类型 |
| STMT_08_04_012_PASS_multi_level_shadowing | compile-pass | 测试函数作用域内多级块遮蔽：外层let被if块遮蔽，if块内let再被内层块遮蔽（规范允许任意声明遮蔽同作用域内同名声明） |
| STMT_08_04_013_PASS_loop_body_shadows_param | compile-pass | 测试for循环体内let声明与函数参数同名编译错误：参数和局部变量在同一作用域导致重复 |
| STMT_08_04_014_PASS_const_complex_initializer | compile-pass | 测试const复杂初始化表达式：算术运算、三元表达式、逻辑运算、字符串拼接、数组字面量和函数返回值的初始化 |
| STMT_08_04_017_PASS_let_without_initializer | compile-pass | let 声明仅带类型注解、无初始化器，编译通过 |
| STMT_08_04_018_PASS_let_union_type | compile-pass | 测试let带复杂联合类型注解的声明 |
| STMT_08_04_006_FAIL_param_local_conflict | compile-fail | 测试参数与局部变量同名编译错误 |
| STMT_08_04_007_FAIL_reassign_const | compile-fail | 测试const常量重新赋值编译错误 |
| STMT_08_04_008_FAIL_duplicate_let_same_scope | compile-fail | 测试同一作用域重复let声明同名变量编译错误 |
| STMT_08_04_011_FAIL_const_without_initializer | compile-fail | const 声明必须带初始化器 — STATEMENTS.md: constant declaration has initialization part |
| STMT_08_04_016_FAIL_duplicate_const_same_scope | compile-fail | 测试同一作用域重复const声明同名常量编译错误 |
| STMT_08_04_019_FAIL_const_top_level_no_init | compile-fail | const 在模块顶层声明缺少初始化器 — STATEMENTS.md: constant declaration has initialization par |
| STMT_08_04_020_FAIL_duplicate_let_block | compile-fail | 测试同一块作用域内（if/for/while等块体）重复let声明同名变量编译错误 |
| STMT_08_04_023_FAIL_const_array_reassign | compile-fail | const 数组引用不可重新赋值 — 区别于元素修改（元素修改是允许的） |
| STMT_08_04_024_FAIL_LET_DUPLICATE_SCOPE | compile-fail | 同一作用域重复 let 声明应产生编译错误 |
| STMT_08_04_025_FAIL_CONST_REASSIGN | compile-fail | const 变量重新赋值应产生编译错误 |
| STMT_08_04_009_RUNTIME_let_const_values | runtime | 验证let可赋值和const不可变性的运行时行为 |
| STMT_08_04_010_RUNTIME_block_scope_shadow | runtime | 验证块作用域遮蔽的运行时行为：内层声明遮蔽外层 |
| STMT_08_04_015_RUNTIME_multi_level_shadow | runtime | 运行时验证多级作用域遮蔽：外层let被if块内let遮蔽，if块内let再被内层块中const遮蔽，离开各级块后恢复外层值 |
| STMT_08_04_021_RUNTIME_const_not_reassignable | runtime | 验证 const 声明的常量在运行时保持其初始值不变 |
| STMT_08_04_022_RUNTIME_const_array_element_mutation | runtime | const 声明数组时引用不可变但元素可修改 — 与 TS/JS 语义一致 |
| STMT_08_04_026_RUNTIME_LET_MUTATION | runtime | let 变量可变性验证 |
| STMT_08_04_027_RUNTIME_CONST_IMMUTABLE | runtime | const 变量不可变性验证 |
| STMT_08_04_028_RUNTIME_LET_TYPE_INFERENCE | runtime | let 类型推断验证 |
| STMT_08_04_029_RUNTIME_SHADOWING | runtime | 变量遮蔽运行时验证 |
| STMT_08_04_030_RUNTIME_ANNOTATION_LET | runtime | 注解使用在声明中 |

### §8.5 if Statements（22P + 4F + 10R）

| 用例 ID | 分类 | 测试内容 |
|---------|------|---------|
| STMT_08_05_001_PASS_BASIC_IF | compile-pass | 基本 if 语句，条件表达式使用 boolean 字面量和 boolean 变量 |
| STMT_08_05_002_PASS_IF_ELSE | compile-pass | if-else 语句的两个分支均通过编译，boolean 条件驱动分支选择 |
| STMT_08_05_003_PASS_NESTED_IF_ELSE | compile-pass | 嵌套 if-else 语句，验证 dangling else 绑定到最近 if 的语法 |
| STMT_08_05_004_PASS_BLOCK_SCOPE | compile-pass | if/else 块语句创建独立块级作用域，同名变量可在不同分支声明 |
| STMT_08_05_005_PASS_IF_WITHOUT_BLOCK | compile-pass | if/else 不带块语句（无 {}），只跟一条语句；不创建块级作用域 |
| STMT_08_05_006_PASS_NUMERIC_CONDITION_EXTENDED | compile-pass | if 条件表达式为 int 类型时当前版本因 Extended Conditional Expressions 允许编译通过（spec标注未来版本将废弃此特性） |
| STMT_08_05_007_PASS_STRING_CONDITION_EXTENDED | compile-pass | if 条件表达式为 string 类型时当前版本因 Extended Conditional Expressions 允许编译通过（spec标注未来版本将废弃此 |
| STMT_08_05_008_PASS_FLOAT_CONDITION_EXTENDED | compile-pass | if 条件表达式为 number（浮点）类型时当前版本因 Extended Conditional Expressions 允许编译通过（spec标注未来版本将 |
| STMT_08_05_011_PASS_char_condition_extended | compile-pass | char 类型作为 if 条件 — Extended Conditional Expressions 允许 char（c'\u0000' → false，其余  |
| STMT_08_05_012_PASS_complex_logical_operators | compile-pass | if 条件中使用复杂逻辑表达式 — && (逻辑与), || (逻辑或), ! (逻辑非) 运算符及其组合，括包与关系表达式混合 |
| STMT_08_05_013_PASS_bigint_condition_extended | compile-pass | bigint 类型作为 if 条件 — Extended Conditional Expressions 允许 bigint (0n → false，非 0 → |
| STMT_08_05_014_PASS_enum_condition_extended | compile-pass | enum 类型作为 if 条件 — Extended Conditional Expressions 允许 enum (底层数值为 0 的成员 → false， |
| STMT_08_05_015_PASS_null_undefined_condition_extended | compile-pass | null 和 undefined 类型作为 if 条件 — Extended Conditional Expressions 允许 null 和 undefin |
| STMT_08_05_016_PASS_bigint_condition_extended | compile-pass | bigint 类型作为 if 条件的 Extended Conditional 语义补充 — 覆盖 if 无 else 分支、if-else-if 链、no-b |
| STMT_08_05_017_PASS_enum_condition_extended | compile-pass | enum 类型作为 if 条件的 Extended Conditional 语义补充 — 覆盖 if 无 else 分支、if-else-if 链、no-blo |
| STMT_08_05_020_PASS_if_without_else | compile-pass | if 语句不带 else 分支 — STATEMENTS.md 允许单独的 if-then |
| STMT_08_05_027_PASS_IF_OBJECT_COND | compile-pass | Object 类型作为 if 条件，受 Extended Conditional Expressions 支持，当前编译通过 |
| STMT_08_05_028_PASS_IF_ARRAY_COND | compile-pass | 数组类型作为 if 条件，受 Extended Conditional Expressions 支持，当前编译通过 |
| STMT_08_05_029_PASS_IF_UNREACHABLE | compile-pass | 恒真条件后的 unreachable else 分支 |
| STMT_08_05_030_PASS_IF_VOID_COND | compile-pass | void(≡undefined)类型作为 if 条件，受 Extended Conditional Expressions 支持，当前编译通过 |
| STMT_08_05_031_PASS_IF_DANGLING | compile-pass | else 匹配最近 if — 验证歧义消除 |
| STMT_08_05_033_PASS_IF_NULL_COND | compile-pass | null 类型作为 if 条件，受 Extended Conditional Expressions 支持，当前编译通过 |
| STMT_08_05_009_FAIL_missing_parentheses | compile-fail | if 语句缺少括号应产生语法错误 — STATEMENTS.md 要求 'if' '(' expression ')' |
| STMT_08_05_010_FAIL_empty_condition | compile-fail | if 条件表达式不能为空 — STATEMENTS.md 要求 '(' expression ')' |
| STMT_08_05_032_FAIL_IF_CONDITION_NEVER | compile-fail | never 类型变量不能用于 if 条件 |
| STMT_08_05_034_FAIL_IF_ELSE_SCOPE_LEAK | compile-fail | if 分支声明的变量泄漏到外部应产生编译错误 |
| STMT_08_05_009_RUNTIME_IF_TRUE_FALSE | runtime | 运行时验证 boolean 条件为 true/false 时 if/else 分支正确执行 |
| STMT_08_05_010_RUNTIME_NESTED_IF_ELSE | runtime | 运行时验证嵌套 if-else 的多层分支选择正确性以及 else if 链式语义 |
| STMT_08_05_012_RUNTIME_char_condition_truthiness | runtime | 运行时验证 char 作为 if 条件的 truthiness — c'\u0000' 视为 false，非空字符视为 true |
| STMT_08_05_013_RUNTIME_complex_logical_operators | runtime | 运行时验证 if 条件中逻辑运算符 &&, ||, ! 的短路求值和真值表行为 |
| STMT_08_05_014_RUNTIME_extended_conditional_truthiness | runtime | 运行时验证 bigint, enum, null, undefined 作为 if 条件的 truthiness — Extended Conditional  |
| STMT_08_05_015_RUNTIME_block_scope_interaction | runtime | 运行时验证 non-block if 与 block if 的作用域差异，以及嵌套 if-else 的 dangling else 绑定 |
| STMT_08_05_018_RUNTIME_bigint_truthiness | runtime | 运行时验证 bigint 在 if 条件中的 truthiness — 0n 为 falsy，非 0n（正/负）为 truthy |
| STMT_08_05_019_RUNTIME_enum_truthiness | runtime | 运行时验证 enum 在 if 条件中的 truthiness — 底层为 0 的成员 → falsy，非 0 → truthy |
| STMT_08_05_035_RUNTIME_IF_ELSE_CHAIN | runtime | if-else if-else 链式判断 |
| STMT_08_05_036_RUNTIME_IF_NESTED | runtime | 嵌套 if 语句执行顺序 |

### §8.6 Loop Statements（10P + 10F + 10R）

| 用例 ID | 分类 | 测试内容 |
|---------|------|---------|
| STMT_08_06_001_PASS_BasicWhile | compile-pass | 基本while循环：条件为false时循环体不执行，true时正常迭代 |
| STMT_08_06_002_PASS_BasicDoWhile | compile-pass | 基本do-while循环：至少执行一次循环体，条件初始为false时仍执行一次 |
| STMT_08_06_003_PASS_BasicFor | compile-pass | 基本for循环：包含初始化、条件判断、更新表达式，支持多种写法 |
| STMT_08_06_004_PASS_BasicForOf | compile-pass | 基本for-of循环：遍历数组元素，正确处理每个元素 |
| STMT_08_06_005_PASS_LabeledLoopBreak | compile-pass | 带标签的for循环：在循环体内使用break label正确引用标签以提前终止外层循环 |
| STMT_08_06_013_PASS_MultipleNestedLabels | compile-pass | 嵌套循环各自带标签：for/while/do-while 三层嵌套，每层各有标签，break 和 continue 正确引用对应标签 |
| STMT_08_06_014_PASS_SameLabelNameDifferentLoops | compile-pass | 标签作用域隔离：两个顺序排列的非嵌套循环可使用相同标签名，各自独立作用域 |
| STMT_08_06_021_PASS_LABELED_FOR | compile-pass | 带 label 的 for 循环配合 break |
| STMT_08_06_022_PASS_LABELED_WHILE | compile-pass | 带 label 的 while 循环 |
| STMT_08_06_006_FAIL_LabelInLambdaContinue | compile-fail | 在标签循环体内使用lambda表达式，lambda中引用外层标签的continue语句 |
| STMT_08_06_007_FAIL_LabelInLambdaBreak | compile-fail | 在标签循环体内使用lambda表达式，lambda中引用外层标签的break语句 |
| STMT_08_06_008_FAIL_BreakToUndeclaredLabel | compile-fail | break语句引用一个未声明的标签标识符，应编译时报错 |
| STMT_08_06_012_FAIL_label_declared_not_used | compile-fail | spec §8.6 要求：loop label 声明后若未在 loopStatement 中被 break/continue 使用，应产生 compile-ti |
| STMT_08_06_015_PASS_LabeledDoWhileAndForOf | compile-pass | spec §8.6 允许 labeled do-while / for-of（(identifier ':')? 前缀适用于 while|do|for|forO |
| STMT_08_06_016_FAIL_LabelInLambdaDoWhile | compile-fail | 标签关联 do-while 循环，循环体内 lambda 表达式引用该标签的 break 语句 — 编译时错误 |
| STMT_08_06_017_FAIL_LabelInLambdaForOf | compile-fail | 标签关联 for-of 循环，循环体内 lambda 表达式引用该标签的 break/continue — 编译时错误 |
| STMT_08_06_018_FAIL_BreakToSiblingLabel | compile-fail | break/continue 引用非包围作用域（兄弟循环）的标签 — 编译时错误 |
| STMT_08_06_023_FAIL_LABEL_IN_LAMBDA | compile-fail | label 在 lambda 表达式中使用应产生编译错误 |
| STMT_08_06_024_FAIL_LABEL_CONTINUE_IN_LAMBDA | compile-fail | label continue 在 lambda 中使用应产生编译错误 |
| STMT_08_06_025_FAIL_BREAK_LABEL_NOT_FOUND | compile-fail | break 引用不存在的 label 应产生编译错误 |
| STMT_08_06_009_RUNTIME_WhileAndDoWhile | runtime | while和do-while循环运行时正确性验证 |
| STMT_08_06_010_RUNTIME_ForAndForOf | runtime | for和for-of循环运行时正确性验证 |
| STMT_08_06_011_RUNTIME_LabeledLoop | runtime | 带标签循环运行时正确性验证 |
| STMT_08_06_019_RUNTIME_MultipleNestedLabels | runtime | 多层嵌套标签循环运行时正确性验证：break 跳出指定外层循环，continue 跳到指定外层循环的下一次迭代 |
| STMT_08_06_020_RUNTIME_UnlabeledBreakContinue | runtime | 无标签 break/continue 在嵌套循环中的运行时行为：仅控制最内层循环，不影响外层 |
| STMT_08_06_026_RUNTIME_LABELED_LOOP_BREAK | runtime | 带 label 的循环 break 运行时验证 |
| STMT_08_06_027_RUNTIME_LABELED_CONTINUE | runtime | 带 label 的 continue 运行时验证 |
| STMT_08_06_028_RUNTIME_FOR_LOOP_LABEL | runtime | 简单 for 循环带 label |
| STMT_08_06_029_RUNTIME_DO_WHILE_LABEL | runtime | 带 label 的 do-while |
| STMT_08_06_030_RUNTIME_LABEL_NOT_USED | runtime | label 未使用 — es2panda 编译通过（STMT-G1 已知差异） |

### §8.7 while/do Statements（22P + 4F + 10R）

| 用例 ID | 分类 | 测试内容 |
|---------|------|---------|
| STMT_08_07_001_PASS_basic_while | compile-pass | 基本 while 循环，使用布尔变量作为条件，验证合法的 while 语句通过编译 |
| STMT_08_07_002_PASS_while_empty_body | compile-pass | while 循环使用空语句体(分号) 和 空块语句，验证空循环体合法 |
| STMT_08_07_003_PASS_basic_do_while | compile-pass | 基本 do-while 循环，条件使用布尔变量和比较表达式，验证合法的 do 语句通过编译 |
| STMT_08_07_004_PASS_do_while_empty_body | compile-pass | do-while 循环使用空块和空语句体，验证空循环体合法 |
| STMT_08_07_005_PASS_nested_loops | compile-pass | while 和 do-while 循环互相嵌套，验证多层嵌套合法 |
| STMT_08_07_006_PASS_while_condition_number_extended | compile-pass | while 条件使用数字字面量(非 boolean)，期望编译报错 |
| STMT_08_07_007_PASS_do_while_condition_string_extended | compile-pass | do-while 条件使用字符串字面量(非 boolean)，期望编译报错 |
| STMT_08_07_008_PASS_while_condition_non_bool_extended | compile-pass | while 条件使用 number 类型变量(非 boolean)，期望编译报错 |
| STMT_08_07_009_PASS_while_with_break_in_nested_if | compile-pass | while 循环内嵌套 if 语句中使用 break，验证 break 跳出 while 循环 — STATEMENTS.md §8.7 |
| STMT_08_07_010_PASS_do_while_with_continue | compile-pass | do-while 循环体中使用 continue 语句，验证 continue 跳转到条件检查 — STATEMENTS.md §8.7 |
| STMT_08_07_011_PASS_while_body_try_catch | compile-pass | while 循环体内包含 try-catch 语句，验证循环体可包含异常处理 — STATEMENTS.md §8.7 |
| STMT_08_07_012_PASS_do_while_body_try_catch | compile-pass | do-while 循环体内包含 try-catch 语句，验证 do 体可包含异常处理 — STATEMENTS.md §8.7 |
| STMT_08_07_013_PASS_while_complex_logical_condition | compile-pass | while 条件表达式使用复杂逻辑表达式 (&&, ||, !)，验证复合条件通过编译 — STATEMENTS.md §8.7 |
| STMT_08_07_014_PASS_while_condition_bigint_extended | compile-pass | while 条件使用 bigint 类型（Extended Conditional Expression），验证 bigint 作为条件通过编译 — STATE |
| STMT_08_07_015_PASS_while_condition_enum_extended | compile-pass | while 条件使用 enum 类型（Extended Conditional Expression），验证枚举值作为条件通过编译 — STATEMENTS.m |
| STMT_08_07_018_PASS_while_body_shadows_param | compile-pass | while 循环体内 let 声明遮蔽参数名 — 循环体创建独立的块作用域 |
| STMT_08_07_026_PASS_WHILE_OBJECT | compile-pass | Object 作为 while 条件，受 Extended Conditional Expressions 支持，当前编译通过 |
| STMT_08_07_027_PASS_WHILE_ARRAY | compile-pass | 数组作为 while 条件，受 Extended Conditional Expressions 支持，当前编译通过 |
| STMT_08_07_028_PASS_DO_OBJECT | compile-pass | Object 作为 do-while 条件，受 Extended Conditional Expressions 支持，当前编译通过 |
| STMT_08_07_029_PASS_WHILE_VOID | compile-pass | void(≡undefined)函数调用作为 while 条件，受 Extended Conditional Expressions 支持，当前编译通过 |
| STMT_08_07_030_PASS_WHILE_NULL | compile-pass | null 作为 while 条件，受 Extended Conditional Expressions 支持，当前编译通过 |
| STMT_08_07_031_PASS_DO_NULL | compile-pass | null 作为 do-while 条件，受 Extended Conditional Expressions 支持，当前编译通过 |
| STMT_08_07_009_FAIL_while_missing_parentheses | compile-fail | while 语句缺少括号应产生语法错误 — STATEMENTS.md 要求 'while' '(' expression ')' |
| STMT_08_07_010_FAIL_do_while_missing_while | compile-fail | do 语句不能缺少 while 关键字 — STATEMENTS.md 要求 'do' statement 'while' '(' expression ')' |
| STMT_08_07_032_FAIL_WHILE_NEVER_COND | compile-fail | never 类型作为 while 条件 |
| STMT_08_07_033_FAIL_DO_NEVER_COND | compile-fail | never 类型作为 do-while 条件 |
| STMT_08_07_009_RUNTIME_while_not_executed | runtime | while 条件初始为 false，验证循环体不被执行 — while 先判断条件再执行 |
| STMT_08_07_010_RUNTIME_do_while_executed_once | runtime | do-while 条件初始为 false，验证循环体至少执行一次 — do-while 先执行再判断 |
| STMT_08_07_011_RUNTIME_while_vs_do_while | runtime | 对比 while 和 do-while 在相同初始条件下的执行次数差异 |
| STMT_08_07_012_RUNTIME_do_while_continue_to_condition | runtime | do-while 体内 continue 跳转到条件检查，若条件为 false 则退出循环 — STATEMENTS.md §8.7 |
| STMT_08_07_013_RUNTIME_while_break_in_nested_if | runtime | while 内嵌套 if 使用 break 提前退出，验证 break 后循环不再执行且外部变量保留中间值 — STATEMENTS.md §8.7 |
| STMT_08_07_016_RUNTIME_do_while_break_at_least_once | runtime | do-while 体内 break 提前退出，验证循环体至少执行一次 — do-while 先执行再判断条件，break 在第一次迭代即退出 — STATEME |
| STMT_08_07_017_RUNTIME_while_zero_iterations | runtime | while 条件初始为 false，验证循环体执行 0 次 — while 先判断条件再执行，条件不满足则跳过整个循环体 — STATEMENTS.md §8. |
| STMT_08_07_034_RUNTIME_WHILE_ZERO_ITER | runtime | while 条件初始为 false 执行零次 |
| STMT_08_07_035_RUNTIME_DO_AT_LEAST_ONCE | runtime | do-while 至少执行一次 |
| STMT_08_07_036_RUNTIME_WHILE_COUNTDOWN | runtime | while 倒计时循环 |

### §8.8 for Statements（18P + 5F + 10R）

| 用例 ID | 分类 | 测试内容 |
|---------|------|---------|
| STMT_08_08_001_PASS_BASIC_FOR | compile-pass | 基础 for 循环，forInit 中声明新变量 i 并显式指定 int 类型 |
| STMT_08_08_002_PASS_FOR_TYPE_INFERENCE | compile-pass | forInit 类型推导，let i = 0 自动推导为 int |
| STMT_08_08_003_PASS_FOR_EXISTING_VAR | compile-pass | 使用已存在的变量作为循环索引，而非在 forInit 中声明新变量 |
| STMT_08_08_004_PASS_FOR_EMPTY_INIT | compile-pass | for 循环的 forInit 和 forUpdate 均为空，仅保留条件表达式 |
| STMT_08_08_005_PASS_FOR_EMPTY_CONTINUE | compile-pass | forContinue 表达式为空（无终止条件），循环靠内部 break 退出 |
| STMT_08_08_006_PASS_NON_BOOLEAN_CONDITION_EXTENDED | compile-pass | forContinue 表达式类型为非 boolean（int 类型），当前版本因 Extended Conditional Expressions 允许编译通 |
| STMT_08_08_009_PASS_for_empty_all_parts | compile-pass | for 循环的三个部分均可为空 — STATEMENTS.md: forInit/forContinue/forUpdate 均为可选 |
| STMT_08_08_012_PASS_for_init_expression_sequence | compile-pass | forInit 使用 expressionSequence（逗号表达式）初始化已存在的多个变量 — STATEMENTS.md: forInit 可以是 exp |
| STMT_08_08_013_PASS_for_update_expression_sequence | compile-pass | forUpdate 使用 expressionSequence（逗号表达式）更新多个变量 — STATEMENTS.md: forUpdate 是 expres |
| STMT_08_08_014_PASS_for_labeled_body | compile-pass | for 循环体使用 labeled statement，支持 break label 跳出外层循环 |
| STMT_08_08_015_PASS_for_init_var_accessible | compile-pass | forInit 声明的循环变量在 forContinue 表达式、forUpdate 表达式和循环体中均可访问 — STATEMENTS.md line 251 |
| STMT_08_08_016_PASS_for_empty_update | compile-pass | forUpdate 为空，循环变量在循环体内手动更新 — STATEMENTS.md: forUpdate? 是可选的 |
| STMT_08_08_018_PASS_for_labeled_break | compile-pass | for 循环使用 labeled break 提前退出循环体 — STATEMENTS.md §8.8, §8.10：break labelName 在带有标签 |
| STMT_08_08_023_PASS_FOR_OBJECT | compile-pass | Object 作为 for 条件，受 Extended Conditional Expressions 支持，当前编译通过 |
| STMT_08_08_024_PASS_FOR_ARRAY | compile-pass | 数组作为 for 条件，受 Extended Conditional Expressions 支持，当前编译通过 |
| STMT_08_08_025_PASS_FOR_VOID | compile-pass | void(≡undefined)作为 for 条件，受 Extended Conditional Expressions 支持，当前编译通过 |
| STMT_08_08_026_PASS_FOR_NULL | compile-pass | null 作为 for 条件，受 Extended Conditional Expressions 支持，当前编译通过 |
| STMT_08_08_028_PASS_FOR_MULTI_DECL | compile-pass | forInit 中声明多个不同类型变量，编译通过 |
| STMT_08_08_007_FAIL_VAR_OUT_OF_SCOPE | compile-fail | forInit 中声明的变量具有循环作用域，循环外不能访问 |
| STMT_08_08_010_FAIL_for_missing_semicolons | compile-fail | for 循环缺少分号应产生语法错误 — STATEMENTS.md: 'for' '(' forInit? ';' forContinue? ';' forUp |
| STMT_08_08_019_FAIL_forInit_var_outside_body | compile-fail | forInit 声明的变量作用域仅限于该 for 循环体、forContinue 和 forUpdate，循环结束后不可访问 — STATEMENTS.md l |
| STMT_08_08_027_FAIL_FOR_VAR_ESCAPE | compile-fail | for-init 变量在循环外使用应产生编译错误 |
| STMT_08_08_029_FAIL_FOR_WITHOUT_PARENS | compile-fail | for 语句缺少括号应产生编译错误 |
| STMT_08_08_008_RUNTIME_FOR_BASIC | runtime | 基础 for 循环运行时行为：遍历 i=0..4 求和，验证结果正确 |
| STMT_08_08_009_RUNTIME_FOR_EXISTING_VAR | runtime | 使用已存在变量作为循环索引，验证循环后索引变量值正确 |
| STMT_08_08_011_RUNTIME_for_empty_all_parts | runtime | 运行时验证 for(;;) 空所有部分的行为 — break 正确退出 |
| STMT_08_08_017_RUNTIME_for_expression_sequence | runtime | 运行时验证 forInit 和 forUpdate 中使用 expressionSequence 的正确执行行为和求值顺序 |
| STMT_08_08_020_RUNTIME_for_countdown | runtime | 运行时验证 for 循环递减计数（forUpdate 使用 i-- 自减表达式）的正确执行行为 |
| STMT_08_08_021_RUNTIME_for_complex_condition | runtime | for 循环中使用复杂条件（&&, ||）的运行时验证 |
| STMT_08_08_030_RUNTIME_FOR_INFINITE_BREAK | runtime | for 无限循环 + break 退出 |
| STMT_08_08_031_RUNTIME_FOR_NO_INIT | runtime | for 语句无初始化部分 |
| STMT_08_08_032_RUNTIME_FOR_NO_UPDATE | runtime | for 语句无更新部分 |
| STMT_08_08_033_RUNTIME_FOR_REUSE_VARIABLE | runtime | for 循环复用外部变量 |

### §8.9 for-of Statements（10P + 10F + 10R）

| 用例 ID | 分类 | 测试内容 |
|---------|------|---------|
| STMT_08_09_001_PASS_array_for_of | compile-pass | 使用for-of遍历Array<T>，验证变量类型正确推断为T |
| STMT_08_09_002_PASS_string_for_of | compile-pass | 使用for-of遍历string，验证变量类型正确推断为string |
| STMT_08_09_003_PASS_let_modifiable | compile-pass | 使用let声明forVariable，验证可在循环体内修改 |
| STMT_08_09_004_PASS_external_variable | compile-pass | 使用外部声明的变量作为forVariable，元素类型可赋值给变量类型 |
| STMT_08_09_005_PASS_FixedArray_for_of | compile-pass | 使用for-of遍历FixedArray<T>，验证变量类型正确推断为T |
| STMT_08_09_013_PASS_const_with_type_annotation | compile-pass | for-of使用const声明forVariable并附加显式类型注解，验证类型注解作为实验特性被接受 |
| STMT_08_09_014_PASS_let_with_type_annotation | compile-pass | for-of使用let声明forVariable并附加显式类型注解，验证let变量可在循环体内修改 |
| STMT_08_09_015_PASS_nested_for_of | compile-pass | 嵌套for-of循环，外层遍历Array<Array<int>>，内层遍历内层Array<int>，验证类型推断正确 |
| STMT_08_09_020_PASS_for_of_const_variable | compile-pass | 使用const声明forVariable（无类型注解），验证const变量不可在循环体内赋值且类型正确推断 |
| STMT_08_09_021_PASS_ResizableArray_for_of | compile-pass | 使用for-of遍历ResizableArray<T>（T[]语法），验证变量类型正确推断为T |
| STMT_08_09_006_FAIL_non_iterable | compile-fail | 对非可迭代类型int字面量使用for-of，应产生编译时错误 |
| STMT_08_09_007_FAIL_type_mismatch | compile-fail | 外部变量类型与迭代元素类型不匹配，应产生编译时错误 |
| STMT_08_09_008_FAIL_const_assignment | compile-fail | 对const声明的forVariable赋值，应产生编译时错误 |
| STMT_08_09_009_FAIL_non_iterable_class | compile-fail | 对未实现Iterable接口的自定义类实例使用for-of，应产生编译时错误 |
| STMT_08_09_019_FAIL_external_variable_array_type_mismatch | compile-fail | 外部声明变量类型int与迭代元素类型string不匹配（Array<string>迭代），应产生编译时错误 |
| STMT_08_09_023_FAIL_external_variable_wrong_type | compile-fail | 外部声明变量类型string与迭代元素类型int不匹配（Array<int>迭代），应产生编译时错误 |
| STMT_08_09_024_FAIL_FOR_OF_NON_ITERABLE_OBJECT | compile-fail | 非 iterable Object 作为 for-of 源应产生编译错误 |
| STMT_08_09_025_FAIL_FOR_OF_NON_ITERABLE_INT | compile-fail | int 类型非 iterable 作为 for-of 源应产生编译错误 |
| STMT_08_09_026_FAIL_FOR_OF_CONST_REASSIGN | compile-fail | for-of 中 const 变量重新赋值应产生编译错误 |
| STMT_08_09_027_FAIL_FOR_OF_WRONG_TYPE | compile-fail | for-of 外部变量类型不匹配应产生编译错误 |
| STMT_08_09_010_RUNTIME_array_iteration | runtime | 运行时验证Array<int>的for-of迭代结果正确 |
| STMT_08_09_011_RUNTIME_string_iteration | runtime | 运行时验证string的for-of迭代结果正确 |
| STMT_08_09_012_RUNTIME_external_variable | runtime | 运行时验证使用外部声明变量的for-of迭代结果正确 |
| STMT_08_09_016_RUNTIME_break_continue | runtime | 运行时验证for-of循环中break提前退出和continue跳过当前迭代的行为 |
| STMT_08_09_017_RUNTIME_FixedArray_iteration | runtime | 运行时验证for-of遍历FixedArray<T>，元素类型推断为T，迭代结果正确 |
| STMT_08_09_018_RUNTIME_array_mutation_during_iteration | runtime | for-of迭代时修改被迭代数组的元素值（非增删）不影响迭代次数 |
| STMT_08_09_022_RUNTIME_empty_array_for_of | runtime | 运行时验证for-of遍历空数组，循环体不执行（0次迭代） |
| STMT_08_09_028_RUNTIME_FOR_OF_FIXED_ARRAY | runtime | FixedArray for-of 迭代 |
| STMT_08_09_029_RUNTIME_FOR_OF_STRING_CHARS | runtime | 字符串 for-of 逐字符迭代 |
| STMT_08_09_030_RUNTIME_FOR_OF_LET_MUTABLE | runtime | for-of 中 let 变量可修改 |

---
## 已知 Spec 与实现差异

详见 [issue_report.md](issue_report.md)：C-8.06-01（label 未使用）、C-8.06-02（labeled do-while/for-of 编译器崩溃）、D-8.03-01（block 内 type declaration）、D-8.05-01（Extended Conditional）。

---
## 命名规范

| 元素 | 格式 |
|------|------|
| 前缀 | STMT_ |
| 编号 | 子章节内连续（001 起） |
| 分类 | PASS / FAIL / RUNTIME |
| 目录 | `<子章节>/compile-pass|compile-fail|runtime/` |
