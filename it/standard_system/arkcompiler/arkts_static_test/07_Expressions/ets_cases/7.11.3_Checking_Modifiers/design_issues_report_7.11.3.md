# 7.11.3 Checking Modifiers — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

无。ArkTS/Java/Swift 三种语言在修饰符检查规则上完全一致：

| 规则 | 三语言行为 |
|------|-----------|
| typeReference → 必须 static | 均编译时检查，不一致报错 |
| expression → 不能 static | 均编译时检查，不一致报错 |
| super → 不能 abstract | 均编译时检查，不一致报错 |
| super → 不能 static | 均编译时检查，不一致报错 |

## 总体结论

| 指标 | 数值 |
|------|------|
| 总用例数 | 12 |
| 通过率 | 100% |
| Spec 不一致（D类） | 0 |
| 跨语言差异 | 0（三语言完全一致） |
