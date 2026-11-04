# 3.17.1 Readonly Tuple Types - ArkTS/Java/Swift 跨语言对比报告

---

## 1. 概览

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 章节对应 | §3.17.1 Readonly Tuple Types | final Object[] | let (T1, T2) |
| 定位 | 只读元组类型 | final 数组引用 | 不可变元组常量 |
| 核心概念 | readonly [T1, T2] | final Object[] | let (T1, T2) |

---

## 2. 章节对应关系

| ArkTS §3.17.1 子项 | Java 对应 | Swift 对应 |
|-------------------|-----------|------------|
| readonly [T1, T2] 语法 | final Object[] | let (T1, T2) |
| 元素不可修改 | final 引用（元素仍可改） | let 常量（编译错误） |
| 长度不可改变 | 数组长度固定 | 元组长度固定 |

---

## 3. 关键差异矩阵

| 特性 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 只读声明语法 | ✅ readonly [...] | ❌ final 只保护引用 | ✅ let (...) |
| 编译时检查 | ✅ | ❌（元素仍可改） | ✅ |
| 元素不可修改 | ✅ | ❌ | ✅ |
| 长度不可改变 | ✅ | ✅（数组固定） | ✅ |

---

## 4. 用例 1:1 对照

| 测试点 | ArkTS | Java | Swift |
|--------|-------|------|-------|
| 只读声明 | `let t: readonly [number,string]=[1,"abc"]` | `final Object[] t={1,"abc"}` | `let t: (Int,String)=(1,"abc")` |
| 索引修改 | 编译错误 | 允许（元素可改） | 编译错误 |
| 长度修改 | 编译错误 | 不适用 | 编译错误 |

---

## 5. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 只读语义清晰度 | 10/10 | 4/10 | 10/10 |
| 编译时检查 | 10/10 | 2/10 | 10/10 |
| 语法简洁性 | 9/10 | 6/10 | 9/10 |
| **综合** | **10/10** | **4/10** | **10/10** |

---

## 6. 核心结论

### 6.1 ArkTS 与 Java

1. **编译时 vs 运行时**：ArkTS 在编译时检查只读约束，Java 的 final 只保护引用不保护元素
2. **元素保护**：ArkTS 元素不可修改，Java 元素仍可修改

### 6.2 ArkTS 与 Swift

1. **相似性**：两者都提供编译时检查的只读元组
2. **语法差异**：ArkTS 使用 readonly 关键字，Swift 使用 let 声明

---

## 7. 设计建议

### 7.1 ArkTS 特有优势

1. **readonly 关键字**：明确表达只读意图
2. **编译时检查**：避免运行时错误

### 7.2 建议

1. **readonly 元组赋值给 Tuple**：当前实现不允许，建议支持
2. **文档说明**：明确说明 readonly 元组的行为

---

## 8. 实测结果

| 分类 | 数量 | 通过 | 失败 | 通过率 |
|------|------|------|------|--------|
| compile-pass | 2 | 2 | 0 | 100% |
| compile-fail | 3 | 3 | 0 | 100% |
| runtime | 3 | 3 | 0 | 100% |
| **总计** | **8** | **8** | **0** | **100%** |

**跨语言验证结果**：

| 分类 | Java | Swift | 总计 |
|------|------|-------|------|
| compile-pass | 2/2 | 2/2 | 4/4 |
| compile-fail | 3/3 | 3/3 | 6/6 |
| runtime | 3/3 | 3/3 | 6/6 |
| **总计** | **8/8** | **8/8** | **16/16** |

**compile-fail 跨语言行为差异**：

| 用例 | ArkTS | Java | Swift |
|------|-------|------|-------|
| TYP_03_17_01_004 索引修改 | 编译错误 | 允许（final 只保护引用） | 编译错误 |
| TYP_03_17_01_005 字符串修改 | 编译错误 | 允许 | 编译错误 |
| TYP_03_17_01_006 布尔修改 | 编译错误 | 允许 | 编译错误 |

**结论**：ArkTS 和 Swift 在编译时检查只读约束，Java 的 final 只保护引用不保护元素。

**异常记录**：

| 异常类型 | 用例 | 说明 |
|----------|------|------|
| D类 | TYP_03_17_01_003/009 | readonly 元组不能赋值给 Tuple 类型 |

---

## 9. 测试统计

| 章节 | ArkTS 用例 | Java 验证 | Swift 验证 | 跨语言总计 | 说明 |
|------|-----------|-----------|------------|-----------|------|
| 3.17.1 Readonly Tuple Types | 8 | 8 | 8 | 16 | 03_Types 子章节 |
| **累计** | **8** | **8** | **8** | **16** | |

---

## 10. 文件清单

```
3.17.1_Readonly_Tuple_Types/
├── test_design_mindmap_3.17.1.md          # 测试设计思维导图
├── test_report_3.17.1.md                  # 测试执行报告
├── comparison_report_arkts_java_swift.md  # 本文件
├── compile-pass/
│   ├── TYP_03_17_01_001_PASS_READONLY_TUPLE_BASIC.ets
│   └── TYP_03_17_01_002_PASS_READONLY_TUPLE_LENGTH.ets
├── compile-fail/
│   ├── TYP_03_17_01_004_FAIL_INDEX_WRITE.ets
│   ├── TYP_03_17_01_005_FAIL_STRING_WRITE.ets
│   └── TYP_03_17_01_006_FAIL_BOOLEAN_WRITE.ets
├── runtime/
│   ├── TYP_03_17_01_007_RUNTIME_READONLY_TUPLE_BASIC.ets
│   ├── TYP_03_17_01_008_RUNTIME_READONLY_TUPLE_LENGTH.ets
│   └── TYP_03_17_01_010_RUNTIME_READONLY_TUPLE_DIFFERENT_TYPES.ets
└── cross_lang_verify/
    ├── run_cross_lang_tests.sh
    ├── compile-pass/
    │   ├── TYP_03_17_01_001.java / TYP_03_17_01_001.swift
    │   └── TYP_03_17_01_002.java / TYP_03_17_01_002.swift
    ├── compile-fail/
    │   ├── TYP_03_17_01_004.java / TYP_03_17_01_004.swift
    │   ├── TYP_03_17_01_005.java / TYP_03_17_01_005.swift
    │   └── TYP_03_17_01_006.java / TYP_03_17_01_006.swift
    └── runtime/
        ├── TYP_03_17_01_007.java / TYP_03_17_01_007.swift
        ├── TYP_03_17_01_008.java / TYP_03_17_01_008.swift
        └── TYP_03_17_01_010.java / TYP_03_17_01_010.swift
```

---

## 11. 执行命令

```bash
# 执行 ArkTS 测试
cd /mnt/d/git/ARKTS_STATIC_TEST/03_Types
SECTIONS="3.17.1_Readonly_Tuple_Types" bash run_types_cases_wsl.sh

# 执行所有跨语言测试（Java + Swift）
cd /mnt/d/git/ARKTS_STATIC_TEST/03_Types/ets_cases/3.17.1_Readonly_Tuple_Types/cross_lang_verify
bash run_cross_lang_tests.sh
```

---

**报告生成时间**：2026-06-21
**报告版本**：v4.2
