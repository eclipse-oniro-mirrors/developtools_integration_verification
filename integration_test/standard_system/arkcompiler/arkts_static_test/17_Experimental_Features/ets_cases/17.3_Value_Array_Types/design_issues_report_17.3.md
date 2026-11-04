# 17.3 Value Array Types - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

**报告日期：** 2026-06-25
**测试用例数：** 19（10 compile-pass + 5 compile-fail + 4 runtime）
**通过率：** 94.7%（18/19，1例受 D-17.2-01 影响）
**编译器：** es2panda + ark VM (Linux native)
**Spec 依据：** arktsspecification.md §17.3

## 报告分类口径

| 分类 | 含义 | 处理方式 |
|------|------|----------|
| 符合 ArkTS spec 的语言设计差异 | 行为与 Java/Swift 不同，但符合 ArkTS spec 或当前明确语义 | 不标为缺陷，仅记录差异 |
| Spec 与实现不一致 | 用例与 spec 要求不一致，且当前实现未按 spec 报错/运行 | 保留 FAIL 用例并记录 issue_report |
| 待确认问题 | 需要补充 stdlib/spec/实现依据后才能定性 | 暂不判定为缺陷 |
| 已验证规范一致行为 | 用例验证 ArkTS 行为符合 spec | 记录为通过项 |

---

## 一、符合 ArkTS spec 的语言设计差异

### 差异 A：ValueArray 仅接受值类型 — ArkTS 独有的类型级约束

**分类：** 符合 ArkTS spec 的语言设计差异

#### Spec 依据
§17.3 规定 ValueArray 只能包含值类型（byte、short、int、long、float、double、char、boolean）。非值类型（string、Object、联合类型、类型参数 T）将被编译期拒绝。

#### 实测行为
```typescript
let a1: ValueArray<int> = [1, 2, 3]              // ✅ 编译通过
let a2: ValueArray<string> = ["a", "b"]           // ❌ ESE1547180
let a3: ValueArray<Object> = [new Object()]        // ❌ ESE1547180
let a4: ValueArray<int|undefined> = [1, undefined] // ❌ ESE1547180
```

#### 跨语言对比

| 语言 | 值类型专属数组 | 非值类型元素限制 |
|------|-------------|---------------|
| ArkTS | ValueArray\<T\>（T 限制为值类型） | 编译期拒绝 string/Object/联合类型/T |
| Java | 无对应概念 — 所有数组可含任意类型 | 无限制 |
| Swift | 无对应概念 — Array 可含任意类型 | 无限制（值语义但类型不限） |
| TypeScript | 无对应概念 | 无限制 |

**这是 ArkTS 独有的数组类型约束设计**，Java 和 Swift 均无直接等价物。Java 数组可含 String/Object 等引用类型；Swift Array 虽有值语义但元素类型不受限制。

---

### 差异 B：ValueArray 不协变 — 类型间无子类型关系

**分类：** 符合 ArkTS spec 的语言设计差异

#### Spec 依据
§17.3 规定 ValueArray 类型之间不存在子类型关系，除非类型参数完全相同。`ValueArray<int>` 不可赋值给 `ValueArray<long>`。

#### 实测行为
```typescript
let a: ValueArray<int> = [1, 2, 3]
let b: ValueArray<long> = a   // ❌ ESE0318: Type 'ValueArray<Int>' cannot be assigned to type 'ValueArray<Long>'
```

#### 跨语言对比

| 语言 | 数组协变 |
|------|--------|
| ArkTS | ValueArray 不协变（ESE0318） |
| Java | 数组协变：`String[]` 可赋值给 `Object[]`（历史设计缺陷） |
| Swift | Array 协变（但值语义保证安全） |

ArkTS 的 ValueArray 不协变设计避免了 Java 数组协变导致的历史性类型安全问题。

---

### 差异 C：ValueArray 非泛型 — 不支持类型参数 T

**分类：** 符合 ArkTS spec 的语言设计差异

#### 实测行为
```typescript
function makeVA<T>(val: T): ValueArray<T> {   // ❌ ESE1547180
  return [val]
}
```

ValueArray 不是泛型容器类型，不能使用类型参数 T。必须使用具体值类型。

