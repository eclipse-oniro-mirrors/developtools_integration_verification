# 15.1.1 Type of Standalone Expression - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

**报告日期：** 2026-06-22
**测试用例数：** 6（compile-pass: 4, compile-fail: 1, runtime: 1）
**目的：** 通过用例执行（编译期 + 真实运行时）以及 Java/Swift/TypeScript 对比，确认 ArkTS 行为与 spec 的一致性，并记录语言设计差异和待确认问题。

---

## 一、符合 ArkTS spec 的语言设计差异

### 差异 A：整数字面量类型推断为 int（与 Java 一致，与 TypeScript 不同）

**用例：** SEM_15_01_01_001_PASS_INT_LITERAL_TYPE

**ArkTS 实测行为：**
```typescript
let x = 42    // x: int
let y = 3.14  // y: double
```

**ArkTS spec 依据：**
§15.1.1 Type of Standalone Expression 明确说明：
> 整数字面量作为独立表达式，类型推断为 int

**跨语言对比：**
| 语言 | 整数字面量类型 | 结论 |
|------|---------------|------|
| ArkTS | int | 符合 spec |
| Java | int | 与 ArkTS 一致 |
| Swift | Int | 与 ArkTS 一致 |
| TypeScript | number | 不同，TypeScript 统一为 number |

**分类：** 符合 ArkTS spec 的语言设计差异

---

### 差异 B：对象字面量作为独立表达式被禁止（与 TypeScript 不同）

**用例：** SEM_15_01_01_100_FAIL_OBJECT_LITERAL_STANDALONE

**ArkTS 实测行为：**
```typescript
{x: 1}  // 编译错误：ESE0127
```

**ArkTS spec 依据：**
§15.1.1 Type of Standalone Expression 明确说明：
> 对象字面量作为独立表达式应报编译错误

**跨语言对比：**
| 语言 | 对象字面量作为独立表达式 |
|------|------------------------|
| ArkTS | ❌ 编译错误（ESE0127） |
| Java | N/A（无对象字面量） |
| Swift | ✅ 允许 |
| TypeScript | ✅ 允许 |

**分类：** 符合 ArkTS spec 的语言设计差异

---

## 二、待确认问题

无

---

## 三、已验证 ArkTS 行为（与规范一致）

| 行为 | 用例编号 | 状态 |
|------|---------|------|
| 整数字面量推断为 int | 001 | ✅ |
| 浮点字面量推断为 double | 002 | ✅ |
| 常量表达式类型推断 | 003 | ✅ |
| 数组字面量类型推断 | 004 | ✅ |
| 对象字面量禁止作为独立表达式 | 005 | ✅ |
| 运行时类型行为正确 | 033 | ✅ |

---

## 四、分类汇总

| 分类 | 条目 |
|------|------|
| 符合 ArkTS spec / 当前实现的语言设计差异 | A, B |
| 待确认问题 | 无 |
| 已验证规范一致行为 | 6 项 |

---

## 五、后续建议

1. 对象字面量作为独立表达式被禁止是 ArkTS 的明确设计选择，与 TypeScript 不同，应在 spec 中明确说明原因。
2. 整数字面量类型推断为 int 与 Java 一致，符合静态类型语言惯例。
