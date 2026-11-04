# 8.12 return语句 测试设计思维导图

## 1. 规格定义
- returnStatement: 'return' expression?
- 无表达式时，语义等价于 return undefined
- 无表达式return的合法位置：
  - 构造函数体（constructor body）
  - void/undefined 返回值函数/方法/lambda体
  - Promise<void> async函数体
  - 否则编译错误（compile-time error）
- 返回表达式类型必须可赋值给函数返回类型
  - 否则编译错误（compile-time error）
- 顶层语句不能包含return语句（top-level statements cannot contain a return statement）

## 2. 测试维度

### 2.1 编译通过（compile-pass） — 10个测试点
- void函数中无表达式return（STMT_08_12_001）
- void函数中 return undefined（STMT_08_12_002）
- 匹配类型的return表达式：string/int/boolean/number（STMT_08_12_003）
- 构造函数中无表达式return — 无参构造（STMT_08_12_004）
- 多个return路径：条件分支return + 早期return（STMT_08_12_005）
- lambda表达式中return：带表达式return（类型匹配）+ void lambda中plain return（STMT_08_12_006）
- return子类对象给父类返回类型：直接返回 + 条件分支返回子类（STMT_08_12_007）
- union返回类型(T|undefined)中return：返回具体值 + plain return（STMT_08_12_008）
- 带参数构造函数中无表达式return（STMT_08_12_015）
- 函数体内lambda中return：闭包捕获外部变量 + lambda作为函数参数传递时return（STMT_08_12_016）

### 2.2 编译失败（compile-fail） — 6个测试点
- 构造函数中 return undefined — 规范明确禁止（STMT_08_12_006）
- 非void/非undefined返回类型函数中无表达式return（STMT_08_12_007）
- return表达式类型不可赋值给函数返回类型：int函数返回string（STMT_08_12_008）
- 顶层return语句 — 非函数/方法体内使用return（STMT_08_12_009）
- lambda中return类型不可赋值给声明的返回类型：int lambda返回string（STMT_08_12_010）
- void函数中带表达式的return语句：return int + return string（STMT_08_12_017）

### 2.3 运行时验证（runtime） — 8个测试点
- return表达式正确返回值：int运算 + string拼接（STMT_08_12_009）
- void函数中return提前退出控制流，return后代码不执行（STMT_08_12_010）
- 条件多return路径正确性：正数/负数/零分支（STMT_08_12_011）
- lambda中return值正确性：算术运算 + 字符串操作（STMT_08_12_012）
- return子类对象给父类返回类型的动态多态行为（STMT_08_12_013）
- union(T|undefined)返回类型的运行时语义：具体值 + undefined（STMT_08_12_014）
- 多种控制流路径中return：for循环内return + while循环内return + if-else多分支return（STMT_08_12_018）
- 嵌套if-else中所有分支return值正确性：三层嵌套，触发全部路径（STMT_08_12_019）

## 3. 边界值与特殊场景

### 3.1 类型边界
- int -> number（可赋值）
- string literal -> string（可赋值）
- null -> 非null类型（不可赋值，需考虑null类型限制）
- undefined -> void（可赋值）
- undefined -> 非void/非undefined（不可赋值）
- 子类类型 -> 父类返回类型（可赋值，多态）

### 3.2 函数体边界
- 仅有return语句的函数体
- return后仍有代码（unreachable code）
- 条件return（if/else分支各自return）
- 嵌套if中的return
- lambda表达式中的return
- 函数体内嵌套lambda中的return（闭包场景）

### 3.3 异常场景
- 缺少return语句（非void函数缺少return）
- 部分路径有return，部分路径无return
- return语句后还有不可达代码
- 顶层return语句（不在函数/方法体内）
- void函数中return带表达式

### 3.4 控制流多样性
- for循环内return
- while循环内return
- 多层嵌套if-else中各分支return
- 循环中条件触发return（提前退出循环）

## 4. 文件命名规范
- 前缀: STMT_08_12
- 编译通过（001-008, 015-016）: STMT_08_12_NNN_PASS_描述.ets
- 编译失败（006-010, 017）: STMT_08_12_NNN_FAIL_描述.ets
- 运行时（009-014, 018-019）: STMT_08_12_NNN_RUNTIME_描述.ets
- 编号跨类别递增，存在间隙（预留编号用于扩展）

## 5. 测试要点总结

| ID | 类别 | 测试点 | 预期 |
|----|------|--------|------|
| 001 | pass | void函数无表达式return | 编译通过 |
| 002 | pass | void函数return undefined | 编译通过 |
| 003 | pass | return表达式匹配函数类型（string/int/boolean/number） | 编译通过 |
| 004 | pass | 构造函数（无参）无表达式return | 编译通过 |
| 005 | pass | 多return路径（条件分支return + 早期return） | 编译通过 |
| 006 | fail | 构造函数return undefined | 编译错误 |
| 007 | fail | 非void函数return无表达式 | 编译错误 |
| 008 | fail | return类型不匹配（int函数返回string） | 编译错误 |
| 009 | fail | 顶层return语句（非函数/方法体内） | 编译错误 |
| 010 | fail | lambda中return类型不匹配（int lambda返回string） | 编译错误 |
| 017 | fail | void函数中return带表达式（int/string） | 编译错误 |
| 006 | pass | lambda表达式中return（类型匹配 + void plain return） | 编译通过 |
| 007 | pass | return子类对象给父类返回类型（直接返回 + 分支返回） | 编译通过 |
| 008 | pass | union(T\|undefined)返回类型中return（具体值 + plain return） | 编译通过 |
| 015 | pass | 带参数构造函数中无表达式return | 编译通过 |
| 016 | pass | 函数体内lambda中return（闭包捕获 + lambda作为参数） | 编译通过 |
| 009 | runtime | return表达式正确返回值（int运算 + string拼接） | 运行时通过 |
| 010 | runtime | void函数return提前退出，后续代码不执行 | 运行时通过 |
| 011 | runtime | 条件多return路径正确性（正数/负数/零） | 运行时通过 |
| 012 | runtime | lambda中return值正确性（算术运算 + 字符串操作） | 运行时通过 |
| 013 | runtime | return子类对象给父类类型的动态多态行为 | 运行时通过 |
| 014 | runtime | union(T\|undefined)返回类型运行时语义（具体值 + undefined） | 运行时通过 |
| 018 | runtime | 多种控制流路径中return（for/while/if-else） | 运行时通过 |
| 019 | runtime | 嵌套if-else中所有分支return值正确性（三层嵌套） | 运行时通过 |
