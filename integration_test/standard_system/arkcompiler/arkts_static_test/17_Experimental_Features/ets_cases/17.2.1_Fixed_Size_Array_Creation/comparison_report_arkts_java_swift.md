# 17.2.1 Fixed-Size Array Creation - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-25
**规范来源：** ArkTS Static Spec §17.2.1, Java JLS SE21 §10.3, Swift Language Reference (Collection Types)
**测试基础：** 14 个用例（7 compile-pass + 4 compile-fail + 3 runtime）

---

## 一、概览：三语言定位

| 语言 | 定长数组创建方式 | 设计哲学 |
|------|--------------|---------|
| **ArkTS** | 字面量 `[e1, e2, e3]` 或构造函数 `new FixedArray\<T\>(len, elem)` | 双创建途径：字面量（元素已知）和构造函数（批量初始化） |
| **Java** | 字面量 `{1, 2, 3}`（仅声明时）或 `new int[]{1, 2, 3}` 或 `new int[5]` + 手动初始化 | 声明时字面量或运行时 new，无批量初始化语法 |
| **Swift** | 字面量 `[1, 2, 3]` 或 `Array(repeating: 0, count: 5)` | 字面量（类型推断）和重复值构造器 |

---

## 二、章节对应关系

| ArkTS §17.2.1 | Java JLS §10.3 | Swift | 备注 |
|--------------|---------------|-------|------|
| `new FixedArray\<int\>(5, 0)` | `new int[5]` + `Arrays.fill(arr, 0)` | `Array(repeating: 0, count: 5)` | ArkTS 一步完成 |
| `let a: FixedArray\<int\> = [1, 2, 3]` | `int[] a = {1, 2, 3}` | `let a = [1, 2, 3]` | 语法类似 |
| 字面量传递给 FixedArray 形参 | 字面量传递给 int[] 形参 | 字面量传递给 [Int] 形参 | 三国行为一致 |
| 类型擦除保护（拒绝 T） | 拒绝 `new T[n]` | 支持泛型 Array\<T\> | ArkTS/Java 类似 |
| 长度参数类型检查 | 严格 int | 严格 int | 严格 Int | 三国一致 |

---

## 三、关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 批量初始化语法 | `new FixedArray\<T\>(len, elem)` | 无语法糖，需手动 fill | `Array(repeating:count:)` |
| 字面量类型注解 | `let a: FixedArray\<int\> = [...]` | `int[] a = {...}` | `let a: [Int] = [...]` |
| 字面量类型推断 | 传递给 FixedArray\<T\> 形参可推断 | 仅声明时推断 | 完全推断 |
| 类型擦除 T 拒绝 | ESE0007（编译期） | 编译错误 | 合法 |
| 长度参数非 int 拒绝 | ESE0236（编译期） | 编译错误 | 编译错误 |
| 参数个数校验 | 缺失（cf_bad） | 严格 | 严格 |

---

## 四、用例 1:1 对照（三环境实测结果）

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | FixedArray\<int\> 构造函数创建 | compile-pass | compile-pass (new + fill) | compile-pass |
| 002 | FixedArray\<string\> 构造函数创建 | compile-pass | compile-pass | compile-pass |
| 003 | FixedArray\<float/double\> 构造函数创建 | compile-pass | compile-pass | compile-pass |
| 004 | 字面量 + 显式类型注解 | compile-pass | compile-pass | compile-pass |
| 005 | 字面量 + 类型推断 | compile-pass | compile-pass | compile-pass |
| 006 | 下标读写 | compile-pass | compile-pass | compile-pass |
| 007 | length 属性访问 | compile-pass | compile-pass | compile-pass |
| 010 | 类型擦除拒绝 T | compile-fail (ESE0007) | compile-fail | N/A |
| 011 | 联合类型含 T 拒绝 | compile-fail (ESE461884) | compile-fail | N/A |
| 012 | 构造函数参数个数错误 | cf_bad（意外通过） | compile-fail | compile-fail |
| 013 | 非 int 长度参数 | compile-fail (ESE0236) | compile-fail | compile-fail |
| 020 | 元素个数运行时验证 | runtime-pass | runtime-pass | runtime-pass |
| 021 | 元素初始化值运行时验证 | runtime-pass | runtime-pass | runtime-pass |
| 023 | length 创建后正确 | runtime-pass | runtime-pass | runtime-pass |

---

## 五、关键差异详解

### 构造函数批量初始化语法

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `let a = new FixedArray\<int\>(5, 0)` | 一步创建 5 个元素，均为 0 |
| Java | `int[] a = new int[5]; Arrays.fill(a, 0)` | 两步：创建 + 填充 |
| Swift | `let a = Array(repeating: 0, count: 5)` | 一步完成，标签参数风格 |

ArkTS 语法最紧凑，无额外 import 或链式调用。

### 类型擦除保护对比

| 语言 | `new T[n](elem)` 在泛型上下文中 |
|------|------------------------------|
| ArkTS | ESE0007 拒绝 (FixedArray) |
| Java | 编译错误：generic array creation |
| Swift | 合法，Array\<T\> 支持泛型 |

ArkTS 与 Java 在此行为上一致，均拒绝泛型类型参数用于数组创建。

---

## 六、综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 创建语法简洁性 | 5/5 | 3/5 | 4/5 |
| 类型推断能力 | 4/5 | 3/5 | 5/5 |
| 类型擦除安全性 | 5/5 | 5/5 | 3/5 |
| 参数校验完整性 | 3/5 | 5/5 | 5/5 |
| 编译期错误检测 | 5/5 | 5/5 | 5/5 |

---

## 七、核心结论

1. **ArkTS 的 `new FixedArray\<T\>(len, elem)` 是三语言中最紧凑的批量初始化语法**，比 Java 少一步、比 Swift 少标签参数。
2. **类型擦除保护与 Java 一致**：拒绝泛型上下文中使用类型参数创建数组，提升类型安全。
3. **参数个数校验缺失（cf_bad）是需要修复的编译器缺陷**：Java 和 Swift 均严格校验参数个数。
4. **字面量创建和类型推断与 Java/Swift 行为一致**。

---

## 八、ArkTS 设计建议

1. 修复 FixedArray 构造函数参数个数校验缺失（cf_bad），与 Java/Swift 行为对齐。
2. 当前类型擦除保护设计（ESE0007、ESE461884）合理，建议保持。
3. 长度参数类型严格检查（ESE0236）与 Java/Swift 一致，建议保持。
