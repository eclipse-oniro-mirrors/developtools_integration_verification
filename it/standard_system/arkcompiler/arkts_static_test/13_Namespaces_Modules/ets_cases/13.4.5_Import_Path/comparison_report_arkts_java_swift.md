# 13.4.5 Import Path - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-27
**规范来源：** ArkTS Static Spec §13.4.5 Import Path
**测试基础：** 3 个用例 — 1 可验证
**WSL实测验证：** ✅ 已在 WSL Ubuntu (Java Java 1.8.0_492 + Swift 6.0.3) 中真实编译运行验证

---

## 一、概览

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| import路径 | StringLiteral | 包名(dot-separated) | 模块名 |
| 相对路径 | ✅ `"./module"` | ❌ | ❌ |
| 编译器无法定位 → error | ✅ | ✅ | ✅ |

---

## 二、核心结论

- **ArkTS 使用 StringLiteral 模块路径**，Java用包名，Swift用模块名
- 可验证用例行为正确

---

## 附录

| 语言 | 规范来源 | 实测环境 |
|------|---------|---------|
| ArkTS | ArkTS Static Spec §13.4.5 Import Path | es2panda (WSL) |
| Java | JLS SE21 §7.5 | Java 1.8.0_492 (WSL) |
| Swift | Swift Language Reference | Swift 6.0.3 (WSL) |
