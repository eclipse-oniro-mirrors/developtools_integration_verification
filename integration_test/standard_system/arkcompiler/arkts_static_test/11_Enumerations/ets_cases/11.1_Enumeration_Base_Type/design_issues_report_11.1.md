# 11.1 Enumeration Base Type - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## Spec 规则覆盖

| 规则 | 对应用例 | 结果 |
|------|---------|------|
| 所有成员无初始化器 → int 推断 | 001 | ✅ |
| 全部 int 初始化器 → int 推断 | 002 | ✅ |
| 全部 string 初始化器 → string 推断 | 004,007 | ✅ |
| 部分成员 int 初始化 + 其余无初始化 → int（E2）| 010 | ✅ |
| int + string 混合初始化器 → 编译错误（E4）| 005 | ✅ |
| 无初始化器的成员 + string 初始化器 → 错误（E3）| 011 | ✅ |
| string 推断后缺初始化器 → 编译错误 | 006 | ✅ |
| 显式基类 byte/short/long/float/double/string | → 11.2 | ✅ |

## 编号说明

- 001～011（含迁移到 11.2 的 003/008/009）