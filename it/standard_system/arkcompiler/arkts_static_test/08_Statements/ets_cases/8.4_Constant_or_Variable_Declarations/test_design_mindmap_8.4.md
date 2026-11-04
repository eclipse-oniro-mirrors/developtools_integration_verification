# 8.4 常量或变量声明 测试设计思维导图

## 一、规格说明
- let/const 声明定义新的可变/不可变变量
- constantOrVariableDeclaration: annotationUsage? (variableDeclaration | constantDeclaration)
- 可见性由外围块作用域规则确定
- 声明可以遮蔽同一外围作用域中的同名声明（内部块允许）
- BUT: 参数和局部变量在同一作用域中同名 -> 编译时错误
- let 声明和 const 声明均有初始化部分（initialization part）
- 实测行为: es2panda 允许 let 无初始化器声明（编译通过），但 const 强制要求初始化器

## 二、测试分类

### 1. 变量声明 (variableDeclaration / let)
- let 基本声明: let 标识符: 类型 = 表达式
- let 带类型注解: int, number, string, boolean, long, double
- let 联合类型注解: string|number, int|null, string|int|boolean, number|string[], boolean|null
- let 无初始值: es2panda 允许 `let x: int;` 编译通过（与 const 不同）
- let 可变性: 声明后可重新赋值（int, string, boolean 均在运行时验证）

### 2. 常量声明 (constantDeclaration / const)
- const 基本声明: const 标识符 = 表达式（number, string, int, boolean）
- const 复杂类型: 数组类型 int[], string[]
- const 复杂初始化表达式: 算术运算、三元表达式、逻辑运算、字符串拼接、数组字面量、引用其余 const
- const 必须初始化: 函数作用域和模块顶层均强制；无初始化器 -> 编译错误
- const 不可重新赋值: 编译时错误（与 let 可变性形成对比）
- const 运行时不可变性: 字面量、算术结果、字符串拼接结果均保持

### 3. 作用域与遮蔽
- 块作用域 (block scope): 基本遮蔽，外层 let 被内层块 const 遮蔽（允许）
- 多级遮蔽: 函数体 -> if 块 -> 内层块，let/const 混用，离开各级块后逐级恢复
- for 循环体内 let 声明: 循环体创建独立块作用域，let 合法遮蔽参数名（不与参数冲突）
- 同一作用域重复声明: 函数作用域内重复 let、if 块体内重复 let、同一作用域重复 const -> 编译错误
- 参数与局部变量冲突: 同一函数级作用域参数和 let 同名 -> 编译错误

### 4. 注解用法 (annotationUsage)
- 可选修饰符 @xxx 标注在声明前（语法定义中有，当前用例集未单独覆盖）

## 三、测试点分布

### compile-pass (10 个文件)

| 编号 | 测试点 | 描述 |
|------|--------|------|
| 001 | let 基本声明 | let 声明 int/number/string/boolean 类型变量，类型推断，let 变量可重新赋值 |
| 002 | const 基本声明 | const 声明 number/string/int/boolean 类型常量，不可重新赋值 |
| 003 | 基本块内遮蔽 | 外层 let 与内层块 const 同名（规范允许）；外层 value: string 被内层 const 遮蔽 |
| 004 | let 带类型注解 | let 显式类型注解: int, number, string, boolean, long, double |
| 005 | const 复杂类型 | const 与数组类型 int[]/string[] 及基本数值类型 |
| 012 | 多级遮蔽 | 函数体 -> if 块 -> 内层块三级嵌套遮蔽，let/const 混用，两组变量 (item + value, count) |
| 013 | for 循环体遮蔽参数 | for 循环体内 let 声明与函数参数同名，循环体创建独立块作用域，合法遮蔽 |
| 014 | const 复杂初始化表达式 | const 初始化支持算术运算(1+2\*3)、三元(true?100:0)、逻辑(true&&false)、字符串拼接("Hello"+" World")、数组字面量、引用其余 const |
| 017 | let 无初始化器 | `let x: int;` 编译通过 — es2panda 允许 let 省略初始化器（仅 const 强制） |
| 018 | let 联合类型注解 | let 支持复杂联合类型: string\|number, int\|null, string\|int\|boolean, number\|string[], boolean\|null，每种类型均赋值验证 |

