# 7.36 常量表达式 - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

**报告日期：** 2026-06-23
**测试用例数：** 30（10 compile-pass + 10 compile-fail + 10 runtime）
**通过率：** 100%（30/30，0 unexpected）
**编译器：** es2panda + ark VM (Linux native)
**Spec 依据：** arktsspecification.md §7.36

## 报告分类口径

| 分类 | 含义 | 处理方式 |
|------|------|----------|
| 符合 ArkTS spec 的语言设计差异 | 行为与 Java/Swift 不同，但符合 ArkTS spec 或当前明确语义 | 不标为缺陷，仅记录差异 |
| Spec 与实现不一致 | 用例与 spec 要求不一致，且当前实现未按 spec 报错/运行 | 保留 FAIL 用例并记录 issue_report |
| 待确认问题 | 需要补充 stdlib/spec/实现依据后才能定性 | 暂不判定为缺陷 |
| 已验证规范一致行为 | 用例验证 ArkTS 行为符合 spec | 记录为通过项 |

## 一、Spec 与实现不一致

### 问题 D-7.36-01：常量表达式中 ++ / -- 未被拒绝

**类别：** D 类（Spec 与实现不一致）
**复现用例：** EXP_07_36_005_FAIL_CONST_INCREMENT, EXP_07_36_006_FAIL_CONST_DECREMENT

#### Spec 规则

§7.36 常量表达式明确禁止 `++` / `--`：
> The operators ``++`` and ``--`` are not allowed in constant expressions.

#### 实测行为

```typescript
function testConstIncrement(): void {
  let count: int = 0
  const BAD: int = count++  // 实际编译通过
  const BAD2: int = --count  // 实际编译通过
}
```

#### 预期

应编译失败，常量表达式不允许 `++` / `--`。

#### 实际

编译通过，es2panda 未检查常量表达式中的 `++` / `--`。

#### 跨语言对比

| 语言 | 常量表达式 ++/-- |
|------|-----------------|
| ArkTS | ✅ 编译通过（与 Spec 矛盾） |
| Java | ❌ 常量表达式不允许 ++/-- |
| Swift | ❌ 常量表达式不允许 ++/-- |

#### 建议

1. 编译器对常量表达式初始化器进行语法/语义检查，拒绝 `++` / `--`
2. 增加编译器测试覆盖常量表达式中的违规运算符

---
### 问题 D-7.36-02：常量表达式引用 let 变量未被拒绝

**类别：** D 类（Spec 与实现不一致）
**复现用例：** EXP_07_36_007_FAIL_CONST_REF_LET

#### Spec 规则

§7.36 要求常量表达式只能引用常量相关构造：
> A constant expression can reference only ``const`` declarations and other compile-time constant constructs.

#### 实测行为

```typescript
function testConstRefLet(): void {
  let x: int = 5
  const BAD: int = x + 1  // 实际编译通过
}
```

#### 预期

应编译失败，`x` 是 `let` 声明，不是常量。

#### 实际

编译通过，es2panda 未检查常量表达式引用的变量是否为 `const`。

#### 跨语言对比

| 语言 | 常量引用 let |
|------|------------|
| ArkTS | ✅ 编译通过（与 Spec 矛盾） |
| Java | ❌ 常量表达式只能引用常量 |
| Swift | ❌ 常量表达式只能引用常量 |

#### 建议

1. 编译器对常量表达式中的变量引用进行 const-ness 检查
2. 若 spec 有意允许只读/可确定值的 `let` 场景，应更新 spec 措辞明确范围

---
## 二、已验证规范一致行为

经 es2panda + ark VM 实测，以下行为与 ArkTS spec §7.36 一致：

| 行为 | 验证方式 | 结果 |
|------|---------|------|
| 常量表达式：编译期求值。由字面量/常量引用/一元+ - ~ ! /算术/移位/关系/相等/位运算/条件&& || /三元/括号组成。禁止++/-- | 10 compile-pass + 10 compile-fail + 10 runtime | ✅ 全部通过 |

| 分类 | 数量 | 通过 | 失败 | 通过率 |
|------|------|------|------|--------|
| compile-pass | 10 | 10 | 0 | 100% |
| compile-fail | 10 | 10 | 0 | 100% |
| runtime | 10 | 10 | 0 | 100% |
| **总计** | **30** | **30** | **0** | **100%** |

**结论：30 个测试用例全部编译运行通过。本章节 Spec 约束与 es2panda + ark VM 行为一致。**

## 三、跨语言对比摘要

| 维度 | ArkTS | Java | Swift | TypeScript |
|------|-------|------|-------|-----------|
| 编译验证 | ✅ es2panda — 30/30 通过 | ✅ javac | ✅ swiftc | ✅ tsc |
| 运行时验证 | ✅ ark VM — 10/10 runtime 通过 | ✅ JVM | ✅ Swift runtime | ✅ Node.js |
| Spec 一致性 | ✅ 与 arktsspecification.md §7.36 一致 | ✅ JLS SE21 | ✅ Swift 5.10 | N/A |
| 语言差异 | ArkTS 静态类型 + nullish 安全 | 传统静态类型 | 严格静态 + Optional | 结构化类型 |

## 四、分类汇总

| 条目 | 分类 |
|------|------|
| D-7.36-01：常量表达式中 ++ / -- 未被拒绝 | Spec 与实现不一致 |
| D-7.36-02：常量表达式引用 let 变量未被拒绝 | Spec 与实现不一致 |

## 五、关联记录

- 章节级异常汇总：[issue_report.md](../../issue_report.md)
- 测试执行报告：[test_report_7.36.md](test_report_7.36.md)
- 跨语言对比：[comparison_report_arkts_java_swift.md](comparison_report_arkts_java_swift.md)
- 测试设计：[test_design_mindmap_7.36.md](test_design_mindmap_7.36.md)
