# 9.7.6 Native Methods - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-19
**测试用例数：** 3（2 compile-pass + 1 compile-fail + 0 runtime）
**目的：** 通过用例执行（编译期 + 真实运行时）+ 跨语言对比，识别 ArkTS 本地方法（native methods）设计

---

## 一、与业界静态语言的差异点

### 差异点 CLS-I4：native + static 组合被 es2panda 接受

**用例：** CLS_09_07_046_PASS_NATIVE_STATIC

**实际行为：**
```typescript
class Bad046 { native static foo(): void }
// es2panda 编译通过，无错误
```

**spec 原文（experimental.md §Native Methods）：**
> Native method is a method marked with the keyword native.
> A compile-time error occurs if:
> - Method declaration contains the keyword abstract along with the keyword native.
> - Native method has a body that is a block instead of a simple semicolon or empty body.

**spec 原文（classes.md §Static Methods）：**
> A compile-time error occurs if:
> - The method declaration contains another modifier (abstract, final, or override) along with the modifier static.

**分析：**

spec 的两处约束均未将 `native` 与 `static` 的组合列为 compile-time error：
- §Static Methods 禁止与 static 组合的修饰符为 `abstract`、`final`、`override`，不包含 `native`
- §Native Methods 禁止与 native 组合的修饰符仅为 `abstract`，不包含 `static`

因此，`native static` 组合在 spec 层面未被禁止，es2panda 接受此组合属于"spec 未约束，实现默认放行"的情况。然而，从语言设计角度看，`native` 方法依赖外部平台原生实现（C 语言等），其绑定机制（实例级 vs 类级）在当前 spec 中缺乏明确定义。编译器接受此组合是"被动允许"而非"主动设计"的结果。

**对比：**
| 语言 | native + static 支持 |
|------|---------------------|
| ArkTS | ✅ es2panda 接受（spec 未禁止） |
| Java (JNI) | ✅ 明确支持，如 `System.arraycopy` |
| TypeScript | 无 native 关键字（依赖 declare） |
| Swift | 无 native 关键字 |

**评价：**
- 严重性 LOW：该组合行为上无错误，Java 亦有先例
- 但 spec 未明确定义 native static 方法的语义（原生符号链接规则、调用约定）
- 当前状态为"编译器默认放行而 spec 未充分覆盖"的边缘地带
- 若未来 spec 明确支持则升级为正式特性；若 spec 明确禁止则需编译器增加检查

**建议：**
1. spec 应明确 native 与 static 的组合是否合法
2. 若合法，应补充 native static 方法的原生绑定语义说明
3. 若不合法，es2panda 需增加 compile-time error 检查

---

## 二、符合ArkTS spec的语言设计差异

| 验证点 | 用例 | 状态 |
|-------|------|------|
| native 方法基本声明（分号结尾，无方法体） | 045 | ✅ |
| native 方法与 static 组合声明 | 046 | ✅ |
| native 方法提供 block 方法体被拒绝 | 013 | ✅ |
| native 与 abstract 同时使用被拒绝 | 013 | ✅ |

---

## 三、设计观察

### 观察 A：native 方法的实验性地位 ⭐ DESIGN

**spec 原文（experimental.md）：** native 方法被归类于 "Experimental" 章节，表明其为实验性特性。

**对比：**
| 特性 | spec 位置 | 状态 |
|------|----------|------|
| native methods | experimental.md | 实验性 |
| native constructors | experimental.md | 实验性 |
| final classes/methods | experimental.md | 实验性 |

**评价：** native 方法作为 ArkTS 与原生平台交互的关键通道，目前处于实验性阶段。其 spec 内容相对精简（仅两条约 10 行规范文本），远少于 static methods（约 60 行）或 abstract methods（约 30 行）的篇幅。随着 ArkTS 生态发展，native 方法的规范完善将是重要方向。

### 观察 B：native 修饰符约束集合小于 abstract ⭐ DESIGN

**行为：** native 修饰符的互斥约束集合（仅 `abstract`）显著小于 abstract 修饰符的互斥集合（`static`、`final`、`native`、`async`、`private`）。

| 修饰符组合 | abstract | native |
|-----------|----------|--------|
| + private | ❌ | ✅ 未禁止 |
| + static | ❌ | ✅ 未禁止 |
| + final | ❌ | ✅ 未禁止 |
| + async | ❌ | ✅ 未禁止 |
| + abstract | - | ❌ |
| + native | ❌ | - |

**评价：** native 方法的修饰符约束远少于 abstract 方法，反映出 native 作为实验性特性的规范尚不完整。部分组合（如 native + private、native + final）是否合理，有待 spec 进一步明确。

---

## 四、跨章节差异点

**无重现。** 9.7.6 章节执行 100% 通过，未触发任何已知设计问题。

---

## 五、差异分类总览

| 严重性 | 数量 | 问题列表 |
|-------|------|---------|
| 编译器待完善 | 0 | - |
| 语言差异 | 0 | - |
| 设计观察 | 1 | CLS-I4：native+static 被接受但 spec 未明确定义 |
| 设计观察 | 2 | A、B |

---

## 六、跨语言对比结论

| 维度 | 评价 |
|------|------|
| 与 spec 一致性 | ⭐⭐⭐⭐⭐（执行 100% 通过）|
| 编译期约束严密性 | ⭐⭐⭐⭐（native+body、native+abstract 均正确拦截）|
| spec 覆盖完整度 | ⭐⭐（仅 2 条约 10 行，修饰符组合规则大量留白）|
| 实验性特性成熟度 | ⭐⭐⭐（基础约束可用，但语义定义待完善）|
| 与 Java JNI 对比 | ArkTS 基础行为 = Java（native 方法声明模式一致）|

---

## 七、累积发现汇总（含 9.7.1 ~ 9.7.6）

| 严重性 | 总数 | 来源章节 |
|-------|------|---------|
| 编译器待完善 | 0 | - |
| 语言差异 | 0 | - |
| 设计观察 | 1 | 9.7.6: CLS-I4 |
| 设计观察 | 5 | 9.7.3: A/B/C + 9.7.6: A/B |

---

## 八、改进建议

### 短期
1. spec 明确 native 与 static/final/async/private 等修饰符的组合规则
2. 若 native+static 合法，补充静态本地方法的原生符号链接规范

### 中期
3. 将 native methods 从实验性章节提升至正式章节，完善规范文本
4. 补充 native 方法的运行时绑定模型说明（JNI 风格 vs 自有机制）

### 长期
5. 建立 native 方法的跨平台兼容性测试体系（不同目标平台的原生实现验证）
