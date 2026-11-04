# 13.7.4 Re-Export Directive - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-27
**测试用例数：** 4（compile-pass: 2, compile-fail: 2）
**可验证：** 2 个

---

## 一、与业界静态语言的差异点

**无设计问题发现。** 2 个可验证用例与 spec 一致。

---

## 二、严重性等级总览

| 严重性 | 数量 | 问题列表 |
|-------|------|---------|
| 编译器待完善 | 0 | - |
| 编译器实现限制 | 2 | C类 |

---

## 三、跨语言对比（WSL实测）

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| **re-export** | ✅ `export * from "path"` | ❌ (Java无此概念) | ❌ (Swift无此概念) |
| **选择性re-export** | ✅ `export {d1} from "path"` | ❌ | ❌ |
| **re-export引用当前文件禁止** | ✅ spec要求 | ❌ (Java无此概念) | ❌ |

**WSL实测结果：**
- Java: `OuterWrapper.getInnerVal()` → ✅ 编译+运行成功，INNER_VAL=42 — Java需wrapper类转发，无re-export语法
- Swift: `public struct ReExportedStruct { val=42 }` → ✅ 编译+运行成功，public=42 — Swift无re-export概念

**关键发现：** Java无re-export语法，只能通过wrapper类转发暴露内部包的符号；ArkTS的re-export可直接透传导出

---

## 四、改善建议

1. 等待构建系统支持后验证C类用例

---

## 四、附录：完整用例索引

| 用例 ID | 分类 | 测试内容 | 结果 |
|---------|------|---------|------|
| NSM_13_07_4_001 | compile-pass | export * from路径 | ⚠️ C类 |
| NSM_13_07_4_002 | compile-pass | export {d1} from路径 | ⚠️ C类 |
| NSM_13_07_4_003 | compile-fail | re-export引用当前文件 | ✅ 通过 |
| NSM_13_07_4_004 | compile-fail | re-export实体不可区分 | ✅ 通过 |

---

## 2026-07-17 编译复测验证

使用 es2panda --extension=ets（build 2026-06-17）全量编译验证。

| 用例 | @expect | 实际 | 结论 |
|----|---------|------|------|
| NSM_13_07_4_001 | compile-pass | F0014 | C20未修复 |
| NSM_13_07_4_002 | compile-pass | F0014 | C21未修复 |
| NSM_13_07_4_003 | compile-fail | - | - |
| NSM_13_07_4_004 | compile-fail | - | - |

