# 11.4 Enumeration Methods - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

| 行为 | 用例 | 结果 |
|------|------|------|
| values() | 001 | ✅ |
| fromValue 不存在抛错 | 002 | ✅ |
| toString/valueOf/getName | 003 | ✅ |
| 索引 Color[c] | 004 | ✅ |
| 同值后优先 | 005 | ✅ |
| getValueOf 不存在抛错 | 006 | ✅ |
| string 枚举方法 | 007 | ✅ |

ArkTS 枚举方法最丰富：fromValue、getName、按值索引、同值后优先 Java/Swift 均无直接等价物。