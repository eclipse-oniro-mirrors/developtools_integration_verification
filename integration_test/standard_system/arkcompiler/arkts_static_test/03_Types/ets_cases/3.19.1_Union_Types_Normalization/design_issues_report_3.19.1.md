# 3.19.1 Union Types Normalization - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告
---

## 报告分类口径

| 分类 | 含义 | 处理方式 |
|------|------|----------|
| 符合 ArkTS spec 的语言设计差异 | 行为与 Java/Swift 不同，但符合 ArkTS spec 或当前明确语义 | 不标为缺陷，仅记录差异 |
| Spec 与实现不一致 | 用例与 spec 要求不一致，且当前实现未按 spec 报错/运行 | 保留 FAIL 用例并记录 issue_report |
| 待确认问题 | 需要补充 stdlib/spec/实现依据后才能定性 | 暂不判定为缺陷 |
| 已验证规范一致行为 | 用例验证 ArkTS 行为符合 spec | 记录为通过项 |


## 问题 D-3.19.1-01：readonly union 归一化后仍允许写入

**严重性：** MEDIUM
**类别：** D 类（Spec 与实现不一致）
**复现用例：** TYP_03_19_01_012_FAIL_READONLY_WRITE

## Spec 规则

3.19.1 Union Types Normalization 第 3 步：

> Identical types within a union type are replaced for a single type with account to the readonly type flag priority.

示例：

```typescript
(number[]) | (readonly number[]) // normalized as readonly number[]. Readonly version wins
```

## 实测行为

```typescript
type U12 = number[] | readonly number[]

function testReadonlyWriteFail(): void {
  let arr: number[] = [1.0, 2.0]
  let u: U12 = arr
  u[0] = 3.0  // 实际编译通过
}
```

## 预期

应编译失败，因为 U12 归一化后应为 `readonly number[]`，不允许写入。

## 实际

编译通过，说明 readonly flag priority 在 union normalization 中未被正确应用，或者索引写入检查未基于归一化结果。

## 跨语言对比

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `u[0] = 3.0` where `u: number[] \| readonly number[]` | ✅ 编译通过（与 Spec 矛盾） |
| Java | 无 readonly array 类型 | N/A |
| Swift | `let ro: [Double]` 或不可变数组引用 | ❌ 不允许写入 |

## 建议

1. 编译器在 union normalization 时应把 `T[] | readonly T[]` 归一化为 `readonly T[]`
2. 索引写入检查应使用归一化后的类型
3. 增加编译器测试覆盖该场景
