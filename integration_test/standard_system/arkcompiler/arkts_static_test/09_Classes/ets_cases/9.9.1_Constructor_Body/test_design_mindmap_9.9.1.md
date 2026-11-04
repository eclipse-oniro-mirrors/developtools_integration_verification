# 9.9.1 Constructor Body (构造器体) - 测试设计思维导图

## 概述
本节定义 **构造器体 (Constructor Body)** 的语法与语义规则。包括：
1. **主构造器 (Primary Constructor)**：类的 `constructor(params) { body }` 声明
2. **辅助构造器 (Secondary Constructor)**：通过 `this()` 委派同类主构造器的额外 `constructor` 声明

**核心语义：**
- 主构造器体执行顺序（5 步）：不涉及 this/super 的可选代码 → `super()` 调用 → 编译器隐式字段初始化器（按声明顺序）→ 不通过 this 访问未初始化字段的代码 → 所有字段初始化完成后任意代码
- `super()` 必须是构造器体 **根级语句 (root-level statement)**
- 辅助构造器 `this()` 委派调用必须是 **根级语句**
- `super()` 实参不能使用 `this` 或 `super` 关键字
- 构造器不能显式 `return` 值
- 构造器不能直接或间接调用自身（禁止递归/循环委派）
- 父类有无参构造器时 `super()` 隐式添加
- 编译器采用三级策略检测未初始化字段访问：可证实违反时 compile-time error；可能违反时 compile-time warning；无法静态判定时由实现决定

## 核心规则

### 主构造器体规则
| 规则 | 说明 |
|------|------|
| `this.field` 初始化 | 构造器体中通过 `this.field = value` 初始化实例字段 |
| `super()` 根级调用 | 调用父类构造器必须是根级语句，不可嵌套在 if/for/while 等块中 |
| `super()` 前可选代码 | 允许不涉及 `this`/`super` 的任意代码（局部变量计算、静态调用等） |
| `super()` 实参限制 | 实参中不能使用 `this`（字段未初始化）或 `super` 关键字 |
| 禁止显式 `return` 值 | 构造器不能 `return 42` 等带值表达式的返回语句 |
| 父类无参构造器 | 编译器自动隐式添加 `super()` 调用 |

### 辅助构造器体规则
| 规则 | 说明 |
|------|------|
| `this()` 委派 | 通过 `this(...)` 调用同类的主构造器或其余辅助构造器 |
| `this()` 根级调用 | `this()` 必须是根级语句，不可嵌套在条件/循环块中 |
| 禁止递归委派 | 构造器不能直接调用自身（`constructor() { this() }`）或间接形成循环 |
| 委托链终止 | 最终必须委派到主构造器（主构造器调用 `super()` 链至基类） |

### 字段初始化检测三级策略 ⭐ ARCH
1. **Compile-time error**：编译器可证实时，字段在被初始化前被访问
2. **Compile-time warning**：可能违反但不确定时
3. **Runtime implementation-defined**：无法静态判定时由实现决定

## 测试点覆盖

### 1. 主构造器基本用法（PASS）
- 主构造器声明与 `this.field` 字段初始化
- 继承场景下主构造器调用 `super()` 初始化父类

### 2. 辅助构造器基本用法（PASS）
- 辅助构造器通过 `this(args)` 委派同类主构造器
- 两参主构造器 + 无参辅助构造器委派模式

### 3. super() 前可选代码（PASS）⭐
- `super()` 前执行局部变量计算（算术、逻辑）
- `super()` 前执行不涉及 `this`/`super` 的任意合法代码
- 局部变量结果传递给 `super()` 实参

### 4. 反向：super() 非根级语句（FAIL）
- `super()` 放在 `if` 块内调用 — compile-time error
- 验证 `super()` 必须是 root-level statement

### 5. 反向：构造器显式 return 值（FAIL）
- `constructor() { return 42 }` — compile-time error
- 验证 spec 规则 "Explicit return of a value is prohibited"

### 6. 反向：super() 实参使用 this（FAIL）
- `super(this.instanceField)` — compile-time error
- 此时 `this` 尚未初始化，违反 spec 安全约束

### 7. 反向：super() 实参使用 super 关键字（FAIL）
- `super(super.toString())` — compile-time error
- `super(super.method())` 变体 — compile-time error
- 两个用例覆盖不同父类方法场景

### 8. 反向：构造器直接自调用（FAIL）
- `constructor() { this() }` — 直接递归，compile-time error
- 验证 spec 规则 "constructor calls itself, directly or indirectly"

### 9. 反向：辅助构造器 this() 非根级语句（FAIL）
- `this()` 放在 `if` 块内 — compile-time error
- 两个用例覆盖不同复杂度的违规场景

### 10. 反向：构造器间接循环委派（FAIL）
- 辅助构造器通过参数转换导致循环 — compile-time error
- `constructor(a, b) { this(a + b, 0) }` 形式的间接自调用

