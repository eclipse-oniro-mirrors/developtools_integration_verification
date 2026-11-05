# 3.17 Tuple Types - ArkTS/Java/Swift 跨语言对比报告

---

## 1. 概览

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 章节对应 | §3.17 Tuple Types | 无原生元组 | (T1, T2) |
| 定位 | 固定类型集合 | 需自定义类 | 原生元组类型 |
| 核心概念 | [T1, T2, ...] | Class/Map.Entry | (T1, T2) |

---

## 2. 章节对应关系

| ArkTS §3.17 子项 | Java 对应 | Swift 对应 |
|-----------------|-----------|------------|
| 元组声明 [T1, T2] | 自定义类 | (T1, T2) |
| 元组元素访问 t[i] | getter 方法 | t.i 或 t.0 |
| 元组长度 t.length | 无直接对应 | Mirror.children.count |
| 元组是 Tuple 子类型 | 无 Tuple 超类型 | 无 Tuple 超类型 |

---

## 3. 关键差异矩阵

| 特性 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 原生元组支持 | ✅ | ❌ | ✅ |
| 元素类型异构 | ✅ | ✅（Object[]） | ✅ |
| 索引访问 t[i] | ✅ | ❌（需 getter） | ✅ t.0 |
| 命名元素 | ❌ | ✅（自定义类） | ✅ |
| 长度属性 | ✅ | ❌ | ❌ |
| 元组解构 | ❌ | ❌ | ✅ |
| 元组比较 | ❌ | ❌ | ✅ |

---

## 4. 用例 1:1 对照

| 测试点 | ArkTS | Java | Swift |
|--------|-------|------|-------|
| 声明 | `let t: [number, string]=[1,"hi"]` | `new Tuple2<>(1,"hi")` | `let t: (Int,String)=(1,"hi")` |
| 索引访问 | `t[0]` | `t.getFirst()` | `t.0` |
| 索引修改 | `t[0]=42` | 无直接支持 | `t.0=42`（var） |
| 长度 | `t.length` | 无 | 无 |

---

## 5. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 语法简洁性 | 9/10 | 4/10 | 9/10 |
| 类型安全 | 10/10 | 7/10 | 10/10 |
| 功能完整性 | 8/10 | 5/10 | 9/10 |
| **综合** | **9/10** | **5/10** | **9/10** |

---

## 6. 核心结论

### 6.1 ArkTS 与 Java

1. **原生支持**：ArkTS 有原生元组类型，Java 需要自定义类
2. **语法简洁性**：ArkTS `[T1, T2]` 语法更简洁
3. **类型安全**：ArkTS 元组类型检查更严格

### 6.2 ArkTS 与 Swift

1. **语法相似性**：两者都支持原生元组
2. **元素访问**：ArkTS 使用 `t[i]`，Swift 使用 `t.i`
3. **高级特性**：Swift 支持命名元组、解构、比较

---

## 7. 设计建议

### 7.1 ArkTS 特有优势

1. **原生元组支持**：简化多值返回
2. **类型安全**：编译时检查元素类型
3. **length 属性**：方便获取元组大小

### 7.2 建议

1. **命名元组**：考虑支持命名元素
2. **元组解构**：考虑支持解构赋值
3. **元组比较**：考虑支持元组相等比较

---

## 8. 实测结果

| 分类 | 数量 | 通过 | 失败 | 通过率 |
|------|------|------|------|--------|
| compile-pass | 6 | 6 | 0 | 100% |
| compile-fail | 3 | 3 | 0 | 100% |
| runtime | 5 | 5 | 0 | 100% |
| **总计** | **14** | **14** | **0** | **100%** |

**跨语言验证结果**：

| 分类 | Java | Swift | 总计 |
|------|------|-------|------|
| compile-pass | 6/6 | 6/6 | 12/12 |
| compile-fail | 3/3 | 3/3 | 6/6 |
| runtime | 5/5 | 5/5 | 10/10 |
| **总计** | **14/14** | **14/14** | **28/28** |

**compile-fail 跨语言行为差异**：

