# 14.4.1 Ambient Indexer — 跨语言对比报告

## 1. 概览

| 语言 | 索引声明机制 |
|------|-------------|
| ArkTS | ✅ ambient indexer: `[index: type]: returnType` |
| Java | ✅ array `[]` / Map.get() — 无索引签名声明语法 |
| Swift | ✅ subscript `subscript(index: Int) -> Int` — protocol 可声明 |

## 2. 章节对应关系

| ArkTS 14.4.1 | Java | Swift |
|-------------|------|-------|
| `[index: number]: number` | `int[]` 数组类型 | `subscript(Int) -> Int` |
| `[index: string]: string` | `Map<String, String>` | `subscript(String) -> String` |
| `readonly [index: number]: T` | `final` 不可变 | `get-only subscript` |
| 仅允许一个 indexer | 数组只有一种索引 | subscript 只有一个 |

## 3. 关键差异矩阵

| 特性 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 索引签名声明 | ✅ `[index: type]: returnType` | ❌ 无语法，用集合类型 | ✅ subscript |
| 多索引类型 | ✅ number/int/string | ❌ 仅 int 索引 | ✅ 任意类型 |
| readonly 索引 | ✅ 支持 readonly | ✅ final 集合 | ✅ get-only |
| 每类一个限制 | ✅ 仅允许一个 | N/A | ✅ 可多个 subscript |

## 4. 三环境实测结果

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | number 索引 | ✅ compile-pass | ✅ | ✅ |
| 002 | int 索引 | ✅ compile-pass | ✅ | ✅ |
| 003 | string 索引 | ✅ compile-pass | ✅ | ✅ |
| 004 | readonly 索引 | ✅ compile-pass | N/A | ✅ |
| 005 | Object 返回 | ✅ compile-pass | ✅ | ✅ |
| 006 | 与其余成员共存 | ✅ compile-pass | N/A | N/A |
| 007 | 两个 indexer | ✅ compile-fail | N/A | N/A |
| 008 | 非 ambient | ✅ compile-fail | N/A | N/A |
| 009 | 缺少返回类型 | ✅ compile-fail | N/A | N/A |
| 010 | runtime 共存 | ✅ runtime | N/A | N/A |

## 5. 关键差异详解

### 索引签名 vs 集合类型

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `[index: string]: string` | ✅ 索引签名声明，编译通过 |
| Java | `Map<String, String>` | ⚠️ 需要完整集合类型，非声明式 |
| Swift | `subscript(key: String) -> String` | ✅ subscript 声明 |

### readonly 索引

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `readonly [index: number]: number` | ✅ 编译通过 |
| Java | `final Map<Integer, Integer>` | ⚠️ 引用不可变，内容可变 |
| Swift | `subscript(index: Int) -> Int { get }` | ✅ get-only subscript |

## 6. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 声明式索引签名 | ⭐⭐⭐ | ⭐（需集合类型） | ⭐⭐⭐ |
| 索引类型灵活性 | ⭐⭐⭐（number/int/string） | ⭐（仅 int） | ⭐⭐⭐ |
| readonly 支持 | ⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐ |
| 编译器校验 | ⭐⭐⭐（正确实施） | N/A | N/A |

## 7. 核心结论

1. Ambient indexer 在 ArkTS 中正确实施，支持 number/int/string 索引类型和 readonly 修饰
2. Java 无索引签名声明语法，需通过集合类型（Map/List）模拟
3. Swift subscript 是最接近的概念，但 Swift subscript 编译期而非 ambient
4. 编译器要求 indexer 在类中必须声明于字段之前（解析器限制）

## 8. ArkTS 设计建议

1. 放宽 indexer 在 class 中的声明位置限制，消除字段必须在其后的解析器依赖性
2. 保持当前对 "仅一个 indexer" 和 "仅 ambient 上下文" 的正确校验
