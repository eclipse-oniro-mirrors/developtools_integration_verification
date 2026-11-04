# 3.16.1 Resizable Array Types - ArkTS/Java/Swift 跨语言对比报告

---

## 1. 概览

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 章节对应 | §3.16.1 Resizable Array Types | java.util.ArrayList | Swift Array<T> |
| 定位 | 可变长度数组类型 | 可变长度数组容器 | 可变长度数组类型 |
| 核心概念 | T[] 和 Array<T> 相同类型 | ArrayList<T> 是 List<T> 实现 | [T] 是 Array<T> 简写 |

---

## 2. 章节对应关系

| ArkTS §3.16.1 子项 | Java 对应 | Swift 对应 |
|-------------------|-----------|------------|
| T[] 和 Array\<T\> 语法 | ArrayList\<T\> | [T] 或 Array\<T\> |
| length 属性 | size() 方法 | count 属性 |
| 索引访问 arr[i] | get(i)/set(i,v) | arr[i] 或下标赋值 |
| length 收缩 | 无（数组长度固定） | removeLast()/prefix() |
| 数组是 Object 子类型 | Object 是所有类父类 | Any 类型 |

---

## 3. 关键差异矩阵

| 特性 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 数组可变长度 | ✅ | ❌（原生数组固定） | ✅ |
| 两种语法形式 | ✅ T[] = Array\<T\> | ❌ | ✅ [T] = Array\<T\> |
| length 属性 | ✅ | size() 方法 | count 属性 |
| 直接索引赋值 | ✅ arr[i]=v | ❌ set(i,v) | ✅ arr[i]=v |
| length 收缩 | ✅ | ❌ | ❌ |
| Object 子类型 | ✅ | ✅ | ❌（值类型） |
| 边界检查抛异常 | ✅ RangeError | ✅ IndexOutOfBounds | ✅ 运行时错误 |

---

## 4. 用例 1:1 对照

| 测试点 | ArkTS | Java | Swift |
|--------|-------|------|-------|
| 基本声明 | `let a: number[]=[1,2,3]` | `List<Integer> a=new ArrayList<>(); a.add(1);` | `var a: [Int]=[1,2,3]` |
| 索引读取 | `let x=arr[0]` | `int x=arr.get(0)` | `let x=arr[0]` |
| 索引写入 | `arr[1]=200` | `arr.set(1,200)` | `arr[1]=200` |
| 获取长度 | `arr.length` | `arr.size()` | `arr.count` |
| 收缩长度 | `arr.length=3` | 无直接支持 | `arr=Array(arr.prefix(3))` |
| 数组赋值 | `let b=a` | `List<Integer> b=a` | `var b=a`（值拷贝） |

---

## 5. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 数组可变性 | 9/10 | 6/10 | 9/10 |
| 语法简洁性 | 9/10 | 6/10 | 9/10 |
| 类型安全 | 10/10 | 9/10 | 10/10 |
| 性能控制 | 8/10 | 8/10 | 8/10 |
| **综合** | **9/10** | **7/10** | **9/10** |

---

## 6. 核心结论

### 6.1 ArkTS 与 Java

1. **数组可变性**：ArkTS 原生支持可变长度数组，Java 原生数组长度固定，需使用 ArrayList
2. **语法简洁性**：ArkTS `T[]` 语法更简洁，Java 需要 ArrayList 初始化
3. **length 收缩**：ArkTS 独有特性，Java 无对应功能

### 6.2 ArkTS 与 Swift

1. **数组语义**：ArkTS 数组是引用类型，Swift 数组是值类型
2. **语法相似性**：两者都支持 `T[]` 和 `Array<T>` 两种语法
3. **length 收缩**：ArkTS 支持直接设置 length，Swift 需要使用 prefix 方法

---

## 7. 设计建议

### 7.1 ArkTS 特有优势

1. **T[] 和 Array\<T\> 等价**：简化了数组类型声明
2. **length 属性可写**：直接收缩数组，无需创建新数组
3. **数组是 Object 子类型**：便于泛型编程

### 7.2 建议

