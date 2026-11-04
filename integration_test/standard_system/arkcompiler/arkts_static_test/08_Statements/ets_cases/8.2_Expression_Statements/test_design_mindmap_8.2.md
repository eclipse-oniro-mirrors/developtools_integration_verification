# 8.2 表达式语句  测试设计思维导图

## 1. 章节定义
- 任何表达式都可以作为语句使用
- 语法: expressionStatement → expression ;
- 表达式执行的结果被丢弃
- 示例: 赋值表达式、自增/自减表达式、函数/方法调用、构造函数调用(new)、属性访问链、字面量表达式作为语句

## 2. 测试分类

### 2.1 编译通过 (compile-pass) — 8 个测试点

- **赋值表达式语句** (STMT_08_02_001)
  - 简单赋值: x = 10;
  - 链式赋值: a = b = c = 42;
  - 条件赋值: x = flag ? 100 : 200;
  - 带表达式赋值: x = x * y + 3;

- **自增/自减表达式语句** (STMT_08_02_002)
  - 前缀自增: ++x;
  - 后缀自增: x++;
  - 前缀自减: --x;
  - 后缀自减: x--;
  - 混合使用: ++x; x++; --x; x--;

- **函数/方法调用语句** (STMT_08_02_003)
  - 无返回值函数调用: incrementGlobal();
  - 带参数函数调用: addAndSet(3, 7);
  - 对象方法调用: arr.push(4); arr.shift();
  - 内置方法调用(返回值丢弃): msg.charCodeAt(0); msg.length;

- **复合赋值表达式语句** (STMT_08_02_004)
  - 算术复合赋值: +=, -=, *=, /=, %=
  - 位运算复合赋值: &=, |=, ^=, <<=, >>=
  - 字符串拼接复合赋值: s += " world";

- **多种表达式语句组合** (STMT_08_02_005)
  - 同一函数内连续使用多种表达式语句: 赋值、自增、复合赋值、函数调用、三元表达式
  - 数组元素赋值作为语句: arr[0] = 99;
  - 三元条件表达式语句: x = cond ? 1 : 2;

- **构造函数调用(new)语句** (STMT_08_02_012)
  - 无参数构造调用: new Counter();
  - 带参数构造调用: new Accumulator(42);
  - 带表达式参数构造调用: new Accumulator(10 + 20);
  - 带变量参数构造调用: new Accumulator(base * 3);
  - 连续多次构造调用: new Counter(); new Counter(); new EmptyClass();

- **属性访问和方法链式调用语句** (STMT_08_02_013)
  - 对象属性访问: obj.value;
  - 无参数方法调用: obj.getValue();
  - 双方法链式调用: obj.setValue(20).setValue(30);
  - 交替方法链: obj.increment().increment(); obj.setValue(5).increment().setValue(100);
  - 内置属性访问: s.length; arr.length;
  - 内置方法调用(返回值丢弃): s.substring(0,2); s.charCodeAt(0); arr.pop(); arr.indexOf(20);

- **字面量表达式语句** (STMT_08_02_014)
  - 数字字面量: 42; 0; -1;
  - 字符串字面量: "hello";
  - 布尔字面量: true; false;
  - 数组字面量: [1, 2, 3];
  - 变量名作为表达式: x; s; (变量引用作为语句)
  - 混合字面量与变量: 10; "arkts"; v; [7, 8, 9];

### 2.2 编译失败 (compile-fail) — 4 个测试点

- **无效/不支持的运算符** (STMT_08_02_006)
  - delete 运算符: ArkTS 不支持 delete obj.key;

- **super 在非法上下文中** (STMT_08_02_007)
  - 普通函数中使用 super 表达式: super.prop 仅允许在派生类方法/构造函数中

- **访问未定义变量** (STMT_08_02_008)
  - 表达式中引用未声明的变量: x = undeclaredVariable;

- **逗号表达式在 for 循环外** (STMT_08_02_017)
  - ArkTS 仅允许逗号表达式出现在 for 头部
  - 独立的逗号表达式语句应编译失败: expr1, expr2, expr3;
  - 注: 逗号表达式本身不作为语言特性被完全移除，但限制其使用上下文

### 2.3 运行时 (runtime) — 5 个测试点

- **赋值语句的副作用验证** (STMT_08_02_009)
  - 简单赋值后变量的值: x = 42 → x == 42
  - 链式赋值所有变量: a = b = 99 → a == 99, b == 99
  - 复合赋值 +=: y += 5 → y == 15
  - 复合赋值 *=: y *= 2 → y == 30
  - 函数调用内赋值影响全局: setGlobal(77) → globalRuntimeVal == 77

- **自增/自减的副作用验证** (STMT_08_02_010)
  - 后缀自增: x++ → x == 1; 两次 → x == 2
  - 前缀自增: ++y → y == 6; 三次 → y == 8
  - 后缀自减: a-- → a == 9; 三次 → a == 7
  - 前缀自减: --b → b == 4
  - 全局变量自增: globalInc++ → globalInc == 1