| 用例 | ArkTS | Java | Swift |
|------|-------|------|-------|
| TYP_03_17_007 类型不匹配 | 编译错误 | 运行时（Object[]） | 编译错误 |
| TYP_03_17_008 长度不匹配 | 编译错误 | 运行时（Object[]） | 编译错误 |
| TYP_03_17_009 索引越界 | 编译错误 | 运行时异常 | 编译错误 |

**结论**：ArkTS 和 Swift 在编译时检查元组约束，Java 使用 Object[] 无法在编译时检查。

---

## 9. 测试统计

| 章节 | ArkTS 用例 | Java 验证 | Swift 验证 | 跨语言总计 | 说明 |
|------|-----------|-----------|------------|-----------|------|
| 3.17 Tuple Types | 14 | 14 | 14 | 28 | 03_Types 子章节 |
| **累计** | **14** | **14** | **14** | **28** | |

---

## 10. 文件清单

```
3.17_Tuple_Types/
├── test_design_mindmap_3.17.md          # 测试设计思维导图
├── test_report_3.17.md                  # 测试执行报告
├── comparison_report_arkts_java_swift.md  # 本文件
├── compile-pass/
│   ├── TYP_03_17_001_PASS_BASIC_TUPLE.ets
│   ├── TYP_03_17_002_PASS_TUPLE_INDEX_WRITE.ets
│   ├── TYP_03_17_003_PASS_TUPLE_LENGTH.ets
│   ├── TYP_03_17_004_PASS_TUPLE_AS_TUPLE.ets
│   ├── TYP_03_17_005_PASS_TUPLE_DIFFERENT_TYPES.ets
│   └── TYP_03_17_006_PASS_TUPLE_AS_OBJECT.ets
├── compile-fail/
│   ├── TYP_03_17_007_FAIL_TYPE_MISMATCH.ets
│   ├── TYP_03_17_008_FAIL_LENGTH_MISMATCH.ets
│   └── TYP_03_17_009_FAIL_INDEX_OUT_OF_BOUNDS.ets
├── runtime/
│   ├── TYP_03_17_010_RUNTIME_BASIC_TUPLE.ets
│   ├── TYP_03_17_011_RUNTIME_TUPLE_INDEX_WRITE.ets
│   ├── TYP_03_17_012_RUNTIME_TUPLE_LENGTH.ets
│   ├── TYP_03_17_013_RUNTIME_TUPLE_AS_TUPLE.ets
│   └── TYP_03_17_014_RUNTIME_TUPLE_DIFFERENT_TYPES.ets
└── cross_lang_verify/
    ├── run_cross_lang_tests.sh
    ├── compile-pass/
    │   ├── TYP_03_17_001.java / TYP_03_17_001.swift
    │   ├── TYP_03_17_002.java / TYP_03_17_002.swift
    │   ├── TYP_03_17_003.java / TYP_03_17_003.swift
    │   ├── TYP_03_17_004.java / TYP_03_17_004.swift
    │   ├── TYP_03_17_005.java / TYP_03_17_005.swift
    │   └── TYP_03_17_006.java / TYP_03_17_006.swift
    ├── compile-fail/
    │   ├── TYP_03_17_007.java / TYP_03_17_007.swift
    │   ├── TYP_03_17_008.java / TYP_03_17_008.swift
    │   └── TYP_03_17_009.java / TYP_03_17_009.swift
    └── runtime/
        ├── TYP_03_17_010.java / TYP_03_17_010.swift
        ├── TYP_03_17_011.java / TYP_03_17_011.swift
        ├── TYP_03_17_012.java / TYP_03_17_012.swift
        ├── TYP_03_17_013.java / TYP_03_17_013.swift
        └── TYP_03_17_014.java / TYP_03_17_014.swift
```

---

## 11. 执行命令

```bash
# 执行 ArkTS 测试
cd /mnt/d/git/ARKTS_STATIC_TEST/03_Types
SECTIONS="3.17_Tuple_Types" bash run_types_cases_wsl.sh

# 执行所有跨语言测试（Java + Swift）
cd /mnt/d/git/ARKTS_STATIC_TEST/03_Types/ets_cases/3.17_Tuple_Types/cross_lang_verify
bash run_cross_lang_tests.sh
```

---

**报告生成时间**：2026-06-21
**报告版本**：v4.2