| 语言 | 泛型数组 |
|------|--------|
| ArkTS | ValueArray 不支持泛型类型参数 |
| Java | 数组不是泛型，但 `T[]` 在泛型方法中合法（类型擦除后变 Object[]） |
| Swift | 完全支持泛型 Array\<T\> |

---

## 二、已验证规范一致行为

经 es2panda + ark VM 实测，以下行为与 ArkTS spec §17.3 一致：

| 行为 | 验证方式 | 结果 |
|------|---------|------|
| ValueArray\<int\> 字面量创建 | compile-pass (001) | 通过 |
| ValueArray\<long\> 字面量创建 | compile-pass (002) | 通过 |
| ValueArray\<float\> 字面量创建 | compile-pass (003) | 通过 |
| ValueArray\<double\> 字面量创建 | compile-pass (004) | 通过 |
| ValueArray\<char\> 字面量创建 | compile-pass (005) | 通过 |
| ValueArray\<boolean\> 字面量创建 | compile-pass (006) | 通过 |
| ValueArray\<byte\> 字面量创建 | compile-pass (007) | 通过 |
| ValueArray\<short\> 字面量创建 | compile-pass (008) | 通过 |
| ValueArray\<int\> 构造函数创建 | compile-pass (009) | 通过 |
| ValueArray\<double\> 构造函数创建 | compile-pass (010) | 通过 |
| ValueArray\<string\> 拒绝 (ESE1547180) | compile-fail (011) | 正确拒绝 |
| ValueArray\<int\|undefined\> 拒绝 (ESE1547180) | compile-fail (012) | 正确拒绝 |
| ValueArray\<Object\> 拒绝 (ESE1547180) | compile-fail (013) | 正确拒绝 |
| ValueArray\<T\> 拒绝 (ESE1547180) | compile-fail (014) | 正确拒绝 |
| ValueArray\<int\> 不能赋给 ValueArray\<long\> (ESE0318) | compile-fail (015) | 正确拒绝 |
| 元素值运行时验证 | runtime (020) | 通过 |
| length 运行时验证 | runtime (021) | 通过 |
| 元素修改持久化 | runtime (022) | 通过 |
| 构造函数值验证 | runtime (024) | 通过 |

---

## 三、跨语言对比摘要

| 维度 | ArkTS | Java | Swift | TypeScript |
|------|-------|------|-------|-----------|
| 值类型专属数组 | ValueArray\<T\>（8 种值类型） | 无 | 无 | 无 |
| 非值类型拒绝 | ESE1547180 编译期拒绝 | N/A | N/A | N/A |
| 数组协变 | 禁止 | 支持（协变） | 支持（值语义安全） | 支持 |
| 泛型数组 | ValueArray 不支持泛型 T | 部分支持 | 完全支持 | 完全支持 |
| 编译验证 | ⚠️ 18/19 通过（1例受 D-17.2-01 影响） | javac | swiftc | tsc |
| Spec 一致性 | ⚠️ 1 处受 D-17.2-01 影响（负索引编译期拒绝） | JLS 一致 | 一致 | N/A |

---

## 四、Spec 与实现不一致（跨章节引用）

### 问题 D-17.2-01：编译期拒绝负索引常量

**复现用例：** EXP2_17_03_023_RUNTIME_OUT_OF_BOUNDS

详见 [17.2 Fixed-Size Array Types 设计问题报告](../17.2_Fixed_Size_Array_Types/design_issues_report_17.2.md#问题-d-17.2-01编译器在编译期拒绝负索引常量)。

---

## 五、分类汇总

| 条目 | 分类 |
|------|------|
| 差异 A：ValueArray 仅接受值类型 — ArkTS 独有约束 | 符合 ArkTS spec 的语言设计差异 |
| 差异 B：ValueArray 不协变 | 符合 ArkTS spec 的语言设计差异 |
| 差异 C：ValueArray 非泛型 — 不支持类型参数 T | 符合 ArkTS spec 的语言设计差异 |
| D-17.2-01：编译期拒绝负索引常量（跨章节引用） | Spec 与实现不一致 |
| 已验证规范一致行为 | 18 项通过 |

---

## 五、关联记录

- 章节级异常汇总：[issue_report.md](../../issue_report.md)
- 测试执行报告：[test_report_17.3.md](test_report_17.3.md)
- 测试设计：[test_design_mindmap_17.3.md](test_design_mindmap_17.3.md)
