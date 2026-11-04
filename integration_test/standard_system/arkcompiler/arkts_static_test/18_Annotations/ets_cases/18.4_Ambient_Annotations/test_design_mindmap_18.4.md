# 18.4 Ambient Annotations - 测试设计思维导图

## 概述

参考 ArkTS Static Language Specification 第 18.4 节。

规则：
- `declare @interface Name {}` 声明 ambient annotation
- Ambient 只提供类型信息，不定义实际注解
- Ambient + 实现必须完全一致（包括字段初始化）
- 缺少对应实现 → runtime error
- Ambient 可像普通注解一样导入使用

## 子规则覆盖

### compile-pass
- 基本 `declare @interface` 声明
- `export declare @interface` + 匹配实现
- Ambient 导入并使用

### compile-fail
- Ambient 与实现字段默认值不匹配
- Ambient 与实现字段类型不匹配

### runtime
- Ambient 注解声明运行时编译执行
