# 17.9.1 Explicit Function Overload — ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-25
**测试用例数：** 17（7 compile-pass + 7 compile-fail + 3 runtime）
**通过率：** 94.1%（16/17，1例异常通过）
**编译器：** es2panda --extension=ets (Linux native)
**运行时：** ark VM
**Spec 依据：** arktsspecification.md §17.9.1

## 报告分类口径

| 分类 | 含义 | 处理方式 |
|------|------|----------|
| 符合 ArkTS spec 的语言设计差异 | 行为与 Java/Swift 不同，但符合 ArkTS spec 或当前明确语义 | 不标为缺陷，仅记录差异 |
| Spec 与实现不一致 | 用例与 spec 要求不一致，且当前实现未按 spec 报错/运行 | 保留 FAIL 用例并记录 issue_report |
| 已验证规范一致行为 | 用例验证 ArkTS 行为符合 spec | 记录为通过项 |

---

## 一、符合 ArkTS spec 的语言设计差异

### 差异 A：显式 overload 声明是 ArkTS 特殊设计，Java/Swift 无对应语法

**分类：** 符合 ArkTS spec 的语言设计差异

#### Spec 依据
§17.9.1 规定：通过 `overload f { fi, fs }` 将多个顶层函数绑定到同一个名称，声明顺序决定重载解析优先级。ArkTS 的 overload 声明是一种显式的、声明式的函数集合绑定，与 Java/Swift 的隐式签名重载本质不同。

#### 实测行为
```typescript
function addInt(a: int, b: int): int { return a + b }
function addStr(a: string, b: string): string { return a + b }
function addDbl(a: double, b: double): double { return a + b }
overload add { addInt, addStr, addDbl }
```

#### 跨语言对比

| 语言 | 函数重载机制 | 声明方式 | 解析策略 |
|------|-----------|---------|---------|
| ArkTS | 显式 `overload` 声明 | 声明式绑定，顺序决定优先级 | 第一个匹配的签名胜出 |
| Java | 隐式方法签名重载 | 同名方法不同参数列表（自动） | 编译期最具体匹配 |
| Swift | 不支持自由函数重载 | 仅支持方法重载（参数标签区分） | N/A |
| TypeScript | 函数重载签名 | 多个声明签名 + 一个实现签名 | 仅编译时类型检查，运行时单一实现 |

---

### 差异 B：overload 名不能作为函数引用（Function Reference）

**分类：** 符合 ArkTS spec 的语言设计差异

#### 实测行为
```typescript
function fInt(a: int): int { return a }
function fStr(a: string): string { return a }
overload f { fInt, fStr }
let fn: (a: int) => int = f  // ❌ 编译错误
```

Java 中重载的方法在方法引用上下文需要目标类型推断来选择具体重载（`Function<Integer,Integer> fn = this::f` 通过参数类型推断）。ArkTS 完全禁止将 overload 名作为函数引用，避免了歧义。

---

### 差异 C：overload 声明基于模块/命名空间作用域

**分类：** 符合 ArkTS spec 的语言设计差异

ArkTS 要求所有重载函数必须在同一模块/命名空间作用域内，跨作用域引用会产生编译错误。Java 的方法重载天然受限于类作用域，Swift 的方法重载受限于类型作用域。ArkTS 的模块作用域重载是特殊的顶层设计。

---

## 二、Spec 与实现不一致

### 不一致 A：空重载列表编译通过（EXP2_FuncOverload_Empty_fail）

**分类：** Spec 与实现不一致

**用例文件：** `EXP2_17_09_1_009_FAIL_FUNCOVERLOAD_EMPTY.ets`
**预期行为（规范）：** 空的 `overload identifier { }` 列表应为编译错误
**实际行为：** es2panda 编译器允许编译通过
**严重性：** 低 — spec 可能需要明确空列表是否有实际语义，或编译器需加固
**建议：** 确认 spec 意图后决定修复方向。空 overload 语义不明确（相当于没有重载），应该被拒绝或明确允许。

---

## 三、已验证规范一致行为

经 es2panda + ark VM 实测，以下行为与 ArkTS spec §17.9.1 一致：

| 行为 | 验证方式 | 结果 |
|------|---------|------|
| 基本类型重载（int/string/boolean/double） | compile-pass (001) | ✅ 通过 |
| 不同参数数量重载（0/1/多参数） | compile-pass (002) | ✅ 通过 |
| export 重载及所有函数导出验证 | compile-pass (003) | ✅ 通过 |
| 泛型函数重载 | compile-pass (004) | ✅ 通过 |
| 多个 overload 声明共存 | compile-pass (005) | ✅ 通过 |
| overload 名与函数同名（该函数在列表中） | compile-pass (006) | ✅ 通过 |
| 不同返回类型（签名通过参数区分） | compile-pass (007) | ✅ 通过 |
| overload 名不能作为函数引用 | compile-fail (008) | ✅ 编译错误 |
| export 未全部导出应报错 | compile-fail (010) | ✅ 编译错误 |
| 重载名冲突（重复绑定） | compile-fail (011) | ✅ 编译错误 |
| 同名方法不在列表中 | compile-fail (012) | ✅ 编译错误 |
| 引用不存在/不可访问的函数 | compile-fail (013) | ✅ 编译错误 |
| 调用参数类型不匹配 | compile-fail (014) | ✅ 编译错误 |
| 重载分发顺序（最先匹配优先） | runtime (016) | ✅ 通过 |
| 不同参数个数分发 | runtime (015) | ✅ 通过 |
| 返回值正确性验证 | runtime (017) | ✅ 通过 |

---

## 四、跨语言对比摘要

| 维度 | ArkTS | Java | Swift | TypeScript |
|------|-------|------|-------|-----------|
| 自由函数重载 | ✅ 显式 overload 声明 | ❌ 不支持（仅方法重载） | ❌ 不支持 | ⚠️ 声明签名但不运行时区分 |
| 重载声明方式 | 声明式（overload keyword） | 隐式（同名不同签名） | N/A | 类型级签名声明 |
| 编译验证 | ✅ es2panda — 16/17 通过 | ✅ javac（方法重载） | N/A | ✅ tsc |
| 运行时验证 | ✅ ark VM — 3/3 通过 | ✅ JVM | N/A | ✅ Node（但单一实现） |
| Spec 一致性 | ⚠️ 1 例不一致（空列表） | ✅ JLS §8.4.9 | N/A | ✅ TS spec |

---

## 五、分类汇总

| 条目 | 分类 |
|------|------|
| 差异 A：显式 overload 声明是特殊设计 | 符合 ArkTS spec 的语言设计差异 |
| 差异 B：overload 名不能作为函数引用 | 符合 ArkTS spec 的语言设计差异 |
| 差异 C：模块作用域限制 | 符合 ArkTS spec 的语言设计差异 |
| 不一致 A：空重载列表编译通过 | Spec 与实现不一致 |
| 已验证规范一致行为 | 14 项通过 / 2 项编译错误 |

---

## 六、关联记录

- 章节级异常汇总：[issue_report.md](../../issue_report.md)
- 测试执行报告：[test_report_17.9.1.md](test_report_17.9.1.md)
- 测试设计：[test_design_mindmap_17.9.1.md](test_design_mindmap_17.9.1.md)
- 跨语言对比：[comparison_report_arkts_java_swift.md](comparison_report_arkts_java_swift.md)
