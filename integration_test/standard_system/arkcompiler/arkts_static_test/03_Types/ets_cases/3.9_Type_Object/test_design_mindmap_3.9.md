# 3.9 Type Object - 测试设计思维导图

## 概述
spec §3.9：Object 是预定义类类型，是除以下类型外所有类型的 supertype：
- void/undefined
- null
- Nullish Types
- Type Parameters
- 包含类型参数的 Union Types

Object 是 Any 的子类。所有 Object 子类继承 Object 的方法（toString 等）。

## 测试点

### compile-pass
- Object 接受 class/string/array/tuple/function 实例
- Object 接受数值类型（装箱）
- Object 接受 boolean
- 调用 toString() 等继承方法
- Object[] / Map<string, Object>

### compile-fail
- Object 不接受 null/undefined
- Object 不接受类型参数 T 直接（无约束情况下）
- Object 不接受字段不存在的访问

### runtime
- toString() 返回字符串
- instanceof Object 检查
- Object 装箱数值后值正确