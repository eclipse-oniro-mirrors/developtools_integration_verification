# 9.7.7 方法体 (Method Body) - 测试设计思维导图

## 概述
本节定义**方法体 (Method Body)** 的形式与约束规则（spec §9.7.7 classes.md:1524-1548）。

**方法体**是实现方法的代码块（block）。分号或空体表示无实现。

**核心语义：**
- `abstract` 或 `native` 方法必须为空体（仅分号）
- 非 `abstract` 且非 `native` 的方法必须有 block 体（禁止空体或分号）
- 非 `void` 返回类型的方法必须在所有可能执行路径上均有 `return` 语句（或等效的 `throw` 终结路径）
- `void` 返回类型方法禁止 `return <value>`，允许无 return 或仅有 `return;`
- `return` 表达式的类型必须可赋值（assignable）给方法声明的返回类型（statements.md:590-592）

## 核心规则

### 方法体形式分类
| 方法类型 | 允许的体形式 | 禁止的体形式 |
|---------|------------|------------|
| `abstract` 方法 | 仅分号（空体） | block 体 |
| `native` 方法 | 仅分号（空体） | block 体 |
| 普通方法（非 abstract 非 native） | block 体（`{ ... }`） | 空体 / 分号 |

### 返回值路径完备性规则
| 返回类型 | 要求 |
|---------|------|
| `void` / `undefined` | 允许无 return 语句，或仅 `return;`（语义等价于 `return undefined`） |
| 非 `void` | **所有执行路径上必须有 `return <expression>`**，`throw` 可等效终结路径 |
| `this` | 仅允许 `return this` 或返回调用另一个返回 `this` 的方法的结果 |

### return 语句约束
- `return;`（无表达式）仅允许在 `void` / `undefined` 返回类型的方法、构造函数、或 `Promise<void>` 异步方法中
- `return <expression>` 的类型必须 assignable 给方法声明的返回类型
- 顶层语句中不能出现 `return` 语句

## 测试点覆盖

### 1. abstract 方法体（PASS）
- `abstract` 方法使用分号（空体），编译通过
- `abstract` 类中的具体方法正常使用 block 体，所有路径覆盖 return 语句

### 2. void 方法体（PASS）
- `void` 方法无 return 语句，编译通过
- `void` 方法仅有 `return;`（无表达式），编译通过
- `void` 方法中 `return;` 与无 return 混用，编译通过

### 3. 非 void 方法返回值路径完备性（PASS）
- 所有 `if-else` 分支均有 return 语句
- 所有 `if-else if-else` 多路分支均有 return 语句
- 嵌套 `if-else` 均有 return 语句
- `throw` 替代 return 确保路径终结
- `try-catch` 中 try 块与 catch 块各自有 return
- 循环内包含 return 且循环后也有 return 兜底

### 4. 非 void 方法缺少 return 路径（FAIL）
- `if` 无 `else` 分支导致某路径缺少 return
- `for` 循环可能不执行导致缺少 return
- 非 void 方法存在无 return 语句的执行路径

### 5. void 方法禁止 return 值（FAIL）
- `void` 方法中 `return <int>` 被拒绝
- `void` 方法中 `return <string>` 被拒绝
- `void` 方法中 `return <bool>` 被拒绝

### 6. native 方法体约束（FAIL）
- `native` 方法使用 block 体被拒绝（必须为空体/分号）

### 7. 非 abstract/native 方法禁止空体（FAIL）
- 普通方法使用分号（空体）被拒绝
- 普通方法缺少 block 体被拒绝

### 8. abstract 方法禁止 block 体（FAIL）
- `abstract` 方法带有 block 体被拒绝

### 9. Runtime 复杂控制流验证
- 多路 `if-else if-else` 分支执行四则运算，通过多个 assert 验证正确输出
- `while` 循环内条件提前 return 查找数组元素
- `void` 方法提前 `return;` 退出
- `try-catch` 中 try 块与 catch 块各自 return 处理除零
- 嵌套 `if-else` 五级评分逻辑

