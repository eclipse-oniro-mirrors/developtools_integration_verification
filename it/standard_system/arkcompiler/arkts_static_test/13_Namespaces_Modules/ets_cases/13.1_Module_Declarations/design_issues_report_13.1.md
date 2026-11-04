# 13.1 Module Declarations - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-27
**测试用例数：** 6（compile-pass: 4, compile-fail: 1, runtime: 1）
**目的：** 通过用例执行（编译期 + 真实运行时）+ spec 对比，识别 ArkTS 模块声明的设计问题

---

## 一、与业界静态语言的差异点

### D5 ⭐⭐ — ambient与非ambient声明混合未报错

- **问题描述：** Spec §13.1 规定 "If a module has at least one top-level ambient declaration, then all other declarations must be ambient"，但混合编译通过
- **复现用例 ID：** NSM_13_01_004_FAIL_AMBIENT_MIXED
- **跨语言对比：**

| 语言 | 代码模式 | 行为 | WSL实测 |
|------|---------|------|---------|
| ArkTS | `declare function foo(); function bar() {}` | 编译通过（违反spec） | ⚠️ FAIL_PASSED |
| Java | 无 ambient 概念，天然支持多文件同包 | ✅ | ✅ 同包多文件编译通过 |
| Swift | 无 ambient 概念，天然支持同模块多文件 | ✅ | ✅ 文件级作用域运行通过 |
| TypeScript | `declare function foo(); function bar() {}` | 编译通过（与ArkTS一致） | — |

- **严重性等级：** ⭐⭐ — 中等（spec明确要求但编译器未实现）
- **改进建议：** 编译器应添加模块内 ambient 与非 ambient 声明混合检查

---

## 二、符合ArkTS spec的语言设计差异（与规范一致）

| 行为 | 用例编号 | 状态 |
|------|---------|------|
| 基本模块声明 | NSM_13_01_001 | ✅ |
| 含导出的模块 | NSM_13_01_003 | ✅ |
| 无moduleHeader模块 | NSM_13_01_005 | ✅ |
| 模块初始化执行（运行时） | NSM_13_01_006 | ✅ |

---

## 三、严重性等级总览

| 严重性 | 数量 | 问题列表 |
|-------|------|---------|
| 编译器待完善 | 1 | D5: ambient混合未报错 |
| 语言差异 | 0 | - |
| 设计观察 | 0 | - |

---

## 四、编译规则正确性评估

| 规则 | spec 描述 | 实测 | 结论 |
|------|----------|------|------|
| ambient与非ambient混合禁止 | 模块内至少一个ambient声明则全部必须ambient | 编译通过 (NSM_13_01_004) | ❌ 与spec不一致 |
| 模块初始化执行 | 模块初始化按声明顺序执行 | 运行时通过 (NSM_13_01_006) | ✅ 一致 |

---

## 五、跨语言对比

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| **模块概念** | ✅ 显式module声明 | ✅ package声明 | ✅ module声明(SwiftPM) |
| **ambient声明** | ✅ declare关键字 | ❌ 无此概念 | ❌ 无此概念 |
| **ambient混合禁止** | ⚠️ spec要求但未实现 | — | — |

**结论：** 13.1 章节的 ambient 声明混合规则是 ArkTS 独有的设计，Java 和 Swift 无此概念。编译器需完善此检查。

---

## 六、跨语言对比结论

| 维度 | 评价 |
|------|------|
| 与 spec 一致性 | ⭐⭐⭐⭐（5/6 用例与spec一致，1个D类不一致） |
| 编译期检查完备性 | ⭐⭐⭐（ambient混合检查缺失） |
| 运行时正确性 | ⭐⭐⭐⭐⭐（模块初始化正确） |
| 与 Java 兼容度 | ⭐⭐（Java无模块声明语法） |
| 与 Swift 兼容度 | ⭐⭐⭐（SwiftPM有类似模块概念） |
| spec 完整度 | ⭐⭐⭐⭐⭐（模块声明规则完整） |
| 实现一致性 | ⭐⭐⭐⭐（大部分一致，ambient检查缺失） |

---

## 七、改善建议

### 短期
1. **编译器修复** — 实现 ambient 与非 ambient 混合检查（D5）

### 中期
2. 考虑增加模块嵌套声明的测试用例

### 长期
3. 持续跟踪 spec 变更，确保新增模块特性的编译期检查完备

---

## 八、附录：完整用例索引

| 用例 ID | 分类 | 测试内容 | 结果 |
|---------|------|---------|------|
| NSM_13_01_001 | compile-pass | 基本模块声明 | ✅ 通过 |
| NSM_13_01_002 | compile-pass | 含导入的模块 | ⚠️ C类 |
| NSM_13_01_003 | compile-pass | 含导出的模块 | ✅ 通过 |
| NSM_13_01_004 | compile-fail | ambient与非ambient混合 | ⚠️ D类 |
| NSM_13_01_005 | compile-pass | 无moduleHeader模块 | ✅ 通过 |
| NSM_13_01_006 | runtime | 模块初始化执行 | ✅ 通过 |

---

## 2026-07-17 编译复测验证

使用 es2panda --extension=ets（build 2026-06-17）全量编译验证。

| 用例 | @expect | 实际 | 结论 |
|----|---------|------|------|
| NSM_13_01_001 | compile-pass | - | - |
| NSM_13_01_002 | compile-pass | ACCEPTED | 已修复(C1) |
| NSM_13_01_003 | compile-pass | - | - |
| NSM_13_01_004 | compile-fail | ACCEPTED | D5未修复 |
| NSM_13_01_005 | compile-pass | - | - |
| NSM_13_01_006 | runtime | - | - |

