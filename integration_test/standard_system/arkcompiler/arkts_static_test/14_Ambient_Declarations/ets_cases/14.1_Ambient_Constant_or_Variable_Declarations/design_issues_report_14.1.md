# 14.1 Ambient Constant or Variable Declarations — 跨语言行为差异及规范一致性报告

## 总览

ArkTS 14.1 Ambient Constant or Variable Declarations 的核心规范：
1. Ambient 声明必须具有显式类型注解
2. Ambient 声明不能有初始化器
3. 违反任一规则 → compile-time error

## 已知差异

### D-14.1-01: 初始化器检查缺失

**描述**：ArkTS 编译器当前允许 ambient let/const 声明带初始化器，但 spec 要求 compile-time error。

**复现用例**：
- AMB_14_01_015_FAIL_LET_WITH_INIT.ets (`declare let v = 1`)
- AMB_14_01_016_FAIL_CONST_WITH_INIT.ets (`declare const c = 1`)
- AMB_14_01_019_FAIL_LET_STRING_INIT.ets (`declare let v = "hello"`)
- AMB_14_01_020_FAIL_CONST_STRING_INIT.ets (`declare const c = "world"`)
- AMB_14_01_021_FAIL_LET_BOOL_INIT.ets (`declare let v = true`)
- AMB_14_01_022_FAIL_CONST_BOOL_INIT.ets (`declare const c = false`)
- AMB_14_01_023_FAIL_LET_ARRAY_INIT.ets (`declare let arr = [1, 2, 3]`)
- AMB_14_01_024_FAIL_MULTI_WITH_INIT.ets (`declare let a: int, b: string, c = true`)

**跨语言对比**：

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS (spec) | `declare let v = 1` | ❌ compile-time error |
| ArkTS (实际) | `declare let v = 1` | ✅ 编译通过（与 spec 矛盾） |
| Java | N/A | Java 无 ambient declare 概念 |
| Swift | N/A | Swift 无 ambient declare 概念 |

**严重性**：MEDIUM
**分类**：D 类（Spec 与实现不一致）
**后续建议**：
1. 编译器应增加对 ambient 声明的校验：检查是否有初始化器
2. 检查是否涉及 TypeScript 兼容性考虑（TS 同样禁止 ambient 声明带初始化器）

### D-14.1-02: 显式类型注解检查缺失

**描述**：ArkTS 编译器当前允许 ambient let/const 声明不带类型注解，但 spec 要求显式类型注解。

**复现用例**：
- AMB_14_01_017_FAIL_LET_NO_TYPE.ets (`declare let v`)
- AMB_14_01_018_FAIL_CONST_NO_TYPE.ets (`declare const c`)

**跨语言对比**：

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS (spec) | `declare let v` | ❌ compile-time error |
| ArkTS (实际) | `declare let v` | ✅ 编译通过（与 spec 矛盾） |
| Java | N/A | Java 无 ambient declare 概念 |
| Swift | N/A | Swift 无 ambient declare 概念 |

**严重性**：MEDIUM
**分类**：D 类（Spec 与实现不一致）
**后续建议**：
1. 编译器应增加对 ambient 声明的校验：检查是否缺少类型注解
2. TypeScript 中 `declare let v` 也是 compile error（TS 要求 declare 变量必须有类型注解），建议对齐

## 总结

| ID | 问题 | 严重性 | 分类 | 状态 |
|----|------|--------|------|------|
| D-14.1-01 | Ambient 声明初始化器检查缺失 | MEDIUM | D 类 | 🔄 已于 2026-06-26 确认修复 |
| D-14.1-02 | Ambient 声明显式类型注解检查缺失 | MEDIUM | D 类 | 🔄 已于 2026-06-26 确认修复 |

> **2026-06-26 更新：** 当前编译器版本已正确强制执行两个约束。
> - `declare let v = 1` → Semantic error ESE125125: "Initializers are not allowed in ambient contexts"
> - `declare let v` → Semantic error ESE1111: "Missing type annotation for the 'v'"
> 
> **2026-07-17 复测确认：** 两个约束仍被正确强制执行，修复有效。✅

保留本条历史记录作为档案，标记为已修复。
