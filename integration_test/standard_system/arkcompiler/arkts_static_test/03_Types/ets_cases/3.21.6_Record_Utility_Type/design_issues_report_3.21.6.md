# 3.21.6 Record Utility Type - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 一、行为差异与规范一致性概览

`Record<K,V>` 将 K 映射到 V，K 限于数值、string、string literal 或这些的 union。V 无限制。

## 二、已验证的 ArkTS 规范一致行为

| 行为 | 用例 | 结果 |
|------|------|------|
| `Record<number,Object>` | 001 | ✅ |
| `Record<string,Object>` | 002 | ✅ |
| `Record<boolean,Object>` 拒绝 | 003 | ✅ |
| `Record<literal\|literal, V>` | 004 | ✅ |
| `Record<string\|number, V>` | 005 | ✅ |
| 对象字面量初始化 | 006 | ✅ |
| 索引读写 | 007,009 | ✅ |
| `Record<"salary"\|bool, V>` 拒绝 | 008 | ✅ |

## 三、跨语言对比

| 编译期 Record | ArkTS | Java | Swift |
|-------------|-------|------|-------|
| compile-time Record<K,V> | ✅ | ❌ | ❌ |
| 运行时类比 | Record 对象字面量 | `Map<K,V>` / `HashMap` | `Dictionary<K,V>` |

Java/Swift 的 Map 和 Dictionary 都是运行时容器，无编译期 key 类型限制。

## 四、分类汇总

| 分类 | 数量 |
|------|------|
| 已验证规范一致行为 | 10 |
| Spec 与实现不一致 | 0 |