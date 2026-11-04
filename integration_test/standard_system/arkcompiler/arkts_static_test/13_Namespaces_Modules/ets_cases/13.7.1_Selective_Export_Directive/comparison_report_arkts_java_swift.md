# 13.7.1 Selective Export Directive - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-27
**规范来源：** ArkTS Static Spec §13.7.1
**测试基础：** 4 个用例 — 全部通过
**WSL实测验证：** ✅ 已在 WSL Ubuntu (Java Java 1.8.0_492 + Swift 6.0.3) 中真实编译运行验证

---

## 一、概览

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| selective export | `export {x, y as z}` | ❌ | ❌ |
| alias | ✅ `as` | ❌ | ❌ |
| alias clash禁止 | ✅ | ❌ | ❌ |

---

## 二、核心结论

- **选择性导出是 ArkTS/TS 独有** — Java/Swift 用 public 修饰符替代

---

## 附录

| 语言 | 规范来源 | 实测环境 | WSL实测结果 |
|------|---------|---------|------------|
| ArkTS | ArkTS Static Spec §13.7.1 | es2panda (WSL) | ✅ 4用例全通过 |
| Java | JLS SE21 | Java 1.8.0_492 (WSL) | ✅ public/private A=10, B=20, sum=30 |
| Swift | Swift Language Reference | Swift 6.0.3 (WSL) | ✅ public a=10, b=20, sum=30 |
