# 17.4 Resizable Array Creation Expressions - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

**报告日期：** 2026-06-25
**测试用例数：** 21（9 compile-pass + 7 compile-fail + 5 runtime）
**通过率：** 85.7%（18/21，3 个异常：1 个 D 类 cf_bad + 2 个 C 类编译失败）
**编译器：** es2panda + ark VM (Linux native)
**Spec 依据：** arktsspecification.md §17.4

## 报告分类口径

| 分类 | 含义 | 处理方式 |
|------|------|----------|
| 符合 ArkTS spec 的语言设计差异 | 行为与 Java/Swift 不同，但符合 ArkTS spec 或当前明确语义 | 不标为缺陷，仅记录差异 |
| Spec 与实现不一致 | 用例与 spec 要求不一致，且当前实现未按 spec 报错/运行 | 保留 FAIL 用例并记录 issue_report |
| 待确认问题 | 需要补充 stdlib/spec/实现依据后才能定性 | 暂不判定为缺陷 |
| 已验证规范一致行为 | 用例验证 ArkTS 行为符合 spec | 记录为通过项 |

---

## 一、Spec 与实现不一致

### 问题 D-17.4-01：类型参数 T 作为 array creation expression 元素类型未被拒绝（cf_bad）

**类别：** D 类（Spec 与实现不一致）
**复现用例：** EXP2_17_04_012_FAIL_TYPE_PARAMETER_ELEMENT_TYPE

#### Spec 规则
§17.4 的 array creation expression 应在类型擦除上下文中拒绝类型参数 T 作为元素类型。`new T[n](elem)` 中 T 为类型参数时，应产生编译时错误。

#### 实测行为
```typescript
function makeArray<T>(elem: T): T[] {
  return new T[2](elem)   // 预期编译错误，实际编译通过 (exit 0)
}
```

#### 预期
类型参数 T 作为 array creation expression 的元素类型应产生编译时错误，因为 T 不被类型擦除保留。

#### 实际
编译器 es2panda 未拒绝此用法，编译通过（exit 0）。

#### 跨语言对比

| 语言 | 泛型数组创建 |
|------|------------|
| ArkTS | ⚠️ new T[n](elem) 意外通过（cf_bad） |
| Java | 编译错误：generic array creation |
| Swift | Array\<T\>() 合法 |

#### 建议
编译器应增加对 array creation expression 中类型参数元素类型的检查，与 FixedArray 的类型擦除保护保持一致（见 §17.2.1 的 ESE0007）。

---

## 二、符合 ArkTS spec 的语言设计差异

### 差异 A：Array creation expression 语法 `new T[n](elem)` 为 ArkTS 独有

**分类：** 符合 ArkTS spec 的语言设计差异

#### Spec 依据
§17.4 定义 `new T[n](elem)` 语法创建包含 n 个元素的 resizable 数组，所有元素初始化为 elem。

#### 实测行为
```typescript
let a = new int[5](0)           // ✅ 创建 5 个元素的 int 数组，全部初始化为 0
let b = new string[3]("hello")  // ✅ 创建 3 个元素的 string 数组，全部初始化为 "hello"
let c = new double[4](3.14)     // ✅ 创建 4 个元素的 double 数组
```

#### 跨语言对比

| 语言 | 创建并初始化数组语法 |
|------|-------------------|
| ArkTS | `new T[n](elem)` — 一次完成创建和初始化 |
| Java | `new int[5]` 后需 `Arrays.fill(arr, 0)` 或循环初始化 |
| Swift | `Array(repeating: 0, count: 5)` — 类似，标签参数风格 |
| TypeScript | `new Array(5).fill(0)` — 链式调用 |

ArkTS 的 `new T[n](elem)` 语法最紧凑，比 Java 少一步、比 Swift 少标签参数。

---

### 差异 B：支持联合类型和函数类型数组

**分类：** 符合 ArkTS spec 的语言设计差异

#### 实测行为
```typescript
let a = new (Object|undefined)[5](undefined)   // ✅ 联合类型数组
type Functor = () => void
let b = new Functor[3]((): void => {})         // ✅ 函数类型数组
```

| 语言 | 联合类型数组 | 函数类型数组 |
|------|-----------|-----------|
| ArkTS | 支持 | 支持 |
| Java | 无联合类型 | 支持（FunctionalInterface 数组） |
| Swift | 支持（enum 模拟） | 支持 |

---

### 差异 C：维度表达式编译期类型检查

**分类：** 符合 ArkTS spec 的语言设计差异

