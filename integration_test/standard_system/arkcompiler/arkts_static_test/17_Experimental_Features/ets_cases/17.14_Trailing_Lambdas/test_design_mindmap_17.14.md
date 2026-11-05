# 17.14 Trailing Lambdas - 测试设计思维导图

## 概述
Trailing Lambda 是 ArkTS 实验特性：当函数调用的最后一个参数是函数类型时，可以将 lambda 表达式作为 trailing block 写在函数调用的括号外部。这是将 lambda 作为最后一个参数传递的语法糖。

Spec 定义：
- 最后一个参数为函数类型时，lambda 可作为 trailing block 写在括号外
- 语法：`a.foo() { console.log("trailing lambda") }`
- 目前 trailing lambda 类型除 receiver 外不支持其余参数
- 调用后的 block 总是被当作 trailing lambda 处理
- 分号 `;` 出现在 block 前表示该 block 不是 trailing lambda
- 函数类型参数前的可选参数 → 跳过的参数默认为 undefined
- Trailing lambda 是将 lambda 作为最后一个参数传递的语法糖

## 子类型覆盖

### 1. 基本 Trailing Lambda 语法
- **正向编译**: 函数仅有一个函数类型参数，使用 trailing lambda 语法调用
- **正向编译**: 方法调用使用 trailing lambda 语法
- **反向编译**: 最后一个参数不是函数类型时使用 trailing lambda 语法
- **运行时**: 验证 trailing lambda 实际被执行

### 2. 多参数 + Trailing Lambda
- **正向编译**: 多个普通参数 + 最后一个函数类型参数，使用 trailing lambda
- **正向编译**: 可选参数 + 函数类型参数，使用 trailing lambda
- **运行时**: 验证参数正确传递给函数，同时 trailing lambda 被执行

### 3. 嵌套 Trailing Lambda
- **正向编译**: 外层和内层函数调用都使用 trailing lambda 语法
- **反向编译**: 一次调用后出现多个 trailing block（多个 trailing lambda）

### 4. Trailing Lambda 返回值
- **正向编译**: Trailing lambda 包含 return 语句返回值
- **运行时**: 验证 trailing lambda 返回值被正确接收

### 5. 分号分隔
- **反向编译**: 分号出现在调用和 block 之间，block 不是 trailing lambda
- **注意**: 此时调用缺少必需参数导致编译失败

### 6. 函数类型签名不匹配
- **反向编译**: Trailing lambda 的隐式参数与函数类型签名不匹配

## 分类说明
- **compile-pass**: .ets 文件必须编译成功（无 Syntax error 和 Semantic error）
- **compile-fail**: .ets 文件必须产生编译时错误
- **runtime**: .ets 文件编译成功后通过 ark VM 实际执行 + assert 断言验证

## 文件命名规范
- 前缀: `EXP2_` (实验特性章节)
- 格式: `EXP2_17_14_NNN_{CATEGORY}_{DESCRIPTION}.ets`
- 编号顺序: PASS(001~) → FAIL(接续) → RUNTIME(接续)
