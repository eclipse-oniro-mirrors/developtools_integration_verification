# 10.4.1 Required Interface Properties - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

**报告日期：** 2026-06-22
**测试用例数：** 15+（compile-pass + compile-fail）
**目的：** 通过用例执行（编译期 + 真实运行时）+ 跨语言对比，识别 ArkTS 必需接口属性的设计问题

---

## 报告分类口径

| 分类 | 含义 | 处理方式 |
|------|------|----------|
| 符合 ArkTS spec 的语言设计差异 | 行为与 Java/Swift 不同，但符合 ArkTS spec 或当前明确语义 | 不标为缺陷，仅记录差异 |
| Spec 与实现不一致 | 用例与 spec 要求不一致，且当前实现未按 spec 报错/运行 | 保留 FAIL 用例并记录 issue_report |
| 待确认问题 | 需要补充 stdlib/spec/实现依据后才能定性 | 暂不判定为缺陷 |
| 已验证规范一致行为 | 用例验证 ArkTS 行为符合 spec | 记录为通过项 |

## 一、行为差异与规范一致性概览

### 观察点 L：必需接口属性支持 ⭐⭐⭐ HIGH

**用例：** ITF_10_04_01_001~115 系列

**实际行为：**
```typescript
// ArkTS 必需接口属性
interface I {
  prop: T              // 必需读写属性
  readonly ro: T        // 必需只读属性
  get val(): T         // 必需 getter
  set val(v: T): void  // 必需 setter
}

// 类实现接口时必须实现所有必需属性
class C implements I {
  prop: T = ...        // 必须实现
  readonly ro: T = ... // 必须实现
  get val(): T { ... } // 必须实现
  set val(v: T): void { ... } // 必须实现
}
```

**对比：**
| 维度 | ArkTS | Java | Swift | TypeScript |
|------|-------|------|-------|------------|
| 必需只读属性 | ✅ `readonly prop: T` | ✅ `T getProp()`（方法模拟） | ✅ `var prop: T { get }` | ✅ `readonly prop: T` |
| 必需读写属性 | ✅ `prop: T` | ❌ 接口常量仅只读 | ✅ `var prop: T { get set }` | ✅ `prop: T` |
| getter/setter 声明 | ✅ `get`/`set` 访问器 | ❌ 不支持 | ✅ `{ get set }` | ✅ `get`/`set` |
| getter-only | ✅ 只读声明 | ✅ 接口常量 | ✅ `{ get }` | ✅ `readonly` |
| setter-only | ✅ 只写声明 | ❌ 不支持 | ❌ 不支持 | ❌ 不支持 |
| 字段/访问器等效 | ✅ 字段可满足访问器声明 | N/A | ✅ | ✅ |
| 必需未实现 | ❌ 编译拒绝 | ❌ 编译拒绝 | ❌ 编译拒绝 | ❌ 编译拒绝 |

**影响：** ArkTS 的必需属性系统比 Java 更灵活，与 TypeScript 高度一致。

**评价：** 无问题，设计合理。

---

## 二、已验证 ArkTS 行为（与规范一致）

| 行为 | 用例 | 状态 |
|------|------|------|
| 必需读写属性 `prop: T` | ITF_10_04_01_001 | ✅ |
| 必需只读属性 `readonly ro: T` | ITF_10_04_01_002 | ✅ |
| getter 声明 `get val(): T` | ITF_10_04_01_003 | ✅ |
| setter 声明 `set val(v: T): void` | ITF_10_04_01_004 | ✅ |
| getter-only 声明 | ITF_10_04_01_005 | ✅ |
| setter-only 声明 | ITF_10_04_01_006 | ✅ |
| 字段可满足访问器声明 | ITF_10_04_01_006 | ✅ |
| 必需未实现编译拒绝 | ITF_10_04_01_100 | ✅ |

---

## 三、严重性等级总览

| 严重性 | 数量 | 问题列表 |
|-------|------|---------|
| ⭐⭐⭐ HIGH | 0 | - |
| ⭐⭐ MEDIUM | 0 | - |
| ⭐ LOW | 0 | - |

---

## 四、10.4.1 章节核心结论

| 维度 | 评价 |
|------|------|
| 必需读写属性 | ⭐⭐⭐⭐⭐ 完整支持 |
| 必需只读属性 | ⭐⭐⭐⭐⭐ 完整支持 |
| getter/setter | ⭐⭐⭐⭐⭐ 完整支持 |
| setter-only | ⭐⭐⭐⭐⭐ 支持（优于 Java/Swift/TS） |
| 字段/访问器等效 | ⭐⭐⭐⭐⭐ 完整支持 |
| Java 兼容 | ⭐⭐⭐（部分兼容） |
| TS 兼容 | ⭐⭐⭐⭐⭐ 高度兼容 |

---

## 五、建议改进

### 短期
1. 无

### 中期
2. 无

### 长期
3. 无