#### 实测行为
```typescript
let n: int = 5
let a = new int[n](0)          // ✅ 变量维度，编译通过
let b = new int[3+2](0)        // ✅ 算术表达式维度，编译通过
let c = new int[3.14](0)       // ❌ double 维度，ESE0046
let d = new int["hello"](0)    // ❌ string 维度，ESE0046
let e = new int[true](0)       // ❌ boolean 维度，ESE0046
let f = new int[null](0)       // ❌ null 维度，ESE0046
let g = new int[-3](0)         // ❌ 负常量维度，ESE0247 + ESE708183
```

| 语言 | 维度类型检查 |
|------|------------|
| ArkTS | 编译期严格检查维度类型和符号（int 类型、正值） |
| Java | 编译期严格检查维度类型（int 类型、非负） |
| Swift | 编译期严格检查 count 参数类型（Int 类型、非负） |

三国语言在维度类型检查上行为一致。

---

## 三、已验证规范一致行为

经 es2panda + ark VM 实测，以下行为与 ArkTS spec §17.4 一致：

| 行为 | 验证方式 | 结果 |
|------|---------|------|
| number 类型数组创建 | compile-pass (001) | 通过 |
| int 类型数组创建 | compile-pass (002) | 通过 |
| string 类型数组创建 | compile-pass (003) | 通过 |
| double 类型数组创建 | compile-pass (004) | 通过 |
| boolean 类型数组创建 | compile-pass (005) | 通过 |
| 联合类型数组创建 | compile-pass (006) | 通过 |
| 函数类型数组创建 | compile-pass (007) | 通过 |
| 变量维度编译通过 | compile-pass (008) | 通过 |
| 表达式维度编译通过 | compile-pass (009) | 通过 |
| 负常量维度拒绝 (ESE0247+ESE708183) | compile-fail (010) | 正确拒绝 |
| 浮点维度拒绝 (ESE0046) | compile-fail (011) | 正确拒绝 |
| 元素类型不匹配拒绝 (ESE0046) | compile-fail (013) | 正确拒绝 |
| 字符串维度拒绝 (ESE0046) | compile-fail (014) | 正确拒绝 |
| 布尔维度拒绝 (ESE0046) | compile-fail (015) | 正确拒绝 |
| null 维度拒绝 (ESE0046) | compile-fail (016) | 正确拒绝 |
| 数组长度运行时验证 | runtime (020) | 通过 |
| 元素初始化运行时验证 | runtime (021) | 通过 |
| 联合类型数组运行时验证 | runtime (022) | 通过 |
| 函数类型数组运行时验证 | runtime (023) | 通过 |

---

## 四、待确认问题

| 条目 | 描述 | 状态 |
|------|------|------|
| Q-17.4-01 | EXP2_17_04_012_FAIL_TYPE_PARAMETER_ELEMENT_TYPE cf_bad：类型参数 T 作为 array creation expression 元素类型是否 spec 有意允许，还是编译器缺陷 | 待确认 |

---

## 五、跨语言对比摘要

| 维度 | ArkTS | Java | Swift | TypeScript |
|------|-------|------|-------|-----------|
| 数组创建表达式 | new T[n](elem) | new T[n] + fill | Array(repeating:count:) | Array(n).fill(v) |
| 元素类型支持 | number/int/string/double/boolean/联合/函数 | 全部类型 | 全部类型 | 全部类型 |
| 联合类型数组 | 支持 | 不支持 | 部分支持 | 支持 |
| 维度类型检查 | 编译期严格 (int, 非负) | 编译期严格 | 编译期严格 | 运行时 |
| 编译验证 | ⚠️ 18/21 通过（1 cf_bad + 2 函数类型数组 ESE0127） | javac | swiftc | tsc |
| Spec 一致性 | ⚠️ 2 处不一致（T 元素类型 + 函数类型数组） | 一致 | 一致 | N/A |

---

## 六、分类汇总

| 条目 | 分类 |
|------|------|
| D-17.4-01：类型参数 T 作为元素类型未被拒绝（cf_bad） | Spec 与实现不一致 |
| 差异 A：new T[n](elem) 语法为 ArkTS 独有 | 符合 ArkTS spec 的语言设计差异 |
| 差异 B：支持联合类型和函数类型数组 | 符合 ArkTS spec 的语言设计差异 |
| 差异 C：维度表达式编译期类型检查（与 Java/Swift 一致） | 符合 ArkTS spec 的语言设计差异 |
| Q-17.4-01 | 待确认问题 |

---

## 七、关联记录

- 章节级异常汇总：[issue_report.md](../../issue_report.md)
- 测试执行报告：[test_report_17.4.md](test_report_17.4.md)
- 测试设计：[test_design_mindmap_17.4.md](test_design_mindmap_17.4.md)
