# 7.7 Spread Expression — 三语言对比报告

## 1. 概览

Spread Expression 定义了 `...` 扩展运算符在数组字面量和函数调用中的语义：

| 语言 | 定位 |
|------|------|
| **ArkTS** | 原生 `...` 扩展语法：数组/元组/字符串扩展、rest 参数、值复制、readonly 支持 |
| **Java** | 无扩展语法，使用 `Collections.addAll`、`Stream.concat`、`clone()` 模拟 |
| **Swift** | 无扩展语法，使用 `+` 数组合并、`Array()` 构造器、variadic 参数模拟 |

## 2. 章节对应关系

| 规则 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 数组扩展 | `[...arr]` | `arr.clone()` 或 `Arrays.copyOf` | `Array(arr)` |
| FixedArray 扩展 | `[...fixedArr]` | ❌ 无等价类型 | ❌ 无等价类型 |
| 多扩展合并 | `[...a1, ...a2]` | `Collections.addAll` / `Stream.concat` | `a1 + a2` |
| 扩展+字面量 | `[...a1, 42, ...a2]` | `mergeMixed` 辅助方法 | `a1 + [literal] + a2` |
| Rest 函数调用 | `foo(...arr)` | `foo(arr)`（数组即 varargs） | `fooArray(arr)`（辅助函数） |
| 嵌套扩展 | `foo(...[...arr])` | 无等价语法 | 无等价语法 |
| 元组扩展调用 | `bar(...tuple)` | 无等价 | 无等价 |
| 字符串扩展 | `[...s]` (s: string) | ❌ 无语法 | ❌ 无语法 |
| 复制语义 | 值复制 ✅ | `clone()` ✅ | 值类型语义 ✅ |
| 只读源扩展 | `[...readonlyArr]` | ❌ 无 readonly 类型 | `let` 不可变语义 |

## 3. 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 扩展语法 | ⭐⭐⭐⭐⭐ `...` | ⭐⭐ 需手动合并 | ⭐⭐⭐ `+` 运算符 |
| Rest 参数 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ varargs | ⭐⭐⭐ variadic |
| 只读支持 | ⭐⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐ let |
| 复制语义 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ clone() | ⭐⭐⭐⭐⭐ 值语义 |
| FixedArray 支持 | ⭐⭐⭐⭐⭐ | ❌ | ❌ |

## 4. 用例对照

### 4.1 扩展表达式语法（ArkTS 独有）

| 语言 | 代码 |
|------|------|
| ArkTS | `let result: int[] = [...a1, 42, ...a2]` |
| Java | `Integer[] r = mergeMixed(a1, 42, a2)`（自定义辅助方法） |
| Swift | `let r = a1 + [42] + a2` |

### 4.2 Rest 函数调用

| 语言 | 代码 |
|------|------|
| ArkTS | `function foo(...p: int[]) {}` → `foo(...arr)` |
| Java | `void foo(Integer... p) {}` → `foo(arr)`（数组直接传递） |
| Swift | `func foo(_ p: Int...) {}` → `fooArray(arr)`（需辅助函数） |

### 4.3 复制语义

| 语言 | 复制行为 |
|------|---------|
| ArkTS | `let b = [...a]; b[0]=99` → a[0] 不变 ✅ |
| Java | `Integer[] b = a.clone(); b[0]=99` → a[0] 不变 ✅ |
| Swift | `var b = a; b[0]=99` → a[0] 不变 ✅ |

### 4.4 编译时错误检查

| 错误类型 | ArkTS | Java | Swift |
|---------|-------|------|-------|
| 非 iterable 类型扩展 | ✅ 编译时错误 | N/A（无扩展语法） | N/A（无扩展语法） |
| 非 rest 参数扩展 | ✅ 编译时错误 | ❌ 数组不能传递给非 varargs | ❌ 数组不能传递给非 variadic |

