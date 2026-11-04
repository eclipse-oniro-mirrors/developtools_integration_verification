# 9.7.6 Native Methods - 测试设计思维导图

## 概述
本节定义 **本地方法 (Native Method)**：使用 `native` 关键字标记的方法。

**核心语义 (spec/experimental.md, spec/classes.md)：**
- Native methods 由平台相关代码实现（如 C 语言），而非 ArkTS 实现
- Native method 必须为空体（分号 `;` 或空 body）
- `native` 与 `abstract` 互斥，不可同时使用
- Native method 不可提供 block 方法体

**compile-time error 触发条件：**
1. Method declaration 同时包含 `abstract` 与 `native` 关键字
2. Native method 的 body 是 block 而非分号或空体

**实验性特性：** native methods 属于实验性特性（spec/experimental.md），规范篇幅精简（约 2 条规则）。修饰符组合约束（native + static/final/async/private）在 spec 中**未明确禁止**，属于留白区域。

## 核心规则

### Native Method 声明语法
| 形式 | 示例 | 合法性 |
|------|------|--------|
| 基本声明（分号结尾） | `native foo(): void` | ✅ |
| 空 body（省略 body） | `native foo(): void` | ✅ |
| block body | `native foo(): void { return 42 }` | ❌ compile-time error |
| 与 abstract 组合 | `abstract native foo(): void` | ❌ compile-time error |
| 与 static 组合 | `native static foo(): void` | ✅ spec 未禁止 |

### Native Method 修饰符约束矩阵
| 修饰符组合 | abstract | native |
|-----------|----------|--------|
| + private | ❌ | ✅ 未禁止 |
| + static | ❌ | ✅ 未禁止 |
| + final | ❌ | ✅ 未禁止 |
| + async | ❌ | ✅ 未禁止 |
| + override | ❌ | ✅ 未禁止 |
| + abstract | - | ❌ |
| + native | ❌ | - |

## 测试点覆盖

### 1. Native Method 基本声明（PASS）
- 在普通 class 中声明 `native foo(): void`，以分号结尾，无 block body
- native 方法带参数：`native bar(x: int, s: string): boolean`
- native 方法带返回类型：`native getValue(): int`
- 多个 native 方法在同一 class 中
- native 方法带泛型参数：`native get<T>(): T`（实验性，spec 未明确）

### 2. Native Method + static 组合（PASS）
- `native static` 方法声明
- `native static` 方法带参数与返回值
- 多个 native static 方法共存

### 3. Native Method + 其余修饰符组合（PASS）⭐ 留白验证
- `native private` 方法声明（spec 未禁止）
- `native final` 方法声明（spec 未禁止）
- `native override` 方法声明（spec 未禁止，需父类有对应方法签名）
- `native async` 方法声明（spec 未禁止）

### 4. Native Method body 违规（FAIL）
- native 方法提供 block body `{ return 42 }`
- native 方法提供 block body 带多行语句
- native 方法提供空 block `{}`（理论上空 block 仍是 block）

### 5. Native + abstract 互斥违规（FAIL）
- `abstract native foo(): void` 在同一 class 中
- `abstract native foo(): void` 在 abstract class 中

### 6. Native Method body 缺失/空体违规（FAIL）⭐ 反向验证
- 非 native 非 abstract 方法无 body（仅有分号）
- 普通方法（非 native 非 abstract）省略 body

### 7. Native Method 边界值与边缘场景
- native 方法在 abstract class 中声明（不与 abstract 组合修饰符，仅声明 native）
- native 方法不提供返回类型（spec 未明确，需验证编译器行为）
- 空 class 仅包含 native 方法
- native 方法与字段/属性/构造器共存
- native 方法名与父类非 native 方法同名（override 场景）

### 8. Native Accessor（native getter/setter）（PASS）
- `native get` accessor 声明
- `native set` accessor 声明
- native accessor 提供 body 为违规（FAIL）

### 9. Native Constructor（PASS + FAIL）
- `native constructor` 声明（spec/experimental.md）
- native constructor 提供非空 body 为违规（FAIL）

### 10. Runtime 验证
- **无实际 runtime 用例。** native 方法的运行时行为依赖外部平台原生实现（C 代码绑定），无法在纯 ark VM 环境中独立验证。仅做编译期验证。

## 编号规划
- compile-pass: 045 ~ 058
- compile-fail: 013 ~ 020
- runtime: （暂无）

## 文件命名规范
`CLS_09_07_NNN_{CATEGORY}_{DESCRIPTION}.ets`

| 前缀 | 范围 | 说明 |
|------|------|------|
| `CLS` | 固定 | Class 章节前缀 |
| `09_07` | 固定 | 9.7 节 Method Declarations |
| `NNN` | 编号 | 三位数编号 |
| `CATEGORY` | `PASS` / `FAIL` / `RUNTIME` | 测试分类 |
| `DESCRIPTION` | 自由描述 | 简洁英文描述测试场景 |

**示例：**
- `CLS_09_07_045_PASS_NATIVE_DECLARATION.ets`
- `CLS_09_07_046_PASS_NATIVE_STATIC.ets`
- `CLS_09_07_013_FAIL_NATIVE_WITH_BODY.ets`

## 分类说明
- **compile-pass**（.ets 文件必须编译成功）
- **compile-fail**（.ets 文件必须产生编译时错误）
- **runtime**（.ets 文件测试运行时行为——本节暂无）

## 现有用例覆盖
| 编号 | 文件名 | 分类 | 场景 | 状态 |
|------|--------|------|------|------|
| 045 | CLS_09_07_045_PASS_NATIVE_DECLARATION.ets | compile-pass | native 方法基本声明 | ✅ |
| 046 | CLS_09_07_046_PASS_NATIVE_STATIC.ets | compile-pass | native static 组合 | ✅ |
| 013 | CLS_09_07_013_FAIL_NATIVE_WITH_BODY.ets | compile-fail | native+body 违规 + native+abstract 违规 | ✅ |

## 待补测试点（建议优先级）
| 优先级 | 场景 | 分类 | 说明 |
|--------|------|------|------|
| HIGH | native + private/final/override/async | compile-pass | 修饰符组合留白验证 |
| HIGH | 非 native 方法无 body | compile-fail | 规则对称性验证 |
| MEDIUM | native accessor (getter/setter) | compile-pass + fail | 实验性特性补充 |
| MEDIUM | native constructor | compile-pass + fail | 实验性特性补充 |
| LOW | native 方法在 abstract class 中 | compile-pass | 边界场景 |
| LOW | native 方法不提供返回类型 | ? | spec 未明确，编译器行为验证 |
| LOW | native 方法带泛型参数 | ? | spec 未明确 |
