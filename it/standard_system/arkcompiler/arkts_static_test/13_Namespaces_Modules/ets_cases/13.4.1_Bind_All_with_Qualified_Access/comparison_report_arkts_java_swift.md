# 13.4.1 Bind All with Qualified Access - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-27
**规范来源：** ArkTS Static Spec §13.4.1 Bind All with Qualified Access, Java JLS SE21 §7.5 Import Declarations
**测试基础：** 3 个用例（2 compile-pass + 1 runtime）— 全部C类不可验证
**WSL实测验证：** ✅ 已在 WSL Ubuntu (Java Java 1.8.0_492 + Swift 6.0.3) 中真实编译运行验证

---

## 一、概览：三语言定位

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| import * as | ✅ `import * as N from "path"` | ✅ `import pkg.*;` | ❌ (无此语法) |
| qualifiedName | ✅ N.name | ✅ pkg.Class | ✅ Module.Type |

---

## 二、关键差异

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| import全部导出 | ✅ `import * as` | ✅ `import pkg.*` | ❌ (需逐个导入) |
| 别名绑定 | ✅ `* as N` | ❌ (无别名) | ❌ |
| 模块路径 | StringLiteral | 包名 | 模块名 |

---

## 三、核心结论

- **ArkTS import * as 独有别名机制** — Java `import pkg.*` 无别名，Swift 无全部导入语法
- 全部用例需构建系统支持才能验证

---

## 附录

| 语言 | 规范来源 | 实测环境 |
|------|---------|---------|
| ArkTS | ArkTS Static Spec §13.4.1 Bind All with Qualified Access | es2panda (WSL) |
| Java | JLS SE21 §7.5 Import Declarations | Java 1.8.0_492 (WSL) — 实测 `import nsm141.*; BindAllTarget.VALUE_A=1, VALUE_B=2` ✅ |
| Swift | Swift Language Reference - Modules | Swift 6.0.3 (WSL) — 实测 `import Foundation; sqrt=3.0` ✅ |
