# 3.21.4 Required Utility Type - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 一、行为差异与规范一致性概览

`Required<T>` 是 `Partial<T>` 的反向，将所有 optional 字段变为 required。

## 二、已验证的 ArkTS 规范一致行为

| 行为 | 用例 | 结果 |
|------|------|------|
| optional→required，全字段提供 | 001 | ✅ |
| 无 optional 字段保持不变 | 002, 004 | ✅ |
| class Required | 003 | ✅ |
| 缺少 required 字段编译错误 | 005 | ✅ |
| Required 不含方法 | 007 | ✅ |
| runtime 值正确 | 008, 009 | ✅ |

## 三、待确认问题 / Spec 与实现不一致

**D-3.21.4-01** — Required 应用于非 class/interface 不应编译通过

- Spec 要求：T 必须是 class/interface
- 实际：`Required<int>` 编译通过
- 复现：TYP_03_21_04_006_FAIL_REQUIRED_NON_CLASS

## 四、跨语言对比

| Required 类型 | ArkTS | Java | Swift |
|-------------|-------|------|-------|
| Required<T> | ✅ | ❌ N/A | ❌ N/A |
| 模拟方式 | `Required<Interface>` | null 不可转必填 | 非 optional 类型 |

## 五、分类汇总

| 分类 | 数量 |
|------|------|
| 已验证规范一致行为 | 6 |
| Spec 与实现不一致 | 1 |