# 13.4.2 Default Import Binding - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-27
**测试用例数：** 3（compile-pass: 2, compile-fail: 1）
**可验证：** 1 个

---

## 一、与业界静态语言的差异点

**无设计问题发现。** 唯一可验证用例与 spec 一致。

---

## 二、严重性等级总览

| 严重性 | 数量 | 问题列表 |
|-------|------|---------|
| 编译器待完善 | 0 | - |
| 编译器实现限制 | 2 | C类 |

---

## 三、跨语言对比（WSL实测）

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| **default import** | ✅ `import d from "path"` | ❌ (无此语法) | ❌ (无此语法) |
| **非default形式禁止** | ✅ | — | — |
| **隐式自动导入** | ❌ (无自动导入) | ✅ java.lang.*自动导入 | ✅ 标准库符号默认可用 |

**WSL实测结果：**
- Java: 无需import String/System/Math → ✅ 编译+运行成功，`String.length=5, Math.sqrt(4)=2.0`
- Swift: 标准库符号默认可用 → ✅ 编译成功，`Swift: stdlib auto-available, count=5`

**关键发现：** ArkTS的default import语法与Java的隐式java.lang自动导入不同，Java/Swift都是隐式自动导入标准库，ArkTS需显式import

---

## 四、改善建议

1. 等待构建系统支持后验证C类用例

---

## 五、附录：完整用例索引

| 用例 ID | 分类 | 测试内容 | 结果 |
|---------|------|---------|------|
| NSM_13_04_2_001 | compile-pass | 单标识符default导入 | ⚠️ C类 |
| NSM_13_04_2_002 | compile-pass | {default as Name}导入 | ⚠️ C类 |
| NSM_13_04_2_003 | compile-fail | 非default形式导入default导出 | ✅ 通过 |

---

## 2026-07-17 编译复测验证

使用 es2panda --extension=ets（build 2026-06-17）全量编译验证。

| 用例 | @expect | 实际 | 结论 |
|----|---------|------|------|
| NSM_13_04_2_001 | compile-pass | F0014 | C11未修复 |
| NSM_13_04_2_002 | compile-pass | F0014 | C12未修复 |
| NSM_13_04_2_003 | compile-fail | - | - |

