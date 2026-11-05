# 3.17.2 Type Tuple - 测试设计思维导图（v2 修订版）

## 概述

ArkTS spec/types.md §Tuple Types + Type Tuple 定义：

**Tuple Types（spec/types.md:1156-1205）：**
- Tuple type 是引用类型，由固定数量的元素类型组成
- 语法：`tupleType: '[' (type (',' type)* ','?)? ']'`
- 每个元素有自己的类型，索引从 0 开始
- 索引表达式必须是**常量表达式**且为整数类型
- `length` 属性返回元素数量
- `readonly` 前缀的 tuple 元素不可修改（直接或通过函数/方法）
- 任何 tuple 类型是 Tuple 的子类型

**Type Tuple（spec/types.md:1225-1283）：**
- Tuple 是预定义的抽象超类
- 空元组 `[]` 与 Tuple 相同
- Type Tuple 经 Type Erasure 保留，可用于 instanceof 和 cast
- Tuple 值的元素**不能直接访问**，必须用 `unsafeGet(index: int): Any`
- `unsafeGet` 在 index < 0 或 index >= tuple.length 时抛出 runtime error
- Tuple 值的元素**不可修改**

**子类型关系（spec/semantics.md:443-461）：**
- Tuple type T(P1,...,Pn) 是 Tuple type S(P1,...,Pm) 的子类型，当 n >= m 且前缀元素类型 **identical**
- 即 `[string, number, boolean]` 是 `[string, number]` 的子类型，但 `[Derived, string]` 不是 `[Base, string]` 的子类型

## 子规则覆盖

### 1. Tuple 声明与初始化
- 正向编译: 基本元组声明 `let t: [int, string] = [1, "a"]`
- 正向编译: 空元组 `let empty: [] = []`
- 反向编译: 元素类型不匹配
- 反向编译: 元素数量不匹配

### 2. Tuple 元素访问（索引）
- 正向编译: 常量索引访问 `tuple[0]`, `tuple[1]`
- 运行时: 索引访问正确返回值和类型
- 运行时: 元素赋值修改

### 3. Tuple length 属性
- 正向编译: `tuple.length` 编译通过
- 运行时: `tuple.length` 返回正确元素数量（含空元组）

### 4. Readonly Tuple
- 正向编译: `readonly [number, string]` 声明
- 正向编译: readonly tuple 读取元素
- 反向编译: readonly tuple 修改元素 `x[0] = 42`
- 反向编译: readonly tuple 通过函数/方法修改

### 5. Type Tuple 子类型关系
- 正向编译: 元组赋值给 Tuple `let a: Tuple = pair`
- 正向编译: 空元组等同于 Tuple
- 运行时: instanceof Tuple 检查
- 运行时: 空元组 instanceof Tuple
- 正向编译: Tuple 用于 cast expression
- 正向编译: 前缀子类型（n>=m 且元素 identical）
- 反向编译: 元素子类型关系不满足（[Derived,string] 不可赋值给 [Base,string]）
- 反向编译: 非前缀子类型（更短元组赋值给更长元组）

### 6. Type Tuple.unsafeGet 方法
- 正向编译: `x.unsafeGet(1)` 编译通过
- 运行时: unsafeGet 返回正确值
- 运行时: unsafeGet 索引越界（index >= length）抛出 IndexOutOfBoundsError
- 运行时: unsafeGet 索引为负（index < 0）抛出 IndexOutOfBoundsError

### 7. Tuple 元素不可修改
- 反向编译: Tuple 类型值直接通过索引修改

## 分类说明

- **compile-pass**: 验证 Type Tuple / Tuple Types 的正确用法，编译通过
- **compile-fail**: 验证 Type Tuple / Tuple Types 的非法用法，产生编译时错误
- **runtime**: 验证 Type Tuple / Tuple Types 的运行时行为，包含 assert 断言

## 文件命名规范

- `TYP_03_17_02_YYY_PASS_<DESCRIPTION>.ets`
- `TYP_03_17_02_YYY_FAIL_<DESCRIPTION>.ets`
- `TYP_03_17_02_YYY_RUNTIME_<DESCRIPTION>.ets`

## 用例清单（最终版，26 个）

### compile-pass (10 个)

