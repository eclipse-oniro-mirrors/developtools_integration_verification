# 10.3 Interface Members - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

**报告日期：** 2026-06-22
**测试用例数：** 20+（compile-pass + compile-fail）
**目的：** 通过用例执行（编译期）+ 跨语言对比，识别 ArkTS 接口成员的设计问题

---

## 报告分类口径

| 分类 | 含义 | 处理方式 |
|------|------|----------|
| 符合 ArkTS spec 的语言设计差异 | 行为与 Java/Swift 不同，但符合 ArkTS spec 或当前明确语义 | 不标为缺陷，仅记录差异 |
| Spec 与实现不一致 | 用例与 spec 要求不一致，且当前实现未按 spec 报错/运行 | 保留 FAIL 用例并记录 issue_report |
| 待确认问题 | 需要补充 stdlib/spec/实现依据后才能定性 | 暂不判定为缺陷 |
| 已验证规范一致行为 | 用例验证 ArkTS 行为符合 spec | 记录为通过项 |

## 一、行为差异与规范一致性概览

### 问题 K：Object public 方法名冲突检测未实现 ⭐⭐⭐ HIGH

**用例：** ITF_10_03_003, ITF_10_03_101

**实际行为：**
```typescript
interface I {
  toString(p: number): void  // ❌ 应被拒绝（Spec §10.3 规定与 Object 方法冲突）
  toString(): string         // ❌ 应被拒绝（spec 示例明确标注为 compile-time error）
}
// 当前编译器未检测到冲突，接受这些声明
```

**Spec 依据：** §10.3 "A compile-time error occurs if the method explicitly declared by the interface has the same name as the Object's public method"

**对比：**
| 语言 | Object 方法冲突规则 | 实现状态 |
|------|-------------------|---------|
| ArkTS Spec | ❌ 要求编译错误 | 未实现 |
| Java | ✅ 不禁止（子类实现时覆写 Object 方法） | 不同设计 |
| Swift | ✅ protocol 与 NSObjectProtocol 同名声明产生警告 | 警告级别 |
| TypeScript | ✅ 允许声明合并 | 不同设计 |

**影响：** 违反 Spec 要求，可能导致运行时行为与预期不符。

**建议：** 实现 Object public 方法名冲突检测。

---

### 语言设计差异：Object 方法冲突边界条件

**说明：** Spec §10.3 要求接口中与 Object 公有方法同名的声明应报编译错误，但未明确参数不同、返回值不同等边界情况的处理。此属规范文档完善范畴，非直接 Spec/实现不一致。

**对比：**
| 语言 | 参数不同 | 返回值不同 | 静态方法 |
|------|---------|-----------|---------|
| ArkTS Spec | 未明确 | 未明确 | 未明确 |
| Java | 允许（重载） | 允许（重载） | 允许 |
| Swift | 警告 | 警告 | 允许 |
| TypeScript | 声明合并 | 声明合并 | 允许 |

---

## 二、已验证 ArkTS 行为（与规范一致）

| 行为 | 用例 | 状态 |
|------|------|------|
| 接口属性和方法成员 | ITF_10_03_001 | ✅ |
| 多方法声明 | ITF_10_03_002 | ✅ |
| 重复成员编译拒绝 | ITF_10_03_003 | ✅ |
| Object 方法冲突检测 | ITF_10_03_003~012 | ⚠️ 未实现（问题 K） |

---

## 三、严重性等级总览

| 严重性 | 数量 | 问题列表 |
|-------|------|---------|
| ⭐⭐⭐ HIGH | 1 | 问题 K Object 方法冲突检测未实现 |
| ⭐⭐ MEDIUM | 0 | - |
| ⭐ LOW | 0 | - |

---

## 四、10.3 章节核心结论

| 维度 | 评价 |
|------|------|
| 接口成员声明 | ⭐⭐⭐⭐⭐ 完整支持 |
| 重复成员检测 | ⭐⭐⭐⭐⭐ 正确拒绝 |
| Object 方法冲突检测 | ⭐⭐ 未实现（待完善） |
| Java 兼容 | ⭐⭐⭐⭐ 高度兼容 |
| TS 兼容 | ⭐⭐⭐⭐ 高度兼容 |

---

## 五、建议改进

### 短期
1. 实现 Object public 方法名冲突检测（Spec §10.3 要求）

### 中期
2. 无

### 长期
3. 无