## 5. 三环境实测结果

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | 基本 int[] 数组扩展 | ✅ compile-pass | ✅ | ✅ |
| 002 | FixedArray 扩展 | ✅ compile-pass | ❌ N/A | ❌ N/A |
| 003 | 多扩展合并 | ✅ compile-pass | ✅ | ✅ |
| 004 | 扩展+字面量混合 | ✅ compile-pass | ✅ | ✅ |
| 005 | 函数调用扩展 | ✅ compile-pass | ✅ | ✅ |
| 006 | 多扩展函数调用 | ✅ compile-pass | ✅ | ✅ |
| 007 | 函数返回值扩展 | ✅ compile-pass | ✅ | ✅ |
| 008 | 嵌套扩展 | ✅ compile-pass | ❌ N/A | ❌ N/A |
| 009 | 只读源数组扩展 | ✅ compile-pass | ❌ N/A | ✅ |
| 010 | 元组扩展函数调用 | ✅ compile-pass | ❌ N/A | ❌ N/A |
| 011 | 字符串扩展 | ✅ compile-pass | ❌ N/A | ❌ N/A |
| 012 | 元组扩展字面量 | ✅ compile-pass | ❌ N/A | ❌ N/A |
| 013 | 非 iterable 类扩展 | ❌ 编译时错误 | ❌ N/A | ❌ N/A |
| 014 | 非 iterable 数值扩展 | ❌ 编译时错误 | ❌ N/A | ❌ N/A |
| 015 | 数组非 rest 参数 | ❌ 编译时错误 | ❌ 编译时错误 | ❌ 编译时错误 |
| 016 | 元组非 rest 参数 | ❌ 编译时错误 | ❌ N/A | ❌ N/A |
| 017 | 基本扩展值正确 | ✅ runtime | ✅ | ✅ |
| 018 | 复制语义 | ✅ runtime | ✅ | ✅ |
| 019 | 多扩展合并正确性 | ✅ runtime | ✅ | ✅ |
| 020 | 扩展混合字面量 | ✅ runtime | ✅ | ✅ |
| 021 | 函数调用扩展 | ✅ runtime | ✅ | ✅ |
| 022 | 只读源扩展 | ✅ runtime | ✅ | ✅ |

## 6. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 扩展语法丰富性 | ⭐⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐ |
| 编译时检查 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| 复制语义 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 只读数组支持 | ⭐⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐ |
| FixedArray 支持 | ⭐⭐⭐⭐⭐ | ❌ | ❌ |

## 7. 核心结论

1. **ArkTS 的扩展表达式是独有优势**：`...` 语法在数组字面量和函数调用中提供简洁的扩展语义。
2. **复制语义三语言一致**：扩展/克隆/赋值均执行值复制，互不影响。
3. **编译时类型安全**：ArkTS 对非 iterable 类型和非 rest 参数扩展提供编译时错误。
4. **只读源数组支持**：ArkTS 的 readonly 数组扩展后目标数组可读写，行为合理。
5. **字符串/元组扩展是 ArkTS 独有特性**：Java 和 Swift 均不支持。

## 8. ArkTS 设计建议

- 当前设计完善，无缺陷。
- 扩展表达式语法显著提高了数组操作的简洁性和可读性。
- 编译时多维检查（非 iterable、非 rest 参数）提供了系统的安全保证。

## 9. 三环境实测验证

实测代码和报告见 `cross_lang_verify/` 目录（2026-07-28 实测）：

| 文件 | 实测结果 |
|------|:--------:|
| `JavaSpreadTest.java` + `.class` | 8/8 ✅ |
| `SwiftSpreadTest.swift` + 二进制 | 8/8 ✅ |
| `verification_report.md` | 三环境结果对照 |

**实测关键验证点：**
- 数组扩展：Java `System.arraycopy` / Swift `arr1 + arr2`
- 函数调用扩展：Java varargs / Swift variadic parameters
- 复制语义：三语言均互不影响
- 多扩展合并：Swift `[1,2] + [3,4] == [1,2,3,4]`
