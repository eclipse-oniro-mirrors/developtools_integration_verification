# 17.2.1 Fixed-Size Array Creation - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

**报告日期：** 2026-06-25
**测试用例数：** 14（7 compile-pass + 4 compile-fail + 3 runtime）
**通过率：** 86.7%（13/15，2 个异常通过）
**编译器：** es2panda + ark VM (Linux native)
**Spec 依据：** arktsspecification.md §17.2.1

## 报告分类口径

| 分类 | 含义 | 处理方式 |
|------|------|----------|
| 符合 ArkTS spec 的语言设计差异 | 行为与 Java/Swift 不同，但符合 ArkTS spec 或当前明确语义 | 不标为缺陷，仅记录差异 |
| Spec 与实现不一致 | 用例与 spec 要求不一致，且当前实现未按 spec 报错/运行 | 保留 FAIL 用例并记录 issue_report |
| 待确认问题 | 需要补充 stdlib/spec/实现依据后才能定性 | 暂不判定为缺陷 |
| 已验证规范一致行为 | 用例验证 ArkTS 行为符合 spec | 记录为通过项 |

---

## 一、Spec 与实现不一致

### 问题 D-17.2.1-01：FixedArray 构造函数参数个数校验缺失（cf_bad）

**类别：** D 类（Spec 与实现不一致）
**复现用例：** EXP2_17_02_01_012_FAIL_WRONG_ARG_COUNT

#### Spec 规则
§17.2.1 规定 FixedArray 构造函数签名 `constructor(len: int, elem: T)` 要求恰好两个参数。传参不足或超出应产生编译时错误。

#### 实测行为
```typescript
let a = new FixedArray<int>(3)           // 仅 1 个参数，预期编译错误
let a = new FixedArray<int>(3, 0, 5)     // 3 个参数，预期编译错误
// 实际：以上均编译通过 (exit 0)，es2panda 未拒绝
```

#### 预期
构造函数参数个数不匹配应产生编译时错误。

#### 实际
编译器未校验 FixedArray 构造函数参数个数，允许缺省或多于 2 个参数。

#### 跨语言对比

| 语言 | 数组创建构造函数参数校验 |
|------|------------------------|
| ArkTS | ⚠️ FixedArray(len, elem) 参数个数未校验（cf_bad） |
| Java | `new int[5]` 维度校验严格，编译期拒绝多余/不足维度参数 |
| Swift | `Array(repeating:count:)` 参数个数编译期严格校验 |

#### 建议
编译器应增加 FixedArray 构造函数参数个数校验，确保恰好 2 个参数时编译通过，否则产生编译错误。

---

## 二、符合 ArkTS spec 的语言设计差异

### 差异 A：FixedArray 构造函数语法独有

**分类：** 符合 ArkTS spec 的语言设计差异

#### Spec 依据
§17.2.1 定义 `new FixedArray<T>(len: int, elem: T)` 为 ArkTS 特有的固定大小数组创建语法，同时支持字面量 `[e1, e2, e3]` 创建。

#### 实测行为
```typescript
let a1 = new FixedArray<int>(5, 0)        // ✅ 构造函数创建
let a2: FixedArray<int> = [1, 2, 3]       // ✅ 字面量创建
```

#### 跨语言对比

| 语言 | 定长数组创建方式 |
|------|----------------|
| ArkTS | `new FixedArray<T>(len, elem)` 或字面量 `[...]` |
| Java | `new int[5]` + 循环初始化，或 `Arrays.fill(arr, 0)` |
| Swift | `Array(repeating: 0, count: 5)` |
| TypeScript | `new Array(5).fill(0)` 或 `Array.from({length: 5}, () => 0)` |

ArkTS 的 FixedArray 构造函数同时指定长度和初始值，比 Java/Swift 更简洁。

---

### 差异 B：类型擦除保护 — 禁止类型参数作为 FixedArray 类型参数

**分类：** 符合 ArkTS spec 的语言设计差异

#### Spec 依据
§17.2.1 要求 FixedArray 类型参数在泛型上下文中不被类型擦除保留，因此 `new FixedArray<T>(...)` 在泛型函数/类中非法。

#### 实测行为
```typescript
class Container<T> {
  makeArray(): void {
    let arr = new FixedArray<T>(3, this.item)   // ❌ ESE0007: Cannot use array creation expression with type parameter
  }
}
```

#### 跨语言对比

