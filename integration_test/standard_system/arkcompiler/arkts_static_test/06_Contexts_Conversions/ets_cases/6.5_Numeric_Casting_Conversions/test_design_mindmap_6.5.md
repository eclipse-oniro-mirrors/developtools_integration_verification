# 6.5 Numeric Casting Conversions - 测试设计思维导图

## 概述
数值强制转换通过标准库方法实现（.toInt(), .toLong(), .toDouble(), .toFloat(), .toByte(), .toShort()）。
永不导致运行时错误。遵循 IEEE 754 舍入规则。

## 转换规则
- double→int/long: NaN→0, ±∞→MAX/MIN, 否则向零舍入
- double→byte/short: 先→int 再截断
- 整数→更小整数: 保留低 N 位，可能改变符号
- float→double, int→long: widening

## 文件命名
CON_06_05_ZZZ_{CATEGORY}_{DESCRIPTION}.ets
