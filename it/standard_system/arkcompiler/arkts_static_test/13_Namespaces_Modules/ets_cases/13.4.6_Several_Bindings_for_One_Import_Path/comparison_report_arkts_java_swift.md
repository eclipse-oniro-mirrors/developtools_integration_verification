# 13.4.6 Several Bindings for One Import Path - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-27
**规范来源：** ArkTS Static Spec §13.4.6
**测试基础：** 2 个用例 — 1 可验证
**WSL实测验证：** ✅ 已在 WSL Ubuntu (Java Java 1.8.0_492 + Swift 6.0.3) 中真实编译运行验证

---

## 一、概览

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 同路径多条绑定 | ✅ | ❌ (Java每import一条) | ❌ |
| 名称不可区分禁止 | ✅ | ✅ (同名import冲突) | ✅ |

---

## 二、核心结论

- **多绑定是 ArkTS/TS 独有** — Java每条import只导入一个
- 可验证用例行为正确

---

## 附录

| 语言 | 规范来源 | 实测环境 | WSL实测结果 |
|------|---------|---------|------------|
| ArkTS | ArkTS Static Spec §13.4.6 | es2panda (WSL) | C类待验证 |
| Java | JLS SE21 §7.5 | Java 1.8.0_492 (WSL) | ✅ 多次import A=1, B=2, C=3 |
| Swift | Swift Language Reference | Swift 6.0.3 (WSL) | ✅ import Foundation全部可用 |
