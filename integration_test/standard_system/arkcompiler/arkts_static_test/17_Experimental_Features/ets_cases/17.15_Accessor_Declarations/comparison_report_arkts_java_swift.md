# 17.15 Accessor Declarations - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-23
**规范来源：** ArkTS Static Spec 17.15, Java JLS SE21 8.3/9.3, Swift Language Reference (Properties)
**测试基础：** 15 个用例（6 compile-pass + 5 compile-fail + 4 runtime 真实执行）

---

## 一、概览：三语言定位

| 语言 | 顶层 Getter/Setter | 设计哲学 |
|------|-------------------|---------|
| **ArkTS** | 实验特性，顶层/命名空间 `get`/`set` 声明，像变量一样使用 | 扩展属性访问到全局作用域 |
| **Java** | 无顶层 getter/setter，仅类级 getXxx()/setXxx() 方法约定 | 显式方法调用，JavaBean 约定 |
| **Swift** | Computed properties 在全局/类型/局部作用域都可用 | 一等公民属性系统 |

---

## 二、章节对应关系

| ArkTS 17.15 特性 | Java | Swift | 备注 |
|-----------------|------|-------|------|
| 顶层 getter `get name(): T { body }` | 无 | `var name: T { get { } }` | Swift computed property |
| 顶层 setter `set name(v: T) { body }` | 无 | `var name: T { set { } }` | Swift computed property |
| 命名空间 getter/setter | 无 | N/A (无命名空间) | ArkTS 独有组合 |
| native getter/setter | `native` 方法 | 无直接对应 | Java/ArkTS 有 native |
| Getter 返回类型推断 | N/A | ✅ 支持 | ArkTS/Swift 支持 |
| Setter 无返回类型 | N/A | ✅ 隐式 | ArkTS 强制，Java 方法可返回 |

---

## 三、关键差异矩阵

### 3.1 作用域支持

| 作用域 | ArkTS | Java | Swift |
|--------|-------|------|-------|
| 顶层（全局） | ✅ `get/set` | ❌ | ✅ computed property |
| 命名空间 | ✅ `export get/set` | ❌ | N/A |
| 类成员 | ✅ (标准类 getter/setter) | ✅ JavaBean 方法 | ✅ computed property |
| 局部作用域 | ❌ | ❌ | ✅ (Swift 5.x) |

### 3.2 使用语法对比

| 操作 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 读取 | `let x = value` (getter) | `int x = getValue()` | `let x = value` |
| 写入 | `value = 42` (setter) | `setValue(42)` | `value = 42` |
| 调用 | ❌ 编译错误 `value()` | `getValue()` 是方法 | ❌ 编译错误 |

### 3.3 约束检查

| 约束 | ArkTS | Java | Swift |
|------|-------|------|-------|
| Setter 可选参数禁止 | ✅ ESY13534 | N/A (无此概念) | N/A (无此概念) |
| Getter 参数禁止 | ✅ ESY0058 | N/A | N/A |
| Native 无 body | ✅ ESE0083 | ✅ (抽象方法) | N/A |
| 非 native 必须有 body | ✅ ESE0017 | ✅ | ✅ |
| Setter 返回类型禁止 | ✅ ESY0241 | N/A (方法可返回) | ✅ 隐式 |

---

## 四、用例 1:1 对照（三环境实测结果）

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | 顶层 getter 返回计算值 | ✅ compile-pass | ❌ 不支持顶层 | ✅ computed property |
| 002 | 顶层 setter 赋值 | ✅ compile-pass | ❌ 不支持顶层 | ✅ computed property |
| 003 | Getter+setter 配对 | ✅ compile-pass | ❌ 不支持顶层 | ✅ computed property |
| 004 | 命名空间 getter | ✅ compile-pass | ❌ | N/A |
| 005 | 命名空间 setter | ✅ compile-pass | ❌ | N/A |
| 006 | Getter 返回类型推断 | ✅ compile-pass | N/A | ✅ |
| 007 | Getter 作为调用 | ✅ compile-fail | N/A | ✅ compile-fail |
| 008 | Setter 可选参数 | ✅ compile-fail | N/A | N/A |
| 009 | Getter 有参数 | ✅ compile-fail | N/A | N/A |
| 010 | Native getter 有 body | ✅ compile-fail | ✅ compile-fail | N/A |
| 011 | 非 native 无 body | ✅ compile-fail | ✅ compile-fail | ✅ compile-fail |
| 012r | Getter 返回值验证 | ✅ runtime | N/A | N/A |
| 013r | Setter 更新验证 | ✅ runtime | N/A | N/A |
| 014r | Getter+setter 交互验证 | ✅ runtime | N/A | N/A |
| 015r | 命名空间 getter/setter | ✅ runtime | N/A | N/A |

### 关键差异详解

#### 语法对比：顶层 getter/setter ⭐

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `get value(): int { return 42 }` / `set value(v: int) { ... }` / `value = 10; let x = value` | 声明式，像变量使用 |
| Java | `public static int getValue() { return 42; }` / `public static void setValue(int v) { ... }` / `setValue(10); int x = getValue()` | 显式方法调用 |
| Swift | `var value: Int { get { return 42 } set { ... } }` / `value = 10; let x = value` | 声明式，像变量使用 |

#### Setter 返回类型约束 ⭐

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `set name(v: int) { ... }` | 不能声明返回类型，包括 void（ESY0241） |
| Java | `public void setName(int v) { ... }` | 可以声明返回类型（void），这是方法 |
| Swift | `set { backingValue = newValue }` | 隐式无返回 |

---

## 五、综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 语法简洁性 | ★★★★★ | ★★ | ★★★★★ |
| 作用域覆盖 | ★★★★ | ★★ | ★★★★★ |
| 编译时安全 | ★★★★★ | ★★★ | ★★★★★ |
| 与类 member 一致性 | ★★★★★ | N/A | ★★★★★ |
| 功能丰富度 | ★★★ | ★ | ★★★★★ |

---

## 六、核心结论

1. **ArkTS 顶层 getter/setter 是特殊的实验特性**：在顶层和命名空间作用域提供属性式访问，Java 完全不具备，Swift 有类似概念但无命名空间组合。
2. **变量式使用语法是主要优势**：`value = 10` 比 `setValue(10)` 更自然直观。
3. **编译时约束完整**：ArkTS 编译器对 getter/setter 的约束（无参数、无返回类型、无可选参数）与 spec 完全一致，编译时检测完整。
4. **与 Swift 的属性系统差距**：Swift 的 computed properties 支持属性观察器（willSet/didSet）、属性包装器（property wrappers）等高级特性，ArkTS 暂无对应。
5. **SPEC 与实现一致性良好**：所有 15 个用例结果与 spec 预期完全一致（除 17.14 的 optional param 外）。

---

## 七、ArkTS 设计建议

1. **考虑属性观察器**：仿效 Swift 的 willSet/didSet，允许在 setter 中更自然地处理值变更
2. **考虑默认参数名**：仿效 Swift 的 `newValue`（setter）和 `oldValue`（观察器）
3. **扩大作用域支持**：考虑支持局部作用域的 getter/setter（函数内）
4. **保持当前约束**：当前的编译时约束（无参数、无返回类型等）设计正确，建议保持
