# 17.7.2 Callable Types with $_instantiate - 三环境实测验证报告

**日期：** 2026-06-23

## 实测环境

| 语言 | 编译器 | 运行时 | 可用 |
|------|--------|--------|------|
| ArkTS | es2panda (ArkTS Static Compiler) | ark VM | ✅ |
| Java | javac (Java 1.8) | java -ea | ✅ |
| Swift | N/A (未安装) | N/A | ❌ |

## ArkTS 实测（4 个 runtime 用例）

| 用例 | 行为 | 退出码 | 输出 |
|------|------|--------|------|
| EXP2_17_07_02_011_RUNTIME_BASIC_VERIFICATION | C() 返回正确实例，显式/隐式工厂等价 | 0 | EXP2_17_07_02_011: verified |
| EXP2_17_07_02_012_RUNTIME_ADDITIONAL_PARAMS | 额外参数正确传递 | 0 | EXP2_17_07_02_012: verified |
| EXP2_17_07_02_013_RUNTIME_EXPLICIT_FACTORY | 自定义工厂与隐式工厂行为一致 | 0 | EXP2_17_07_02_013: verified |
| EXP2_17_07_02_014_RUNTIME_OVERLOAD_DISPATCH | 重载正确分发到不同版本 | 0 | EXP2_17_07_02_014: verified |

## Java 实测（1 个等价用例）

| 用例 | 行为 | 退出码 | 输出 |
|------|------|--------|------|
| JavaCallableInstantiate | Supplier<T> + 静态工厂模式，所有断言通过 | 0 | JavaCallableInstantiate: all assertions passed |

**备注：** Java 无 callable type 语法，C() 风格调用不可行。使用 `Supplier<T>` 函数接口 + 静态工厂方法模拟。

## Swift 实测

Swift 5.10 未安装在此环境中。标记为 N/A。

**备注（基于 Swift 语言规范）：** Swift 无 callable type 语法。最接近的等价物是静态工厂方法 + 闭包。Swift 的 `init` 是类型的一等成员，但无法像 ArkTS 的 `C()` 那样调用类型本身。

## 关键语义对比

| 特性 | ArkTS 17.7.2 | Java | Swift |
|------|-------------|------|-------|
| Callable type 语法 `C()` | ✅ 原生支持 | ❌ 不支持 | ❌ 不支持 |
| 隐式工厂传递 | ✅ 编译器自动生成 | ❌ 无此概念 | ❌ 无此概念 |
| 工厂参数作为第一参数 | ✅ `() => ClassType` | N/A（手动传 Supplier） | N/A（手动传闭包） |
| 多参数 $_instantiate | ✅ 支持 | ✅ 方法重载 | ✅ 方法重载 |
| 同参不同返回类型报错 | ✅ 编译错误 | ✅ 编译错误（JLS） | ✅ 编译错误 |
| 静态方法访问泛型参数 | ❌ 编译错误 | ❌ 编译错误 | N/A（Swift 无此限制但语义不同） |