- **函数调用的副作用验证** (STMT_08_02_011)
  - 无参函数调用修改全局计数器: 单次→1, 三次→3
  - 带参函数调用累加: 10+20+30 → 60
  - push 方法副作用: arr.push(4) → length==4, arr[3]==4
  - shift 方法副作用: arr.shift() → 返回1, length==3

- **构造函数调用(new)语句运行时验证** (STMT_08_02_015)
  - 单次构造副作用: newCallCounter == 1
  - 三次连续构造副作用: newCallCounter == 3
  - 带表达式参数构造: new SideEffectClass(5 + 10) → newCallCounter == 1
  - 带变量参数构造: new SideEffectClass(arg) → newCallCounter == 1
  - 返回值丢弃验证: 构造副作用发生但实例不可达(仅副作用保留)

- **属性访问和方法链式调用运行时验证** (STMT_08_02_016)
  - 双方法链副作用: obj.add(2).multiply(3) → chainCounter==2, obj.value==9
  - 三方法链副作用: obj.add(1).multiply(2).add(3) → chainCounter==3, obj.value==23
  - 属性访问不修改状态: obj.value; 多次后 obj.value 不变
  - 非链式方法调用返回值丢弃: testObj.getValue() → chainCounter 不增加
  - 链中重置方法: obj.reset(100).add(50) → chainCounter==2, obj.value==150

## 3. 边界值与异常场景
- 空语句 (;) — 合法的空表达式语句
- 链式赋值语句: x = y = z = 10; (编译通过，运行时验证)
- 复杂嵌套表达式作为语句 (编译通过)
- 逗号表达式在非 for 上下文: 编译失败 (ArkTS 限定逗号表达式仅允许在 for 头部)
- 字面量作为独立语句: 编译通过但无实际副作用 (42; "hello"; true;)
- 构造函数调用结果被丢弃: 编译通过，仅副作用保留
- 方法链中间值被丢弃: 每个链节副作用执行但链的最终返回值被丢弃
- 属性访问表达式语句: 无副作用，编译通过

## 4. 文件命名规范
- 前缀: STMT_08_02_
- 编译通过: STMT_08_02_NNN_PASS_DESCRIPTION.ets
- 编译失败: STMT_08_02_NNN_FAIL_DESCRIPTION.ets
- 运行时: STMT_08_02_NNN_RUNTIME_DESCRIPTION.ets
- NNN 从 001 开始顺序编号

## 5. 测试文件清单 (覆盖率: 8P + 4F + 5R = 17)

| 编号 | 文件名 | 类型 | 描述 |
|------|--------|------|------|
| 001 | STMT_08_02_001_PASS_assignment_expression.ets | pass | 赋值表达式作为语句 (简单/链式/条件/带表达式) |
| 002 | STMT_08_02_002_PASS_increment_decrement.ets | pass | 自增自减表达式 (前缀/后缀/混合) |
| 003 | STMT_08_02_003_PASS_function_call.ets | pass | 函数调用表达式 (无参/带参/方法/内置方法) |
| 004 | STMT_08_02_004_PASS_compound_assignment.ets | pass | 复合赋值表达式 (算术/位运算/字符串拼接) |
| 005 | STMT_08_02_005_PASS_expression_sequence.ets | pass | 多种表达式语句组合 (赋值/自增/三元/数组元素赋值) |
| 006 | STMT_08_02_006_FAIL_delete_operator.ets | fail | delete 运算符不支持 |
| 007 | STMT_08_02_007_FAIL_super_illegal.ets | fail | super 在非法上下文 (普通函数) |
| 008 | STMT_08_02_008_FAIL_undefined_variable.ets | fail | 访问未定义变量 |
| 009 | STMT_08_02_009_RUNTIME_assignment.ets | runtime | 赋值语句副作用验证 (简单/链式/复合/函数调用赋值) |
| 010 | STMT_08_02_010_RUNTIME_increment.ets | runtime | 自增自减副作用验证 (前后缀自增/自减/全局) |
| 011 | STMT_08_02_011_RUNTIME_call.ets | runtime | 函数调用副作用验证 (无参/带参/push/shift) |
| 012 | STMT_08_02_012_PASS_constructor_call.ets | pass | 构造函数调用(new)作为语句 (无参/带参/表达式参数/多次) |
| 013 | STMT_08_02_013_PASS_property_access_chain.ets | pass | 属性访问和方法链式调用 (属性/链式/内置) |
| 014 | STMT_08_02_014_PASS_literal_expression.ets | pass | 字面量表达式语句 (数字/字符串/布尔/数组/变量名) |
| 015 | STMT_08_02_015_RUNTIME_constructor_call.ets | runtime | 构造函数调用运行时验证 (单次/多次/表达式参数/返回值丢弃) |
| 016 | STMT_08_02_016_RUNTIME_property_chain.ets | runtime | 属性访问和方法链运行时验证 (双链/三链/重置/丢弃) |
| 017 | STMT_08_02_017_FAIL_comma_expression_outside_for.ets | fail | 逗号表达式在 for 循环外作为语句 (仅允许在 for 头部) |
