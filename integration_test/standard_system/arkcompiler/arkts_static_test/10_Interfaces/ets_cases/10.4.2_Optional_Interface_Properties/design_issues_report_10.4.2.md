# 10.4.2 Optional Interface Properties - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

**报告日期：** 2026-06-22
**测试用例数：** 10+（compile-pass + compile-fail）
**目的：** 通过用例执行（编译期 + 真实运行时）+ 跨语言对比，识别 ArkTS 可选接口属性的设计问题

---

## 报告分类口径

| 分类 | 含义 | 处理方式 |
|------|------|----------|
| 符合 ArkTS spec 的语言设计差异 | 行为与 Java/Swift 不同，但符合 ArkTS spec 或当前明确语义 | 不标为缺陷，仅记录差异 |
| Spec 与实现不一致 | 用例与 spec 要求不一致，且当前实现未按 spec 报错/运行 | 保留 FAIL 用例并记录 issue_report |
| 待确认问题 | 需要补充 stdlib/spec/实现依据后才能定性 | 暂不判定为缺陷 |
| 已验证规范一致行为 | 用例验证 ArkTS 行为符合 spec | 记录为通过项 |

## 一、行为差异与规范一致性概览

### 观察点 M：可选接口属性支持 ⭐⭐⭐ HIGH

**用例：** ITF_10_04_02_001~210 系列

**实际行为：**
```typescript
// ArkTS 可选接口属性
interface I {
  prop?: T              // 可选属性
}

// 可选与 undefined 等效
interface I {
  prop?: T  // 等价于 prop: T | undefined
}

// 可选未赋值
let obj: I = {}
console.log(obj.prop)  // 输出 undefined（编译通过）
```

**对比：**
| 维度 | ArkTS | Java | Swift | TypeScript |
|------|-------|------|-------|------------|
| 可选属性 | ✅ `prop?: T` | ❌ 不支持 | ❌ `optional` 仅 @objc protocol | ✅ `prop?: T` |
| 可选与 undefined 等效 | ✅ `prop?: T` ↔ `prop: T \| undefined` | N/A | N/A | ✅ |
| 可选未赋值 | ✅ 编译通过（值为 undefined） | N/A | N/A | ✅ |
| 运行时可选访问 | ✅ 已验证 | N/A | N/A | ✅ |

**影响：** ArkTS 的可选属性语法与 TypeScript 完全一致，但 Java/Swift 不支持此特性。

**评价：** 无问题，设计合理（与 TS 一致）。

---

## 二、已验证 ArkTS 行为（与规范一致）

| 行为 | 用例 | 状态 |
|------|------|------|
| 可选属性 `prop?: T` | ITF_10_04_02_001 | ✅ |
| 可选与 undefined 等效 | ITF_10_04_02_002 | ✅ |
| 可选未赋值编译通过 | ITF_10_04_02_003 | ✅ |
| 运行时可选访问 | ITF_10_04_02_200 | ✅ |

---

## 三、严重性等级总览

| 严重性 | 数量 | 问题列表 |
|-------|------|---------|
| ⭐⭐⭐ HIGH | 0 | - |
| ⭐⭐ MEDIUM | 0 | - |
| ⭐ LOW | 0 | - |

---

## 四、10.4.2 章节核心结论

| 维度 | 评价 |
|------|------|
| 可选属性 | ⭐⭐⭐⭐⭐ 完整支持 |
| 可选与 undefined 等效 | ⭐⭐⭐⭐⭐ 完整支持 |
| 运行时可选访问 | ⭐⭐⭐⭐⭐ 正确实现 |
| Java 兼容 | ⭐（Java 不支持可选属性） |
| Swift 兼容 | ⭐（Swift 仅 @objc protocol 支持） |
| TS 兼容 | ⭐⭐⭐⭐⭐ 高度兼容 |

---

## 五、建议改进

### 短期
1. 无

### 中期
2. 无

### 长期
3. 无
