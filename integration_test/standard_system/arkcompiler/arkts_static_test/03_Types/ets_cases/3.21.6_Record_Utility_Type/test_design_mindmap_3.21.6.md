# 3.21.6 Record Utility Type - 测试设计思维导图

## 概述
`Record<K,V>` 将类型 K 的 key 映射到类型 V 的 value。

## 核心规则
- K 必须是：数值类型、string、string literal、这些类型的 union
- boolean、Object 等不能作 K
- V 无限制
- 支持 object literal 初始化
- 通过 `r[index]` 索引访问

## 测试点
- compile-pass: Record<int,Object>、Record<string,Object>、string literal union keys、索引访问、对象字面量
- compile-fail: boolean 作 key、Object 作 key、不合法的 key 类型、类型无关的 key 类型
- runtime: 对象字面量读写、索引读写