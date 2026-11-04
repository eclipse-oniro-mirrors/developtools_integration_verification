# 12.1 Errors - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

| 行为 | 用例 | 结果 |
|------|------|------|
| throw Error | 001 | ✅ |
| 自定义 Error 子类 | 002 | ✅ |
| try-catch 写法 | 003 | ✅ |
| 数组越界 catch 返回 undefined | 004 | ✅ |
| catch 类型为 Error | 005 | ✅ |
| throw 非 Error 编译错误 | 006 | ✅ |

ArkTS 异常处理与 Java 高度相似，但 catch 统一为 Error 类型（Java 可多 catch 指定不同类型）。Swift 使用 Error protocol 和 do-try-catch。