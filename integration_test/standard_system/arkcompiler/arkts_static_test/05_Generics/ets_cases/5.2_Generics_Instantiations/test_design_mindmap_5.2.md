# 5.2 Generic Instantiations - 测试设计思维导图

## 概述
Generic instantiation provides concrete type arguments for generic parameters.
ArkTS supports explicit instantiation (user-specified) and implicit instantiation (type inference).

## 子章节覆盖

### 5.2.1 Type Arguments
- 正向: number/union/array/tuple/function 类型作为类型参数
- 反向: 非法类型参数拒绝

### 5.2.2 Explicit Generic Instantiations
- 正向: 类/方法/函数/类型别名的显式实例化，部分实例化
- 反向: 非泛型带参数、参数数量不匹配、约束违反

### 5.2.3 Implicit Generic Instantiations
- 正向: 函数参数推断、多参数推断、方法默认值
- 反向: 无法推断、缺少上下文、默认顺序限制

## 文件命名规范
- GEN_05_02_X_YYY_{CATEGORY}_{DESCRIPTION}.ets
