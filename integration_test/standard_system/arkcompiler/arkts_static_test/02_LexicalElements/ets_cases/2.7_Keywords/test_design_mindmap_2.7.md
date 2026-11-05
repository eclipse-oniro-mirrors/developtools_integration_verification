# 2.7 Keywords - 测试设计思维导图（v1.1 - 标准化 + 补充cross_lang_verify目录）

## 概述
ArkTS 的关键字是预定义的保留字，**大小写敏感**。共分 4 类：

### 表 1：硬关键字（Hard Keywords，47 个）
任何上下文都保留，**不能作标识符**：
```
abstract, as, async, await, break, case, catch(*),
class, const, constructor, continue, default, do, else, enum,
export, extends, false, final, for, function, if, implements,
import, in, instanceof, interface, let, native, new, null,
overload, override, private, protected, public, return, static,
super, switch, this, throw, true, try, typeof, undefined, while
```
注：spec 表格中 `catch` 同时出现在硬关键字表和软关键字表，需测试验证。

### 表 2：类型关键字（17 个，主名+别名）
预定义类型的名称和别名，也是硬关键字：

| 主名 | 别名 |
|-----|------|
| Any | - |
| bigint | BigInt |
| boolean | Boolean |
| byte | Byte |
| char | Char |
| double | Double |
| float | Float |
| int | Int |
| long | Long |
| number | Number |
| Object | object |
| short | Short |
| string | String |
| void | - |

### 表 3：软关键字（13 个）
特定上下文有保留含义，但**其余场合可作标识符**：
```
catch, declare, finally, from, get, keyof,
module, namespace, of, out, readonly, set, type
```

### 表 4：未来保留软关键字（5 个）
ArkTS 未来保留 / TypeScript 当前使用的软关键字：
```
is, memo, struct, var, yield
```

## 全覆盖测试矩阵

### 维度 1：硬关键字保护（Hard Keywords）

#### A. 硬关键字作标识符必须失败
- **A1** `class` 作变量名（001 fail）
- **A2** `let` 作变量名（002 fail）
- **A3** `const` 作变量名（003 fail）
- **A4** `function` 作变量名（004 fail）
- **A5** `if` 作变量名（005 fail）
- **A6** `return` 作变量名（006 fail）
- **A7** `new` 作变量名（007 fail）
- **A8** `null` 作变量名（008 fail）
- **A9** `true` 作变量名（009 fail）
- **A10** `instanceof` 作变量名（010 fail）

#### B. 硬关键字按用途使用必须通过
- **B1** 类声明 class（011 pass）
- **B2** 接口声明 interface + extends + implements（012 pass）
- **B3** 枚举声明 enum（013 pass）
- **B4** 流程控制 if/else/do/while/for/switch/case/default/break/continue（014 pass）
- **B5** 异常处理 try/catch/throw（015 pass）
- **B6** 类型操作 typeof/instanceof/as（016 pass）
- **B7** 访问修饰符 public/private/protected（017 pass）
- **B8** 修饰符 static/abstract/final/override/native（018 pass）
- **B9** 异步关键字 async/await（019 pass）
- **B10** 模块关键字 import/export（020 pass）
- **B11** 字面量 true/false/null/undefined（021 pass）
- **B12** super/this/new（022 pass）

### 维度 2：类型关键字保护

#### C. 类型关键字作标识符失败
- **C1** `int` 作变量名（023 fail）
- **C2** `string` 作变量名（024 fail）
- **C3** `boolean` 作变量名（025 fail）
- **C4** `Object` 作变量名（026 fail）
- **C5** `void` 作变量名（027 fail）

#### D. 类型关键字主名+别名同义
- **D1** `int` 与 `Int`（028 pass）
- **D2** `string` 与 `String`（029 pass）
- **D3** `boolean` 与 `Boolean`（030 pass）
- **D4** `bigint` 与 `BigInt`（031 pass）
- **D5** `Object` 与 `object`（032 pass）

### 维度 3：软关键字（Soft Keywords）

#### E. 软关键字在合法上下文中作关键字
- **E1** `type` 作类型别名声明（033 pass）
- **E2** `namespace` 作命名空间（034 pass）
- **E3** `readonly` 作字段修饰（035 pass）
- **E4** `get` / `set` 作访问器（036 pass）
- **E5** `from` 在 import 语句（037 pass）
- **E6** `of` 在 for-of 语句（038 pass）
- **E7** `declare` 在 ambient 声明（039 pass）
- **E8** `finally` 在 try 语句（040 pass）

#### F. 软关键字在普通上下文作标识符
- **F1** `type` 作普通变量名（041 pass）
- **F2** `from` 作普通变量名（042 pass）
- **F3** `of` 作普通变量名（043 pass）
- **F4** `get` 作普通变量名（044 pass）
- **F5** `readonly` 作普通变量名（待测）
- **F6** `namespace` 作普通变量名（待测）

### 维度 4：未来保留软关键字

#### G. 未来保留关键字使用
- **G1** `is` 作普通变量名（045 pass）
- **G2** `memo` 作普通变量名（046 pass）
- **G3** `struct` 作普通变量名（待 ArkUI 上下文外有效，047 pass）
- **G4** `var` 作普通变量名（**应失败**，因 ArkTS 禁止 var 声明）（048 fail）
- **G5** `yield` 作普通变量名（049 pass，ArkTS 不支持 generator）

### 维度 5：大小写敏感

#### H. 大小写敏感验证
- **H1** `Class`（首字母大写）作标识符可用（050 pass）
- **H2** `LET`（全大写）作标识符可用（051 pass）
- **H3** `Int` 作类型（关键字），与 `int` 同义（已在 D1 测）
- **H4** 大小写混合 `iNt` 作标识符可用（052 pass）

### 维度 6：运行时

#### I. 关键字相关运行时行为
- **I1** typeof 运算符运行结果（053 rt）
- **I2** instanceof 运算符运行结果（054 rt）
- **I3** super/this 运行时正确（055 rt）
- **I4** 类型关键字别名同义运行结果（056 rt）
- **I5** 软关键字作变量名运行结果（057 rt）

## 用例编号规划

### compile-pass（约 35 个）
- 011~022 硬关键字按用途使用（12个）
- 028~032 类型关键字别名（5个）
- 033~040 软关键字在合法上下文（8个）
- 041~044 软关键字作标识符（4个）
- 045~047, 049 未来保留作标识符（4个）
- 050~052 大小写敏感（3个）

### compile-fail（约 17 个）
- 001~010 硬关键字作标识符（10个）
- 023~027 类型关键字作标识符（5个）
- 048 var 关键字（1个）
- 编号规划保留余量

### runtime（约 5 个）
- 053~057 运行时验证

## 文件命名规范
- 前缀：LEX_02_07
- 示例：`LEX_02_07_001_FAIL_HARD_KW_CLASS.ets`
