# 13.4 Import Directives - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-27
**测试用例数：** 5（compile-pass: 1, compile-fail: 3, runtime: 1）
**可验证：** 3 个（3 compile-fail OK）

---

## 一、与业界静态语言的差异点

**无设计问题发现（D类）。** 所有可验证用例的行为均与 spec 一致。

---

## 二、符合ArkTS spec的语言设计差异（与规范一致）

| 行为 | 用例编号 | 状态 |
|------|---------|------|
| import非前置 → 编译错误 | NSM_13_04_002 | ✅ |
| 模块导入自身 → 编译错误 | NSM_13_04_003 | ✅ |
| import type + binding type冲突 → 编译错误 | NSM_13_04_004 | ✅ |

---

## 三、严重性等级总览

| 严重性 | 数量 | 问题列表 |
|-------|------|---------|
| 编译器待完善 | 0 | - |
| 编译器实现限制 | 2 | C类: es2panda无法解析外部模块路径 |
| 语言差异 | 0 | - |

---

## 四、编译规则正确性评估

| 规则 | spec 描述 | 实测 | 结论 |
|------|----------|------|------|
| import必须在顶层声明前 | import非前置 → error | 编译拒绝 (NSM_13_04_002) | ✅ 一致 |
| 模块不可导入自身 | import from当前路径 → error | 编译拒绝 (NSM_13_04_003) | ✅ 一致 |
| import type与binding type冲突 | 同名冲突 → error | 编译拒绝 (NSM_13_04_004) | ✅ 一致 |

---

## 五、跨语言对比

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| **import语法** | `import ... from "path"` | `import pkg.Class;` | `import ModuleName` |
| **import前置要求** | ✅ spec要求 | ✅ package声明在最前 | ✅ import在文件顶部 |
| **自导入禁止** | ✅ | ❌ (Java无此概念) | ❌ (Swift无此概念) |
| **import type** | ✅ | ❌ (无此概念) | ❌ (无此概念) |

**结论：** 13.4 章节的 import 规则与 Java/Swift 的导入规则有相似之处（前置要求），但 import type 是 ArkTS/TS 独有特性。

---

## 六、跨语言对比结论

| 维度 | 评价 |
|------|------|
| 与 spec 一致性 | ⭐⭐⭐⭐⭐（3/3可验证用例与spec一致） |
| 编译期检查完备性 | ⭐⭐⭐⭐⭐（所有可验证约束正确实现） |
| 运行时正确性 | ⭐（无法验证） |
| 与 Java 兼容度 | ⭐⭐⭐（import前置规则一致） |
| 与 Swift 兼容度 | ⭐⭐⭐（import前置规则一致） |

---

## 七、改善建议

### 短期
1. 无D类问题需修复

### 中期
2. 等待构建系统支持后验证C类用例

---

## 八、附录：完整用例索引

| 用例 ID | 分类 | 测试内容 | 结果 |
|---------|------|---------|------|
| NSM_13_04_001 | compile-pass | 基本import声明 | ⚠️ C类 |
| NSM_13_04_002 | compile-fail | import非前置 | ✅ 通过 |
| NSM_13_04_003 | compile-fail | 模块导入自身 | ✅ 通过 |
| NSM_13_04_004 | compile-fail | import type+binding type冲突 | ✅ 通过 |
| NSM_13_04_005 | runtime | import触发模块初始化 | ⚠️ C类 |

---

## 2026-07-17 编译复测验证

使用 es2panda --extension=ets（build 2026-06-17）全量编译验证。

| 用例 | @expect | 实际 | 结论 |
|----|---------|------|------|
| NSM_13_04_001 | compile-pass | F0014 | C6未修复 |
| NSM_13_04_002 | compile-fail | - | - |
| NSM_13_04_003 | compile-fail | - | - |
| NSM_13_04_004 | compile-fail | - | - |
| NSM_13_04_005 | runtime | F0014 | C7未修复 |

