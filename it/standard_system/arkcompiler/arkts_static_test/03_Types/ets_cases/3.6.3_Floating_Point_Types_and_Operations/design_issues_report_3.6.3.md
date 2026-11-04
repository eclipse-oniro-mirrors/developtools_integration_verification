# 3.6.3 Floating-Point Types and Operations - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

**报告日期：** 2026-06-11
**测试用例数：** 20

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

3.6.3 用例本次执行 100% 通过，IEEE 754 行为完全合规。

---

## 二、已验证的 ArkTS 规范一致行为

| 验证点 | 用例 | 状态 |
|-------|------|------|
| 浮点类型声明 | 001 | ✅ |
| 关系/相等比较 | 002 | ✅ |
| 一元运算 | 003 | ✅ |
| 算术运算与推升 | 004, 018 | ✅ |
| `**` 幂运算 → double | 005 | ✅ |
| 自增自减 | 006 | ✅ |
| 三元 ?: | 007 | ✅ |
| 字符串拼接 | 008, 020 | ✅ |
| 浮点 → 整数（toInt）| 009, 015 | ✅ |
| 整数 → 浮点 widening | 010 | ✅ |
| 浮点 ↔ boolean 隔离 | 011 | ✅ |
| 字面量超范围拒绝 | 012 | ✅ |
| NaN 性质 | 013 | ✅ |
| Infinity 性质 | 014 | ✅ |
| round-toward-zero | 015 | ✅ |
| 上溢 → ±Inf | 016 | ✅ |
| gradual underflow | 017 | ✅ |
| 类型推升 double 优先 | 018 | ✅ |
| 浮点除零 → ±Inf/NaN | 019 | ✅ |
| 字符串拼接 decimal | 020 | ✅ |

---

## 三、符合 ArkTS spec 的语言设计差异与观察

### 观察 A：`**` 浮点幂运算总是返回 double ⭐ DESIGN

**spec §3.6.3：** "operation implementation for an exponentiation operator with numeric operands always uses the 64-bit floating-point arithmetic. ... The result of the numeric operator is a value of type double."

**评价：** 与 §3.6.2 整数 `**` 返回 bigint 形成对照，二者都设计为避免精度损失。
- 整数 `**` → bigint（避免溢出）
- 浮点 `**` → double（保留精度）

**对比：** Java/Swift 无 `**` 运算符。

### 观察 B：浮点除零不抛异常（与整数不同）

**spec §3.6.3：** "Operators on floating-point numbers ... behave in compliance with the IEEE 754 Standard"

**对比：**
| 类型 | a / 0 | a % 0 |
|------|------|------|
| 整数 (3.6.2) | throw ArithmeticError | throw ArithmeticError |
| 浮点 (3.6.3) | ±Inf 或 NaN | NaN |

---

## 四、待确认问题 / Spec 与实现不一致记录

| 问题 | 来源 | 重现用例 |
|------|------|---------|
| `as` 弃用于数值转换（问题 Q）| 3.6.2 | TYP_03_06_03_009 用例使用 `.toInt()` 而非 `as int` |

---

## 五、分类汇总

| 严重性 | 数量 | 问题列表 |
|-------|------|---------|
| ⭐⭐⭐ HIGH | 0 | - |
| ⭐⭐ MEDIUM | 0 | - |
| ⭐ LOW | 0 | - |
| 设计观察 | 2 | A、B |

---

## 六、3.6.3 章节核心结论

| 维度 | 评价 |
|------|------|
| IEEE 754 合规 | ⭐⭐⭐⭐⭐ |
| 与 spec 一致性 | ⭐⭐⭐⭐⭐（本次 100%）|
| 运算符完整度 | ⭐⭐⭐⭐⭐（含 `**`）|
| 类型推升合理性 | ⭐⭐⭐⭐⭐ |

3.6.3 是 ArkTS 浮点设计的稳健章节，IEEE 754 完全合规。