| 编号 | 用例 ID | 测试点 | 规范依据 |
|------|---------|--------|----------|
| 1 | TYP_03_17_02_001_PASS_TUPLE_AS_TUPLE_TYPE | 元组赋值给 Tuple | types.md:1225-1238 |
| 2 | TYP_03_17_02_002_PASS_EMPTY_TUPLE | 空元组声明 | types.md:1240-1245 |
| 3 | TYP_03_17_02_003_PASS_INSTANCEOF_TUPLE | instanceof Tuple | types.md:1247-1248 |
| 4 | TYP_03_17_02_004_PASS_UNSAFE_GET | unsafeGet 方法 | types.md:1250-1257 |
| 5 | TYP_03_17_02_005_PASS_TUPLE_LENGTH | tuple.length 属性 | types.md:1192-1200 |
| 6 | TYP_03_17_02_006_PASS_READONLY_TUPLE_READ | readonly tuple 读取 | types.md:1207-1224 |
| 7 | TYP_03_17_02_008_PASS_TUPLE_CAST | Tuple cast expression | types.md:1247-1248 |
| 8 | TYP_03_17_02_009_PASS_TUPLE_ELEMENT_ACCESS | 常量索引访问 | types.md:1177-1190 |
| 9 | TYP_03_17_02_010_PASS_TUPLE_ELEMENT_WRITE | 元组元素修改 | types.md:1189 |
| 10 | TYP_03_17_02_026_PASS_TUPLE_PREFIX_SUBTYPE | 前缀子类型 n>=m | semantics.md:450-461 |

### compile-fail (8 个)

| 编号 | 用例 ID | 测试点 | 规范依据 |
|------|---------|--------|----------|
| 11 | TYP_03_17_02_007_FAIL_TUPLE_ELEMENT_SUBTYPE | [Derived,string] 不可赋值给 [Base,string] | semantics.md:450-453 |
| 12 | TYP_03_17_02_011_FAIL_DIRECT_ACCESS | Tuple 直接索引访问 | types.md:1250 |
| 13 | TYP_03_17_02_012_FAIL_READONLY_TUPLE_WRITE | readonly tuple 修改 | types.md:1212-1223 |
| 14 | TYP_03_17_02_013_FAIL_TYPE_MISMATCH | 元素类型不匹配 | types.md:1174 |
| 15 | TYP_03_17_02_014_FAIL_LENGTH_MISMATCH | 元素数量不匹配 | types.md:1172 |
| 16 | TYP_03_17_02_015_FAIL_TUPLE_MUTATE | 修改 Tuple 值的元素 | types.md:1281-1283 |
| 17 | TYP_03_17_02_016_FAIL_DIFF_LENGTH_ASSIGN | 不同长度 tuple 互赋 | semantics.md:229-230 |
| 18 | TYP_03_17_02_017_FAIL_READONLY_VIA_FUNCTION | readonly 通过函数修改 | types.md:1212-1214 |

### runtime (8 个)

| 编号 | 用例 ID | 测试点 | 规范依据 |
|------|---------|--------|----------|
| 19 | TYP_03_17_02_018_RUNTIME_TUPLE_AS_TUPLE_TYPE | 元组赋值给 Tuple | types.md:1225-1238 |
| 20 | TYP_03_17_02_019_RUNTIME_EMPTY_TUPLE | 空元组 instanceof Tuple | types.md:1240-1245 |
| 21 | TYP_03_17_02_020_RUNTIME_INSTANCEOF_TUPLE | instanceof Tuple 运行时 | types.md:1269-1270 |
| 22 | TYP_03_17_02_021_RUNTIME_UNSAFE_GET | unsafeGet 正常访问 | types.md:1264-1276 |
| 23 | TYP_03_17_02_022_RUNTIME_UNSAFE_GET_NEGATIVE_INDEX | unsafeGet 负索引 (@runtime-throws=IndexOutOfBoundsError) | types.md:1259-1262 |
| 24 | TYP_03_17_02_023_RUNTIME_UNSAFE_GET_OUT_OF_BOUNDS | unsafeGet 越界 (@runtime-throws=IndexOutOfBoundsError) | types.md:1259-1262 |
| 25 | TYP_03_17_02_024_RUNTIME_TUPLE_LENGTH | tuple.length 运行时 | types.md:1192-1200 |
| 26 | TYP_03_17_02_025_RUNTIME_TUPLE_ELEMENT_ACCESS_WRITE | 元组元素访问与修改 | types.md:1177-1190 |

## 设计问题记录

### 发现 1: Tuple 子类型关系为 identical 而非 subtype

**spec 规定**：semantics.md:450-453 明确 "a tuple type is a subtype of a tuple type with fewer **identical** constituent types"
**影响**：`[Derived, string]` 不是 `[Base, string]` 的子类型，尽管 Derived <: Base
**性质**：这是 ArkTS 的合理设计选择（tuple 不支持元素协变）
**跨语言对比**：Java 不支持元组协变；Swift tuple 也不支持协变