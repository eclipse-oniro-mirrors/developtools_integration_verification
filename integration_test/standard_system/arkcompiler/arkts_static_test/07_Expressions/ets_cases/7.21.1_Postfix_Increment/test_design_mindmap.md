# 7.21.1 Postfix Increment - 测试设计思维导图

## 概述

验证 `expr++` 后置递增表达式在编译时和运行时的正确行为，包括：
- 所有数值类型（byte/short/int/long/float/double）和 bigint 的 ++ 支持
- 非数值类型拒绝编译
- 返回值语义（返回自增前原值）
- 副作用语义（变量自增 1）
- 非 LHS 表达式的编译时错误

## 三级测试点设计

### compile-pass (7 个)

验证各数值类型和 bigint 的 ++ 编译通过

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | INT | int 变量后置递增 |
| 002 | SHORT | short 变量后置递增 |
| 003 | LONG | long 变量后置递增 |
| 004 | BYTE | byte 变量后置递增 |
| 005 | FLOAT | float 变量后置递增 |
| 006 | DOUBLE | double 变量后置递增 |
| 007 | BIGINT | bigint 变量后置递增 |

### compile-fail (5 个)

验证非数值类型和非 LHS 报编译时错误

| # | 测试点 | 说明 |
|---|--------|------|
| 021 | STRING | string 类型不能 ++ |
| 022 | BOOLEAN | boolean 类型不能 ++ |
| 023 | ENUM | enum 类型不能 ++（非数值类型）|
| 024 | LITERAL | 字面量 5++ 不是 LHS |
| 025 | FUNC_CALL | 函数调用结果 ++ 不是 LHS |

### runtime (8 个)

验证运行时自增值和返回值

| # | 测试点 | 预期值 |
|---|--------|--------|
| 031 | INT_VALUE | int++ 返回旧值，变量+1 |
| 032 | SHORT_VALUE | short++ 返回旧值，变量+1 |
| 033 | LONG_VALUE | long++ 返回旧值，变量+1 |
| 034 | BYTE_VALUE | byte++ 返回旧值，变量+1 |
| 035 | FLOAT_VALUE | float++ 返回旧值，变量+1 |
| 036 | DOUBLE_VALUE | double++ 返回旧值，变量+1 |
| 037 | BIGINT_VALUE | bigint++ 返回旧值，变量+1 |
| 038 | INT_OVERFLOW | int 最大值溢出：MAX_VALUE++ → MIN_VALUE |

## 文件命名规范

- 格式：`EXP_{CHAP}_{SUB}_{SEQ}_{CATEGORY}_{DESCRIPTION}.ets`
- 例：`EXP_07_21_1_001_PASS_INT.ets`
- SEQ：3 位数字，001-999
- CATEGORY：PASS / FAIL / RUNTIME

## 注释模板要求

每个 .ets 文件需包含 5 个 JSDoc 标签：

```
/**
 * @id EXP_07_XX_YYY_{CATEGORY}_{DESC}
 * @expect compile-pass | compile-fail | runtime
 * @section 7.X
 * @design <中文描述>
 * @note 正向用例：验证该特性编译通过的正确用法
 *       反向用例：验证该场景应产生编译时错误
 *       运行时用例：验证该场景的运行时行为
 */
```

## 关键验证点

1. **返回值语义**：x++ 返回 x 自增前的值
2. **副作用语义**：x++ 后 x = x + 1
3. **类型保持**：byte++ 结果类型为 byte（非 int 提升）
4. **非数值类型拒绝**：string/boolean/enum 等不能 ++
5. **非 LHS 拒绝**：字面量、函数调用结果等不能 ++
6. **数值溢出**：int 最大值 ++ 变为最小值（包装行为）
7. **结果类型**：运算结果类型与原变量类型相同
