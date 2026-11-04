# 18.1 Declaring Annotations - 测试设计思维导图

## 概述

参考 ArkTS Static Language Specification 第 18.1 节。

Declaring an annotation is similar to declaring an interface where the keyword `interface` is prefixed with the character `@`.

语法规则：
```
annotationDeclaration:
  '@interface' identifier '{' annotationField* '}'
;
annotationField:
  identifier ':' type constInitializer?
;
constInitializer:
  '=' constantExpression
;
```

## 子规则覆盖

### 1. 基本 @interface 声明
- **正向编译**: 最基本的空注解声明 (`@interface Position {}`)
- **正向编译**: 有多个字段的注解声明
- **正向编译**: 注解字段带默认值（常量表达式）
- **正向编译**: 导出注解 (`export @interface`)

### 2. 注解字段定义
- **正向编译**: 字段使用合法的受限类型 (string, number, boolean, enum, 其余注解等)
- **正向编译**: 多个换行分隔的字段
- **反向编译**: 初始值不是常量表达式（如调用函数）
- **反向编译**: 字段使用非法类型

### 3. 注解声明位置约束
- **反向编译**: 注解定义在局部作用域（不在顶层）

### 4. 注解不能继承
- **反向编译**: 尝试 extends 注解

### 5. 注解名称不能与其余实体重名
- **反向编译**: 注解与类同名
- **反向编译**: 注解与接口同名

### 6. 注解不定义类型
- **反向编译**: 对注解使用 type alias
- **反向编译**: 类 implements 注解

## 分类说明

- **compile-pass**: 验证合法的注解声明可通过编译
- **compile-fail**: 验证不合法的注解声明产生编译时错误
- **runtime**: 验证注解的运行时行为（此部分主要覆盖基本声明场景，运行时访问详见 18.6）

## 文件命名规范

- `ANN_18_01_001_{CATEGORY}_{DESCRIPTION}.ets`

| 字段 | 说明 |
|------|------|
| `ANN_` | 第 18 章（Annotations）前缀 |
| `18` | 主章节号 |
| `01` | 子章节号（18.1） |
| `YYY` | 连续编号 |
| `CATEGORY` | PASS / FAIL / RUNTIME |
| `DESCRIPTION` | 大写下划线描述 |
