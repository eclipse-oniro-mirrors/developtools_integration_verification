# 13.4.1 Bind All with Qualified Access - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-27
**测试用例数：** 3（compile-pass: 2, runtime: 1）
**可验证：** 0 个（全部C类）

---

## 一、与业界静态语言的差异点

**无设计问题发现。** 全部用例因C类无法验证，无法确认是否有D类不一致。

---

## 二、严重性等级总览

| 严重性 | 数量 | 问题列表 |
|-------|------|---------|
| 编译器待完善 | 0 | - |
| 编译器实现限制 | 3 | C类: 无法解析外部模块路径 |

---

## 三、跨语言对比（WSL实测）

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| **import * as** | ✅ | ✅ `import pkg.*;` | ❌ (无此语法, import整个模块) |
| **qualifiedName访问** | ✅ N.name | ✅ pkg.Class.name | ✅ Module.name |

**WSL实测结果：**
- Java: `import nsm141.*; BindAllTarget.VALUE_A=1, VALUE_B=2` → ✅ 编译+运行成功
- Swift: `import Foundation; sqrt=3.0` → ✅ 编译+运行成功，导入整个模块无需限定名

**关键发现：** Java的 `import pkg.*` 需类名限定（BindAllTarget.VALUE），语义等价于ArkTS的 `import * as M` 后用 M.xxx

---

## 四、改善建议

1. 等待构建系统支持后验证全部C类用例

---

## 五、附录：完整用例索引

| 用例 ID | 分类 | 测试内容 | 结果 |
|---------|------|---------|------|
| NSM_13_04_1_001 | compile-pass | import * as 合法使用 | ⚠️ C类 |
| NSM_13_04_1_002 | compile-pass | A.name访问导出实体 | ⚠️ C类 |
| NSM_13_04_1_003 | runtime | * as运行时访问 | ⚠️ C类 |

---

## 2026-07-17 编译复测验证

使用 es2panda --extension=ets（build 2026-06-17）全量编译验证。

| 用例 | @expect | 实际 | 结论 |
|----|---------|------|------|
| NSM_13_04_1_001 | compile-pass | F0014 | C8未修复 |
| NSM_13_04_1_002 | compile-pass | F0014 | C9未修复 |
| NSM_13_04_1_003 | runtime | F0014 | C10未修复 |

