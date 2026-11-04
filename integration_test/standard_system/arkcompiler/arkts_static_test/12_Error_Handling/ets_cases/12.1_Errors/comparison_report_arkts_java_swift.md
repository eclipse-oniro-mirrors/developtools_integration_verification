# 12.1 Errors - ArkTS vs Java vs Swift 对比报告

| 异常处理 | ArkTS | Java | Swift |
|---------|-------|------|-------|
| 异常基类 | Error | Exception / Throwable | Error protocol |
| 自定义子类 | extends Error | extends Exception | enum: Error |
| throw 非 Error | ❌ 编译错误 | ❌ 编译错误 | ❌ 编译错误 |
| try-catch 类型 | Error | 可指定多种 Exception | catch 可 pattern match |
| 数组越界 | RangeError | ArrayIndexOutOfBoundsException | guard 或 precondition |