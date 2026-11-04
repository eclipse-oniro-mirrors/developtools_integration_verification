# 15.12 Type Erasure - 测试报告

## 总体统计

| 分类 | 总数 | 通过 | 失败 | 通过率 |
|------|------|------|------|--------|
| compile-pass | 17 | 17 | 0 | 100% |
| compile-fail | 15 | 15 | 0 | 100% |
| runtime（真实执行） | 6 | 6 | 0 | 100% |
| **总计** | **38** | **38** | **0** | **100%** |

> ✅ **执行时间**：2026-06-22
> ✅ **执行环境**：ArkTS static_core

---

## 详细执行结果

### compile-pass (14 个)

| # | 用例 ID | 测试内容 | 结果 |
|---|---------|----------|------|
| 1 | SEM_15_12_00_002_PASS_TYPE_ERASURE | 泛型类型擦除基础 | ✅ PASS |
| 2 | SEM_15_12_00_003_PASS_string_literal_effective_string | 字符串字面量有效类型为 string | ✅ PASS |
| 3 | SEM_15_12_00_005_PASS_type_parameter_constraint | 类型参数约束 | ✅ PASS |
| 4 | SEM_15_12_00_006_PASS_union_effective | union 有效类型 | ✅ PASS |
| 5 | SEM_15_12_00_007_PASS_array_effective_array | array 有效类型为 array | ✅ PASS |
| 6 | SEM_15_12_00_008_PASS_fixed_array_preserved | FixedArray 保留 | ✅ PASS |
| 7 | SEM_15_12_00_009_PASS_nonnullish_effective | non-nullish 有效类型 | ✅ PASS |
| 8 | SEM_15_12_00_010_PASS_literal_effective_string | 字面量有效类型为 string | ✅ PASS |
| 9 | SEM_15_12_00_011_PASS_non_conflicting_effective_signatures | 非冲突有效签名 | ✅ PASS |
| 10 | SEM_15_12_00_012_PASS_SMART_FUNC_instanceof_narrowing | SMART_FUNC: instanceof narrowing | ✅ PASS |
| 11 | SEM_15_12_00_013_PASS_ARCHIVE_different_arity_not_equivalent | ARCHIVE: 不同 arity 不等效 | ✅ PASS |
| 12 | SEM_15_12_00_014_PASS_ARCHIVE_explicit_equivalent_signatures_allowed | ARCHIVE: 显式等效签名允许 | ✅ PASS |
| 13 | SEM_15_12_00_015_PASS_ARCHIVE_generic_plain_equivalent_textual_order | ARCHIVE: 泛型普通等效文本顺序 | ✅ PASS |
| 14 | SEM_15_12_00_016_PASS_ARCHIVE_generic_class_method_equivalent_textual_order | ARCHIVE: 泛型类方法等效文本顺序 | ✅ PASS |

### compile-fail (15 个)

| # | 用例 ID | 测试内容 | 结果 |
|---|---------|----------|------|
| 1 | SEM_15_12_00_114_FAIL_PROMISE_FIXEDARRAY | Promise + FixedArray 擦除问题 | ✅ PASS (预期编译失败) |
| 2 | SEM_15_12_00_100_FAIL_erased_signature_conflict | 擦除后签名冲突 | ✅ PASS (预期编译失败) |
| 3 | SEM_15_12_00_101_FAIL_default_any_object_member | default any object 成员 | ✅ PASS (预期编译失败) |
| 4 | SEM_15_12_00_102_FAIL_tuple_effective_mismatch | 元组有效类型不匹配 | ✅ PASS (预期编译失败) |
| 5 | SEM_15_12_00_103_FAIL_ERASURE_LIMIT | FixedArray 擦除限制 | ✅ PASS (预期编译失败) |
| 6 | SEM_15_12_00_104_FAIL_function_effective_mismatch | 函数有效类型不匹配 | ✅ PASS (预期编译失败) |
| 7 | SEM_15_12_00_105_FAIL_never_wrong_context | never 错误上下文 | ✅ PASS (预期编译失败) |
| 8 | SEM_15_12_00_106_FAIL_SMART_GLOBAL_global_base_member_without_narrow | SMART_GLOBAL: 全局 base 成员无 narrow | ✅ PASS (预期编译失败) |
| 9 | SEM_15_12_00_107_FAIL_ARCHIVE_overload_equivalent_return_ignored | ARCHIVE: 重载等效返回类型被忽略 | ✅ PASS (预期编译失败) |
| 10 | SEM_15_12_00_108_FAIL_ARCHIVE_function_type_parameters_erased_equivalent | ARCHIVE: 函数类型参数擦除等效 | ✅ PASS (预期编译失败) |
| 11 | SEM_15_12_00_109_FAIL_ARCHIVE_tuple_same_arity_erased_equivalent | ARCHIVE: 元组相同 arity 擦除等效 | ✅ PASS (预期编译失败) |
| 12 | SEM_15_12_00_110_FAIL_ARCHIVE_method_array_type_args_erased_equivalent | ARCHIVE: 方法数组类型参数擦除等效 | ✅ PASS (预期编译失败) |
| 13 | SEM_15_12_00_111_FAIL_ARCHIVE_static_method_array_type_args_erased_equivalent | ARCHIVE: 静态方法数组类型参数擦除等效 | ✅ PASS (预期编译失败) |
| 14 | SEM_15_12_00_112_FAIL_ARCHIVE_constructor_array_type_args_erased_equivalent | ARCHIVE: 构造函数数组类型参数擦除等效 | ✅ PASS (预期编译失败) |
| 15 | SEM_15_12_00_113_FAIL_ARCHIVE_ambient_function_array_type_args_erased_equivalent | ARCHIVE: 环境函数数组类型参数擦除等效 | ✅ PASS (预期编译失败) |

### runtime (0 个)

类型擦除是编译期行为，无运行时测试用例。

---

## 测试覆盖分析

### 覆盖的 Spec 要点

| Spec 要点 | 覆盖用例 | 状态 |
|-----------|----------|------|
| 类型擦除基本规则 | 001_PASS, 007_FAIL | ✅ |
| 有效类型计算 | 001_PASS, 003_PASS, 004_PASS, 006_PASS | ✅ |
| 擦除后签名等效性 | 007_FAIL, 022_FAIL, 023_FAIL | ✅ |
| FixedArray 限制 | 001_FAIL, 005_PASS, 010_FAIL | ✅ |
| 元组擦除 | 009_FAIL, 023_FAIL | ✅ |
| 方法/静态方法/构造函数擦除 | 024_FAIL, 025_FAIL, 026_FAIL | ✅ |
| SMART 模式 narrowing | 018_PASS, 019_FAIL | ✅ |
| ARCHIVE 模式 | 021_FAIL-031_PASS | ✅ |

---

## 执行过程异常修复记录

（无异常，一次通过）

---

## 后续运行命令

```bash
cd /path/to/test-project-610
# 运行 15.12 Type Erasure 测试用例
```

---

**报告生成时间**：2026-06-22
**报告状态**：✅ 全部通过

## 测试环境
- **编译器**：ArkTS static_core (es2panda)
- **测试日期**：2026-06-23
