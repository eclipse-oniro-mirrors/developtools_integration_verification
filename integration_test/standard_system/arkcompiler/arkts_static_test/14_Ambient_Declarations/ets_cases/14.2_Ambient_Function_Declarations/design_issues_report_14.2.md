# 14.2 Ambient Function Declarations — 跨语言行为差异及规范一致性报告

## 总览

ArkTS 14.2 Ambient Function Declarations 的核心规范：
1. 必须显式指定返回类型 — 否则 compile-time error
2. 参数不能有默认值 — 否则 compile-time error
3. 不能有函数体 — 否则 compile-time error
4. 不能使用 `async` 修饰符 — 否则 compile-time error

## 已校验规则

所有 4 条规则均已通过 compile-fail 用例验证，编译器全部正确实施：

| 规则 | 验证用例 | 结果 |
|------|---------|------|
| 无返回类型 → compile-time error | AMB_14_02_009_FAIL | ✅ 正确报错 |
| 参数默认值 → compile-time error | AMB_14_02_010_FAIL | ✅ 正确报错 |
| 函数体 → compile-time error | AMB_14_02_011_FAIL | ✅ 正确报错 |
| async 修饰符 → compile-time error | AMB_14_02_012_FAIL | ✅ 正确报错 |
| 可选参数+默认值 → compile-time error | AMB_14_02_013_FAIL | ✅ 正确报错 |
| 多参数含默认值 → compile-time error | AMB_14_02_014_FAIL | ✅ 正确报错 |
| 布尔默认值 → compile-time error | AMB_14_02_015_FAIL | ✅ 正确报错 |

## 已知差异

**无。** 14.2 节所有编译器行为与 spec 完全一致，无待解决问题。

## 跨语言差异

| 特性 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 外部函数签名声明 | `declare function` | 接口抽象方法 | Protocol 方法声明 |
| 可选参数 | 原生支持 `param?: type` | 不支持，需重载 | 不支持，需重载 |
| 联合类型参数 | 支持 `int \| string` | 不支持 | 不支持 |
| async 修饰符 | 明确禁止 | 不支持（无 async 关键字） | 不支持 |

## 总结

| ID | 问题 | 严重性 | 分类 |
|----|------|--------|------|
| — | 无待解决问题 | — | — |
