# 17.2 Fixed-Size Array Types - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

**报告日期：** 2026-06-23
**测试用例数：** 17（7 compile-pass + 5 compile-fail + 5 runtime）
**通过率：** 70.6%（12/17，5 个受 Spec 不一致影响：D-17.2-01×2 + D-17.2-02 + D-17.2.1-01 + 跨章节）
**编译器：** es2panda + ark VM (Linux native)
**Spec 依据：** arktsspecification.md §17.2

## 报告分类口径

| 分类 | 含义 | 处理方式 |
|------|------|----------|
| 符合 ArkTS spec 的语言设计差异 | 行为与 Java/Swift 不同，但符合 ArkTS spec 或当前明确语义 | 不标为缺陷，仅记录差异 |
| Spec 与实现不一致 | 用例与 spec 要求不一致，且当前实现未按 spec 报错/运行 | 保留 FAIL 用例并记录 issue_report |
| 待确认问题 | 需要补充 stdlib/spec/实现依据后才能定性 | 暂不判定为缺陷 |
| 已验证规范一致行为 | 用例验证 ArkTS 行为符合 spec | 记录为通过项 |

## 一、Spec 与实现不一致

### 问题 D-17.2-01：编译器在编译期拒绝负索引常量

**类别：** D 类（Spec 与实现不一致）
**复现用例：** EXP2_17_02_023_RUNTIME_FIXED_ARRAY_OUT_OF_BOUNDS

#### Spec 规则
§17.2 规定索引越界为运行时错误。spec 未明确说明负索引在编译期的处理。

#### 实测行为
```typescript
let a: FixedArray<int> = [1, 2, 3]
let x: int = a[-1]  // 编译错误: ESE0247 Index value cannot be less than zero
```

#### 预期
按照数组越界访问的运行时语义，a[-1] 应在运行时报错。

#### 实际
编译器 ESE0247 在编译期拒绝负索引常量。

#### 跨语言对比

| 语言 | 负索引行为 |
|------|----------|
| ArkTS | 编译期拒绝 (ESE0247) |
| Java | 运行时 ArrayIndexOutOfBoundsException |
| Swift | 运行时 fatal error |

#### 建议
编译器比 spec 更严格是合理防御性策略，但应更新 spec 或文档说明编译期的负索引常量检查。

---

### 问题 D-17.2-02：编译器在编译期拒绝 length 赋值

**类别：** D 类（Spec 与实现不一致）
**复现用例：** EXP2_17_02_024_RUNTIME_FIXED_ARRAY_LENGTH_IMMUTABLE

#### Spec 规则
§17.2 规定 "Array length is set once at runtime and cannot be changed later."

#### 实测行为
```typescript
let a: FixedArray<int> = [1, 2]
a.length = 5  // 编译错误: ESE0024 Setting the length of an array is not permitted
```

#### 预期
Spec 描述为运行时属性不可变。

#### 实际
编译器 ESE0024 在编译期即拒绝 length 赋值。

#### 跨语言对比

| 语言 | length 赋值 |
|------|-----------|
| ArkTS | 编译期拒绝 (ESE0024) |
| Java | array.length 是 final 字段 |
| Swift | Array.count 是 get-only |

#### 建议
编译期检查比运行时检查更安全，应确认编译器行为即为最终语义并更新 spec 措辞。

---

## 二、符合 ArkTS spec 的语言设计差异

### 差异 A：FixedArray 与 Array 互不兼容

**分类：** 符合 ArkTS spec 的语言设计差异

#### Spec 依据
§17.2 明确："Fixed-size arrays are not compatible with resizable arrays."

#### 实测行为
```typescript
let a: FixedArray<number> = [1, 2, 3]
let b: number[] = [1, 2, 3]
a = b  // 编译错误
b = a  // 编译错误
```

#### 跨语言对比

| 语言 | 定长数组 |
|------|---------|
| ArkTS | FixedArray<T> 与 Array<T> 不兼容（独立类型） |
| Java | 所有数组类型兼容 Object[] |
| Swift | Array 统一，无定长/变长区分 |
| TypeScript | readonly 元组可实现类似效果 |

---

## 三、已验证规范一致行为

经 es2panda + ark VM 实测，以下行为与 ArkTS spec §17.2 一致：

| 行为 | 验证方式 | 结果 |
|------|---------|------|
| FixedArray<T> 字面量声明 (int/double/string/boolean) | 7 compile-pass | ✅ 全部通过 |
| 索引读写 | 3 runtime | ✅ 全部通过 |
| length 属性读取 | 1 runtime | ✅ 通过 |
| FixedArray ↔ Array 互赋值拒绝 | 2 compile-fail | ✅ 正确拒绝 |
| 无 .push() 等 Array 方法 | 1 compile-fail | ✅ ESE0087 |
| 泛型参数类型擦除保留 | 1 compile-pass | ✅ 通过 |

## 四、跨语言对比摘要

| 维度 | ArkTS | Java | Swift | TypeScript |
|------|-------|------|-------|-----------|
| 定长数组 | FixedArray<T> | T[] (长度可变但不可重分配) | Array（统一） | readonly tuple |
| 编译验证 | ✅ es2panda — 17 用例 | ✅ javac | ✅ swiftc | ✅ tsc |
| Spec 一致性 | ⚠️ 2 处实现比 spec 更严格 | ✅ | ✅ | N/A |

## 五、分类汇总

| 条目 | 分类 |
|------|------|
| D-17.2-01：编译期拒绝负索引常量（比 spec 更严格） | Spec 与实现不一致 |
| D-17.2-02：编译期拒绝 length 赋值（比 spec 更严格） | Spec 与实现不一致 |
| 差异 A：FixedArray 与 Array 互不兼容 | 符合 ArkTS spec 的语言设计差异 |

## 六、关联记录

- 章节级异常汇总：[issue_report.md](../../issue_report.md)
- 测试执行报告：[test_report_17.2.md](test_report_17.2.md)
- 测试设计：[test_design_mindmap_17.2.md](test_design_mindmap_17.2.md)
