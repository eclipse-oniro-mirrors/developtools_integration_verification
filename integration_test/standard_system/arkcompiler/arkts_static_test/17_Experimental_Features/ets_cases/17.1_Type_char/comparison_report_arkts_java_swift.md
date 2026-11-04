# 17.1 Type char - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-23
**规范来源：** ArkTS Static Spec §17.1, Java JLS SE21 §4.2.1, Swift Language Reference (Types)
**测试基础：** 13 个用例（5 compile-pass + 5 compile-fail + 3 runtime 真实执行）

---

## 一、概览：三语言定位

| 语言 | char 类型定位 | 设计哲学 |
|------|------------|---------|
| **ArkTS** | class 类型，Object 子类型，16-bit Unicode | 面向对象 + 类型安全，char 是完整的类 |
| **Java** | 原始整数类型（primitive），16-bit unsigned | char 是数值类型，可参与算术和 widening |
| **Swift** | Character 引用类型（extended grapheme cluster） | 完全不同的概念，无 16-bit 整数 char |

---

## 二、章节对应关系

| ArkTS 17.1 | Java JLS §4.2.1 | Swift | 备注 |
|------------|-----------------|-------|------|
| char 声明 `let c: char = c'a'` | `char c = 'a'` | N/A (Character) | 语法不同 |
| char 是 class 类型 | char 是 primitive | Character 是 struct | 类型本质完全不同 |
| char 是 Object 子类型 | char 需装箱为 Character | Character 不是 AnyObject 子类型（struct） | ArkTS 最面向对象 |
| char->int 禁止 | char->int 允许（widening） | N/A | 关键差异 |
| char 关键字 | char 是保留字 | 无 char 关键字 | ArkTS/Java 类似 |

---

## 三、关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| char 类型本质 | class 类型 | 原始整数类型 | Character struct |
| char 是 Object 子类型 | ✅ 直接赋值 | ⚠️ 需自动装箱 | ❌ struct 不继承 |
| char->int 隐式转换 | ❌ 编译错误 | ✅ widening | N/A |
| int->char 隐式转换 | ❌ 编译错误 | ❌ 需强制转换 | N/A |
| char 作为函数参数/返回类型 | ✅ | ✅ | ✅ |
| char[] 数组 | ✅ | ✅ | ✅ [Character] |
| char 关键字作为变量名 | ❌ | ❌ | ✅ (无此关键字) |

---

## 四、用例 1:1 对照（三环境实测结果）

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | char 变量声明初始化 | ✅ compile-pass | ✅ compile-pass | N/A |
| 002 | char 赋值给 Object | ✅ compile-pass | ✅ (auto-boxing) | N/A |
| 003 | char 函数参数/返回 | ✅ compile-pass | ✅ compile-pass | N/A |
| 004 | char 类字段 | ✅ compile-pass | ✅ compile-pass | N/A |
| 005 | char 泛型数组 | ✅ compile-pass | ✅ compile-pass | N/A |
| 006 | int 赋给 char | ✅ compile-fail | ✅ (literal) / ❌ (variable) | N/A |
| 007 | char 赋给 int | ✅ compile-fail | ✅ compile-pass | N/A |
| 008 | string 赋给 char | ✅ compile-fail | ✅ compile-fail | N/A |
| 009 | boolean 赋给 char | ✅ compile-fail | ✅ compile-fail | N/A |
| 010 | char 作为变量名 | ✅ compile-fail | ✅ compile-fail | N/A |
| 011 | c'a' == 0x61 验证 | ✅ runtime | ✅ runtime | N/A |
| 012 | char Object instanceof | ✅ runtime | ✅ runtime | N/A |
| 013 | char[] 数组操作 | ✅ runtime | ✅ runtime | N/A |

### 关键差异详解

#### 用例 007: char->int 转换 ⭐

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `let ch: char = c'A'; let n: int = ch` | ❌ 编译错误：Type 'Char' cannot be assigned to 'Int' |
| Java | `char ch = 'A'; int n = ch` | ✅ 编译通过：widening primitive conversion |
| Swift | N/A | N/A |

#### 用例 002: char->Object 赋值 ⭐

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `let o: Object = c'A'` | ✅ 直接赋值（char 是 Object 子类型） |
| Java | `Object o = 'A'` | ✅ 自动装箱为 Character（不是子类型关系） |
| Swift | N/A | Character 是 struct，不继承 AnyObject |

---

## 五、综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 类型安全性 | ★★★★★ | ★★★★☆ | ★★★★★ |
| 面向对象一致性 | ★★★★★ | ★★★☆☆ | N/A |
| 简洁性 | ★★★★☆ | ★★★★★ | N/A |
| 与数值类型互操作 | ★★★☆☆ | ★★★★★ | N/A |

---

## 六、核心结论

1. **ArkTS char 是 Java char 和 Swift Character 之间的特殊设计**：作为 class 类型而非原始类型，更面向对象；但不支持 Java char 的数值 widening/算术运算，更类型安全。
2. **char 与 int 不可互转是 ArkTS 的关键设计选择**，与 Java 不同但增强了类型安全性。
3. **Swift 无对应概念**：Swift 的 Character 是完全不同的设计（扩展字位簇），不适用比较。

---

## 七、ArkTS 设计建议

1. 当前设计（char 作为 class 类型、禁止与 int 隐式转换）是一致的、合理的安全设计。
2. 如需数值转换，可考虑提供显式转换方法（如 `char.code` 或 `char.toInt()`）。
