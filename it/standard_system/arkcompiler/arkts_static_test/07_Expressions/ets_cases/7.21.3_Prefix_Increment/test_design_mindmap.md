# 7.21.3 Prefix Increment - 测试设计思维导图

## 概述

验证 `++expr` 前置递增表达式在编译时和运行时的正确行为。**关键区别**：与后置递增 `x++` 不同，前置递增 `++x` 返回**自增后的新值**。

## 三级测试点设计

### compile-pass (7 个)

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | INT | int 前置递增 |
| 002 | SHORT | short 前置递增（类型保持）|
| 003 | LONG | long 前置递增 |
| 004 | BYTE | byte 前置递增（类型保持）|
| 005 | FLOAT | float 前置递增 |
| 006 | DOUBLE | double 前置递增 |
| 007 | BIGINT | bigint 前置递增 |

### compile-fail (5 个)

| # | 测试点 | 说明 |
|---|--------|------|
| 021 | STRING | string ++ 非数值 |
| 022 | BOOLEAN | boolean ++ 非数值 |
| 023 | ENUM | enum ++ 非数值 |
| 024 | LITERAL | ++5 非 LHS |
| 025 | FUNC_CALL | ++func_call 非 LHS |

### runtime (8 个)

| # | 测试点 | 预期值 |
|---|--------|--------|
| 031 | INT_VALUE | ++int 返回新值，变量+1 |
| 032 | SHORT_VALUE | ++short 返回新值，变量+1 |
| 033 | LONG_VALUE | ++long 返回新值，变量+1 |
| 034 | BYTE_VALUE | ++byte 返回新值，变量+1 |
| 035 | FLOAT_VALUE | ++float 返回新值，变量+1 |
| 036 | DOUBLE_VALUE | ++double 返回新值，变量+1 |
| 037 | BIGINT_VALUE | ++bigint 返回新值，变量+1 |
| 038 | INT_OVERFLOW | ++int.MAX 溢出为 int.MIN |

## 文件命名规范

- 格式：`EXP_{CHAP}_{SUB}_{SEQ}_{CATEGORY}_{DESCRIPTION}.ets`
- 例：`EXP_07_21_3_001_PASS_INT.ets`
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

1. **返回值语义**（与 postfix 关键区别）：++x 返回**自增后的新值**（而非旧值）
2. **副作用语义**：++x 后 x = x + 1
3. **类型保持**：++byte 结果类型为 byte
4. **非数值类型拒绝**：string/boolean/enum 不能 ++
5. **非 LHS 拒绝**：++字面量、++函数调用结果 报错
