# 3.1 Predefined Types - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

**报告日期：** 2026-06-11
**测试用例数：** 49（compile-pass: 18, compile-fail: 16, runtime: 15）
**目的：** 通过用例执行（编译期 + 真实运行时）以及 Java/Swift 对比，确认 ArkTS 行为与 spec 的一致性，并记录语言设计差异和待确认问题。

---

## 一、符合 ArkTS spec 的语言设计差异

### 差异 A：整数溢出静默回绕（符合 spec）

**用例：** TYP_03_01_041_RUNTIME_INT_OVERFLOW_WRAP

**ArkTS 实测行为：**
```typescript
let max: int = 2147483647
let overflow: int = max + 1   // -2147483648
let min: int = -2147483648
let underflow: int = min - 1  // 2147483647
```

**ArkTS spec 依据：**
§3.6.2 Integer Types and Operations 明确说明：
> The integer operators cannot indicate an overflow or an underflow.

**跨语言对比：**
| 语言 | 行为 | 结论 |
|------|------|------|
| ArkTS | 静默回绕 | 符合 spec |
| Java | 静默回绕 | 与 ArkTS 一致 |
| Swift | 默认 trap，需 `&+` 显式回绕 | 更严格 |

**分类：** 符合 ArkTS spec 的语言设计差异

---

### 差异 B：char 不能隐式 widening 到 int/long（符合当前实现，需以 char 实验章节为准）

**用例：** TYP_03_01_036_PASS_CHAR_OPERATIONS / TYP_03_01_037_FAIL_CHAR_INVALID

**ArkTS 实测行为：**
```typescript
let a: char = c'a'
let n: int = a   // 编译错误：Type 'Char' cannot be assigned to type 'Int'
```

**说明：**
ArkTS `char` 是实验特性，并未按 Java 的 integral numeric widening 规则处理。当前实现中 `char` 可进行 char 之间的比较，但不隐式转换为 `int`/`long`。

**跨语言对比：**
| 语言 | char→int |
|------|---------|
| ArkTS | 不允许隐式转换 |
| Java | 允许 widening（'a' → 97） |
| Swift | 无 char integral 类型，使用 Character |

**分类：** 符合当前 ArkTS 实现的语言设计差异；若 spec 需要说明，应在 char 实验章节中明确

---

### 差异 C：char 与 short/byte 不可互转（符合类型安全设计）

**用例：** TYP_03_01_037_FAIL_CHAR_INVALID

**ArkTS 实测行为：**
```typescript
let n: int = 65
let c: char = n   // 编译错误
```

**跨语言对比：**
| 语言 | int→char |
|------|---------|
| ArkTS | 不允许隐式转换 |
| Java | 不允许隐式转换，需强制 cast |
| Swift | 无对应 |

**分类：** 符合 ArkTS spec 的语言设计差异

---

### 差异 D：预定义类型名不能作为变量名（符合 lexical/name 规则）

**用例来源：** TYP_03_01_011 / TYP_03_01_047 修复过程中发现

**ArkTS 实测行为：**
```typescript
let double: (x: int) => int = ...  // 编译错误：double is a predefined type
let char: string = "a"             // 编译错误：char is a predefined type
```

**ArkTS spec 依据：**
§Lexical Elements / Keywords 中规定预定义类型名及别名是 hard keywords，不能作为标识符。

**跨语言对比：**
| 关键字作变量名 | ArkTS | Java | Swift |
|---------------|-------|------|-------|
| `int` | 不允许 | 不允许 | 允许（非关键字） |
| `double` | 不允许 | 不允许 | 允许（非关键字） |
| `char` | 不允许 | 不允许 | 允许（非关键字） |
| `string` | 不允许 | 允许（非关键字） | 允许（非关键字） |

**分类：** 符合 ArkTS spec 的语言设计差异

---

### 差异 F：嵌套函数被禁止（符合 ArkTS 静态语法限制）

**触发场景：** 多个用例初版中出现函数内声明函数

**ArkTS 实测行为：**
```typescript
function outer(): void {
  function inner(): void {}  // ESY0135: Nested functions are not allowed
}
```

**说明：**
当前 ArkTS 静态实现禁止嵌套函数，测试用例需将辅助函数提升到顶层。

**跨语言对比：**
| 语言 | 嵌套函数 |
|------|---------|
| ArkTS | 不支持 |
| Java | 不支持普通嵌套函数，可用 lambda/local class 替代 |
| Swift | 支持 |

**分类：** 符合 ArkTS 当前语言限制的设计差异

---

### 差异 G：局部类、局部 type alias 被禁止（符合 ArkTS 当前实现限制）

