# 15.8.4 Computing Smart Types（计算智能类型）- 测试设计思维导图

## 一、测试范围

验证 ArkTS 在控制流分析中计算智能类型（Smart Types）的行为，包括：
- `null` 检查后类型收窄（`x != undefined` 后 x 收窄为 `string`）
- 类型不匹配拒绝（联合类型不能直接赋值给具体类型）
- 智能类型运行时行为

**注意**: 本节是 Algorithmic section，描述编译器如何计算智能类型。

## 二、测试用例矩阵

| 测试用例 ID | 类型 | 测试点 | 预期结果 |
|------------|------|--------|---------|
| SEM_15_08_04_001 | compile-pass | 计算智能类型：null 检查后类型收窄 | ✅ 通过 |
| SEM_15_08_04_100 | compile-fail | 智能类型拒绝：联合类型不能直接赋值给具体类型 | ✅ 通过 |
| SEM_15_08_04_200 | runtime | 智能类型运行时验证 | ✅ 通过 |

## 三、跨章节关联

- **15.8.1 Type Expression**（类型表达式）- 智能类型基于类型表达式
- **15.8.5 Control Flow Graph**（控制流图）- 智能类型计算依赖控制流图
- **4.15.4 Type Operators**（类型运算符）- 类型守卫（`instanceof`、`typeof`、`!= undefined`）

## 四、测试设计说明

### 4.1 正向测试用例
- **SEM_15_08_04_001**: 验证 `null` 检查后类型收窄，`x != undefined` 后 x 从 `string|undefined` 收窄为 `string`

### 4.2 反向测试用例
- **SEM_15_08_04_200**: 验证智能类型拒绝，联合类型 `string|int` 不能直接赋值给 `string`

### 4.3 运行时测试用例
- **SEM_15_08_04_200**: 验证智能类型运行时行为


## 最新设计要点

从章节思维导图同步的最新测试设计点：

- variable declaration (l(v) and s(l(v)) initialization)
- assignment (variable alias update)
- instanceof assumption (s'(l(v)) := s(l(v)) & A)
- strict equality with string literal (s'(l(v)) := str)
- strict equality with undefined (s'(l(v)) := undefined)
- strict equality with null (s'(l(v)) := null)
- loose equality with undefined (s'(l(v)) := undefined|null)
- typeof assumption (type T evaluation)
- strict equality with enum constant (s'(l(v)) := N(ec))
- truthiness check (s'(l(v)) := s(l(v)) - (null|undefined|""))
- CFG branch joining (union of smart types)
- backedge node update (loop variable reset to declared type)
- must-alias sets computation
- smart type for captured variables in lambdas

## 五、覆盖率分析

| 规范条目 | 覆盖状态 | 备注 |
|---------|---------|------|
| null 检查收窄 | ✅ 已覆盖 | SEM_15_08_04_001 |
| 类型不匹配拒绝 | ✅ 已覆盖 | SEM_15_08_04_200 |
| 运行时行为 | ✅ 已覆盖 | SEM_15_08_04_200 |