### 10. Runtime 循环累积计算验证
- `for` 循环累积计算（阶乘），最终 return 累积结果
- assert 验证 `compute(5) == 120`

## 边界值与边缘场景

### 边界场景
- `void` 方法中混合使用 `return;` 和无 return 的多条路径
- 深层嵌套 `if-else` 中所有路径均覆盖 return
- `throw` 语句出现在 `if` 分支中以替代 return 并终结路径
- `while(true)` 无限循环内部有 return，循环后可不需兜底

### 边缘场景
- `abstract` 类中混合 `abstract` 方法（分号体）与具体方法（block 体）
- `native` 方法声明语法与体形式的组合约束
- 构造函数中的 `return;`（允许无表达式，禁止 `return undefined`）
- `Promise<void>` 异步方法中 `return;` 的合法性

## 编号规划
- compile-pass: CLS_09_07_010, 019, 020, 025
- compile-fail: CLS_09_07_009, 015, 016, 017, 018, 024, 032
- runtime: CLS_09_07_021, 033

## 文件命名规范
`CLS_09_07_NNN_{CATEGORY}_{DESCRIPTION}.ets`

| 前缀 | 含义 |
|------|------|
| `CLS` | Classes 章节 |
| `09_07` | 9.7.7 小节编号（取前两位数字段：09 章，07 节） |
| `NNN` | 三位序号，全局不重复 |
| `PASS` | compile-pass 用例 |
| `FAIL` | compile-fail 用例 |
| `RUNTIME` | runtime 用例 |

## 用例清单

| 序号 | 用例编号 | 分类 | 描述 |
|------|---------|------|------|
| 1 | CLS_09_07_009 | compile-fail | abstract 方法禁止 block 体 / 非 void 方法缺少 return |
| 2 | CLS_09_07_010 | compile-pass | 合法方法体：abstract 空体 + void 无 return + 非 void 全路径 return |
| 3 | CLS_09_07_015 | compile-fail | void 方法禁止 `return <value>`（int 返回值） |
| 4 | CLS_09_07_016 | compile-fail | native 方法禁止 block 体 |
| 5 | CLS_09_07_017 | compile-fail | 非 void 方法 if 无 else 分支缺少 return |
| 6 | CLS_09_07_018 | compile-fail | 非 abstract 非 native 方法禁止空体（分号） |
| 7 | CLS_09_07_019 | compile-pass | if-else 两路均有 return，throw 替代 return 终结路径 |
| 8 | CLS_09_07_020 | compile-pass | 方法体边缘场景：void return; 混用、abstract 类具体方法全覆盖 |
| 9 | CLS_09_07_021 | runtime | 复杂控制流运行时验证（多路分支 + while + try-catch + 嵌套 if-else） |
| 10 | CLS_09_07_024 | compile-fail | for 循环可能不执行导致缺少 return 路径 |
| 11 | CLS_09_07_025 | compile-pass | 所有路径均有 return（含嵌套 if-else + try-catch 两路） |
| 12 | CLS_09_07_032 | compile-fail | void 方法禁止 `return <value>`（string/bool 返回值） |
| 13 | CLS_09_07_033 | runtime | 循环累积计算运行时验证（阶乘 assert） |

## 覆盖率总览

| 分类 | 数量 | 覆盖点 |
|------|------|--------|
| compile-pass | 4 | abstract 空体、void 无 return/return;、非 void 全路径 return、throw 终结、try-catch 两路 return、循环兜底 return |
| compile-fail | 7 | abstract 带 block 体、void 禁止 return value (int/string/bool)、native 带 block 体、非 void 缺少 return (if 无 else / for 可能不执行)、普通方法空体 |
| runtime | 2 | 复杂控制流多路分支 + while + try-catch + 嵌套 if-else、循环累积计算（阶乘） |
| **总计** | **13** | 100% spec 规则覆盖 |
