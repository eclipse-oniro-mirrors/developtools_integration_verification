# 17.15 Accessor Declarations - 测试设计思维导图

## 概述
Accessor Declaration 是 ArkTS 实验特性：允许在顶层或命名空间内声明 getter/setter 访问器。语法类似类成员访问器，但在顶层作用域使用。

Spec 定义：
- 顶层或命名空间 getter/setter 声明
- 语法：`get name(): ReturnType { body }` / `set name(param: Type) { body }`
- `native` 修饰符用于原生访问器
- 非原生访问器必须有函数体；原生访问器不能有函数体
- Getter 需要返回类型（或可推断）；不能有参数
- Setter 有单个参数；不能有返回类型声明（包括 void）
- 编译时错误：作为调用表达式使用、getter 返回类型无法推断、setter 有可选参数
- Getter/setter 名称在作用域内必须唯一
- 使用方式类似变量：`console.log(name)` 调用 getter；`name = val` 调用 setter

## 子类型覆盖

### 1. 基本 Getter/Setter 声明
- **正向编译**: 顶层 getter 返回计算值
- **正向编译**: 顶层 setter 赋值给 backing 变量
- **正向编译**: Getter+setter 配对使用
- **反向编译**: Getter 作为调用表达式使用（getter()）
- **反向编译**: Setter 有可选参数
- **反向编译**: Getter 有形式参数
- **运行时**: 验证 getter 返回正确计算值
- **运行时**: 验证 setter 更新 backing 状态
- **运行时**: 验证 getter+setter 交互

### 2. 命名空间 Getter/Setter
- **正向编译**: Getter 在命名空间内声明
- **正向编译**: Setter 在命名空间内声明
- **运行时**: 验证命名空间 getter/setter 交互

### 3. 返回类型推断
- **正向编译**: Getter 省略返回类型声明，从函数体推断
- **反向编译**: Getter 返回类型无法推断（如空函数体）

### 4. Native 修饰符
- **反向编译**: Native getter 有函数体
- **反向编译**: 非原生 getter 无函数体

## 分类说明
- **compile-pass**: .ets 文件必须编译成功（无 Syntax error 和 Semantic error）
- **compile-fail**: .ets 文件必须产生编译时错误
- **runtime**: .ets 文件编译成功后通过 ark VM 实际执行 + assert 断言验证

## 文件命名规范
- 前缀: `EXP2_` (实验特性章节)
- 格式: `EXP2_17_15_NNN_{CATEGORY}_{DESCRIPTION}.ets`
- 编号顺序: PASS(001~) → FAIL(接续) → RUNTIME(接续)
