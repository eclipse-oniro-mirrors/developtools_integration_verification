# 14.1 Ambient Constant or Variable Declarations — 测试设计思维导图

## 概述

Ambient constant/variable declarations 使用 `declare` 关键字声明在别处定义的实体类型信息，不引入新实体，不包含可执行代码。

**核心规则（来自 ArkTS Static Spec ambients.md）：**
1. Ambient constant/variable declarations 必须具有**显式类型注解**（explicit type annotation）
2. Ambient constant/variable declarations **不能有初始化器**（no initializer）
3. 违反以上任一规则 → **compile-time error**

**语法：**
```
ambientConstantOrVariableDeclaration:
    'const'|'let' ambientConstantOrVariableList ';'
    ;
ambientConstantOrVariableList:
    ambientConstantOrVariable (',' ambientConstantOrVariable)*
    ;
ambientConstantOrVariable:
    identifier ':' type
    ;
```

## 子类型覆盖

### 1. declare let 正向编译（compile-pass）

- **基本类型**：int, string, boolean, double, long, short, byte, float
- **复合类型**：int[]（数组）, `int | string`（联合）, `(x: int) => void`（函数类型）
- **预定义类型**：Object, Any
- **多声明**：`declare let a: int, b: string`（逗号分隔多变量）
- **可选属性**：`declare let v: {x?: int}`（若类型系统允许）

### 2. declare const 正向编译（compile-pass）

- **基本类型**：int, string, boolean, double, long
- **复合类型**：int[], `int | string`, Object, Any
- **多声明**：`declare const a: int, b: string`
- **与 let 等价规则**：const 与 let 除关键字外规则一致

### 3. declare let 反向编译（compile-fail）

- **有初始化器**：`declare let v = 1`（任何类型的有初始化器都应报错）
- **无类型注解**：`declare let v`（单独标识符无类型应报错）
- **多声明中含初始化器**：`declare let a: int, b = 1`（部分初始化器应报错）

### 4. declare const 反向编译（compile-fail）

- **有初始化器**：`declare const c = 1`（任何类型的有初始化器都应报错）
- **无类型注解**：`declare const c`（单独标识符无类型应报错）
- **多声明中含初始化器**：`declare const a: int, b = 1`

### 5. 边界与异常场景

- **初始化器类型匹配**：即使初始化器值类型与声明类型一致，也应报错
- **字符串初始化器**：`declare let v = "hello"` — 同上，有初始化器即错
- **布尔初始化器**：`declare let v = true` — 同上
- **数组初始化器**：`declare let arr = [1, 2, 3]` — 同上

### 6. 运行时（runtime）

- 在带 main 入口的文件中使用 ambient 声明，验证不影响正常代码编译与执行
- ambient 声明本身不产生可执行代码，运行时仅验证周围代码可正常运行

## 分类说明

| 分类 | 设计目的 | 通过条件 |
|------|---------|---------|
| compile-pass | 验证合法语法编译通过 | 编译无 Syntax/Semantic error |
| compile-fail | 验证非法语法报错 | 编译有 Syntax/Semantic error |
| runtime | 验证 ambient 声明不干扰正常运行 | 编译成功 + ark 执行成功 |

## 文件命名规范

- 前缀：`AMB_`
- 章节：`14_01`（14 章 01 子节）
- 编号：PASS 001~014 → FAIL 015~024 → RUNTIME 025~026
- 格式：`AMB_14_01_YYY_{CATEGORY}_{DESCRIPTION}.ets`
