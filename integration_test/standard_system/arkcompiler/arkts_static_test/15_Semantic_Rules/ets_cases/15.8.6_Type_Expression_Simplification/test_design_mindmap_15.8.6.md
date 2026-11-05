# 15.8.6 Type Expression Simplification（类型表达式简化）- 测试设计思维导图

## 一、测试范围

验证 ArkTS 对类型表达式的简化行为，包括：
- 联合类型简化（`int|int` 简化为 `int`）
- 类型不匹配拒绝（类型不能赋值）
- 类型表达式简化运行时行为

**注意**: 本节是 Algorithmic section，描述编译器如何简化类型表达式。

## 二、测试用例矩阵

| 测试用例 ID | 类型 | 测试点 | 预期结果 |
|------------|------|--------|---------|
| SEM_15_08_06_001 | compile-pass | 类型表达式简化：联合类型简化（`int|int` 简化为 `int`） | ✅ 通过 |
| SEM_15_08_06_100 | compile-fail | 类型简化拒绝：类型不能赋值 | ✅ 通过 |
| SEM_15_08_06_200 | runtime | 类型简化运行时验证 | ✅ 通过 |

## 三、跨章节关联

- **15.8 Smart Casts and Smart Types**（智能转换和智能类型）- 父章节
- **3.19 Union Types**（联合类型）- 联合类型简化
- **15.8.1 Type Expression**（类型表达式）- 类型表达式简化

## 四、测试设计说明

### 4.1 正向测试用例
- **SEM_15_08_06_001**: 验证联合类型简化，`int|int` 简化为 `int`，因此可以赋值给 `int`

### 4.2 反向测试用例
- **SEM_15_08_06_200**: 验证类型简化拒绝，类型不能赋值（`int` 不能赋值给 `string`）

### 4.3 运行时测试用例
- **SEM_15_08_06_200**: 验证类型表达式简化运行时行为


## 最新设计要点

从章节思维导图同步的最新测试设计点：

- intersection associativity ((A&B)&C = A&(B&C))
- intersection commutativity (A&B = B&A)
- intersection with subtyping (A&B = A if A<:B)
- intersection with never (A&never = never)
- intersection with Any (A&Any = A)
- union associativity ((A|B)|C = A|(B|C))
- union commutativity (A|B = B|A)
- union with subtyping (A|B = A if A<:B)
- union with never (A|never = A)
- union with Any (A|Any = Any)
- difference with never (A-never = A)
- difference with subtyping (A-B = never if A<:B)
- difference with Any (A-Any = never)
- difference commutativity ((B-A)&A = never)
- intersection-difference simplification ((A&B)-C = (A-C)&(B-C))
- union-difference simplification ((A|B)-C = (A-C)|(B-C))
- nested difference simplification ((A-B)-C = A-(B|C))
- object type simplification (A&B = never if neither extends the other)
- final class-interface simplification (A&I = never if A not implement I)
- class/interface with never/undefined (A&U = never, A-U = A)
- push difference inside intersection/union
- push intersection inside union
- union type normalization after simplification
- difference type approximation (A-B recursively replaced by A)

## 五、覆盖率分析

| 规范条目 | 覆盖状态 | 备注 |
|---------|---------|------|
| 联合类型简化 | ✅ 已覆盖 | SEM_15_08_06_001 |
| 类型不匹配拒绝 | ✅ 已覆盖 | SEM_15_08_06_200 |
| 运行时行为 | ✅ 已覆盖 | SEM_15_08_06_200 |
