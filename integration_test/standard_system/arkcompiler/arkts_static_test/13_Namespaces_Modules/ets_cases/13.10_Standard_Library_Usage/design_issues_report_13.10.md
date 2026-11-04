# 13.10 Standard Library Usage - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-27
**测试用例数：** 3（compile-pass: 1, compile-fail: 1, runtime: 1）

---

## 一、与业界静态语言的差异点

### D1 ⭐⭐⭐ — 标准库名重定义未报错

- **问题描述：** Spec §13.10 规定 "Using standard library names as names of programmer-defined entities at the module scope causes a compile-time error"，但 `let console: int = 5` 编译通过
- **复现用例 ID：** NSM_13_10_002_FAIL_STDLIB_NAME_REUSE
- **跨语言对比：**

| 语言 | 代码 | 行为 | WSL实测 |
|------|------|------|---------|
| ArkTS | `let console: int = 5` | 编译通过(违反spec) | ⚠️ FAIL_PASSED |
| Java | `public class System {}` (默认包) | ✅ 编译通过(遮蔽java.lang.System) | ✅ 隔离目录实测通过 |
| Java | `public class Integer {}` (默认包) | ✅ 编译通过(遮蔽java.lang.Integer) | ✅ 隔离目录实测通过 |
| Swift | `func print(_ msg: String)` | ✅ 编译通过(遮蔽Swift.print) | ✅ 实测通过 |
| Swift | `struct Array {}` | ✅ 编译通过(遮蔽Swift.Array) | ✅ 实测通过 |

- **关键修正：** Java和Swift都**允许**重定义标准库名（通过遮蔽机制），与之前理论推导的"禁止"结论不同。ArkTS spec禁止但编译器允许，Java/Swift则允许但提供遮蔽+显式引用机制。

- **严重性等级：** ⭐⭐⭐ — 较高（spec明确禁止，Java/Swift均禁止，但ArkTS编译器未实现）
- **改进建议：** 编译器应添加标准库名重定义检查

---

## 二、符合ArkTS spec的语言设计差异（与规范一致）

| 行为 | 用例编号 | 状态 |
|------|---------|------|
| console.log标准库使用 | NSM_13_10_001 | ✅ |
| 标准库运行时访问 | NSM_13_10_003 | ✅ |

---

## 三、严重性等级总览

| 严重性 | 数量 | 问题列表 |
|-------|------|---------|
| 编译器待完善 | 1 | D1: 标准库名重定义未报错 |

---

## 四、改善建议

### 短期
1. **编译器修复** — 添加标准库名重定义检查（D1）

---

## 五、附录：完整用例索引

| 用例 ID | 分类 | 测试内容 | 结果 |
|---------|------|---------|------|
| NSM_13_10_001 | compile-pass | console.log标准库使用 | ✅ 通过 |
| NSM_13_10_002 | compile-fail | 重新定义标准库名 | ⚠️ D类 |
| NSM_13_10_003 | runtime | 标准库运行时访问 | ✅ 通过 |

---

## 2026-07-17 编译复测验证

使用 es2panda --extension=ets（build 2026-06-17）全量编译验证。

| 用例 | @expect | 实际 | 结论 |
|----|---------|------|------|
| NSM_13_10_001 | compile-pass | - | - |
| NSM_13_10_002 | compile-fail | ACCEPTED | D1未修复 |
| NSM_13_10_003 | runtime | - | - |

