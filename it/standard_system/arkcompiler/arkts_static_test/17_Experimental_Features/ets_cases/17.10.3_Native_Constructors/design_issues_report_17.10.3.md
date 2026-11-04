# 17.10.3 Native Constructors - ArkTS 与 Java/Swift 行为差异及规范一致性报告

## 概述

本报告记录在测试 ArkTS 17.10.3 Native Constructors 章节时发现的语言设计问题。这些问题可能是 ArkTS 特有的设计选择，也可能是与主流语言不一致的潜在问题。

---

---

## 报告分类口径

| 分类 | 含义 | 处理方式 |
|------|------|----------|
| 符合 ArkTS spec 的语言设计差异 | 行为与 Java/Swift 不同，但符合 ArkTS spec 或当前明确语义 | 不标为缺陷，仅记录差异 |
| Spec 与实现不一致 | 用例与 spec 要求不一致，且当前实现未按 spec 报错/运行 | 保留 FAIL 用例并记录 issue_report |
| 待确认问题 | 需要补充 stdlib/spec/实现依据后才能定性 | 暂不判定为缺陷 |
| 已验证规范一致行为 | 用例验证 ArkTS 行为符合 spec | 记录为通过项 |

## 设计问题列表

### 问题 1: native constructor 是 ArkTS 独有的平台特性

**问题描述**：
ArkTS 支持在构造函数上使用 `native` 修饰符，而 Java 和 Swift 均无对应的语言特性。Java 的 `native` 关键字只能用于方法，不能用于构造函数；Swift 完全没有 `native` 关键字（使用 `@_silgen_name` 或 module map 完成 C/ObjC 互操作）。

**复现用例 ID**：EXP2_17_10_03_001_PASS_NATIVE_CONSTRUCTOR_NO_PARAMS, EXP2_17_10_03_002_PASS_NATIVE_CONSTRUCTOR_WITH_PARAMS, EXP2_17_10_03_003_PASS_NATIVE_CONSTRUCTOR_IN_SUBCLASS

**实测错误信息**：无（语言设计选择）

**跨语言对比表**：

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `native constructor()` | 编译通过，声明无函数体 |
| Java | `native ClassName();` | 编译错误：`native` 只能用于方法，不能用于构造函数 |
| Swift | 无对应语法 | `native` 关键字不存在，`init()` 必须有函数体 |

**严重性等级**：LOW

**分析**：
- `native constructor` 是 ArkTS 的平台特有设计，用于声明由 native 层（C/C++）实现的构造函数
- Java 开发者通常通过工厂方法模式或构造函数中调用 `native` 方法来实现类似效果
- Swift 开发者通过编译器桥接（`@objc`、`@_silgen_name`）实现类似功能，但从来不在语言层面提供 `native` 关键字
- 这种设计使得 ArkTS 与底层平台（OpenHarmony）的集成更直接，但增加了 Java/Swift 开发者的学习成本
- 从平台定位来看，ArkTS 作为 OpenHarmony 平台语言，此设计是合理的

**改进建议**：
1. 在迁移文档中明确说明 `native constructor` 与 Java `native` 方法的差异
2. 提供 Java/Swift 等价模式示例（工厂方法 + native init 方法）
3. 明确说明 `native constructor` 只适用于 ArkTS 平台绑定场景

---

### 问题 2: 空函数体 `{}` 同样被拒绝

**问题描述**：
`native constructor() {}`（空函数体）与 `native constructor() { console.log("x") }`（非空函数体）同样产生 ESE0084 编译错误。虽然空函数体在语义上表示"无操作"，与无函数体的语义等价，但编译器一致地拒绝任何形式的函数体。

**复现用例 ID**：EXP2_17_10_03_007_FAIL_NATIVE_CONSTRUCTOR_EMPTY_BODY, EXP2_17_10_03_006_FAIL_NATIVE_CONSTRUCTOR_NONEMPTY_BODY

**实测错误信息**：
```
ESE0084: Native constructor declaration cannot have a body.
```

**跨语言对比表**：

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `native constructor() {}` | ESE0084 编译错误 |
| Java | N/A（Java 无 native constructor） | N/A |
| Swift | N/A（Swift 无 native 关键字） | N/A |

**严重性等级**：LOW

**分析**：
- 编译器一致地将"空函数体"和"非空函数体"视作违规，这与 spec 规定一致：`native constructor` 声明不能有任何函数体
- 从语言设计角度看，允许空函数体 `{}` 作为语法糖（syntactic sugar）在技术上可行，因为空函数体语义上等价于无函数体
- 但保持严格的"零容忍"规则有其好处：强制开发者明确区分 native 声明和 regular 声明，避免混淆
- 如果允许空函数体，可能导致开发者误以为 native 实现是可选的
- 一致的拒绝策略使错误信息更加清晰，开发者不会对"为什么空体可以而非空体不行"产生困惑

**改进建议**：
1. 保持现有的严格拒绝策略（一致性好）
2. 如果未来考虑改进，可以在错误信息中附加提示："Use no body at all for native constructors."
3. 在文档中说明 `native constructor()` 的正确写法（无函数体，以分号或换行结束）

