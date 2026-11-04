# 6.4.3 Enumeration to Numeric Type - 测试设计思维导图

## 概述
数值基类型枚举可转换为 ≥ 枚举基类型的数值类型，永不导致运行时错误。
目标类型：同大小或更大的数值类型，或含枚举基类型的联合类型。

## 转换表

| 枚举基类型 | 可转换为 |
|-----------|---------|
| byte | byte, short, int, long, float, double |
| short | short, int, long, float, double |
| int | int, long, float, double |
| long | long, float, double |
| double | double |

## 文件命名
CON_06_04_03_ZZZ_{CATEGORY}_{DESCRIPTION}.ets
