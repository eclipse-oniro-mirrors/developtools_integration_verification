# 8.14 throw 语句 - 测试设计思维导图

## 概述
spec section 8.14：throw 语句用于抛出异常，表达式类型必须可赋值给 Error 类型（否则编译时报错）。null 和 undefined 不能作为 throw 表达式。throw 语句立即转移控制权到最近的 catch 块；若无 try 结构捕获则产生 UncaughtExceptionError。

## 核心规则
- throw 表达式类型必须可赋值给 Error（包括 Error 子类）
- null 和 undefined 不可抛出（编译时报错）
- string、number、boolean 等非 Error 类型不可抛出（编译时报错）
- 普通对象字面量即便有 message 属性也不可抛出（类型不兼容 Error）
- throw 立即转移控制权，之后在同一 try 块中的代码不可达（但不导致编译错误）

## 测试点

### compile-pass（7 个用例）
- 直接抛出 Error 实例: throw new Error("msg") —— 最基础的 throw 语句
- 通过 Error 类型变量抛出: let e: Error = ...; throw e;
- 抛出自定义 Error 子类: class C extends Error { ... }; throw new C();
- 抛出标准 Error 子类 RangeError: throw new RangeError("msg");
- 抛出携带额外属性的自定义 Error 子类（errCode、timestamp 等字段不影响赋值兼容性）
- return 之后的 throw 语句语法合法（不可达代码不导致编译错误）
- throw Error 时使用字符串拼接构造动态消息

### compile-fail（6 个用例）
- 抛出 string 字面量: throw "string" —— string 不可赋值给 Error
- 抛出 null: throw null —— null 不允许作为 throw 表达式
- 抛出 undefined: throw undefined —— undefined 不允许作为 throw 表达式
- 抛出 number 字面量: throw 42 —— number 不可赋值给 Error
- 抛出 boolean 字面量: throw true —— boolean 不可赋值给 Error
- 抛出普通对象字面量: throw { message: "..." } —— 非 Error 实例对象不可赋值给 Error

### runtime（6 个用例）
- 单层 try-catch 捕获 throw —— 验证 throw 被最近的 catch 正确捕获
- catch 中 rethrow 重新抛出 —— 内层 catch 捕获后重新抛出，由外层 catch 再次捕获
- 独立函数内 throw 沿调用栈传播 —— top-level 函数内 throw，由调用方 try-catch 捕获
- 三层嵌套 try-catch 最近匹配 —— 最内层 throw，由最近的 catch 捕获，不传播到外层
- throw 立即转移控制权 —— throw 之后的赋值语句不执行，验证控制流即时跳转
- 深层嵌套 try-catch 逐层 rethrow 传播 —— 三层嵌套，每层 catch 捕获后 rethrow，最外层最终捕获，验证每层传播标记正确、rethrow 后代码不执行

## 边界值与异常场景
- 空 Error 对象: throw new Error()
- 带详细消息的 Error: throw new Error("detailed message")
- 抛出后立即被同层 catch 捕获
- catch 块中重新抛出 (rethrow)，由外层 catch 捕获
- 函数间跨调用栈传播：throw 在 A 函数中，由调用 A 的 B 函数 try-catch 捕获
- 深层嵌套（3 层）try-catch + rethrow 全链路传播
- 普通对象字面量（非 Error 实例）编译拒绝

## 文件命名规范
- 前缀: STMT_08_14
- 编译通过: STMT_08_14_001_PASS ~ STMT_08_14_017_PASS（7 个文件，编号不连续）
  实际编号: 001, 002, 003, 004, 010, 011, 017
- 编译失败: STMT_08_14_005_FAIL ~ STMT_08_14_019_FAIL（6 个文件，编号不连续）
  实际编号: 005, 006, 007, 012, 013, 019
- 运行时:   STMT_08_14_008_RUNTIME ~ STMT_08_14_018_RUNTIME（6 个文件，编号不连续）
  实际编号: 008, 009, 014, 015, 016, 018

## 关键约束
- 所有函数必须顶层定义，不允许嵌套函数（compile-fail/runtime 用例中辅助函数也须顶层定义）
- 自定义 Error 子类必须顶层定义，不允许局部类
- 编译通过文件使用 function testXxx(): void 签名
- 编译失败文件使用 function testXxx(): void 签名
- 运行时文件必须使用 function main(): void 签名
- 运行时断言采用 if (cond) throw new Error("msg") 模式
