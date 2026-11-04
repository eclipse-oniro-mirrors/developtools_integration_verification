# 3.19.2 Access to Common Union Members - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告
---

## 报告分类口径

| 分类 | 含义 | 处理方式 |
|------|------|----------|
| 符合 ArkTS spec 的语言设计差异 | 行为与 Java/Swift 不同，但符合 ArkTS spec 或当前明确语义 | 不标为缺陷，仅记录差异 |
| Spec 与实现不一致 | 用例与 spec 要求不一致，且当前实现未按 spec 报错/运行 | 保留 FAIL 用例并记录 issue_report |
| 待确认问题 | 需要补充 stdlib/spec/实现依据后才能定性 | 暂不判定为缺陷 |
| 已验证规范一致行为 | 用例验证 ArkTS 行为符合 spec | 记录为通过项 |


## 问题 D-3.19-02：union 同名字段不同类型不报错

**严重性：** MEDIUM
**类别：** D 类（Spec 与实现不一致）
**复现用例：** TYP_03_19_02_005_FAIL_DIFF_FIELD_TYPE

## Spec 规则

联合类型 `T1 | ... | TN` 访问共同成员 `u.m` 时：
- 每个 Ti 必须是 class/interface
- 每个 Ti 都有非静态成员 m
- m 必须是同签名方法/accessor，或同类型字段

字段类型不同应 compile-time error。

## 实测行为

```typescript
class A5 { s: string = "text" }
class B5 { s: number = 3.14 }

function testDiffFieldTypeFail(): void {
  let u: A5 | B5 = new A5()
  console.log(u.s) // 实际编译通过
}
```

## 预期

应编译失败，因为 `s` 字段类型分别是 string 和 number。

## 实际

编译通过。

## 跨语言对比

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `(u: A|B).s`，字段类型不同 | ✅ 编译通过（与 Spec 矛盾） |
| Java | 无 union，必须显式 cast 或 sealed pattern | ❌ 不能直接访问 |
| Swift | enum/protocol 需要显式 pattern match | ❌ 不能直接访问不同类型属性 |

## 建议

1. 编译器在 common member 分析中比较字段类型一致性
2. 若字段类型不同，应报 compile-time error
3. 增加编译器测试覆盖 spec 原例
