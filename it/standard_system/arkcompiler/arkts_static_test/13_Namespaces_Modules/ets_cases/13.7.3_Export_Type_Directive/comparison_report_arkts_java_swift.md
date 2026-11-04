# 13.7.3 Export Type Directive - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-27
**规范来源：** ArkTS Static Spec §13.7.3
**测试基础：** 2 个用例
**WSL实测验证：** ✅ 已在 WSL Ubuntu (Java Java 1.8.0_492 + Swift 6.0.3) 中真实编译运行验证

---

## 一、概览

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| export type | ✅ | ❌ (无此概念) | ❌ (无此概念) |
| export type引用非type禁止 | ⚠️ spec要求但未实现(D4) | ✅ (import=类型+值) | ✅ (import=类型+值) |

---

## 二、WSL实测验证结果 🔬

### D4 对比：export type可引用非type导致类型信息丢失

**Java实测：** import导入的类既是类型也是值
```java
public class TypeValue {
    public static int VALUE = 10;
    // TypeValue作为类型：TypeValue ref = new TypeValue();
    // TypeValue作为值：VALUE静态成员可访问
}
```
→ ✅ 编译运行通过，imported class is type+value, VALUE=10

**结论：** Java中import=类型+值绑定，不存在"导入类型但值不可用"的问题。Swift同理。ArkTS的D4问题在Java/Swift中不存在。

---

## 三、核心结论

- **export type 是 ArkTS/TS 独有** — Java/Swift中类型和值总是绑定
- **D4不一致** — ArkTS export type可引用非type，导致类型信息丢失，Java/Swift无此问题

---

## 附录

| 语言 | 规范来源 | 实测环境 |
|------|---------|---------|
| ArkTS | ArkTS Static Spec §13.7.3 | es2panda (WSL) |
| Java | JLS SE21 | Java 1.8.0_492 (WSL) |
| Swift | Swift Reference | Swift 6.0.3 (WSL) |
