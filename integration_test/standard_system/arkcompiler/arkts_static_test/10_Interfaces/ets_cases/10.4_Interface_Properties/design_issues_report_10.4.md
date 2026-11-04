# 10.4 Interface Properties - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

**报告日期：** 2026-06-22
**测试用例数：** 15+（compile-pass + compile-fail）
**目的：** 通过用例执行（编译期 + 真实运行时）+ 跨语言对比，识别 ArkTS 接口属性的设计问题

---

## 报告分类口径

| 分类 | 含义 | 处理方式 |
|------|------|----------|
| 符合 ArkTS spec 的语言设计差异 | 行为与 Java/Swift 不同，但符合 ArkTS spec 或当前明确语义 | 不标为缺陷，仅记录差异 |
| Spec 与实现不一致 | 用例与 spec 要求不一致，且当前实现未按 spec 报错/运行 | 保留 FAIL 用例并记录 issue_report |
| 待确认问题 | 需要补充 stdlib/spec/实现依据后才能定性 | 暂不判定为缺陷 |
| 已验证规范一致行为 | 用例验证 ArkTS 行为符合 spec | 记录为通过项 |

## 一、行为差异与规范一致性概览

### 观察点 K：接口属性声明语法 ⭐⭐⭐ HIGH

**用例：** ITF_10_04_001~015 系列

**实际行为：**
```typescript
// ArkTS 接口属性声明
interface I {
  prop: T              // 必需属性
  readonly ro: T       // 只读属性
  get val(): T         // getter
  set val(v: T): void  // setter
}

// getter 赋值
interface I {
  get val(): T
  val = 42  // ❌ 编译拒绝（只读）
}

// setter 读取
interface I {
  set val(v: T): void
  let x = val  // ❌ 编译拒绝（只写）
}
```

**对比：**
| 维度 | ArkTS | Java | Swift | TypeScript |
|------|-------|------|-------|------------|
| 接口属性声明 | `prop: T` | `T PROP = val;` (常量) | `var prop: T { get set }` | `prop: T` |
| getter 赋值 | ❌ 编译拒绝 | N/A（只读常量） | ❌ 编译拒绝 | ❌ 编译拒绝 |
| setter 读取 | ❌ 编译拒绝 | N/A | ❌ 编译拒绝 | ❌ 编译拒绝 |
| 运行时属性访问 | ✅ 已验证 | ✅ | ✅ | ✅ |

**影响：** ArkTS 的接口属性语法与 TypeScript 高度一致。

**评价：** 无问题，设计合理。

---

## 二、已验证 ArkTS 行为（与规范一致）

| 行为 | 用例 | 状态 |
|------|------|------|
| 接口属性声明 `prop: T` | ITF_10_04_001 | ✅ |
| 只读属性 `readonly ro: T` | ITF_10_04_100 | ✅ |
| getter 声明 `get val(): T` | ITF_10_04_101 | ✅ |
| setter 声明 `set val(v: T): void` | ITF_10_04_200 | ✅ |
| getter 赋值编译拒绝 | ITF_10_04_100 | ✅ |
| setter 读取编译拒绝 | ITF_10_04_101 | ✅ |
| 运行时属性访问 | ITF_10_04_200 | ✅ |

---

## 三、严重性等级总览

| 严重性 | 数量 | 问题列表 |
|-------|------|---------|
| ⭐⭐⭐ HIGH | 0 | - |
| ⭐⭐ MEDIUM | 0 | - |
| ⭐ LOW | 0 | - |

---

## 四、10.4 章节核心结论

| 维度 | 评价 |
|------|------|
| 接口属性声明 | ⭐⭐⭐⭐⭐ 完整支持 |
| 只读属性 | ⭐⭐⭐⭐⭐ 完整支持 |
| getter/setter | ⭐⭐⭐⭐⭐ 完整支持 |
| getter 赋值限制 | ✅ 正确拒绝 |
| setter 读取限制 | ✅ 正确拒绝 |
| Java 兼容 | ⭐⭐⭐（Java 接口常量不同） |
| TS 兼容 | ⭐⭐⭐⭐⭐ 高度兼容 |

---

## 五、建议改进

### 短期
1. 无

### 中期
2. 无

### 长期
3. 无
