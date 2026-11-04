# 17.15 Accessor Declarations - 三环境实测验证报告

**测试日期：** 2026-06-23

---

## ArkTS 实测结果

| # | 用例 | 预期 | 实测 |
|---|------|------|------|
| 001 | EXP2_17_15_001_PASS_GETTER_COMPUTED | compile-pass | ✅ compile-pass |
| 002 | EXP2_17_15_002_PASS_SETTER_ASSIGN | compile-pass | ✅ compile-pass |
| 003 | EXP2_17_15_003_PASS_GETTER_SETTER_PAIR | compile-pass | ✅ compile-pass |
| 004 | EXP2_17_15_004_PASS_NAMESPACE_GETTER | compile-pass | ✅ compile-pass |
| 005 | EXP2_17_15_005_PASS_NAMESPACE_SETTER | compile-pass | ✅ compile-pass |
| 006 | EXP2_17_15_006_PASS_GETTER_INFER | compile-pass | ✅ compile-pass |
| 007 | EXP2_17_15_007_FAIL_GETTER_AS_CALL | compile-fail | ✅ ESE0289: This expression is not callable |
| 008 | EXP2_17_15_008_FAIL_SETTER_OPTIONAL_PARAM | compile-fail | ✅ ESY13534: Setter cannot have optional parameter |
| 009 | EXP2_17_15_009_FAIL_GETTER_WITH_PARAM | compile-fail | ✅ ESY0058: Getter must not have formal parameters |
| 010 | EXP2_17_15_010_FAIL_NATIVE_GETTER_BODY | compile-fail | ✅ ESE0083: Native cannot have body |
| 011 | EXP2_17_15_011_FAIL_NONNATIVE_NO_BODY | compile-fail | ✅ ESE0017: Only abstract or native methods can't have body |
| 012 | EXP2_17_15_012_RUNTIME_GETTER_VALUE | runtime | ✅ verified: getter returned 42 |
| 013 | EXP2_17_15_013_RUNTIME_SETTER_UPDATE | runtime | ✅ verified: setter stored 100 |
| 014 | EXP2_17_15_014_RUNTIME_PAIR_INTERACTION | runtime | ✅ verified: final=25 |
| 015 | EXP2_17_15_015_RUNTIME_NAMESPACE | runtime | ✅ verified: namespace getter/setter, final=84 |

---

## Java 实测结果

**编译器：** javac 21.0.11
**运行时：** java (Java 21)

| 测试点 | 代码 | 结果 |
|--------|------|------|
| Getter via method | `getValue()` returns 42 | ✅ |
| Setter via method | `setValue(42)` updates backing | ✅ |
| Getter+setter interaction | multiple set/get cycles | ✅ |

**结论：** Java 不支持顶层 getter/setter 声明。Java 的 getter/setter 通过显式方法调用 `getXxx()`/`setXxx()` 实现，不能像变量一样使用 `x = val` 语法。ArkTS 的 getter/setter 更像 Swift 的 computed properties。

---

## Swift 实测结果

**状态：** Swift 5.10 未安装在该环境中。

**文档分析：**
Swift 的 computed properties 是 ArkTS accessor declarations 的最直接对应物：
```swift
var backingValue: Int = 0
var value: Int {
    get { return backingValue }
    set { backingValue = newValue }
}
// Usage: value = 42; print(value)
```

Swift 支持：
- 顶层 computed properties (全局作用域)
- 只读 computed properties (仅 get)
- 类型属性 (static/class)
- `newValue` 默认参数名
- 属性观察器 (willSet/didSet)

**预估结果：** Swift 完整支持 ArkTS 的 getter/setter 概念，且在以下方面更较强：
- 属性观察器
- 默认 newValue 参数
- 更丰富的属性包装器

---

## 关键差异总结

| 特性 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 顶层 getter/setter | ✅ `get/set name()` | ❌ 不支持 | ✅ computed property |
| 变量式使用语法 | ✅ `x = val` | ❌ `setX(val)` | ✅ `x = val` |
| Setter 不允许返回类型 | ✅ 编译器强制 | N/A (方法可以) | ✅ implicit |
| Getter 返回类型推断 | ✅ 支持 | N/A | ✅ 支持 |
| Setter 可选参数禁止 | ✅ 编译错误 | N/A | ✅ (无此概念) |
| Native 访问器 | ✅ `native get` | ✅ `native` 方法 | ❌ (无 direct native) |
| 命名空间内访问器 | ✅ | ❌ | N/A (无命名空间) |
| 属性观察器 | ❌ | N/A | ✅ willSet/didSet |
