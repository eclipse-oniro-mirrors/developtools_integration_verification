# 13.4.3 Selective Binding - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-27
**规范来源：** ArkTS Static Spec §13.4.3 Selective Binding
**测试基础：** 3 个用例 — 1 可验证
**WSL实测验证：** ✅ 已在 WSL Ubuntu (Java Java 1.8.0_492 + Swift 6.0.3) 中真实编译运行验证

---

## 一、概览

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 选择性导入 | `import {x} from "path"` | `import pkg.Class;` | `import Module` |
| 别名导入 | `import {x as y}` | ❌ | ❌ |
| alias后原名不可访问 | ✅ spec禁止 | ❌ | ❌ |

---

## 二、核心结论

- **选择性导入是三语言共有机制**，但语法不同
- **别名导入是 ArkTS/TypeScript 独有**

---

## 附录

| 语言 | 规范来源 | 实测环境 | WSL实测结果 |
|------|---------|---------|------------|
| ArkTS | ArkTS Static Spec §13.4.3 Selective Binding | es2panda (WSL) | C类待验证 |
| Java | JLS SE21 §7.5 Import Declarations | Java 1.8.0_492 (WSL) | ✅ `import nsm141.SelectiveTarget; VALUE_A=10` |
| Swift | Swift Language Reference - Import Declaration | Swift 6.0.3 (WSL) | ✅ `import Foundation; sqrt=3.0` |
