# 3.19.3 Keyof Types - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告
---

## 报告分类口径

| 分类 | 含义 | 处理方式 |
|------|------|----------|
| 符合 ArkTS spec 的语言设计差异 | 行为与 Java/Swift 不同，但符合 ArkTS spec 或当前明确语义 | 不标为缺陷，仅记录差异 |
| Spec 与实现不一致 | 用例与 spec 要求不一致，且当前实现未按 spec 报错/运行 | 保留 FAIL 用例并记录 issue_report |
| 待确认问题 | 需要补充 stdlib/spec/实现依据后才能定性 | 暂不判定为缺陷 |
| 已验证规范一致行为 | 用例验证 ArkTS 行为符合 spec | 记录为通过项 |


## 问题 D-3.19-03：keyof 非 class/interface 类型不报错

**严重性：** LOW
**类别：** D 类（Spec 与实现不一致）
**复现用例：** TYP_03_19_03_007_FAIL_KEYOF_NON_CLASS

## Spec 规则

`keyof typeReference` 中，`typeReference` 必须是 class 或 interface 类型。
否则应产生 compile-time error。

## 实测行为

```typescript
type WrongKeyof = keyof number
```

实际编译通过。

## 跨语言对比

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `keyof number` | ✅ 编译通过（与 Spec 矛盾） |
| Java | 无 compile-time keyof，只能反射 | N/A |
| Swift | 无 compile-time keyof，只能 Mirror | N/A |

## 建议

1. 编译器应检查 `keyof` operand 是否为 class/interface
2. `keyof number`、`keyof string` 等非 class/interface 应编译错误
3. 添加编译器测试覆盖
