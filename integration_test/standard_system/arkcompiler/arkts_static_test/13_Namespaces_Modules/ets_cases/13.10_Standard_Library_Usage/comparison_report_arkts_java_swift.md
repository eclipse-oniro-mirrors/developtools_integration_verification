# 13.10 Standard Library Usage - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-27
**规范来源：** ArkTS Static Spec §13.10, Java API, Swift Standard Library
**测试基础：** 3 个用例（1 compile-pass + 1 compile-fail + 1 runtime）
**WSL实测验证：** ✅ 已在 WSL Ubuntu (Java Java 1.8.0_492 + Swift 6.0.3) 中真实编译运行验证

---

## 一、概览

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 标准库使用 | ✅ console.log | ✅ System.out | ✅ print() |
| 标准库名重定义 | ⚠️ spec禁止但编译器允许(D1) | ✅ 默认包可重定义(遮蔽) | ✅ 可重定义(遮蔽) |

---

## 二、关键差异

- **D1不一致** — ArkTS spec禁止标准库名重定义但编译器未实现（FAIL_PASSED）
- **三语言都允许遮蔽** — Java和Swift都可以在局部作用域重定义标准库名，但机制不同

---

## 三、WSL实测验证结果 🔬

### Java 实测

| 测试 | 编译 | 运行 | 说明 |
|------|------|------|------|
| 重定义System | ✅ | ✅ | 默认包可定义System类，遮蔽java.lang.System |
| 重定义Integer | ✅ | ✅ | 默认包可重定义Integer，需java.lang.Integer显式引用 |
| 重定义String | ✅ | ⚠️ | 编译通过但main(String[] args)参数类型被遮蔽导致运行异常 |
| 正常使用stdlib | ✅ | ✅ | System.out/Math.sqrt等正常 |

### Swift 实测

| 测试 | 编译 | 运行 | 说明 |
|------|------|------|------|
| 重定义print | ✅ | ✅ | func print可遮蔽Swift.print，可用Swift.print显式引用 |
| 重定义Array | ✅ | ✅ | struct Array可遮蔽Swift.Array |
| 正常使用stdlib | ✅ | ✅ | print/sqrt/Foundation正常 |

### ArkTS 实测

| 测试 | 编译 | 说明 |
|------|------|------|
| FAIL_STDLIB_NAME_REUSE | ⚠️ FAIL_PASSED | spec禁止但编译器不报错 |
| PASS_STDLIB_CONSOLE | ✅ | console.log正常使用 |

---

## 四、核心结论

- **三语言标准库名遮蔽机制不同**：
  - ArkTS: spec禁止重定义但编译器未实现 → **最宽松(允许重定义无警告)**
  - Java: 默认包中可重定义但遮蔽java.lang.* → **中等(允许但需显式引用原始)**
  - Swift: 可重定义但遮蔽标准库 → **中等(允许但可用Swift.xxx显式引用)**
- **ArkTS应与Java/Swift对齐** — 至少应在重定义标准库名时发出警告

---

## 附录

| 语言 | 规范来源 | 实测环境 |
|------|---------|---------|
| ArkTS | ArkTS Static Spec §13.10 | es2panda (WSL) |
| Java | Java API Documentation | Java 1.8.0_492 (WSL) |
| Swift | Swift Standard Library | Swift 6.0.3 (WSL) |
