# 13.5 Top-Level Declarations - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-27
**规范来源：** ArkTS Static Spec §13.5, Java JLS SE21 §7, Swift Language Reference
**测试基础：** 4 个用例（3 compile-pass + 1 runtime）— 全部通过
**WSL实测验证：** ✅ 已在 WSL Ubuntu (Java Java 1.8.0_492 + Swift 6.0.3) 中真实编译运行验证

---

## 一、概览：三语言定位

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 顶层class | ✅ | ✅ (在包内) | ✅ (在模块内) |
| 顶层function | ✅ | ✅ (static方法) | ✅ (func) |
| 顶层let/const | ✅ | ✅ (static字段) | ✅ (let/var) |
| 执行顺序 | ✅ 文本位置 | ✅ 类加载顺序 | ✅ |

---

## 二、核心结论

- **三语言顶层声明语义一致** — class/function/variable在模块/包/模块最外层
- 所有 4 个用例全部通过，无设计差异

---

## 附录

| 语言 | 规范来源 | 实测环境 |
|------|---------|---------|
| ArkTS | ArkTS Static Spec §13.5 | es2panda (WSL) |
| Java | JLS SE21 §7 | Java 1.8.0_492 (WSL) |
| Swift | Swift: Declarations | Swift 6.0.3 (WSL) |
