# 15.8.5 Control Flow Graph（控制流图）- 测试设计思维导图

## 一、测试范围

验证 ArkTS 使用控制流图（Control Flow Graph, CFG）进行智能类型分析的行为，包括：
- `if` 分支中的类型收窄（`instanceof` 检查后在 `if` 分支中类型收窄）
- 类型不匹配拒绝（类型不能赋值）
- 控制流图运行时行为

**注意**: 本节是 Algorithmic section，描述编译器如何使用控制流图进行智能类型分析。

## 二、测试用例矩阵

| 测试用例 ID | 类型 | 测试点 | 预期结果 |
|------------|------|--------|---------|
| SEM_15_08_05_001 | compile-pass | 控制流图：if/else 分支类型（instanceof 检查后在 if 分支中类型收窄） | ✅ 通过 |
| SEM_15_08_05_100 | compile-fail | 控制流拒绝：类型不能赋值 | ✅ 通过 |
| SEM_15_08_05_200 | runtime | 控制流运行时验证 | ✅ 通过 |

## 三、跨章节关联

- **15.8.1 Type Expression**（类型表达式）- 智能类型基于类型表达式
- **15.8.4 Computing Smart Types**（计算智能类型）- 智能类型计算依赖控制流图
- **4.15.4 Type Operators**（类型运算符）- 类型守卫（`instanceof`）

## 四、测试设计说明

### 4.1 正向测试用例
- **SEM_15_08_05_001**: 验证控制流图中的类型收窄，`instanceof` 检查后在 `if` 分支中类型从 `Animal` 收窄为 `Dog`

### 4.2 反向测试用例
- **SEM_15_08_05_200**: 验证控制流拒绝，类型不能赋值（`int` 不能赋值给 `string`）

### 4.3 运行时测试用例
- **SEM_15_08_05_200**: 验证控制流图运行时行为


## 最新设计要点

从章节思维导图同步的最新测试设计点：

- CFG node types (expression, branching, assuming, backedge)
- if/else statement translation to CFG
- if/else if/else chain translation
- switch statement translation (with cases and default)
- while loop translation (with backedge)
- do-while loop translation
- for loop translation (with initialization, condition, update)
- for-in/for-of loop translation
- ternary conditional expression translation
- logical AND/OR short-circuit translation
- variable declaration node creation
- assignment node creation
- instanceof expression node creation
- typeof expression node creation
- branching node with true/false branches
- assuming node with assumed condition
- backedge node marking loop transfer
- CFG branch joining (union of smart types)
- must-alias sets computation across CFG
- TBD: language construct to CFG fragment mapping verification

## 五、覆盖率分析

| 规范条目 | 覆盖状态 | 备注 |
|---------|---------|------|
| if 分支类型收窄 | ✅ 已覆盖 | SEM_15_08_05_001 |
| 类型不匹配拒绝 | ✅ 已覆盖 | SEM_15_08_05_200 |
| 运行时行为 | ✅ 已覆盖 | SEM_15_08_05_200 |
