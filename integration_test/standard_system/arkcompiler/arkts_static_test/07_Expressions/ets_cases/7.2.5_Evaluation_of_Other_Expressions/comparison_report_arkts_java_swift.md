# 7.2.5 Evaluation of Other Expressions — 三语言对比报告

## 1. 概览

本章节定义 6 种特殊表达式在异常条件下的求值顺序规则：类实例创建、数组创建、索引表达式、方法调用、索引赋值、Lambda。

## 2. 章节对应关系

| 概念 | ArkTS | Java | Swift |
|------|-------|------|-------|
| Class Instance args L→R | ✅ 参数 L→R 后构造 | ✅ 同 | ✅ 同（无 new 关键字）|
| Array literal elements L→R | ✅ `[e1, e2, e3]` | ✅ `new int[]{e1, e2, e3}` | ✅ `[e1, e2, e3]` |
| Indexing arr before idx | ✅ `arr[idx]` | ✅ `arr[idx]` | ✅ `arr[idx]` |
| Method call obj before args | ✅ `obj.method(args)` | ✅ `obj.method(args)` | ✅ `obj.method(args)` |
| Index assignment A→I→V | ✅ `arr[i] = val` | ✅ `arr[i] = val` | ✅（引用类型包装）|
| Lambda/Closure lazy eval | ✅ 创建不执行体 | ✅ 创建不执行体 | ✅ 创建不执行体 |
| 数组类型 | 引用类型 | 引用类型 | **值类型**（COW） |

## 3. 关键差异矩阵

| 差异点 | ArkTS | Java | Swift |
|--------|-------|------|-------|
| 数组语义 | 引用类型 | 引用类型 | **值类型**（Copy-on-Write） |
| 返回值下标赋值 | ✅ 直接修改原数组 | ✅ 直接修改原数组 | ❌ 返回值不可变，需 class 包装 |
| Lambda/Closure 惰性求值 | ✅ 一致 | ✅ 一致 | ✅ 一致 |
| 方法调用求值顺序 | ✅ 对象→参数 L→R | ✅ 对象→参数 L→R | ✅ 对象→参数 L→R |
| new 关键字 | ✅ `new Class(args)` | ✅ `new Class(args)` | ❌ `ClassName(args)` 无 new |

## 4. 用例对照

### 4.1 Class Instance Creation（new 表达式）

```
ArkTS:  new MyClass(getA("A"), getB("B"))  → 参数 A→B 顺序求值
Java:   new MyClass(getA("A"), getB("B"))  → 参数 A→B 顺序求值
Swift:  MyClass(a: getA("A"), b: getB("B"))  → 参数 A→B 顺序求值（无 new 关键字）
```
✅ 一致（语法细节不同）

### 4.2 Array Literal 元素求值顺序

```
ArkTS:  [getX("X"), getY("Y"), getZ("Z")]  → X→Y→Z 顺序
Java:   new int[]{getX("X"), getY("Y"), getZ("Z")}  → X→Y→Z 顺序
Swift:  [getX("X"), getY("Y"), getZ("Z")]  → X→Y→Z 顺序
```
✅ 一致

### 4.3 Indexing 求值顺序

```
ArkTS:  getArr("A")[getIdx("I")]  → A→I 顺序
Java:   getArr("A")[getIdx("I")]  → A→I 顺序
Swift:  getArr("A")[getIdx("I")]  → A→I 顺序
```
✅ 一致

### 4.4 Index Assignment 求值顺序

```
ArkTS:  getArr("A")[getIdx("I")] = getVal("V")  → A→I→V 顺序
Java:   getArr("A")[getIdx("I")] = getVal("V")  → A→I→V 顺序
Swift:  需 class 包装（值类型限制）
```
⚠️ Swift 因数组为值类型，需使用 class 包装

## 5. 三环境实测结果

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | Class Instance 编译 | ✅ compile-pass | ✅ | ✅ |
| 002 | Array Creation 编译 | ✅ compile-pass | ✅ | ✅ |
| 003 | Indexing 编译 | ✅ compile-pass | ✅ | ✅ |
| 004 | Method Call 编译 | ✅ compile-pass | ✅ | ✅ |
| 005 | Index Assignment 编译 | ✅ compile-pass | ✅ | ✅ |
| 006 | Lambda 编译 | ✅ compile-pass | ✅ | ✅ |
| 007 | Class Instance args AB | ✅ runtime | ✅ | ✅ |
| 008 | Array literal XYZ | ✅ runtime | ✅ | ✅ |
| 009 | Indexing AI order | ✅ runtime | ✅ | ✅ |
| 010 | Method call OA order | ✅ runtime | ✅ | ✅ |
| 011 | Index assign AIV order | ✅ runtime | ✅ | ✅ |
| 012 | Lambda lazy eval | ✅ runtime | ✅ | ✅ |

## 6. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 表达式求值顺序确定性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 数组语义一致性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ |
| Lambda/Closure 一致性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 跨类型覆盖 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |

## 7. 核心结论

1. **ArkTS 12/12 用例 100% 通过**，6 种表达式的求值顺序实现完整。
2. **三语言在求值顺序语义上基本一致**：new/数组/索引/方法/Lambda 均按预期求值。
3. **唯一架构级差异**：Swift 数组是值类型，而 ArkTS/Java 是引用类型。这对索引赋值求值顺序验证有影响。
4. **Lambda/Closure 惰性求值三语言完全一致**：创建时不执行体，调用时才执行。

## 8. ArkTS 设计建议

当前设计合理：ArkTS 在 6 种特殊表达式的求值顺序规则上与 Java 高度一致，与 Swift 的唯一差异源于数组值类型/引用类型的根本性语言设计选择，无需调整。

## 9. 三环境实测验证

实测代码和报告见 `cross_lang_verify/` 目录（2026-07-28 实测）：

| 文件 | 实测结果 |
|------|:--------:|
| `JavaOtherExprEval.java` + `.class` | 12/12 ✅ |
| `SwiftOtherExprEval.swift` + 二进制 | 12/12 ✅ |
| `verification_report.md` | 三环境结果对照 |

**实测关键验证点：**
- new/数组/索引/方法调用/索引赋值/Lambda 求值顺序三语言 trace 完全一致
- Lambda 惰性求值：创建时 `count=0`，初次调用 `count=1`，二次调用 `count=2`
- Swift 数组为值类型：使用 `class ArrayRef` 包装实现引用语义
