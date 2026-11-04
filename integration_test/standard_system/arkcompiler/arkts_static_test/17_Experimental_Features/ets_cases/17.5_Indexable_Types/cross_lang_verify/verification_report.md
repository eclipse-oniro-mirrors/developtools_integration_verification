# 17.5 Indexable Types - 三环境实测验证报告

**日期：** 2026-06-23

---

## ArkTS 实测

| 用例 | 编译 | 运行 | 结果 |
|------|------|------|------|
| 001 BASIC_GET_SET | PASS | N/A | compile-pass |
| 002 GET_ONLY | PASS | N/A | compile-pass |
| 003 SET_ONLY | PASS | N/A | compile-pass |
| 004 INTERFACE_IMPL | PASS | N/A | compile-pass |
| 005 OVERRIDE | PASS | N/A | compile-pass |
| 006 GENERIC_CLASS | PASS | N/A | compile-pass |
| 007 STRING_INDEX | PASS | N/A | compile-pass |
| 008 OVERLOAD | PASS | N/A | compile-pass |
| 010 FAIL_ASYNC_GET | FAIL (ESY0220) | N/A | compile-fail |
| 011 FAIL_ASYNC_SET | FAIL (ESY0220) | N/A | compile-fail |
| 012 FAIL_READ_ONLY_WRITE | FAIL (ESE0250) | N/A | compile-fail |
| 013 FAIL_WRITE_ONLY_READ | FAIL (ESE0250) | N/A | compile-fail |
| 020 RUNTIME_BASIC_INDEX | PASS | exit 0, "verified" | runtime |
| 021 RUNTIME_STRING_INDEX | PASS | exit 0, "verified" | runtime |
| 022 RUNTIME_GENERIC_INDEX | PASS | exit 0, "verified" | runtime |

**编译器：** es2panda
**运行时：** ark VM
**总计：** 15/15 通过 (100%)

---

## Java 实测

**编译器：** javac (Java)
**运行时：** java
**结果：** 编译成功，运行 exit 0，输出 "verified"

**关键发现：**
- Java 不支持用户自定义索引语法（无操作符重载）
- 最接近的等价物：数组内置 `[]` 语法、`List.get(i)/set(i,v)`、`Map.get(k)/put(k,v)`
- Java 的索引能力是语言内置的，不可扩展

---

## Swift 实测

**编译器：** swift (未安装在当前系统)
**结果：** N/A - Swift 5.10 未在当前 Linux 环境中安装

**代码已生成：** `EXP2_17_05_Indexable_Types.swift`
**预期行为（基于 Swift Language Reference）：**
- Swift `subscript` 语法与 ArkTS `$_get/$_set` 功能等价
- Swift 支持 get-only、get+set、多参数类型重载
- Swift subscript 参数类型不受限制（ArkTS 限 string/number）
- Swift 使用 `newValue` 隐式参数，ArkTS 使用显式 `value` 参数

---

## 跨语言对比总结

| 特性 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 自定义索引语法 | `$_get/$_set` | N/A | `subscript` |
| 索引操作符 | `obj[i]` / `obj[i]=v` | `arr[i]` (仅数组) | `obj[i]` / `obj[i]=v` |
| 只读索引 | $_get only | N/A | get-only subscript |
| 只写索引 | $_set only | N/A | N/A (需 set+get) |
| 索引参数类型 | int / string | N/A | 任意类型 |
| 泛型支持 | 支持 | N/A | 支持 |
| 重载支持 | 有限（类层次） | N/A | 完全支持 |
| async 禁止 | ESY0220 编译错误 | N/A | N/A |
