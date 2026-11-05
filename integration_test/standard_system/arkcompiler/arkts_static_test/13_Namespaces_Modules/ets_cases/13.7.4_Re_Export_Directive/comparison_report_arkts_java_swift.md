# 13.7.4 Re-Export Directive - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-27
**规范来源：** ArkTS Static Spec §13.7.4
**测试基础：** 4 个用例 — 2 可验证
**WSL实测验证：** ✅ 已在 WSL Ubuntu (Java Java 1.8.0_492 + Swift 6.0.3) 中真实编译运行验证

---

## 一、概览

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| export * from | ✅ | ❌ | ❌ |
| export {x} from | ✅ | ❌ | ❌ |
| re-export自引用禁止 | ✅ | ❌ | ❌ |

---

## 二、核心结论

- **re-export 是 ArkTS/TS 独有** — Java/Swift无重新导出概念
- 可验证用例行为正确

---

## 附录

| 语言 | 规范来源 | 实测环境 | WSL实测结果 |
|------|---------|---------|------------|
| ArkTS | ArkTS Static Spec §13.7.4 | es2panda (WSL) | ✅ 2可验证 |
| Java | JLS SE21 | Java 1.8.0_492 (WSL) | ✅ wrapper转发INNER_VAL=42（无re-export语法） |
| Swift | Swift Language Reference | Swift 6.0.3 (WSL) | ✅ 无re-export概念, public=42 |
