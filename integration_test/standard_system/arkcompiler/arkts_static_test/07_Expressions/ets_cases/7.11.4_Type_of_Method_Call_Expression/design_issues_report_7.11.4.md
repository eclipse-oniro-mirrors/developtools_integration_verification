# 7.11.4 Type of Method Call Expression — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

### ID-01: void 方法返回值赋值 — Spec 与实现不一致 ⭐⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_11_04_007_FAIL_STATIC_VOID_ASSIGNED, EXP_07_11_04_008_FAIL_INSTANCE_VOID_ASSIGNED |
| **实测结果** | 编译通过（期望编译时错误） |
| **错误信息** | 编译成功，无任何错误或警告 |

**描述**：Spec 规定 void 方法调用结果不能赋值给变量（"Compile-time error as void cannot be used as type annotation"），但编译器允许通过。

**跨语言对比**：

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS (spec) | `let x = A.method()` | ❌ Compile-time error |
| ArkTS (实现) | `let x = A.method()` | ✅ 编译通过，无任何提示 |
| Java | `var x = doSomething()` | ❌ 编译时错误：cannot infer type (variable initializer is 'void') |
| Swift | `let x = doSomething()` | ⚠️ 编译通过但有 warning：inferred to have type '()' |

**分类**：D 类 — Spec 与实现不一致

**建议**：
1. **短期**：按 spec 实现，在编译器中添加对 void 赋值给变量的检查，报编译时错误。
2. **或长期**：如果设计意图是允许 void 作为表达式（类似 Swift 的 `()` 类型），应更新 spec 文档，移除该编译时错误描述。
3. 当前状态（spec 禁止但实现允许）是技术债，建议尽快明确方向。

---

### ID-02: 三语言 void 赋值行为对比

| 语言 | void 赋值行为 | 严格程度 |
|------|-------------|---------|
| Java | 编译时错误 | 最严格 |
| Swift | warning + 编译通过 | 中等 |
| ArkTS (实现) | 无声编译通过 | 最宽松 |
| ArkTS (spec) | 编译时错误 | 最严格 |

## 总体结论

本节仅有 1 个 D 类问题。无其余设计差异或实现问题。
