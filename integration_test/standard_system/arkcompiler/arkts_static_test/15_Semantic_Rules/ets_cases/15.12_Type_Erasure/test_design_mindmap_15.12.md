# 15.12 Type Erasure - 测试设计思维导图

## 概述
本节定义 ArkTS 中泛型类型擦除（Type Erasure）的语义：编译期擦除类型参数，擦除后类型等效性判断，以及擦除对 FixedArray、函数签名、元组等的影响。

## 核心规则

### 1. 类型擦除基本规则
- 泛型类型参数在编译期擦除，擦除后 `T` 视为 `any`
- 类型擦除后，等效签名被视为相同签名
- 擦除不影响运行时行为（泛型信息在运行时不可用）

### 2. 有效类型（Effective Type）
- `string` 字面量类型擦除后为 `string`
- `number` 字面量类型擦除后为 `number`
- `union` 类型擦除后为 union 成员的共同超类型
- `array` 擦除后为 `array`
- `FixedArray` 擦除后**不**保留长度信息（ESE461884）

### 3. 擦除后签名等效性
- 函数类型参数擦除后等效 → 编译错误（重复声明）
- 元组相同 arity 擦除后等效 → 编译错误
- 方法数组类型参数擦除后等效 → 编译错误
- 不同 arity 的函数擦除后**不**等效 → 允许重载

### 4. FixedArray 限制
- 擦除后类型不可用于 `FixedArray` 类型参数（ESE461884）
- `Promise<FixedArray<T>>` 在擦除后可能导致问题

## 测试点覆盖

### compile-fail（15 个）
1. Promise + FixedArray 擦除问题（SEM_15_12_00_114_FAIL_PROMISE_FIXEDARRAY）
2. 擦除后签名冲突（SEM_15_12_00_100_FAIL_erased_signature_conflict）
3. default any object 成员（SEM_15_12_00_101_FAIL_default_any_object_member）
4. 元组有效类型不匹配（SEM_15_12_00_102_FAIL_tuple_effective_mismatch）
5. FixedArray 擦除限制（SEM_15_12_00_103_FAIL_ERASURE_LIMIT）
6. 函数有效类型不匹配（SEM_15_12_00_104_FAIL_function_effective_mismatch）
7. never 错误上下文（SEM_15_12_00_105_FAIL_never_wrong_context）
8. SMART_GLOBAL: 全局变量 base 成员无 narrow（SEM_15_12_00_106_FAIL_SMART_GLOBAL）
9. ARCHIVE: 重载等效返回类型被忽略（SEM_15_12_00_107_FAIL_ARCHIVE）
10. ARCHIVE: 函数类型参数擦除等效（SEM_15_12_00_108_FAIL_ARCHIVE）
11. ARCHIVE: 元组相同 arity 擦除等效（SEM_15_12_00_109_FAIL_ARCHIVE）
12. ARCHIVE: 方法数组类型参数擦除等效（SEM_15_12_00_110_FAIL_ARCHIVE）
13. ARCHIVE: 静态方法数组类型参数擦除等效（SEM_15_12_00_111_FAIL_ARCHIVE）
14. ARCHIVE: 构造函数数组类型参数擦除等效（SEM_15_12_00_112_FAIL_ARCHIVE）
15. ARCHIVE: 环境函数数组类型参数擦除等效（SEM_15_12_00_113_FAIL_ARCHIVE）

### compile-pass（14 个）
1. 字符串字面量有效类型为 string（SEM_15_12_00_003_PASS_string_literal_effective_string）
2. 泛型类型擦除基础（SEM_15_12_00_002_PASS_TYPE_ERASURE）
3. 类型参数约束（SEM_15_12_00_005_PASS_type_parameter_constraint）
4. union 有效类型（SEM_15_12_00_006_PASS_union_effective）
5. array 有效类型为 array（SEM_15_12_00_007_PASS_array_effective_array）
6. FixedArray 保留（SEM_15_12_00_008_PASS_fixed_array_preserved）
7. non-nullish 有效类型（SEM_15_12_00_009_PASS_nonnullish_effective）
8. 字面量有效类型为 string（SEM_15_12_00_010_PASS_literal_effective_string）
9. 非冲突有效签名（SEM_15_12_00_011_PASS_non_conflicting_effective_signatures）
10. SMART_FUNC: instanceof narrowing（SEM_15_12_00_012_PASS_SMART_FUNC）
11. ARCHIVE: 不同 arity 不等效（SEM_15_12_00_013_PASS_ARCHIVE）
12. ARCHIVE: 显式等效签名允许（SEM_15_12_00_014_PASS_ARCHIVE）
13. ARCHIVE: 泛型普通等效文本顺序（SEM_15_12_00_015_PASS_ARCHIVE）
14. ARCHIVE: 泛型类方法等效文本顺序（SEM_15_12_00_016_PASS_ARCHIVE）

### runtime（6 个）
包含运行时类型检查与泛型擦除验证用例

## 编号规划
- compile-fail: 001, 007-011, 019, 021-027
- compile-pass: 001-006, 015-016, 018, 028-031

## 文件命名规范
`SEM_15_12_YYY_{CATEGORY}_{DESCRIPTION}.ets`

## 子章节链接
- 15.2.2: Subtyping for Generic Classes
- 5: Generics
- 15.12: Type Erasure


## 最新设计要点

从章节思维导图同步的最新测试设计点：

- generic type erasure (covariant → constraint, contravariant → never, invariant → wildcard)
- type parameter erasure (to constraint type)
- union type erasure (effective type of union members)
- array type erasure (to Array<effective type>)
- FixedArray erasure (to FixedArray<effective type>)
- function type erasure (parameters → Any, return → never)
- rest parameter function type erasure
- tuple type erasure (to internal generic tuple type)
- string literal type erasure (to string)
- Awaited type erasure (based on Promise type)
- NonNullable erasure (effective type - null)
- Record<K,V> erasure (to Map<effective K, effective V>)
- effective signature type (return never → never)
- runtime type safety checks after erasure
- cast expression with erased types (potential ClassCastError)

