# 18.1.1 Types of Annotation Fields - 测试设计思维导图

## 概述

参考 ArkTS Static Language Specification 第 18.1.1 节。

注解字段允许的类型仅限于以下：
- Numeric Types (int, byte, short, long, float, double, number)
- Type boolean
- Type string
- Enumeration types
- Array of the above types (e.g., string[]), including arrays of arrays (e.g., string[][])
- 使用其余类型 → compile-time error

## 子规则覆盖

### 1. 允许的字段类型（compile-pass）
- **Numeric Types**: int, byte, short, long, float, double, number
- **boolean**: boolean 类型字段
- **string**: string 类型字段
- **enum**: 枚举类型字段
- **数组**: 上述类型的一维数组
- **多维数组**: 上述类型的二维/多维数组
- **混合类型**: 多种允许类型组合

### 2. 不允许的字段类型（compile-fail）
- **Object/Object 子类型**: 自定义类
- **interface**: 接口类型
- **annotation**: 注解类型（与 18.1 交叉）
- **union 类型**: 联合类型
- **Record / Map**: 字典类型
- **Function**: 函数类型
- **any / unknown**: 松散类型
- **null / undefined**: nullish 类型

### 3. 运行时（runtime）
- 使用合法字段类型的注解并在运行时访问其值

## 分类说明
- compile-pass: 验证合法类型可通过编译
- compile-fail: 验证不合法类型产生编译时错误
- runtime: 验证注解字段类型在运行时行为正确

## 文件命名规范
- `ANN_18_01_1_YYY_{CATEGORY}_{DESCRIPTION}.ets`

| 字段 | 说明 |
|------|------|
| `ANN_` | 第 18 章前缀 |
| `18` | 主章节号 |
| `01_1` | 子章节号 (18.1.1) |
| `YYY` | 连续编号 |
| `CATEGORY` | PASS / FAIL / RUNTIME |
| `DESCRIPTION` | 大写下划线描述 |
