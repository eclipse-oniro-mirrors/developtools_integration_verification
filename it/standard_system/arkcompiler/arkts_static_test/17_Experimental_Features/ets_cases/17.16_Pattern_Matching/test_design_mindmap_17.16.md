# 17.16 Pattern Matching - 测试设计思维导图

## 概述
ArkTS §17.16 Pattern Matching 章节描述通用模式匹配构造。经实测探索，ArkTS 当前实现**不支持** `is` 运算符（ESY169587）、`match` 表达式、类型谓词等完整模式匹配特性。仅支持 `instanceof` 进行运行时类型测试。本测试集以真实编译器行为为准，对 spec 设计意图中的特性进行验证与记录。

## 实测编译器行为基线
| 特性 | 是否支持 | 错误码 |
|------|---------|--------|
| `is` 运算符 | ❌ | ESY169587 / ESY0227 |
| `match` 表达式 | ❌ | N/A（无此语法） |
| 类型谓词 `x is Type` | ❌ | ESY169587 |
| `instanceof` | ✅ | 含 W1001506 编译期警告 |
| 嵌套函数 | ❌ | ESY0135 |
| 局部类 | ❌ | ESY0040 |

## 子类型覆盖

### 1. instanceof 类型测试（正向编译）
- 正向编译: Object 变量使用 instanceof 检查具体类型
- 正向编译: 用户自定义类的 instanceof 层次检查
- 正向编译: 条件分支基于 instanceof 结果
- 正向编译: instanceof 与 null 的交互

### 2. is 运算符和类型谓词（反向编译）
- 反向编译: `is` 运算符触发 ESY169587
- 反向编译: 类型谓词函数签名中的 `is` 触发错误
- 反向编译: 错误使用 `is` 的多种场景

### 3. 模式匹配相关语法（反向编译）
- 反向编译: 不支持的 match 语法（如有）
- 反向编译: 类型注释在模式中的非法使用

### 4. instanceof 运行时行为
- 运行时: instanceof String 检查
- 运行时: instanceof 用户自定义类检查
- 运行时: instanceof 多分支选择
- 运行时: instanceof 与 null 检查

## 分类说明
- **compile-pass**: 使用 instanceof 进行类型测试的合法代码
- **compile-fail**: 使用 `is` 运算符等不支持的模式匹配特性
- **runtime**: instanceof 运行时行为验证（含 assert）

## 边界值、异常场景
- null 的 instanceof 行为（始终为 false）
- 基本类型（int, double）的 instanceof 行为
- 编译期已知的 instanceof 结果（W1001506 警告）
- ArkTS 不支持嵌套函数/局部类/局部 type alias → 所有函数和类必须在顶层定义

## 文件命名规范
- `EXP2_17_16_NNN_{CATEGORY}_{DESCRIPTION}.ets`
- CATEGORY: PASS / FAIL / RUNTIME
- 编号: 001~ (PASS), 010~ (FAIL), 020~ (RUNTIME)
