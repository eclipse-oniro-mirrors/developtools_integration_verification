# 17.16.1 Destructuring Assignment - 测试设计思维导图

## 概述
ArkTS §17.16.1 描述解构赋值（Destructuring Assignment）特性。经实测探索，ArkTS 当前实现支持数组和元组的解构声明（declaration destructuring），但不支持解构赋值到已有变量、rest 元素、嵌套解构（编译器崩溃）、类型注释在解构模式内等高级特性。

## 实测编译器行为基线
| 特性 | 是否支持 | 错误码 |
|------|---------|--------|
| 数组解构声明 `let [a, b] = arr` | ✅ | - |
| 元组解构声明 `let [a, b] = tup` | ✅ | - |
| 跳过元素 `let [a, , b]` | ✅ | - |
| Rest 元素 `let [a, ...rest]` | ❌ | ESY165518 |
| 嵌套解构 `let [[a,b],[c,d]]` | ❌ | 编译器崩溃 (segfault) |
| 解构赋值到已有变量 `[x, y] = arr` | ❌ | ESE0252 等 |
| 类型注释在模式内 `let [a: int, b]` | ❌ | ESY0229 |
| 对象解构 `let {x, y} = obj` | ❌ | ESY177354 (inline types) |
| 非数组 RHS `let [a, b] = 42` | ❌ | ESY0049 |
| 重复变量绑定 `let [a, a]` | ❌ | ESE0351 |
| 更多 LHS 比 tuple 元素 `let [a,b,c] = tup_2` | ❌ | ESY82935 |

## 子类型覆盖

### 1. 数组解构声明（正向编译）
- 正向编译: 基本数组解构 `let [a, b] = arr`
- 正向编译: 跳过元素解构 `let [a, , b] = arr`
- 正向编译: 单元数组解构 `let [a] = arr`
- 正向编译: 字面量数组 RHS `let [a, b] = [1, 2]`

### 2. 元组解构（正向编译）
- 正向编译: 元组解构声明 `let [num, str] = tup`

### 3. 解构编译时错误（反向编译）
- 反向编译: 非数组/元组 RHS → ESY0049
- 反向编译: 重复变量绑定 → ESE0351
- 反向编译: 更多 LHS 比 tuple 元素 → ESY82935
- 反向编译: Rest 元素 → ESY165518
- 反向编译: 类型注释在解构模式内 → ESY0229
- 反向编译: 嵌套解构 → 编译器崩溃（记录为 Bug）

### 4. 解构运行时行为
- 运行时: 验证正确值提取
- 运行时: 验证跳过元素
- 运行时: 验证元组解构值
- 运行时: 验证字符串数组解构

## 分类说明
- **compile-pass**: 合法解构声明语法
- **compile-fail**: 不合法的解构用法（含不支持的语法）
- **runtime**: 解构声明实际执行 + assert 验证

## 边界值、异常场景
- 嵌套解构导致编译器崩溃（严重 Bug）
- Rest 元素不支持
- 解构赋值（非声明）不支持
- 对象解构因 inline type 限制不支持
- ArkTS 不支持嵌套函数/局部类/局部 type alias → 所有函数和类必须在顶层定义

## 文件命名规范
- `EXP2_17_16_1_NNN_{CATEGORY}_{DESCRIPTION}.ets`
- CATEGORY: PASS / FAIL / RUNTIME
- 编号: 001~ (PASS), 010~ (FAIL), 020~ (RUNTIME)
