# 3.19 Union Types - 测试设计思维导图

## 概述

Union type 是引用类型，由多个类型通过 `|` 组合而成。关键规则：
- 函数类型在联合类型中必须用括号包裹，否则 compile-time error
- 联合类型的值可以是其中任意类型的值
- 可通过 instanceof 收窄联合类型
- 联合类型归一化规则：线性化、展开别名、去重、字符串字面量消除、never 消除
- 共同成员访问：相同签名的 method 或同类型 field
- keyof 类型：从类/接口成员名构建字符串字面量联合类型

## 3.19 Union Types 子类型覆盖

### 1. 基本联合类型声明
- 正向编译: string | number, Cat | Dog | number ✅ (001)
- 正向编译: 联合类型变量赋值 ✅ (001)
- 正向编译: enum 在联合类型中 ✅ (002)
- 正向编译: instanceof 收窄联合类型 ✅ (003)
- 正向编译: 联合类型作为函数参数/返回 ✅ (004)
- 正向编译: 预定义类型联合 number | boolean ✅ (005)

### 2. 联合类型函数类型括号
- 反向编译: 函数类型不加括号 → compile-time error ⚠️ SPEC 不一致 (006)

### 3. 联合类型共同成员访问
- 正向编译: 同名字段同类型可访问 ✅ (007)
- 正向编译: 同名方法同签名可调用 ✅ (007)
- 反向编译: 同名字段不同类型 → compile-time error ✅ (008)
- 反向编译: 同名方法不同签名 → compile-time error ✅ (009)
- 反向编译: 静态方法通过联合类型调用 → compile-time error ✅ (010)

## 3.19.1 Union Types Normalization 子类型覆盖

### 1. 嵌套联合线性化
- 正向编译: (T1 | T2) | (T3 | T4) → T1 | T2 | T3 | T4 ✅ (011)

### 2. 类型别名展开
- 正向编译: type B = number; type C = string; type D = B | C → number | string ✅ (012)

### 3. 相同类型消除
- 正向编译: number | number → number ✅ (013)

### 4. string 字面量消除
- 正向编译: "325" | string | number → string | number ✅ (014)

### 5. never 消除
- 正向编译: never | number → number ✅ (015)

### 6. readonly 优先
- 正向编译: (number[]) | (readonly number[]) → readonly number[] ✅ (016)

### 7. 循环引用
- 反向编译: type E = E → compile-time error ✅ (017)

## 3.19.2 Access to Common Union Members 子类型覆盖

### 1. 共同字段访问
- 正向编译: 同名字段同类型 ✅ (018)
- 反向编译: 同名字段不同类型 ✅ (019)

### 2. 共同方法访问
- 正向编译: 同名方法同签名 ✅ (020)
- 反向编译: 同名方法不同签名 ✅ (021)
- 反向编译: 重载方法 ✅ (022)

### 3. 静态成员
- 反向编译: 联合类型访问静态方法 ✅ (023)

## 3.19.3 Keyof Types 子类型覆盖

### 1. 基本 keyof 类型
- 正向编译: keyof A → 字符串字面量联合 ✅ (024)
- 反向编译: keyof 非类/接口类型 → compile-time error ✅ (025)
- 正向编译: keyof 空类 → never ✅ (026)
- 反向编译: keyof 结果赋值错误字符串 → compile-time error ✅ (027)

## 分类说明

- compile-pass: 001-005, 007, 011-016, 018, 020, 024, 026
- compile-fail: 006(⚠️SPEC不一致), 008-010, 017, 019, 021-023, 025, 027
- runtime: 028-035

## 文件命名规范

- TYP_03_19_YYY_{CATEGORY}_{DESCRIPTION}.ets (3.19 主章节)
- TYP_03_19_01_YYY_{CATEGORY}_{DESCRIPTION}.ets (3.19.1 Normalization)
- TYP_03_19_02_YYY_{CATEGORY}_{DESCRIPTION}.ets (3.19.2 Common Members)
- TYP_03_19_03_YYY_{CATEGORY}_{DESCRIPTION}.ets (3.19.3 Keyof)