1. **文档说明**：明确说明 length 收缩的边界检查行为
2. **性能优化**：length 收缩应避免不必要的内存拷贝
3. **错误信息**：RangeError 应提供更详细的错误信息

---

## 8. 实测结果

| 分类 | 数量 | 通过 | 失败 | 通过率 |
|------|------|------|------|--------|
| compile-pass | 8 | 8 | 0 | 100% |
| compile-fail | 1 | 1 | 0 | 100% |
| runtime | 7 | 7 | 0 | 100% |
| **总计** | **16** | **16** | **0** | **100%** |

**异常记录**：

| 异常类型 | 用例 | 说明 |
|----------|------|------|
| D类 | TYP_03_16_01_017/018 | Spec 声明应为编译时错误，但实现为运行时 RangeError |

---

## 9. 测试统计

| 章节 | 测试用例数 | 编译通过 | 执行通过 | 说明 |
|------|-----------|----------|----------|------|
| 3.16.1 Resizable Array Types | 16 | 16 | 16 | 03_Types 子章节 |
| **累计** | **16** | **16** | **16** | |

---

## 10. 文件清单

```
3.16.1_Resizable_Array_Types/
├── test_design_mindmap_3.16.1.md          # 测试设计思维导图
├── test_report_3.16.1.md                  # 测试执行报告
├── comparison_report_arkts_java_swift.md  # 本文件
├── compile-pass/
│   ├── TYP_03_16_01_001_PASS_T_BRACKET_SYNTAX.ets
│   ├── TYP_03_16_01_002_PASS_ARRAY_T_SYNTAX.ets
│   ├── TYP_03_16_01_003_PASS_SYNTAX_EQUIVALENCE.ets
│   ├── TYP_03_16_01_004_PASS_INDEX_ACCESS.ets
│   ├── TYP_03_16_01_005_PASS_LENGTH_PROPERTY.ets
│   ├── TYP_03_16_01_006_PASS_SHRINK_ARRAY.ets
│   ├── TYP_03_16_01_007_PASS_AS_OBJECT.ets
│   └── TYP_03_16_01_008_PASS_TYPE_ALIAS.ets
├── compile-fail/
│   └── TYP_03_16_01_011_FAIL_TYPE_MISMATCH.ets
├── runtime/
│   ├── TYP_03_16_01_012_RUNTIME_SYNTAX_EQUIVALENCE.ets
│   ├── TYP_03_16_01_013_RUNTIME_SHRINK_ARRAY.ets
│   ├── TYP_03_16_01_014_RUNTIME_INDEX_ACCESS.ets
│   ├── TYP_03_16_01_015_RUNTIME_TYPE_ALIAS.ets
│   ├── TYP_03_16_01_016_RUNTIME_AS_OBJECT.ets
│   ├── TYP_03_16_01_017_RUNTIME_SHRINK_NEGATIVE.ets
│   └── TYP_03_16_01_018_RUNTIME_SHRINK_GREATER.ets
└── cross_lang_verify/
    ├── TYP_03_16_01_Resizable_Array_Types.java
    └── TYP_03_16_01_Resizable_Array_Types.swift
```

---

## 11. 执行命令

```bash
# 执行 ArkTS 测试
cd /mnt/d/git/ARKTS_STATIC_TEST/03_Types
SECTIONS="3.16.1_Resizable_Array_Types" bash run_types_cases_wsl.sh

# 执行 Java 跨语言测试
cd /mnt/d/git/ARKTS_STATIC_TEST/03_Types/ets_cases/3.16.1_Resizable_Array_Types/cross_lang_verify
javac TYP_03_16_01_Resizable_Array_Types.java && java TYP_03_16_01_Resizable_Array_Types

# 执行 Swift 跨语言测试
cd /mnt/d/git/ARKTS_STATIC_TEST/03_Types/ets_cases/3.16.1_Resizable_Array_Types/cross_lang_verify
~/swift-5.10/usr/bin/swift TYP_03_16_01_Resizable_Array_Types.swift
```

---

**报告生成时间**：2026-06-21
**报告版本**：v4.2