| 语言 | 泛型数组创建 |
|------|------------|
| ArkTS | 拒绝类型参数 T 作为 FixedArray 类型参数（ESE0007） |
| Java | 拒绝 `new T[5]`（泛型数组创建编译错误） |
| Swift | 支持泛型数组 `Array<T>()` |

ArkTS 与 Java 在此行为上一致，均拒绝泛型类型参数用于数组创建。

---

### 差异 C：长度参数严格类型检查

**分类：** 符合 ArkTS spec 的语言设计差异

#### 实测行为
```typescript
let a = new FixedArray<int>(3.14, 0)   // ❌ ESE0236: Type 'Double' cannot be used as an index type
```

长度参数必须为 int 类型，不接受 float/double 等非整数类型。

| 语言 | 数组长度类型要求 |
|------|----------------|
| ArkTS | 严格 int（ESE0236 拒绝 double 等） |
| Java | 严格 int（编译期拒绝 double） |
| Swift | 严格 Int |

三国语言行为一致。

---

## 三、已验证规范一致行为

经 es2panda + ark VM 实测，以下行为与 ArkTS spec §17.2.1 一致：

| 行为 | 验证方式 | 结果 |
|------|---------|------|
| FixedArray 构造函数 int 类型元素创建 | compile-pass (001) | 通过 |
| FixedArray 构造函数 string 类型元素创建 | compile-pass (002) | 通过 |
| FixedArray 构造函数浮点数类型元素创建 | compile-pass (003) | 通过 |
| Array Literal 显式类型注解创建 | compile-pass (004) | 通过 |
| Array Literal 类型推断 | compile-pass (005) | 通过 |
| 下标读写编译通过 | compile-pass (006) | 通过 |
| length 属性访问 | compile-pass (007) | 通过 |
| 类型擦除拒绝 T（ESE0007） | compile-fail (010) | 正确拒绝 |
| 联合类型含 T 拒绝（ESE461884） | compile-fail (011) | 正确拒绝 |
| 非 int 长度参数拒绝（ESE0236） | compile-fail (013) | 正确拒绝 |
| 构造函数元素个数运行时验证 | runtime (020) | 通过 |
| 元素初始化值运行时验证 | runtime (021) | 通过 |
| length 创建后正确 | runtime (023) | 通过 |

---

## 四、待确认问题

| 条目 | 描述 | 状态 |
|------|------|------|
| Q-17.2.1-01 | EXP2_17_02_01_012_FAIL_WRONG_ARG_COUNT cf_bad：构造函数参数个数校验缺失是否为编译器已知局限，还是 spec 允许可变参数 | 待确认 |
| Q-17.2.1-02 | EXP2_17_02_01_022_RUNTIME_OUT_OF_BOUNDS：运行时用例受 D-17.2-01 影响，负索引编译期被 ESE0247 拒绝 | 归入 D-17.2-01 |

---

## 五、跨语言对比摘要

| 维度 | ArkTS | Java | Swift | TypeScript |
|------|-------|------|-------|-----------|
| 定长数组创建 | FixedArray(len, elem) 或 [e1, e2] | new T[n] + 手动初始化 | Array(repeating:count:) | new Array(n).fill(v) |
| 类型擦除保护 | 拒绝 T 作为类型参数 | 拒绝 new T[n] | 支持泛型 Array | 支持 |
| 编译验证 | es2panda — 13/14 通过 (1 cf_bad) | javac | swiftc | tsc |
| Spec 一致性 | 1 处不一致（构造函数参数个数） | 一致 | 一致 | N/A |

---

## 六、分类汇总

| 条目 | 分类 |
|------|------|
| D-17.2.1-01：FixedArray 构造函数参数个数校验缺失（cf_bad） | Spec 与实现不一致 |
| 差异 A：FixedArray 构造函数语法独有 | 符合 ArkTS spec 的语言设计差异 |
| 差异 B：类型擦除保护 — 禁止 T 作为类型参数 | 符合 ArkTS spec 的语言设计差异 |
| 差异 C：长度参数严格类型检查（与 Java/Swift 一致） | 符合 ArkTS spec 的语言设计差异 |
| Q-17.2.1-01 | 待确认问题 |

---

## 七、关联记录

- 章节级异常汇总：[issue_report.md](../../issue_report.md)
- 测试执行报告：[test_report_17.2.1.md](test_report_17.2.1.md)
- 测试设计：[test_design_mindmap_17.2.1.md](test_design_mindmap_17.2.1.md)
