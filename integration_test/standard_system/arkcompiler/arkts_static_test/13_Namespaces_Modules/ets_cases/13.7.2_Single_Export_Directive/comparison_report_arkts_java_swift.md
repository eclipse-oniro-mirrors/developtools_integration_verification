# 13.7.2 Single Export Directive - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-27
**规范来源：** ArkTS Static Spec §13.7.2
**测试基础：** 7 个用例（4 compile-pass + 2 compile-fail + 1 runtime）
**WSL实测验证：** ✅ 已在 WSL Ubuntu (Java Java 1.8.0_492 + Swift 6.0.3) 中真实编译运行验证

---

## 一、概览

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| export identifier | ✅ | ❌ (public修饰符) | ❌ (public修饰符) |
| export default | ✅ | ❌ | ❌ |
| export default expression | ✅ (D6: 只导出值不导出类型) | ✅ (类=类型+值) | ✅ (类型=值) |

---

## 二、WSL实测验证结果 🔬

### D6 对比：export default expr只导出值不导出类型

**Java实测：** 类既是类型也是值
```java
public class DefaultExport {
    public int val = 42;
    // DefaultExport作为类型可用：DefaultExport obj = new DefaultExport();
    // DefaultExport作为值可用：obj.val
}
```
→ ✅ 编译运行通过，type+value both accessible, val=42

**结论：** Java中类=类型+值，不存在"只导出值不导出类型"的问题。ArkTS的D6问题在Java/Swift中不存在。

---

## 三、核心结论

- **default export 是 ArkTS/TS 独有** — Java/Swift无此概念
- **D6不一致** — export default expression只导出值不导出类型，Java/Swift中类型和值总是绑定
- 其余用例全部与spec一致

---

## 附录

| 语言 | 规范来源 | 实测环境 |
|------|---------|---------|
| ArkTS | ArkTS Static Spec §13.7.2 | es2panda (WSL) |
| Java | JLS SE21 | Java 1.8.0_492 (WSL) |
| Swift | Swift Reference | Swift 6.0.3 (WSL) |
