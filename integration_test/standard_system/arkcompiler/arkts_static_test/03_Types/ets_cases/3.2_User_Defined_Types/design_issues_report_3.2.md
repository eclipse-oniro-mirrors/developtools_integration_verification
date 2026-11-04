# 3.2 User-Defined Types - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

**报告日期：** 2026-06-11
**测试用例数：** 30（11 compile-pass + 11 compile-fail + 8 runtime）
**目的：** 通过用例执行（编译期 + 真实运行时）+ 跨语言对比，识别 ArkTS 用户定义类型的设计问题

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

### 问题 I：不支持数字/布尔字面量类型 ⭐⭐⭐ HIGH

**用例：** TYP_03_02_010_FAIL_NUMERIC_LITERAL_TYPE

**实际行为：**
```typescript
let n: 42 = 42      // ❌ ESY0138: Invalid Type
let b: true = true  // ❌ ESY0138: Invalid Type
```

**Spec 依据：** §3.15 Literal Types
> ArkTS supports only the following literal types:
> - String Literal Types
> - null and undefined

**对比：**
| 语言 | 数字字面量类型 | 布尔字面量类型 | 字符串字面量类型 |
|------|--------------|---------------|---------------|
| ArkTS | ❌ | ❌ | ✅ |
| TypeScript | ✅ | ✅ | ✅ |
| Java | ❌ | ❌ | ❌ |
| Swift | ❌ | ❌ | ❌ |

**影响：**
- TS 中常见的 `type Port = 80 | 443 | 8080` 模式不可用
- TS 中 `type Flag = true` 模式不可用
- 必须用 enum 替代

**建议：** 增加数字/布尔字面量类型支持以提升 TS 兼容性。

---

### 问题 J：stdlib 全局命名空间包含 `Box` 等常见名 ⭐⭐ MEDIUM

**用例：** TYP_03_02_007 修复时发现

**实际行为：**
```typescript
class Box<T> {  // ❌ Class 'Box' is already defined
  value: T
}
```

**对比：**
| 语言 | 用户类与 stdlib 同名 |
|------|-------------------|
| ArkTS | ❌ 冲突 |
| Java | ✅ 用户类覆盖（除非 import） |
| TypeScript | ✅ 用户类覆盖 |
| Swift | ✅ 不同命名空间 |

**影响：** TS/Java 用户定义 `Box`、`Container` 等通用名，迁移到 ArkTS 时需重命名。

**建议：** 将 stdlib 类放到独立命名空间（如 `std.core`），或允许用户覆盖。

---

### 问题 K：enum.values() 返回 FixedArray 而非 Array ⭐⭐ MEDIUM

**用例：** TYP_03_02_022_RUNTIME_ENUM_METHODS

**实际行为：**
```typescript
let colors: Array<EColor> = EColor.values()
// ❌ Type 'FixedArray<EColor>' cannot be assigned to type 'Array<EColor>'

let colors: FixedArray<EColor> = EColor.values()  // ✅
```

**Spec 描述（§3.11）：** "values() returns an array of enumeration members"，未明说 Array 还是 FixedArray。

**对比：**
| 语言 | enum 类似 API | 返回类型 |
|------|------------|---------|
| ArkTS | `E.values()` | `FixedArray<E>` |
| Java | `E.values()` | `E[]`（固定长度） |
| Swift | `E.allCases` | `[E]`（动态） |
| TypeScript | enum 无 values | N/A |

**影响：**
- spec 描述模糊，与实现不一致
- ArkTS 的 Array/FixedArray 隔离设计在 enum API 处暴露不便
- 用户惯用 `Color[]`，需显式 FixedArray 转换

**建议：**
1. spec 中明确 values() 返回 FixedArray
2. 或提供 toArray() 转换方法

---

### 问题 L：无原生联合类型反向定义（与 TS 一致）⭐ LOW

**Observation:** 联合类型 `T1 | T2` 在赋值/参数都正常，与 TS 一致。
**评价：** 无问题。

---

### 问题 M：泛型类型参数变量声明无法跨函数共享类型实例 ⭐ LOW

**Observation:** 泛型类正确实例化，运行时类型擦除（与 Java 类似）。

**对比：**
| 语言 | 泛型实现 |
|------|---------|
| ArkTS | 类型擦除（与 Java 类似） |
| Java | 类型擦除 |
| Swift | 真泛型（保留类型信息） |
| C# | 真泛型 |

---

### 问题 N（重现）：嵌套函数/局部类/局部 type alias 禁止 (TYP-002, TYP-006)

**重现用例：** 多个用例修复时遇到，已记录为 3.1 章节问题。

---

## 二、已验证 ArkTS 行为（与规范一致）

| 行为 | 用例 | 状态 |
|------|------|------|
| 类继承 super 调用 | 021 | ✅ |
| 类多态方法分发 | 021 | ✅ |
| 接口 implements + 多态 | 027 | ✅ |
| enum 值与名称双向映射 | 022 | ✅ |
| 联合类型 instanceof 收窄 | 023 | ✅ |
| 元组索引访问与修改 | 024 | ✅ |
| 字面量类型运行时是 string | 028 | ✅ |
| 泛型类型擦除运行时一致 | 029 | ✅ |
| 函数类型作为高阶函数参数 | 030 | ✅ |
| 抽象类不能实例化 | 013 | ✅ |
| 接口缺失方法编译错误 | 014 | ✅ |
| enum 重复成员编译错误 | 015 | ✅ |
| 元组类型严格匹配 | 016 | ✅ |
| 联合不兼容类型拒绝 | 017 | ✅ |
| 泛型约束 extends 检查 | 018 | ✅ |
| 字符串字面量值匹配 | 019 | ✅ |
| 类型别名循环引用拒绝 | 026 | ✅ |

---

## 三、严重性等级总览

| 严重性 | 数量 | 问题列表 |
|-------|------|---------|
| ⭐⭐⭐ HIGH | 1 | 问题 I 数字/布尔字面量类型 |
| ⭐⭐ MEDIUM | 2 | 问题 J Box 命名冲突、问题 K enum.values() |
| ⭐ LOW | 2 | 问题 L 联合类型 OK、问题 M 类型擦除 |

---

## 四、3.2 章节核心结论

| 维度 | 评价 |
|------|------|
| 类用法支持 | ⭐⭐⭐⭐ 完整支持 |
| 接口支持 | ⭐⭐⭐⭐ 完整支持 |
| 枚举设计 | ⭐⭐⭐ 但 values() 返回 FixedArray 不便 |
| 元组支持 | ⭐⭐⭐⭐⭐ 一等公民 |
| 联合类型 | ⭐⭐⭐⭐⭐ 一等公民（优于 Java/Swift） |
| 泛型 | ⭐⭐⭐⭐ 完整但类型擦除 |
| 字面量类型 | ⭐⭐ 仅支持 string，不支持数字/布尔（弱于 TS） |
| 类型别名 | ⭐⭐⭐⭐ 支持递归限制合理 |
| TS 兼容 | ⭐⭐⭐ 部分（字面量类型缺失） |

---

## 五、建议改进

### 短期
1. 文档明确 enum.values() 返回 FixedArray
2. spec §3.15 字面量类型章节明确数字/布尔字面量类型不支持

### 中期
3. 评估增加数字/布尔字面量类型（提升 TS 兼容）
4. 解决 stdlib 全局命名空间污染（Box 等常见名）

### 长期
5. 考虑提供 enum.toArray() 转换方法
6. 评估真泛型实现（保留类型信息，类似 C#）
