# 3.6.1 Numeric Types - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

**报告日期：** 2026-06-11
**测试用例数：** 20（10 compile-pass + 5 compile-fail + 5 runtime）
**目的：** 通过用例执行 + 跨语言对比，识别 ArkTS 数值类型设计

---

---

## 报告分类口径

| 分类 | 含义 | 处理方式 |
|------|------|----------|
| 符合 ArkTS spec 的语言设计差异 | 行为与 Java/Swift 不同，但符合 ArkTS spec 或当前明确语义 | 不标为缺陷，仅记录差异 |
| Spec 与实现不一致 | 用例与 spec 要求不一致，且当前实现未按 spec 报错/运行 | 保留 FAIL 用例并记录 issue_report |
| 待确认问题 | 需要补充 stdlib/spec/实现依据后才能定性 | 暂不判定为缺陷 |
| 已验证规范一致行为 | 用例验证 ArkTS 行为符合 spec | 记录为通过项 |

## 一、行为差异与规范一致性概览

**无新发现的未解决规范/实现不一致问题。**

3.6.1 章节用例本次执行 100% 通过，未触发任何编译器异常或语义反直觉行为。

---

## 二、已验证的 ArkTS 规范一致行为

| 验证点 | 用例 | 状态 |
|-------|------|------|
| 6 种数值类型基本声明 | 001 | ✅ |
| 各类型边界值 | 002, 016 | ✅ |
| byte→更大类型 widening | 003, 017 | ✅ |
| short→更大类型 widening | 004 | ✅ |
| int/long/float widening | 005 | ✅ |
| 数值类型作 Object 子类型 | 006, 020 | ✅ |
| new T() 构造（spec 例子）| 007, 018 | ✅ |
| BigInt() 显式转换 | 008, 019 | ✅ |
| number = double 别名 | 009 | ✅ |
| 混合类型算术层次 | 010 | ✅ |
| bigint 与数值隐式拒绝 | 011 | ✅ |
| narrowing 隐式拒绝 | 012 | ✅ |
| 字面量超范围拒绝 | 013 | ✅ |
| bigint 字面量赋值数值类型拒绝 | 014 | ✅ |
| 浮点字面量赋值整数拒绝 | 015 | ✅ |

---

## 三、符合 ArkTS spec 的语言设计差异与观察

### 观察 A：number 别名设计独有 ⭐ DESIGN

**spec §3.6.1 明确：** "Type number is an alias to double."

**对比：**
| 语言 | number 别名 |
|------|------------|
| ArkTS | ✅ number = double |
| Java | ❌ |
| Swift | ❌ |

**评价：** 此设计简化代码可读性，与 ArkTS 的 ECMAScript 风格保持一致。

### 观察 B：new T() 返回 0 ⭐ DESIGN

**spec §3.6.1 例子原文：**
```typescript
let a_number = new number
let a_byte = new byte
let an_integer = new int
console.log (a_number, a_byte, an_integer)
// Output is: 0 0 0
```

**对比：**
| 语言 | new T() |
|------|---------|
| ArkTS | ✅ 返回 0 |
| Java | ❌ 不支持原始类型 new |
| Swift | ✅ Int() 返回 0 |

### 观察 C：bigint 与数值层次完全隔离

**spec §3.6.1 明确：** "Type bigint does not belong to this hierarchy. No implicit conversion from numeric types to bigint occurs."

**对比：**
| 语言 | bigint 与数值类型 |
|------|----------------|
| ArkTS | ❌ 完全隔离（必须 BigInt() ）|
| Java | ❌ 完全隔离（BigInteger 是类）|
| Swift | N/A（无 bigint）|

**评价：** 安全设计，避免精度损失。

### 观察 D：缺少无符号整数类型 ⭐ DESIGN

**ArkTS 仅有有符号整数：byte/short/int/long**

**对比：**
| 语言 | 无符号整数 |
|------|----------|
| ArkTS | ❌ |
| Java | ❌（Java 8+ 部分支持 unsigned API） |
| Swift | ✅ UInt8/UInt16/UInt32/UInt64 |

**评价：** ArkTS = Java（无），Swift 有完整 UInt 系列。某些场景（如 hash、字节流处理）需要无符号类型。

---

## 四、待确认问题 / Spec 与实现不一致记录

**无重现。** 3.6.1 章节本次执行 100% 通过。

---

## 五、分类汇总

| 严重性 | 数量 | 问题列表 |
|-------|------|---------|
| ⭐⭐⭐ HIGH | 0 | - |
| ⭐⭐ MEDIUM | 0 | - |
| ⭐ LOW | 0 | - |
| 设计观察（非问题）| 4 | A、B、C、D |

---

## 六、3.6.1 章节核心结论

| 维度 | 评价 |
|------|------|
| 与 spec 一致性 | ⭐⭐⭐⭐⭐（本次 100% 通过） |
| 设计严密性 | ⭐⭐⭐⭐⭐（层次清晰） |
| number 别名 | ⭐⭐⭐⭐⭐（独有特性） |
| Java/Swift 对比 | 介于两者之间，宽松度 ≈ Java |

---

## 七、累积发现汇总（含 3.1 ~ 3.6.1）

| 严重性 | 总数 | 来源章节 |
|-------|------|---------|
| ⭐⭐⭐ HIGH | 4 | 3.1: TYP-001/002/003 + 3.2: 数字字面量类型 |
| ⭐⭐ MEDIUM | 6 | 3.1: TYP-004/005/006 + 3.2: Box/values + 3.3: 注解括号 |
| ⭐ LOW | 4 | 3.1: TYP-007/008 + 3.2: 类型擦除 + 3.3: spec 优先级 |
| 设计观察 | 8 | 3.4: 数组/raw type + 3.5: 默认参数/alias + 3.6.1: number/new/bigint/uint |

---

## 八、改进建议

### 中期
1. 评估增加无符号整数类型（如 ubyte, ushort, uint, ulong）

### 短期
**无紧急需要。**

3.6.1 章节是 ArkTS 数值类型设计的核心章节，spec 描述清晰、实现完整、与 Java 习惯一致并增加了 number/bigint 等增强特性。
