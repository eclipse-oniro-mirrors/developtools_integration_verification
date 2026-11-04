# 3.5 Type References - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

**报告日期：** 2026-06-11
**测试用例数：** 19（10 compile-pass + 5 compile-fail + 4 runtime）
**目的：** 通过用例执行（编译期 + 真实运行时）+ 跨语言对比，识别 ArkTS 类型引用设计

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

3.5 章节用例本次执行 100% 通过，未触发任何编译器异常或语义反直觉行为。

---

## 二、已验证的 ArkTS 规范一致行为

| 验证点 | 用例 | 状态 |
|-------|------|------|
| Simple name 类型引用 | 001 | ✅ |
| Qualified name 类型引用 | 002 | ✅ |
| 嵌套 namespace 限定名 | 003 | ✅ |
| 显式 type arguments | 004, 017 | ✅ |
| 嵌套泛型引用 A<B<C>> | 005, 017 | ✅ |
| 默认 type arguments | 006 | ✅ |
| spec 关键例子 alias 替换 | 007, 016 | ✅ |
| alias 链式递归替换 | 008 | ✅ |
| 泛型 alias 替换（spec 例） | 009, 019 | ✅ |
| 泛型类内类型参数引用 | 010 | ✅ |
| 泛型参数数量错拒绝 | 011 | ✅ |
| 违反 extends 约束拒绝 | 012 | ✅ |
| 变量名作类型拒绝 | 013 | ✅ |
| namespace 内不存在类型拒绝 | 014 | ✅ |
| alias 循环引用拒绝 | 015 | ✅ |
| 泛型实例化运行时 | 017 | ✅ |
| qualified name 运行时 | 018 | ✅ |
| 泛型 alias 运行时 | 019 | ✅ |

---

## 三、符合 ArkTS spec 的语言设计差异与观察

### 观察 A：ArkTS 是三者中唯一支持泛型默认类型参数的 ⭐ DESIGN

**spec §3.5 提到：** "Its type arguments can be provided explicitly or implicitly based on defaults."

**用例：** TYP_03_05_006_PASS_GENERIC_DEFAULT_TYPE_PARAM

```typescript
class Defaulted<T = int> { /* ... */ }
let d: Defaulted = new Defaulted(2)   // T 默认为 int
```

**对比：**
| 语言 | 泛型默认参数 |
|------|------------|
| ArkTS | ✅ |
| Java | ❌ |
| Swift | ❌ |

**评价：** 此为 ArkTS 独有的好特性，简化常见泛型用法。

### 观察 B：alias 替换语义在 spec 中明确 ⭐ DESIGN

**spec §3.5 明确：** "the type alias is replaced for a non-aliased type in all cases when dealing with types. The replacement is potentially recursive."

**用例：** TYP_03_05_007（spec 原例）

**评价：** spec 明确说明替换是"递归的"，与 Swift typealias 行为一致。Java 因无 type alias 无此设计。

---

## 四、待确认问题 / Spec 与实现不一致记录

**无重现。** 3.5 章节本次执行 100% 通过，未触发已知设计问题。

---

## 五、分类汇总

| 严重性 | 数量 | 问题列表 |
|-------|------|---------|
| ⭐⭐⭐ HIGH | 0 | - |
| ⭐⭐ MEDIUM | 0 | - |
| ⭐ LOW | 0 | - |
| 设计观察（非问题）| 2 | A、B |

---

## 六、3.5 章节核心结论

| 维度 | 评价 |
|------|------|
| 与 spec 一致性 | ⭐⭐⭐⭐⭐（本次 100% 通过）|
| 设计严密性 | ⭐⭐⭐⭐⭐（替换语义清晰）|
| 默认类型参数 | ⭐⭐⭐⭐⭐（独有特性）|
| Java/Swift 对比 | ArkTS = Swift > Java |

---

## 七、累积发现汇总（含 3.1 ~ 3.5）

| 严重性 | 总数 | 来源章节 |
|-------|------|---------|
| ⭐⭐⭐ HIGH | 4 | 3.1: TYP-001/002/003 + 3.2: 数字字面量类型 |
| ⭐⭐ MEDIUM | 6 | 3.1: TYP-004/005/006 + 3.2: Box/values + 3.3: 注解括号 |
| ⭐ LOW | 4 | 3.1: TYP-007/008 + 3.2: 类型擦除 + 3.3: spec 优先级 |
| 设计观察 | 4 | 3.4: 数组排除/raw type 严格 + 3.5: 默认参数/alias 替换 |

---

## 八、改进建议

无新建议。

3.5 章节是 ArkTS 类型系统设计质量较高的章节之一，spec 描述清晰、实现严格、与 Swift 风格一致。
