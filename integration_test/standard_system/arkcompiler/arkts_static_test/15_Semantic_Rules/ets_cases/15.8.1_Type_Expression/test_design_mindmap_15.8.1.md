# 15.8.1 Type Expression（类型表达式）- 测试设计思维导图

## 一、测试范围

验证 ArkTS 对类型表达式和智能转换（Smart Cast）的行为，包括：
- `instanceof` 类型收窄（instanceof 检查后类型收窄）
- `null`/`undefined` 类型收窄（`!= undefined` 检查后类型收窄）
- `typeof` 类型收窄（Spec 要求，但编译器未实现，已知 GAP）
- 智能转换作用域限制（智能转换仅在检查块内有效）
- 类型表达式运行时行为

## 二、测试用例矩阵

| 测试用例 ID | 类型 | 测试点 | 预期结果 |
|------------|------|--------|---------|
| SEM_15_08_01_001_PASS_INSTANCEOF_SMART_CAST | compile-pass | 验证 instanceof smart cast：instanceof 检查后类型收窄 | ✅ 通过 |
| SEM_15_08_01_002_PASS_NULL_SMART_CAST | compile-pass | 验证 null/undefined smart cast：!= undefined 检查后类型收窄 | ✅ 通过 |
| SEM_15_08_01_100_FAIL_TYPEOF_GAP | compile-fail | 验证 typeof smart cast — Spec 要求 typeof 收窄，编译器未实现（已知 GAP） | ⚠️ GAP |
| SEM_15_08_01_101_FAIL_SMART_CAST_OUTSIDE | compile-fail | 验证智能转换作用域限制：在检查块外不能使用智能转换 | ✅ 通过 |
| SEM_15_08_01_200 | runtime | 类型表达式运行时验证 | ✅ 通过 |

## 三、跨章节关联

- **15.8 Smart Casts and Smart Types**（智能转换和智能类型）- 父章节
- **15.2 Subtyping**（子类型关系）- 类型收窄基于子类型关系
- **4.15.4 Type Operators**（类型运算符）- `instanceof` 和 `typeof` 运算符
- **11.2 Type Testing and Casting**（类型测试和转换）- 类型测试

## 四、测试设计说明

### 4.1 正向测试用例
- **SEM_15_08_01_001**: 验证 `instanceof` 智能转换，`instanceof` 检查后类型从 `Animal` 收窄为 `Dog`
- **SEM_15_08_01_002**: 验证 `null`/`undefined` 智能转换，`!= undefined` 检查后类型收窄

### 4.2 反向测试用例
- **SEM_15_08_01_100**: 验证 `typeof` 智能转换（已知 GAP），Spec 要求 `typeof x === "boolean"` 后 x 应收窄为 `boolean`，但编译器未实现
- **SEM_15_08_01_101**: 验证智能转换作用域限制，在检查块外不能使用智能转换

### 4.3 运行时测试用例
- **SEM_15_08_01_200**: 验证类型表达式运行时行为


## 最新设计要点

从章节思维导图同步的最新测试设计点：

- type expression syntax and evaluation

## 五、覆盖率分析

| 规范条目 | 覆盖状态 | 备注 |
|---------|---------|------|
| instanceof 类型收窄 | ✅ 已覆盖 | SEM_15_08_01_001 |
| null/undefined 类型收窄 | ✅ 已覆盖 | SEM_15_08_01_002 |
| typeof 类型收窄 | ⚠️ 已知 GAP | SEM_15_08_01_100，编译器未实现 |
| 智能转换作用域 | ✅ 已覆盖 | SEM_15_08_01_101 |
| 运行时行为 | ✅ 已覆盖 | SEM_15_08_01_200 |

## 六、已知问题（GAP）

### 6.1 SEM_15_08_01_100_FAIL_TYPEOF_GAP

**问题描述**: Spec 要求 `typeof` 收窄，但编译器未实现。

**Spec 要求**: `typeof x === "boolean"` 后，x 应收窄为 `boolean`。

**编译器行为**: 编译报错 ESE0318。

**分类**: D 类（Spec 与实现不一致）

**跟踪**: ESY145527
