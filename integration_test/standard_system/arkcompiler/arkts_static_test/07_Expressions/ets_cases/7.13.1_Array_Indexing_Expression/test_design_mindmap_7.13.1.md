# 7.13.1 Array Indexing Expression - 测试设计思维导图

## 概述

数组索引表达式的索引必须是整数类型（`byte`、`short` 或 `int`），否则编译时错误。
- `byte` 和 `short` 通过加宽数值转换提升到 `int`
- `long`、`float`、`double`/`number` 必须显式调用 `.toInt()` 方法转换
- 字符串索引 `arr["1"]` 编译时错误
- 非整数浮点字面量 `arr[3.5]` 编译时错误
- `number` 类型变量作为索引编译时错误
- 链式操作符 `?.` 后的数组索引合法
- 引用类型的数组元素可以通过结果变量修改字段
- 运行时：越界索引抛出 `RangeError`

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | int 类型索引 | `arr[0]`、`arr[idx]` — int 索引合法 |
| 002 | byte/short 索引 | `arr[b]`、`arr[s]` — byte/short 加宽到 int 合法 |
| 003 | 数组元素赋值 | `arr[0] = newVal` — 元素赋值合法 |
| 004 | 引用类型字段修改 | `arr[1].field = val` — 通过数组元素修改引用类型字段 |
| 005 | 链式操作符 | `obj?.arr[0]` — 链式操作符后的数组索引合法 |
| 006 | long→toInt() 显式转换 | `arr[longVar.toInt()]` — long 显式转换后索引 |
| 007 | float/double→toInt() 显式转换 | `arr[floatVar.toInt()]`、`arr[doubleVar.toInt()]` |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 008 | 字符串索引 | `arr["1"]` — 非数值类型索引编译时错误 |
| 009 | 非整数浮点字面量索引 | `arr[3.5]` — double 字面量非整数编译时错误 |
| 010 | number 类型索引 | `arr[numVar]` — number 类型变量索引编译时错误 |
| 011 | long 无转换索引 | `arr[longVar]` — long 类型直接索引编译时错误 |
| 012 | float 无转换索引 | `arr[floatVar]` — float 类型直接索引编译时错误 |
| 013 | double 无转换索引 | `arr[doubleVar]` — double 类型直接索引编译时错误 |

### runtime（验证实际运行时行为）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 014 | 元素访问和赋值 | 访问数组元素并赋值，值匹配预期 |
| 015 | 越界索引 | 越界访问抛出 RangeError |
| 016 | 引用类型字段修改 | 修改数组元素的引用类型字段，验证修改生效 |
| 017 | 链式操作符 + 数组 | 链式操作符后数组索引访问正常运行 |

## 文件命名规范

`EXP_07_13_01_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号（PASS 001-007, FAIL 008-013, RUNTIME 014-017）
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
