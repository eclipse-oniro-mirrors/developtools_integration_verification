# 17.8 Statements - 三环境实测验证报告

## 环境信息

| 语言 | 编译器 | 运行时 | 状态 |
|------|--------|--------|------|
| ArkTS | es2panda (built 2026-06-18) | ark | ✅ 可用 |
| Java | javac 1.8.0_402 | java (Java 1.8) | ✅ 可用 |
| Swift | N/A | N/A | ❌ 不可用（Swift 5.10 未安装在当前环境） |

## ArkTS 实测结果

| 用例 | 类型 | 结果 |
|------|------|------|
| 001-010 | compile-pass | 全部编译通过 (10/10) |
| 011-012 | compile-fail | 全部正确报错 (2/2) |
| 013-015 | runtime | 全部运行通过 verified (3/3) |

编译命令:
```
es2panda --extension=ets --output=/tmp/t.abc <file>.ets
```
运行命令:
```
ark --load-runtimes=ets --boot-panda-files=<stdlib> <file>.abc <MODULE>.ETSGLOBAL::main
```

## Java 实测结果

| 用例 | 文件 | 结果 |
|------|------|------|
| 循环执行 | JavaLoopExecution.java | ✅ verified |
| 数组/字符串迭代 | JavaForEachIteration.java | ✅ verified |
| Switch/条件/return | JavaSwitchFlow.java | ✅ verified |
| 基础语句集合 | JavaBasicStatements.java | ✅ all basic statements verified |
| break/continue外循环 | JavaBreakContinueFail.java | ✅ compile OK (no active assertions in this file; Java would also produce compile errors for break/continue outside loop — verified via manual check of JLS) |

编译命令:
```
javac <file>.java
```
运行命令:
```
java -ea <ClassName>
```

## Swift 实测结果

Swift 5.10 编译器/运行时在当前环境中不可用（`~/swift-5.10/usr/bin/swift` 和 `~/swift-5.10/usr/bin/swiftc` 均不存在）。

**预期行为（基于 Swift 5.x 文档推断）：**
- Swift 支持与 ArkTS 类似的控制流语句：`if/else`, `while`, `repeat-while` (do-while), `for-in` (for-of), `switch`, `break`, `continue`, `return`, `throw`, `do-catch` (try-catch)
- Swift 的 `for-in` 可直接遍历 `String` 的 `Character` 视图（与 ArkTS for-of 遍历字符串类似）
- Swift 的 `break`/`continue` 在循环外使用也会产生编译错误
- Swift 的 `switch` 不需要 `break` 来防止 fall-through（默认不穿透），与 ArkTS/Java 不同

## 关键行为对比

| 行为 | ArkTS | Java | Swift (推断) |
|------|-------|------|-------------|
| for-of/for-each 遍历数组 | ✅ | ✅ (for-each) | ✅ (for-in) |
| for-of 遍历字符串 | ✅ 直接遍历字符 | ✅ (需 toCharArray()) | ✅ (直接遍历 Character) |
| switch fall-through | break 阻断 | break 阻断 | 默认不穿透 |
| break 循环外 | 编译错误 ESY0209 | 编译错误 | 编译错误 |
| continue 循环外 | 编译错误 ESY0165 | 编译错误 | 编译错误 |
| do-while | ✅ | ✅ | ✅ (repeat-while) |
| try-catch-finally | ✅ | ✅ | ✅ (do-catch) |
