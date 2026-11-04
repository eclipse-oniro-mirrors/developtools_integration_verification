# 3.6.4 Type boolean - 测试设计思维导图

## 概述
boolean 表示逻辑值 true/false，支持运算符并是 Object 子类型。

## 运算符
1. 相等：`==`, `!=`
2. 逻辑非：`!`
3. 逻辑（按位）：`&`, `^`, `|`
4. 短路：`&&`, `||`
5. 三元：`?:`
6. 字符串拼接：`+`（boolean → "true"/"false"）

## 是 Object 子类型
- spec §3.6.4：boolean 是 stdlib class type，是 Object 子类型
- `new boolean` → false
- 可放入 `Object[]`

## 测试点
- compile-pass: 字面量、相等、逻辑非、& ^ |、&& ||、?:、字符串拼接、new boolean、boolean as Object
- compile-fail: boolean ↔ 数值互转、boolean 算术运算
- runtime: `new boolean` = false、短路求值副作用、& ^ | 真值表、字符串拼接

## 编号
- compile-pass: 001 ~ 008
- compile-fail: 009 ~ 010
- runtime: 011 ~ 015