### compile-fail (7 个文件)

| 编号 | 测试点 | 描述 |
|------|--------|------|
| 006 | 参数与局部变量同名 | 函数参数 item: boolean 与函数体内 `let item: int[]` 同作用域冲突 -> 编译错误 |
| 007 | const 重新赋值 | const maxValue: int = 100 后 maxValue = 200 -> 编译错误 |
| 008 | 同一函数作用域重复 let | `let name: string = "hello"` 后 `let name: string = "world"` 同作用域 -> 编译错误 |
| 011 | const 无初始化器(函数内) | 函数内 `const x: int` 缺少初始化表达式 -> 编译错误 |
| 016 | 同一作用域重复 const | `const name: string = "first"` 后 `const name: string = "second"` 同作用域 -> 编译错误 |
| 019 | const 无初始化器(模块顶层) | 模块顶层 `const x: int` 缺少初始化表达式 -> 编译错误 |
| 020 | if 块体内重复 let | if 块体内 `let msg: string = "first"` 后 `let msg: string = "second"` -> 编译错误 |

### runtime (4 个文件)

| 编号 | 测试点 | 描述 |
|------|--------|------|
| 009 | let/const 值语义运行时 | let 变量可修改(int/string/boolean)，const 常量不可修改，均通过 assert 验证 |
| 010 | 基本块作用域遮蔽运行时 | 内层块 const 遮蔽外层 let，离开块后外层值恢复，int 和 string 两组验证 |
| 015 | 多级遮蔽运行时 | 三级嵌套块(item: 1->2->3->2->1; text: A->B->C->B->A)，各级隔离，逐级恢复，含 let/const 混用 |
| 021 | const 不可变性运行时 | const 字面量(int/string/boolean/number)及表达式(算术 x+y、字符串拼接 s1+" "+s2)初始化后值保持不可变 |

## 四、边界值与边缘场景

### 已覆盖的边界值
- let 无初始化器声明（允许，与 const 不同）：017
- const 无初始化器声明（函数内禁止）：011
- const 无初始化器声明（模块顶层禁止）：019
- 深层嵌套作用域（3 级）遮蔽：012, 015
- const 复杂初始化表达式（算术/三元/逻辑/拼接/数组）：014
- const 表达式初始化运行时保持性（算术/拼接）：021
- 联合类型注解（5 种组合: string|number, int|null, string|int|boolean, number|string[], boolean|null）：018
- 基本类型全覆盖 (int, number, string, boolean, long, double)：001, 002, 004
- 数组类型 const: 005
- for 循环体内遮蔽参数边界：013
- if 块体内重复声明：020

### 未覆盖/可补充的边缘场景
- while/do-while 循环体内遮蔽参数（当前仅覆盖 for 循环）
- switch case 块内声明遮蔽
- const 对象字面量类型（当前仅覆盖数组，未覆盖 object/record 类型）
- annotationUsage 修饰符 + let/const 组合声明
- 箭头函数体内 let/const 与外层遮蔽
- let 无初始化器后第一次赋值（运行时行为验证）
- const 声明的引用类型内部可变性（如 const arr: int[] = [1,2,3]; arr[0] = 99 是否允许）

## 五、文件命名规范
- 前缀: STMT_08_04_
- compile-pass: STMT_08_04_NNN_PASS_DESCRIPTION.ets
- compile-fail: STMT_08_04_NNN_FAIL_DESCRIPTION.ets
- runtime: STMT_08_04_NNN_RUNTIME_DESCRIPTION.ets
- 编号连续不重复（001-021，存在编号空缺: 011 为 FAIL 而非 PASS，编号反映设计次序而非分类次序）

## 六、覆盖率摘要

| 分类 | 数量 | 通过率 |
|------|------|--------|
| compile-pass | 10 | 100% |
| compile-fail | 7 | 100% |
| runtime | 4 | 100% |
| **总计** | **21** | **100%** |