**触发场景：** 多个用例初版中出现函数体内 `class` 或 `type`

**ArkTS 实测行为：**
```typescript
function test(): void {
  class Inner {}                  // ESY0040
  type IntOp = (x: int) => int    // ESY0040
}
```

**跨语言对比：**
| 语言 | 局部类 | 局部 type alias |
|------|-------|----------------|
| ArkTS | 不支持 | 不支持 |
| Java | 支持 local class | 无 type alias |
| Swift | 支持 | 支持 typealias |

**分类：** 符合 ArkTS 当前实现限制的设计差异

---

### 差异 H：Array.pop() 返回 `T | undefined`（符合 nullish 安全设计）

**用例：** TYP_03_01_013_PASS_ARRAY_RESIZABLE / TYP_03_01_034_RUNTIME_ARRAY_RESIZABLE_OPS

**ArkTS 实测行为：**
```typescript
let arr: int[] = [1, 2, 3]
let n: int = arr.pop()                // 编译错误
let m: int | undefined = arr.pop()    // OK
```

**跨语言对比：**
| 语言 | pop/删除末尾返回 |
|------|----------------|
| ArkTS | `T | undefined` |
| Java | `ArrayList.remove(index): T`，空或越界抛异常 |
| Swift | `popLast(): T?` |

**分类：** 符合 ArkTS spec / nullish 安全的语言设计差异

---

## 二、待确认问题

### 待确认 E：Spec 提到的 `asIntN` / `asUintN` 函数未在当前 stdlib 中可见

**用例来源：** 早期 TYP_03_01_033 设计中曾尝试调用 `asIntN` / `asUintN`

**ArkTS Static Spec 依据：**
§3.14 Type bigint 提到：
```typescript
asIntN(bitsCount: long, bigIntToCut: bigint): bigint
asUintN(bitsCount: long, bigIntToCut: bigint): bigint
```

**当前实测：**
```typescript
let a: bigint = 0xFFn
let lower4: bigint = asIntN(4, a)    // 编译器报 Unresolved reference asIntN
let lower4u: bigint = asUintN(4, a)  // 编译器报 Unresolved reference asUintN
```

**当前结论：**
该问题暂不直接定性为 ArkTS 设计缺陷，需要补充 **标准库规范依据** 后再确认：

1. 如果 stdlib 规范明确导出全局函数 `asIntN` / `asUintN`，则这是实现缺失或导出问题。
2. 如果 stdlib 规范定义调用形式为 `BigInt.asIntN` / `BigInt.asUintN`，则当前调用方式需要调整。
3. 如果 stdlib 未定义这些 API，则应修正 ArkTS Static Spec §3.14 的表述。

**待补充材料：**
- ArkTS Standard Library 对 BigInt / bigint helper APIs 的正式定义
- `asIntN` / `asUintN` 的实际导出位置、调用形式、模块路径

**分类：** 待确认问题（需要 stdlib 规范依据）

---

## 三、已验证 ArkTS 行为（与规范一致）

| 行为 | 用例编号 | 状态 |
|------|---------|------|
| 整数除零抛 ArithmeticError | 029 | ✅ |
| try-catch 可捕获 ArithmeticError | 049 | ✅ |
| 浮点 0/0 = NaN | 030 | ✅ |
| 浮点 1/0 = Infinity | 030 | ✅ |
| NaN != NaN | 030 | ✅ |
| && / \|\| 短路求值 | 043 | ✅ |
| Object instanceof 子类 | 044 | ✅ |
| T\|null 类型收窄 | 045 | ✅ |
| FixedArray 元素可改长度不可变 | 046 | ✅ |
| char ASCII 序比较 | 048 | ✅ |
| bigint 任意精度 | 033 | ✅ |
| Array push/pop/迭代 | 034 | ✅ |
| 函数类型变量调用 | 047 | ✅ |
| 浮点 gradual underflow | 042 | ✅ |
| Any 持有 null | 031 | ✅ |

---

## 四、分类汇总

| 分类 | 条目 |
|------|------|
| 符合 ArkTS spec / 当前实现的语言设计差异 | A, B, C, D, F, G, H |
| 待确认问题 | E |
| 已验证规范一致行为 | 15 项 |

---

## 五、后续建议

1. 不再将 A/B/D/F/G/H 描述为 HIGH/MEDIUM/LOW 设计缺陷，而统一表述为"符合 ArkTS spec 的语言设计差异"。
2. 对 E 单独补充 stdlib 规范依据后再判断是否属于 spec/实现不一致。
3. 若后续拿到 stdlib BigInt API 规范，应更新本报告 E 条目。
