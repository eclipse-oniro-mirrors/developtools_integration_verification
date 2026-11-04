# 14.3 Ambient Overload Function Declarations — 跨语言对比报告

## 1. 概览

| 语言 | 定位 | 函数重载机制 |
|------|------|-------------|
| ArkTS | 通过 `declare overload` 显式声明重载集 | ✅ 显式 overload 声明 |
| Java | 自动重载：同名不同参自动构成重载集 | ✅ 隐式自动重载 |
| Swift | 自动重载：同名不同参自动构成重载集 | ✅ 隐式自动重载 |

## 2. 章节对应关系

| ArkTS 14.3 | Java | Swift |
|-----------|------|-------|
| `declare function f1(p: string): void` + `declare overload f {f1, f2}` | 无需 explicit overload，同名即重载 | 无需 explicit overload，同名即重载 |
| Namespace 内 overload | 类内方法重载 | 嵌套类型内的函数重载 |
| 重载解析按列表顺序 | ✅ 重载解析按声明顺序 | ✅ 重载解析按声明顺序 |
| 返回类型不参与重载解析 | ✅ 同 | ✅ 同 |

## 3. 关键差异矩阵

| 特性 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 重载声明方式 | 显式 `declare overload` | 隐式（同名自动重载） | 隐式（同名自动重载） |
| declare/ambient 修饰 | ✅ 必须 declare | N/A | N/A |
| 空重载集 | ❌ spec 要求报错 | N/A | N/A |
| 重载等价签名 | ❌ spec 要求报错 | ❌ compile-time error | ❌ compile-time error |
| 引用未定义函数 | ❌ compile-time error | N/A | N/A |
| 可选参数重载 | ✅ 支持 | ❌ 不支持（需重载） | ❌ 不支持（需重载） |

## 4. 三环境实测结果

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | 顶层重载 | ✅ compile-pass | ✅ | ✅ |
| 002 | namespace 重载 | ✅ compile-pass | ✅ | ✅ |
| 003 | 三重载 | ✅ compile-pass | ✅ | ✅ |
| 004 | 不同参数个数 | ✅ compile-pass | ✅ | ✅ |
| 005 | 可选参数混合 | ✅ compile-pass | N/A | N/A |
| 006 | 函数内调用重载 | ✅ compile-pass | ✅ | ✅ |
| 007 | 引用未定义函数 | ✅ compile-fail | N/A | N/A |
| 008 | 重载等价签名 | ⚠️ D 类不一致 | N/A | N/A |
| 009 | 空重载集 | ⚠️ D 类不一致 | N/A | N/A |
| 010 | 未声明标识符 | ✅ compile-fail | N/A | N/A |
| 011 | 引用非 declare 函数 | ⚠️ D 类不一致 | N/A | N/A |
| 012 | runtime 共存 | ✅ runtime | N/A | N/A |

## 5. 关键差异详解

### 显式 vs 隐式重载声明

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `declare overload foo {f1, f2}` | ✅ 显式声明重载集 |
| Java | `void foo(String p) {} void foo(int p) {}` | ⚠️ 自动构成重载，无需显式声明 |
| Swift | `func foo(p: String) {} func foo(p: Int) {}` | ⚠️ 自动构成重载，无需显式声明 |

### 重载等价签名

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS (spec) | `fa(x: int): void` + `fb(x: int): void` | ❌ 应 compile-time error |
| ArkTS (实际) | 同上 | ⚠️ 当前编译器允许（D 类不一致）|
| Java | `void fa(int x) {} void fb(int x) {}` | ❌ compile-time error |
| Swift | `func fa(x: Int) {} func fb(x: Int) {}` | ❌ compile-time error |

## 6. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 重载声明灵活性 | ⭐⭐⭐（显式 + 隐式) | ⭐⭐（仅隐式） | ⭐⭐（仅隐式） |
| 编译器校验 | ⭐⭐（部分规则未实施） | ⭐⭐⭐（完整校验） | ⭐⭐⭐（完整校验） |
| 与 TS 兼容 | ⭐⭐⭐（与 TS 语法一致） | N/A | N/A |
| 可选参数 | ⭐⭐⭐（原生支持） | ⭐（需重载模拟） | ⭐（需重载模拟） |

## 7. 核心结论

1. ArkTS 的 `declare overload` 与 TypeScript 语法一致，属于显式重载声明，而 Java/Swift 使用隐式自动重载
2. 编译器对 14.3 的部分校验未实施（重载等价签名、空重载集、非 declare 函数引用），属于 D 类不一致
3. 引用未定义函数和未声明标识符的校验已正确实施
4. 可选参数与重载的组合是 ArkTS/TS 独有的简洁语法

## 8. ArkTS 设计建议

1. **修复编译器校验**：增加对重载等价签名、空重载集的检查，与 Java/Swift 行为对齐
2. **保持 overload 语法**：`declare overload` 显式声明方式适用于描述外部 API 的重载签名，建议保留
3. **补充文档**：spec 应明确定义 `declare overload` 的编译时错误场景（空集、等价签名等）
