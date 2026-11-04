# 3.20 Nullish Types - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告
---

## 报告分类口径

| 分类 | 含义 | 处理方式 |
|------|------|----------|
| 符合 ArkTS spec 的语言设计差异 | 行为与 Java/Swift 不同，但符合 ArkTS spec 或当前明确语义 | 不标为缺陷，仅记录差异 |
| Spec 与实现不一致 | 用例与 spec 要求不一致，且当前实现未按 spec 报错/运行 | 保留 FAIL 用例并记录 issue_report |
| 待确认问题 | 需要补充 stdlib/spec/实现依据后才能定性 | 暂不判定为缺陷 |
| 已验证规范一致行为 | 用例验证 ArkTS 行为符合 spec | 记录为通过项 |


## 新发现问题

无。3.20 用例全部通过，spec 与实现一致。

## 设计观察

### 观察 A：ArkTS nullish 设计更接近 Swift Optional

ArkTS 的 `T | undefined/null` 与 Swift 的 `T?` 都是类型系统级可空表达，优于 Java 的裸 null。

### 观察 B：Object 不接受 null/undefined 是重要安全边界

Java `Object o = null` 合法，ArkTS 明确拒绝，这是更安全的设计。

### 观察 C：undefined 性能优于 null

spec 明确推荐 `T | undefined`，并指出 undefined 性能优于 null。

## 严重性

| 严重性 | 数量 |
|-------|------|
| HIGH | 0 |
| MEDIUM | 0 |
| LOW | 0 |