---

### 问题 3: native constructor 缺少编译时平台实现检查

**问题描述**：
声明了 `native constructor()` 的类，如果对应 native 实现不存在，在运行时尝试实例化将产生 `LinkerUnresolvedMethodError`（链接错误），但编译期没有任何警告。与 regular 方法相比，native 构造函数的外部依赖没有编译期可见性检查。

**复现用例 ID**：EXP2_17_10_03_004_PASS_NATIVE_AND_REGULAR_CONSTRUCTOR, EXP2_17_10_03_012_RUNTIME_NATIVE_AND_REGULAR_CONSTRUCTOR

**实测错误信息**：
```
LinkerUnresolvedMethodError (运行时): native constructor implementation not found
```

**跨语言对比表**：

| 语言 | 代码 | 编译时检查 | 运行时行为 |
|------|------|-----------|-----------|
| ArkTS | `native constructor()` | 无检查 | LinkerUnresolvedMethodError |
| Java | `native void method();` | 无编译时检查 | UnsatisfiedLinkError |
| Swift | `@_silgen_name("func") func f()` | 无编译时检查 | 链接时崩溃 |

**严重性等级**：MEDIUM

**分析**：
- 这是一个跨语言共性问题：Java 的 `native` 方法同样没有编译期检查，如果 JNI 实现缺失，运行时抛出 `UnsatisfiedLinkError`
- 但是 ArkTS 的 native constructor 场景更危险：如果没有 regular constructor 作为后备路径，类的实例化完全不可用
- 测试验证了"native 与 regular constructor 共存"的正面模式（用例 004/012），允许通过 regular constructor 完成实例化
- 如果类只有一个 native constructor 且没有对应的 native 实现，该类在运行时完全不可用——这种场景应该有编译期或链接期的警告

**改进建议**：
1. 提供 lint 规则：检测类中仅有 native constructor 且无对应的 native 库声明时产生警告
2. 提供编译选项（如 `--strict-native-link`）启用 native 符号的链接时检查
3. 推荐良好实践：包含 native constructor 的类应同时提供 regular constructor 作为后备
4. 在文档中明确说明 native constructor 需要平台侧对应的 C/C++ 实现

---

### 问题 4: native constructor 可与 regular constructor 共存（正面设计）

**问题描述**：
ArkTS 允许一个类中同时声明 `native constructor()` 和 regular `constructor(...)`，两者形成重载关系。这种设计使同一个类既能通过 native 路径实例化（高性能），也能通过纯 ArkTS 路径实例化（兼容性）。

**复现用例 ID**：EXP2_17_10_03_004_PASS_NATIVE_AND_REGULAR_CONSTRUCTOR, EXP2_17_10_03_012_RUNTIME_NATIVE_AND_REGULAR_CONSTRUCTOR

**实测错误信息**：无（正面特性）

**跨语言对比表**：

| 语言 | 等价模式 | 行为 |
|------|----------|------|
| ArkTS | `native constructor(); constructor(val: int) { ... }` | 编译通过，两者共存 |
| Java | `public ClassName() { this.nativeInit(); } native void nativeInit();` | 需要包装模式实现 |
| Swift | 两个 `init(...)` 重载（均需要有函数体） | 通过重载实现，无 native 概念 |

**严重性等级**：不适用（正面设计特性）

**分析**：
- 这是 ArkTS 设计的一个优点：native 和 regular constructor 的重载使得类可以灵活适配不同使用场景
- 当 native 实现存在时，平台可以使用 native constructor 获得更好的性能
- 当 native 实现不可用时，开发者仍然可以通过 regular constructor 创建和使用对象
- 这与 Java 中通过构造器调用 native 初始化方法的模式有相似的使用效果，但 ArkTS 将这种模式提升为语言级特性
- 用例 012 已验证通过 regular constructor 实例化完全正常，属性和方法访问均工作正确

**改进建议**：
1. 将这种模式写入良好实践文档
2. 推荐包含 native constructor 的类始终提供至少一个 regular constructor 作为后备路径

---

## 总结

| 问题 | 分类 | 严重性 | 是否需要改进 |
|------|------|--------|-------------|
| native constructor 是 ArkTS 独有特性 | 符合 ArkTS spec 的语言设计差异 | LOW | 文档说明 |
| 空函数体 {} 同样被拒绝 | 已验证规范一致行为 | LOW | 保持现状 |
| 缺少编译时平台实现检查 | 待确认问题 | MEDIUM | 建议增加 lint/编译选项 |
| native 与 regular constructor 共存 | 已验证规范一致行为（正面） | N/A | 写入良好实践 |

**核心结论**：
ArkTS 的 native constructor 特性是平台特有的设计，与 Java/Swift 无直接对应。主要的关注点是 native 符号的编译时可见性缺失（与 Java 同类问题），但"native + regular constructor 共存"的设计提供了良好的灵活性。空函数体的严格拒绝是一致性设计选择，无需改变。

---

**报告生成时间**：2026-06-23
**分析依据**：ArkTS Static Language Specification, Java SE 21 JLS, Swift 5.10
