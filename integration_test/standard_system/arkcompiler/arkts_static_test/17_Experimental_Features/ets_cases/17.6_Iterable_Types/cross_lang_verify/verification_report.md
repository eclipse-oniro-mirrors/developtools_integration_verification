# 17.6 Iterable Types - 三环境实测验证报告

**生成日期：** 2026-06-23

---

## ArkTS 实测结果

| 用例 | 结果 | 备注 |
|------|------|------|
| EXP2_17_06_001_PASS_CLASS_IMPLEMENTS_ITERABLE | compile-pass | 类实现 Iterable\<number\> 编译通过 |
| EXP2_17_06_002_PASS_FOR_OF_CUSTOM_ITERABLE | compile-pass | 自定义 Iterable 编译通过 |
| EXP2_17_06_003_PASS_FOR_OF_ARRAY_ITERABLE | compile-pass | 数组 for-of 编译通过 |
| EXP2_17_06_004_PASS_FOR_OF_STRING_ITERABLE | compile-pass | 字符串 for-of 编译通过 |
| EXP2_17_06_005_PASS_INTERFACE_EXTENDS_ITERABLE | compile-pass | 接口扩展 Iterable 编译通过 |
| EXP2_17_06_006_PASS_UNION_ITERABLE | compile-pass | 联合可迭代编译通过 |
| EXP2_17_06_007_PASS_OVERRIDE_ITERATOR | compile-pass | 覆盖 $_iterator 编译通过 |
| EXP2_17_06_008_PASS_GENERIC_ITERABLE | compile-pass | 泛型 Iterable 编译通过 |
| EXP2_17_06_009_PASS_ABSTRACT_ITERATOR_INTERFACE | compile-pass | 抽象 $_iterator 编译通过 |
| EXP2_17_06_010_FAIL_ASYNC_ITERATOR | compile-fail | ESY0220: $_iterator cannot be asynchronous |
| EXP2_17_06_011_FAIL_ITERABLE_NO_ITERATOR | compile-fail | ESE0190: not abstract, no $_iterator override |
| EXP2_17_06_012_FAIL_ITERATOR_WRONG_RETURN | compile-fail | ESE0096: return type must implement Iterator |
| EXP2_17_06_013_RUNTIME_FOR_OF_ARRAY_VERIFY | runtime (exit 0) | sum=60, count=3, empty=0 |
| EXP2_17_06_014_RUNTIME_FOR_OF_STRING_VERIFY | runtime (exit 0) | result="ArkTS", count=5, empty=0 |
| EXP2_17_06_015_RUNTIME_FOR_OF_CUSTOM_VERIFY | runtime (exit 0) | sum=15, count=5, empty=0 |

---

## Java 实测结果

**编译器/运行时:** Java 21.0.11

| 测试场景 | 结果 | 备注 |
|----------|------|------|
| Custom Range for-each (1..5) | verified (assert pass) | sum=15, count=5 |
| Empty range (5..1) | verified | emptyCount=0 |
| Array int[] for-each | verified | arrSum=60, arrCount=3 |
| String iteration | N/A (manual loop) | Java String 不实现 Iterable\<Character\>，需用 charAt() |
| Generic Wrapper\<String\> for-each | verified | value="hello", count=1 |

**观察：**
- Java 使用 `Iterable<T>.iterator()` 返回 `Iterator<T>`，ArkTS 使用 `$_iterator()` 方法名
- Java Iterator 使用 `hasNext(): boolean` + `next(): T` 两方法模式，ArkTS 使用 `next(): IteratorResult<T>` 单方法模式
- Java String **不是** Iterable，ArkTS string **是** Iterable
- Java 数组可用于增强型 for 循环（规范支持，但非 Iterable 接口）

---

## Swift 实测结果

**环境:** Swift **不可用**（系统中未安装 swift/swiftc）

Swift 代码已准备在 `SwiftIterable.swift` 中。Swift 使用以下等价模式：
- `Sequence` 协议（对应 ArkTS `Iterable`），`makeIterator()` 方法
- `IteratorProtocol` 协议（对应 ArkTS `Iterator`），`next() -> Element?` 方法
- String 和 Array 在 Swift 中也是内置 Sequence
- 没有 async Iterator 的特殊限制（Swift 使用 AsyncSequence 独立协议）

---

## 三环境综合对比

| 特性 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 可迭代接口 | Iterable\<T\> | Iterable\<T\> | Sequence |
| 迭代器接口 | Iterator\<T\> | Iterator\<T\> | IteratorProtocol |
| 迭代方法名 | `$_iterator()` | `iterator()` | `makeIterator()` |
| 迭代器方法 | `next(): IteratorResult<T>` | `hasNext()+next(): T` | `next() -> T?` |
| 数组内置可迭代 | 是 | 是（增强for） | 是 |
| 字符串内置可迭代 | 是 | **否** | 是 |
| async 迭代禁止 | 是（编译错误） | N/A | 独立 AsyncSequence |
| 联合可迭代 | 是（独有） | 否 | 否 |
| 符号方法名废弃 | [Symbol.iterator] | N/A | N/A |
