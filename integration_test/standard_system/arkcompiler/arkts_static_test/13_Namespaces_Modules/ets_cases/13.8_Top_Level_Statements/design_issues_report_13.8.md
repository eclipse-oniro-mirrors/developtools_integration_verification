# 13.8 Top-Level Statements - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-27
**测试用例数：** 6（compile-pass: 2, compile-fail: 2, runtime: 2）

---

## 一、与业界静态语言的差异点

### D3 ⭐⭐⭐ — 变量使用在声明前未报错

- **问题描述：** Spec §13.8 规定 "if a top-level statement refers to a variable or constant and the declaration is textually located after the statement, then a compile-time error occurs"，但 `console.log(a); let a = 1` 编译通过
- **复现用例 ID：** NSM_13_08_004_FAIL_TOP_LEVEL_USE_BEFORE_DECLARE
- **跨语言对比：**

| 语言 | 代码 | 行为 | WSL实测 |
|------|------|------|---------|
| ArkTS | `console.log(a); let a = 1` | 编译通过(违反spec) | ⚠️ FAIL_PASSED |
| Java | `static int a = b + 1; static int b = 2;` | ❌ 编译错误("illegal forward reference") | ✅ javac实测确认禁止 |
| Swift | `print(a); let a = 1` | ❌ 编译错误(变量需先声明) | ✅ swiftc实测确认 |

- **严重性等级：** ⭐⭐⭐ — 较高（spec明确禁止前向引用但编译器未实现，Java/Swift均禁止）
- **改进建议：** 编译器应检查顶层语句中变量使用的前向引用

---

## 二、符合ArkTS spec的语言设计差异（与规范一致）

| 行为 | 用例编号 | 状态 |
|------|---------|------|
| 顶层语句合法使用 | NSM_13_08_001 | ✅ |
| 声明在前语句在后 | NSM_13_08_002 | ✅ |
| 顶层语句含return → 编译错误 | NSM_13_08_003 | ✅ |
| 顶层语句执行顺序 | NSM_13_08_005 | ✅ |
| main()在top-level之后执行 | NSM_13_08_006 | ✅ |

---

## 三、严重性等级总览

| 严重性 | 数量 | 问题列表 |
|-------|------|---------|
| 编译器待完善 | 1 | D3: 变量前向引用未报错 |
| 语言差异 | 0 | - |

---

## 四、改善建议

### 短期
1. **编译器修复** — 实现顶层语句变量前向引用检查（D3）

---

## 五、附录：完整用例索引

| 用例 ID | 分类 | 测试内容 | 结果 |
|---------|------|---------|------|
| NSM_13_08_001 | compile-pass | 顶层语句合法使用 | ✅ 通过 |
| NSM_13_08_002 | compile-pass | 声明在前语句在后 | ✅ 通过 |
| NSM_13_08_003 | compile-fail | 顶层语句含return | ✅ 通过 |
| NSM_13_08_004 | compile-fail | 变量使用在声明前 | ⚠️ D类 |
| NSM_13_08_005 | runtime | 顶层语句执行顺序 | ✅ 通过 |
| NSM_13_08_006 | runtime | main()在top-level之后执行 | ✅ 通过 |

---

## 2026-07-17 编译复测验证

使用 es2panda --extension=ets（build 2026-06-17）全量编译验证。

| 用例 | @expect | 实际 | 结论 |
|----|---------|------|------|
| NSM_13_08_001 | compile-pass | - | - |
| NSM_13_08_002 | compile-pass | - | - |
| NSM_13_08_003 | compile-fail | - | - |
| NSM_13_08_004 | compile-fail | ACCEPTED | D3未修复 |
| NSM_13_08_005 | runtime | - | - |
| NSM_13_08_006 | runtime | - | - |

