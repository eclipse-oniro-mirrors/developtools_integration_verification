# 17.14 Trailing Lambdas - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

**报告日期：** 2026-06-23
**测试用例数：** 14（compile-pass: 6, compile-fail: 4, runtime: 4）
**目的：** 通过用例执行（编译期 + 真实运行时）以及 Java/Swift 对比，确认 ArkTS 行为与 spec 的一致性，并记录语言设计差异和待确认问题。

---

## 报告分类口径

| 分类 | 说明 | 处理方式 |
|------|------|---------|
| A 类 | ArkTS 合理设计 | 修改用例适配 |
| B 类 | ArkTS 设计问题 | 修改用例 + 记入本报告 |
| C 类 | 编译器实现 bug | 临时绕过 + 记录 |
| D 类 | Spec 与实现不一致 | 保留原始 FAIL 用例（标注⚠️SPEC不一致）+ 记入本报告 |

| 分类 | 数量 | 用例 |
|------|------|------|
| A 类 | 0 | - |
| B 类 | 0 | - |
| C 类 | 0 | - |
| D 类 | 1 | EXP2_17_14_010_FAIL_OPTIONAL_BEFORE_TRAILING |

---

## 一、符合 ArkTS spec 的语言设计差异

### 差异 A：ArkTS trailing lambda 不支持参数（符合 spec 17.14）

**ArkTS 实测行为：**
Trailing lambda 体不能声明参数，spec 17.14 明确规定 "Currently no parameters for trailing lambda type except receiver"。

**跨语言对比：**
| 语言 | Trailing 参数支持 |
|------|-----------------|
| ArkTS | 仅支持 receiver 参数 `(this: T) => void` |
| Java | N/A（无 trailing lambda 语法） |
| Swift | 支持完整参数 `{ x in ... }` |

**分类：** 符合 ArkTS spec 的语言设计差异

---

### 差异 B：ArkTS trailing lambda 不支持多个 trailing block（符合 spec 17.14）

**用例：** EXP2_17_14_009_FAIL_MULTIPLE_TRAILING

**ArkTS 实测行为：**
```typescript
process() { console.log("first") } { console.log("second") }
// ESE0124: Expected 2 arguments, got 0
// ESY0227: Unexpected token '{'
```

**跨语言对比：**
| 语言 | 多个 trailing 支持 |
|------|------------------|
| ArkTS | ❌ 不支持 |
| Java | N/A |
| Swift | ✅ 支持 (Swift 5.3+ multiple trailing closures) |

**分类：** 符合 ArkTS spec 的语言设计差异（spec 明确规定仅最后一个参数可为 trailing lambda）

---

## 二、Spec 与实现不一致（D 类）⚠️

### D-01：可选参数在函数类型参数前编译器拒绝（ESY0219）

**用例：** EXP2_17_14_010_FAIL_OPTIONAL_BEFORE_TRAILING

**Spec 规定（17.14）：**
> Optional params before function type param → skipped args default to undefined

**ArkTS 实测行为：**
```typescript
function processWithOptional(prefix: string, optionalSuffix?: string, callback: () => void): void
// ESY0219: A required parameter cannot follow an optional parameter
```

**说明：**
Spec 17.14 明确允许可选参数在函数类型参数之前，调用 trailing lambda 时可跳过可选参数。但 ArkTS 编译器（与 3.18 函数类型章节相同的限制）禁止必选参数出现在可选参数之后。

**跨语言对比：**
| 语言 | 可选参数在必选参数前 |
|------|-------------------|
| ArkTS | ❌ 编译器拒绝 ESY0219 |
| Java | N/A（无可选参数概念） |
| Swift | ❌ 编译错误（参数顺序规则类似） |

**分类：** D 类（Spec 与实现不一致）

**建议：**
1. 若 spec 为此特性的本意设计，需修改编译器支持可选参数在函数类型参数前
2. 若编译器行为正确，需更新 spec 17.14 移除 "Optional params before function type param" 的说明
3. 无论哪种修复，应在 3.18 函数类型和 17.14 trailing lambda 两处保持一致

---

## 三、无其余待确认问题

所有其余 13 个用例的编译器和运行时行为与 spec 17.14 完全一致。

---

## 四、总结

| 类别 | 数量 |
|------|------|
| 符合 spec 的设计差异 | 2 |
| D 类 SPEC 不一致 | 1 |
| 编译器实现问题 | 0 |
| 待确认问题 | 0 |
