# 17.9.3 Explicit Interface Method Overload — ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-25
**测试用例数：** 10（6 compile-pass + 3 compile-fail + 1 runtime）
**通过率：** 100%（10/10，0例异常）
**编译器：** es2panda --extension=ets (Linux native)
**运行时：** ark VM
**Spec 依据：** arktsspecification.md §17.9.3

## 报告分类口径

| 分类 | 含义 | 处理方式 |
|------|------|----------|
| 符合 ArkTS spec 的语言设计差异 | 行为与 Java/Swift 不同，但符合 ArkTS spec 或当前明确语义 | 不标为缺陷，仅记录差异 |
| Spec 与实现不一致 | 用例与 spec 要求不一致，且当前实现未按 spec 报错/运行 | 保留 FAIL 用例并记录 issue_report |
| 已验证规范一致行为 | 用例验证 ArkTS 行为符合 spec | 记录为通过项 |

---

## 一、符合 ArkTS spec 的语言设计差异

### 差异 A：接口中显式 overload 声明是 ArkTS 特殊设计

**分类：** 符合 ArkTS spec 的语言设计差异

#### Spec 依据
§17.9.3 规定：接口中声明 `overload identifier { method1, method2, ... }`。实现类必须实现所有重载方法。可在实现类中 override overload。Override 必须包含接口中的所有方法。如果实现类不 override，则继承接口的 overload。多个继承的同名 overload 时必须 override。

#### 实测行为
```typescript
interface Handler {
  handleInt(a: int): string
  handleStr(a: string): string
  overload handle { handleInt, handleStr }
}
```

#### 跨语言对比

| 语言 | 接口方法重载机制 | 实现方式 |
|------|--------------|---------|
| ArkTS | 显式 `overload` 声明在接口中 | 实现类必须实现所有方法，可 override overload 添加方法 |
| Java | 隐式签名重载 | default 方法可提供默认实现；实现类必须实现所有抽象方法 |
| Swift | protocol 方法声明 | protocol extension 可提供默认实现；实现类型必须实现无默认实现的方法 |
| TypeScript | 接口方法签名重载 | 与 Java 类似，无运行时重载 |

**关键差异：** ArkTS 在接口中直接声明 overload 绑定关系，实现类可以 override 该 overload 声明来添加自己的方法。Java/Swift 没有接口级重载绑定这一概念。

---

### 差异 B：实现类可选择性 override overload

**分类：** 符合 ArkTS spec 的语言设计差异

ArkTS 实现类有两种选择：
1. **不 override overload** — 继承接口中的 overload 声明（默认行为）
2. **override overload** — 必须列出所有接口方法，并可添加新方法

Java 接口的重载方法通过 default 方法实现或让实现类各自实现。Swift protocol 通过 extension 提供默认实现。ArkTS 的 override overload 提供了一种显式的、可扩展的重载管理机制。

---

### 差异 C：多个接口继承同名 overload 必须 override

**分类：** 符合 ArkTS spec 的语言设计差异

当实现类同时实现多个包含同名 overload 的接口时，ArkTS 要求必须显式 override 该 overload，否则编译错误。这避免了多继承的重载歧义。

Java 中多个接口的同名 default 方法冲突时，实现类必须 override 解决冲突。ArkTS 的行为与 Java 在此场景下语义类似，但触发条件不同（ArkTS 基于 overload 声明冲突，Java 基于方法签名冲突）。

---

## 二、已验证规范一致行为

经 es2panda + ark VM 实测，以下行为与 ArkTS spec §17.9.3 一致：

| 行为 | 验证方式 | 结果 |
|------|---------|------|
| 接口中基本 overload 声明 | compile-pass (003) | ✅ 通过 |
| 实现类 override overload（含所有接口方法） | compile-pass (004) | ✅ 通过 |
| 不 override 则继承接口 overload | compile-pass (005) | ✅ 通过 |
| override 时添加新方法 | compile-pass (002) | ✅ 通过 |
| 多接口继承（无冲突） | compile-pass (006) | ✅ 通过 |
| 抽象类继承接口 overload | compile-pass (001) | ✅ 通过 |
| 多接口同名 overload 未 override → 报错 | compile-fail (007) | ✅ 编译错误 |
| override 缺少接口方法 → 报错 | compile-fail (009) | ✅ 编译错误 |
| 未实现所有重载方法 → 报错 | compile-fail (008) | ✅ 编译错误 |
| 接口类型引用调用重载方法（运行时） | runtime (010) | ✅ 通过 |

---

## 三、跨语言对比摘要

| 维度 | ArkTS | Java | Swift | TypeScript |
|------|-------|------|-------|-----------|
| 接口重载声明 | ✅ 显式 overload | ❌ 无独立概念（方法签名重载） | ❌ 无独立概念 | ⚠️ 签名声明 |
| overload override 机制 | ✅ 可选覆盖、可添加方法 | ❌ 无 | ❌ 无 | ❌ 无 |
| 多接口同名 overload 冲突检测 | ✅ 编译期强制 override | ⚠️ default 方法冲突时需 override | ⚠️ protocol 冲突处理 | ❌ |
| 编译验证 | ✅ es2panda — 10/10 通过 | ✅ javac | ✅ swiftc | ✅ tsc |
| Spec 一致性 | ✅ 与 spec §17.9.3 完全一致 | ✅ JLS §9.4 | ✅ Swift (Protocols) | ✅ TS spec |

---

## 四、分类汇总

| 条目 | 分类 |
|------|------|
| 差异 A：接口中显式 overload 声明 | 符合 ArkTS spec 的语言设计差异 |
| 差异 B：实现类可选择性 override overload | 符合 ArkTS spec 的语言设计差异 |
| 差异 C：多接口同名 overload 冲突检测 | 符合 ArkTS spec 的语言设计差异 |
| 已验证规范一致行为 | 10 项全部通过 |

---

## 五、关联记录

- 章节级异常汇总：[issue_report.md](../../issue_report.md)
- 测试执行报告：[test_report_17.9.3.md](test_report_17.9.3.md)
- 测试设计：[test_design_mindmap_17.9.3.md](test_design_mindmap_17.9.3.md)
- 跨语言对比：[comparison_report_arkts_java_swift.md](comparison_report_arkts_java_swift.md)