### 11. Runtime：构造器执行顺序（RUNTIME）⭐
- 三级继承链（GrandParent → Parent → Child）构造器执行顺序验证
- 预期顺序：祖类构造器 → 父类构造器 → 子类构造器
- 两个用例（005 简单版 + 017 带字段版）交叉验证

### 12. Runtime：字段初始化与构造器交错顺序（RUNTIME）⭐
- 精确追踪字段初始化器与构造器体的交错执行
- 预期输出：`GfGcPfPcCfCc`（GrandParent字段→GrandParent构造器→Parent字段→Parent构造器→Child字段→Child构造器）
- 与 spec §9.9.1 示例输出完全一致

### 13. Runtime：instanceof 检查正确性（RUNTIME）
- 构造器初始化完成后 `instanceof` 关系正确
- 父类/子类内部字段值在构造后均可正确读取
- 验证 spec `crash_this` 示例行为

### 14. Runtime：辅助构造器运行时验证（RUNTIME）
- 无参辅助构造器委派三参主构造器
- 运行时字段值正确（1/2/3 对应 x/y/z）

### 15. Runtime：三级继承所有字段值验证（RUNTIME）
- `GrandParent → Parent → Child` 继承链
- 每层字段均正确初始化（gpVal="gp" / pVal="p" / cVal="c"）

## 边界值与边缘场景

### 字段初始化边缘场景
- 字段初始化器依赖前一个字段的值（按声明顺序）
- `super()` 前代码涉及局部变量与表达式混合计算
- 构造器体为空时字段初始化器仍然执行

### 辅助构造器边缘场景
- 辅助构造器委派链长度 > 2（A → B → C 主构造器）
- 辅助构造器与主构造器参数数量/类型不匹配
- 辅助构造器在委派前没有可选代码（与主构造器 `super()` 前代码机制不同）

### 继承边缘场景
- 基类无显式构造器（隐式默认构造器 `super()` 行为）
- 基类仅有有参构造器（子类必须显式 `super(args)`）
- abstract class 构造器行为

### 编译检测边缘场景
- 字段在 `super()` 之前通过局部别名间接被访问
- 字段在 `super()` 之后但在初始化器之前被访问（warning 场景）
- 静态字段 vs 实例字段在构造器中的访问差异

### 运行时边缘场景
- 构造器体中抛出异常时字段状态
- `new` 表达式本身就是构造器调用，嵌套 `new` 的构造器交错顺序

## 编号规划

| 类别 | 编号范围 | 数量 |
|------|---------|------|
| compile-pass | 001 ~ 003（001, 002, 010） | 3 |
| compile-fail | 004 ~ 025（不连续） | 9 |
| runtime | 005 ~ 023（不连续） | 6 |
| **合计** | | **18** |

## 文件命名规范

`CLS_09_09_NNN_{CATEGORY}_{DESCRIPTION}.ets`

- **CLS**: Classes 章节前缀
- **09_09**: 9.9 节（含子节 9.9.1）
- **NNN**: 三位数字编号（001 ~ 025）
- **CATEGORY**: `PASS` / `FAIL` / `RUNTIME`
- **DESCRIPTION**: 测试点英文描述，使用下划线连接

### 命名示例
| 编号 | 文件名 | 含义 |
|------|--------|------|
| 001 | `CLS_09_09_001_PASS_PRIMARY_CONSTRUCTOR.ets` | 主构造器基本用法 |
| 003 | `CLS_09_09_003_FAIL_SUPER_NOT_ROOT.ets` | super() 非根级语句 |
| 005 | `CLS_09_09_005_RUNTIME_CONSTRUCTOR_EXEC_ORDER.ets` | 构造器执行顺序 |

### 编号规则
- compile-pass 使用 `001` ~ `003`（含跳号，010 属于 pass）
- compile-fail 使用 `004` ~ `025` 范围
- runtime 使用 `005` ~ `023` 范围
- 编号在 NNN 空间统一编排，不按类别独立编号

## 关键设计观察 (design observations)

### A. 构造器执行顺序设计严密 ⭐ DESIGN
ArkTS spec 详细规定主构造器体的五步执行顺序，比 TypeScript 更严格、更可预测：
1. 不涉及 this/super 的可选代码
2. 调用父类构造器 super()
3. 编译器隐式添加字段初始化器（按声明顺序）
4. 不通过 this 访问未初始化字段的代码
5. 所有字段初始化完成后的任意代码

### B. super() 前代码限制兼顾灵活性与安全性 ⭐ DESIGN
允许 super() 前放置不涉及 this/super 的任意代码，在安全（禁止访问未初始化 this）和灵活（允许预处理计算）之间取得良好平衡。对比 Java（更宽松，可访问 static 成员）和 Swift（两阶段初始化，phase 1 极其严格）。

### C. 编译时检测非初始化字段访问的多级策略 ⭐ DESIGN
三级策略：可证实时 compile-time error → 可能违反时 compile-time warning → 无法静态判定时由实现决定。务实工程折中，在不牺牲太多表达能力的前提下最大化静态安全。
