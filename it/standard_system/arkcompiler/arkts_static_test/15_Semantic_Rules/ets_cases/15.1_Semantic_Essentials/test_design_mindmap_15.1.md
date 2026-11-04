# 15.1 Semantic Essentials - 测试设计思维导图

## 1. 测试范围
验证语义基础（15.1 整章的概述和入口）：
- 独立表达式（15.1.1）
- 赋值上下文（15.1.2）
- 变量初始化（15.1.3）
- 数值运算符（15.1.4）
- 字符串运算符（15.1.5）
- 其余上下文（15.1.6）
- 类型参数（15.1.7）
- 语义基础总结（15.1.8）

## 2. 测试用例设计
### 2.1 编号规划
| 编号前缀 | 含义 | 示例 |
|---------|------|------|
| SEM_15_01_001 ~ SEM_15_01_021 | compile-pass 用例 | 各类语义基础正向用例 |
| SEM_15_01_010 ~ SEM_15_01_022 | compile-fail 用例 | 各类语义基础反向用例 |
| SEM_15_01_023 | runtime 用例 | 语义基础运行时用例 |
| SEM_15_01_099 | compile-fail 用例 | 语义基础拒绝（占位） |
| SEM_15_01_100 | compile-pass 用例 | 语义基础（占位） |
| SEM_15_01_101 | runtime 用例 | 语义基础运行时（占位） |

### 2.2 文件命名规范
- 格式：`SEM_15_01_XXX_{DESCRIPTION}.ets`
- 示例：`SEM_15_01_00_001_PASS_standalone_int_literal.ets`

## 3. 测试点分解
### 3.1 独立表达式（15.1.1）
- 整数字面量类型推断
- 对象字面量作为独立表达式（应拒绝）

### 3.2 赋值上下文（15.1.2）
- 类型不匹配赋值拒绝
- 目标类型推断

### 3.3 变量初始化（15.1.3）
- 数组字面量目标类型
- 显式泛型类型

### 3.4 数值运算符（15.1.4）
- 字符串 + 整数
- 字符串 + 布尔值
- byte 递增
- short 复合赋值
- 整数除法结果

### 3.5 字符串运算符（15.1.5）
- 字符串 + nullish

### 3.6 其余上下文（15.1.6）
- 函数参数目标类型
- 调用参数目标类型

### 3.7 类型参数（15.1.7）
- 显式泛型数值
- 显式泛型 T 扩展 number

### 3.8 智能转换（15.1 相关）
- instanceof 缩小
- 全局变量基础成员未缩小

## 4. 覆盖情况
### 4.1 compile-pass 用例（16 个）
| 编号 | 用例文件 | 测试点 |
|------|---------|--------|
| SEM_15_01_001 | SEM_15_01_00_001_PASS_standalone_int_literal.ets | 整数字面量默认类型 |
| SEM_15_01_002 | SEM_15_01_00_002_PASS_target_double_literal.ets | 目标类型 double 字面量 |
| SEM_15_01_003 | SEM_15_01_00_003_PASS_array_literal_target_double.ets | 数组字面量目标 double |
| SEM_15_01_004 | SEM_15_01_00_004_PASS_function_arg_target_type.ets | 函数参数目标类型 |
| SEM_15_01_005 | SEM_15_01_00_005_PASS_string_plus_int.ets | 字符串 + 整数 |
| SEM_15_01_006 | SEM_15_01_00_006_PASS_string_plus_boolean.ets | 字符串 + 布尔值 |
| SEM_15_01_007 | SEM_15_01_00_007_PASS_byte_increment.ets | byte 递增 |
| SEM_15_01_008 | SEM_15_01_00_008_PASS_short_compound_assignment.ets | short 复合赋值 |
| SEM_15_01_009 | SEM_15_01_00_009_PASS_explicit_generic_number.ets | 显式泛型数值 |
| SEM_15_01_016 | SEM_15_01_00_010_PASS_standalone_numeric_array.ets | 独立数值数组 |
| SEM_15_01_017 | SEM_15_01_00_011_PASS_call_arg_target_double.ets | 调用参数目标 double |
| SEM_15_01_018 | SEM_15_01_00_012_PASS_int_division_result.ets | 整数除法结果 |
| SEM_15_01_019 | SEM_15_01_00_013_PASS_string_plus_nullish.ets | 字符串 + nullish |
| SEM_15_01_020 | SEM_15_01_00_014_PASS_explicit_T_number.ets | 显式 T 扩展 number |
| SEM_15_01_021 | SEM_15_01_00_015_PASS_SMART_FUNC_instanceof_narrowing.ets | instanceof 缩小 |
| SEM_15_01_100 | SEM_15_01_100.ets | 语义基础：类型注解变量声明 |

### 4.2 compile-fail 用例（8 个）
| 编号 | 用例文件 | 测试点 |
|------|---------|--------|
| SEM_15_01_010 | SEM_15_01_00_100_FAIL_standalone_object_literal.ets | 对象字面量作为独立表达式 |
| SEM_15_01_011 | SEM_15_01_00_101_FAIL_incompatible_assignment_like_rhs.ets | 不兼容赋值上下文 RHS |
| SEM_15_01_012 | SEM_15_01_00_102_FAIL_generic_target_no_extra_inference.ets | 泛型目标无额外推断 |
| SEM_15_01_013 | SEM_15_01_00_103_FAIL_string_minus_int.ets | 字符串 - 整数 |
| SEM_15_01_014 | SEM_15_01_00_104_FAIL_boolean_numeric_operator.ets | 布尔值数值运算符 |
| SEM_15_01_015 | SEM_15_01_00_105_FAIL_implicit_numeric_narrowing.ets | 隐式数值缩小 |
| SEM_15_01_022 | SEM_15_01_00_106_FAIL_SMART_GLOBAL_global_base_member_without_narrow.ets | 全局变量基础成员未缩小 |
| SEM_15_01_099 | SEM_15_01_099.ets | 语义基础拒绝 |

### 4.3 runtime 用例（2 个）
| 编号 | 用例文件 | 测试点 |
|------|---------|--------|
| SEM_15_01_023 | SEM_15_01_023_RT_SMART_GLOBAL_overload_declared_base_top_level.ets | 全局重载声明基础顶层 |
| SEM_15_01_101 | SEM_15_01_101.ets | 语义基础运行时 |


## 最新设计要点

从章节思维导图同步的最新测试设计点：

- normal cases
- edge cases
- error cases

## 5. 跨章节链接
- 15.1.1 ~ 15.1.8 子章节
- 4.6 Variable and Constant Declarations
- 15.4 Assignability
- 15.5 Type Inference
- 15.7 Generic Functions
