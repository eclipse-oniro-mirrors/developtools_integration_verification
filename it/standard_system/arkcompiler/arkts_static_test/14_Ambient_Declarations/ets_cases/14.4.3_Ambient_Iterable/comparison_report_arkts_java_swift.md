# 14.4.3 Ambient Iterable — 跨语言对比报告

## 1. 概览

| 语言 | 可迭代声明 |
|------|-----------|
| ArkTS | ✅ `[Symbol.iterator](): Iterator<T>` |
| Java | ✅ `Iterable<T>` + `Iterator<T>` |
| Swift | ✅ `Sequence` + `IteratorProtocol` |

## 2. 章节对应关系

| ArkTS 14.4.3 | Java | Swift |
|-------------|------|-------|
| `[Symbol.iterator](): Iterator<int>` | `Iterator<Integer> iterator()` | `func makeIterator() -> IndexingIterator<[Int]>` |
| 仅允许一个 iterable | 一个类可 implement Iterable 一次 | 一个 Sequence 协议 |

## 3. 关键差异矩阵

| 特性 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 可迭代声明 | ✅ ambient iterable | ✅ Iterable<T> 接口 | ✅ Sequence 协议 |
| Iterator 检查 | ✅ 编译器检查 | ✅ 编译期 | ✅ 编译期 |
| 仅 ambient 上下文 | ✅ 限制 | N/A | N/A |
| 每类一个限制 | ✅ 仅允许一个 | ✅ 仅一个 Iterable | ✅ 仅一个 Sequence |

## 4. 三环境实测结果

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | 基本 iterable | ✅ compile-pass | ✅ | ✅ |
| 002 | 与字段共存 | ✅ compile-pass | ✅ | ✅ |
| 003 | bool 迭代器 | ✅ compile-pass | ✅ | ✅ |
| 004 | 两个 iterable | ✅ compile-fail | N/A | N/A |
| 005 | 非 ambient | ✅ compile-fail | N/A | N/A |
| 006 | 缺返回类型 | ✅ compile-fail | N/A | N/A |
| 007 | runtime | ✅ runtime | N/A | N/A |

## 5. 关键差异详解

### 返回类型必须是 Iterator<T>

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `[Symbol.iterator](): Iterator<int>` | ✅ 编译通过 |
| ArkTS | `[Symbol.iterator](): CIterator`（自定义接口） | ❌ 必须实现 Iterator 接口 |
| Java | `Iterator<Integer> iterator()` | ✅ 必须实现 Iterator |
| Swift | `func makeIterator() -> IndexingIterator<[Int]>` | ✅ 必须实现 IteratorProtocol |

### 不支持自定义接口

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `[Symbol.iterator](): CIterator` | ❌ Semantic error：必须实现 Iterator |
| Java | `MyIterator iterator()` | ❌ 必须实现 Iterator |
| Swift | `func makeIterator() -> MyIterator` | ❌ 必须符合 IteratorProtocol |

## 6. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 声明简洁性 | ⭐⭐⭐（单行语法） | ⭐⭐（需 implements） | ⭐⭐（需协议遵循） |
| Iterator 校验 | ⭐⭐⭐（严格检查） | ⭐⭐⭐（编译期） | ⭐⭐⭐（编译期） |
| 编译器校验 | ⭐⭐⭐（所有规则正确） | N/A | N/A |

## 7. 核心结论

1. ArkTS 使用 `[Symbol.iterator](): Iterator<T>` 声明可迭代类型，与 Java/Swift 概念一致
2. 编译器严格检查返回类型是否实现 `Iterator<T>` 接口，不支持自定义迭代器接口
3. 所有 compile-fail 规则均正确实施，无 spec 不一致问题
4. 解析器限制：iterable 声明后不能跟 array brackets 语法

## 8. ArkTS 设计建议

1. 保持编译器对 Iterator 接口的严格校验
2. 修复解析器对 iterable 后跟 array brackets 的处理
3. 考虑在未来版本支持 inline object literal type（`{value: T, done: boolean}`）
