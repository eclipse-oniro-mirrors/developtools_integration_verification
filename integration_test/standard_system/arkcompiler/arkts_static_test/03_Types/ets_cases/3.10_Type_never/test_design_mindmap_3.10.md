# 3.10 Type never - 测试设计思维导图

## 概述
spec §3.10：never 是 assignable to any type 的特殊类型，无实例。

## 三种用法
1. **函数返回类型**：永不返回值（仅抛错或无限循环）
2. **变量类型**：永不获得值（赋值左右都是 never 是合法的）
3. **参数类型**：函数体永不被执行

## 测试点

### compile-pass
- 函数返回 never（throw）
- 函数返回 never（无限循环）
- 参数类型 never
- never 在联合类型中
- never 是任何类型的子类型（assignable）
- 穷举检查（exhaustive check）

### compile-fail
- never 函数没有 throw 或循环
- never 变量赋普通值
- never 函数返回值

### runtime
- 调用 never 函数抛异常
- 穷举检查通过