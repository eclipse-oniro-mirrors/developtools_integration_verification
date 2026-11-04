# 17.12 Default Interface Method Declarations - ArkTS 与 Java/Swift 行为差异及规范一致性报告

**报告日期：** 2026-06-23
**测试用例数：** 14（compile-pass: 5, compile-fail: 5, runtime: 4）
**目的：** 通过用例执行（编译期 + 真实运行时）以及 Java/Swift 对比，确认 ArkTS 行为与 spec 的一致性，并记录语言设计差异和待确认问题。

---

## 报告分类口径

| 分类 | 说明 | 本报告条目数 |
|------|------|------------|
| **A 类** - 符合 ArkTS spec 的语言设计差异 | ArkTS 行为符合 spec，但与 Java/Swift 不同 | 2 |
| **B 类** - 待确认问题 | 需要进一步确认 spec 或实现 | 0 |
| **C 类** - 编译器实现问题 | 实现与 spec 预期不符的 bug | 0 |
| **D 类** - Spec 与实现不一致 | spec 要求的行为与实际实现不同 | 0 |

---

## 一、符合 ArkTS spec 的语言设计差异

### 差异 A：无 `default` 关键字，有方法体即为默认方法（符合 spec）

**用例：** EXP2_17_12_001, 002, 003, 004, 005

**ArkTS 实测行为：**
```typescript
interface IGreeter {
  greet(): void {           // 无 default 关键字，有方法体即默认实现
    console.log("Hello")
  }
}
```

**ArkTS spec 依据：**
§17.12 语法定义为 `[private] identifier signature block`，无 `default` 关键字要求。

**跨语言对比：**
| 语言 | 语法 | 结论 |
|------|------|------|
| ArkTS | 有方法体即默认 | 最简洁 |
| Java | 必须加 `default` 关键字 | 显式但冗余 |
| Swift | 需在 protocol extension 中声明 | 语义分离 |

**分类：** A 类 — 符合 ArkTS spec 的语言设计差异

---

### 差异 B：接口中 this.xxx 访问实例属性（符合 spec，ArkTS 独有能力）

**用例：** EXP2_17_12_005, 023

**ArkTS 实测行为：**
```typescript
interface IDescribable {
  name: string
  describe(): string {
    return "Name: " + this.name   // ✅ 默认方法中 this 访问实例属性
  }
}
```

**ArkTS spec 依据：**
§17.12 未限制默认方法中使用 `this`，且 ArkTS 接口支持声明实例属性。

**跨语言对比：**
| 语言 | 接口实例属性 | this.属性访问 | 结论 |
|------|------------|-------------|------|
| ArkTS | ✅ | ✅ | 独有能力 |
| Java | ❌（仅 static final 常量） | N/A | 不支持 |
| Swift | ❌（需声明 `{ get }` 计算属性） | 间接 | 需额外声明 |

**分类：** A 类 — 符合 ArkTS spec 的语言设计差异（ArkTS 独有优势）

---

## 二、已验证 ArkTS 行为（与规范一致）

| 行为 | 用例编号 | 状态 |
|------|---------|------|
| 接口默认方法基本声明和继承 | 001, 020 | ✅ |
| 接口中多个默认方法 | 002 | ✅ |
| 私有默认方法声明和内部调用 | 003, 022 | ✅ |
| 默认方法支持多种参数/返回类型 | 004 | ✅ |
| 默认方法中 this 访问属性 | 005, 023 | ✅ |
| 私有默认方法外部不可访问 | 010 | ✅ |
| 重写返回类型不兼容报错 | 011 | ✅ |
| 调用不存在方法报错 | 012 | ✅ |
| 重复方法定义报错 | 013 | ✅ |
| 语法错误报错 | 014 | ✅ |
| 默认方法运行时正确调用 | 020 | ✅ |
| 重写优先于默认实现 | 021 | ✅ |
| 私有默认方法内部调用链正确 | 022 | ✅ |
| 默认方法中复杂逻辑正确执行 | 023 | ✅ |

---

## 三、分类汇总

| 分类 | 条目 |
|------|------|
| A 类 - 符合 spec 的语言设计差异 | A, B |
| B 类 - 待确认问题 | 无 |
| C 类 - 编译器实现问题 | 无 |
| D 类 - Spec 与实现不一致 | 无 |
| 已验证规范一致行为 | 14 项 |

---

## 四、后续建议

1. **保持 ArkTS 接口设计优势**：无 `default` 关键字、支持 private、支持 this.属性访问是 ArkTS 区别于 Java/Swift 的核心竞争力。
2. **考虑支持返回类型协变**（return type covariance）：当前 ArkTS 要求重写方法返回类型严格匹配，Java/Swift 支持协变返回更灵活。
3. 本次测试未发现任何 SPEC 不一致或编译器实现问题。
