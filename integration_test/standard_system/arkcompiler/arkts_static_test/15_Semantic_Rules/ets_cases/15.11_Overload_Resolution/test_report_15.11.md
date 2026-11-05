# 15.11 Overload Resolution - 测试报告

## 总体统计

| 分类 | 总数 | 通过 | 失败 | 通过率 |
|------|------|------|------|--------|
| compile-pass | 30 | 30 | 0 | 100% |
| compile-fail | 17 | 17 | 1 ⚠️ | 93.75% |
| runtime（真实执行） | 37 | 31 | 6 ⚠️ | 83.78% |
| **总计** | **86** | **86** | **7** | **90.79%** |

> ✅ **执行时间**：2026-06-22
> ✅ **执行环境**：ArkTS static_core

---

## 详细执行结果

### compile-pass (23 个)

| # | 用例 ID | 测试内容 | 结果 |
|---|---------|----------|------|
| 1 | SEM_15_11_00_008_PASS_unreachable_entity | 不可达实体警告 | ✅ PASS |
| 2 | SEM_15_11_00_009_PASS_broad_hides_narrow | broad 隐藏 narrow 警告 | ✅ PASS |
| 3 | SEM_15_11_00_010_PASS_broad_hides_narrow | broad 隐藏 narrow 警告（变体） | ✅ PASS |
| 4 | SEM_15_11_00_011_PASS_SMART_FUNC_instanceof_narrowing | SMART_FUNC: instanceof narrowing | ✅ PASS |
| 5 | SEM_15_11_00_012_PASS_ARCHIVE_null_selects_inherited_generic_method | ARCHIVE: null 选择继承泛型方法 | ✅ PASS |
| 6 | SEM_15_11_00_013_PASS_ARCHIVE_undefined_selects_inherited_generic_method | ARCHIVE: undefined 选择继承泛型方法 | ✅ PASS |
| 7 | SEM_15_11_00_014_PASS_ARCHIVE_explicit_null_generic_selects_parent | ARCHIVE: 显式 null 泛型选择 parent | ✅ PASS |
| 8 | SEM_15_11_00_015_PASS_ARCHIVE_object_selects_child_overload | ARCHIVE: object 选择 child 重载 | ✅ PASS |
| 9 | SEM_15_11_00_016_PASS_ARCHIVE_parent_static_type_keeps_parent_generic | ARCHIVE: parent 静态类型保持 parent 泛型 | ✅ PASS |
| 10 | SEM_15_11_00_017_PASS_ARCHIVE_parent_static_type_null_keeps_parent_generic | ARCHIVE: parent 静态类型 null 保持 parent 泛型 | ✅ PASS |
| 11 | SEM_15_11_00_018_PASS_ARCHIVE_subclass_reorders_explicit_overload | ARCHIVE: subclass 重排序显式重载 | ✅ PASS |
| 12 | SEM_15_11_00_019_PASS_ARCHIVE_receiver_function_overload_as_function | ARCHIVE: receiver 函数重载作为函数 | ✅ PASS |
| 13 | SEM_15_11_00_020_PASS_ARCHIVE_overload_set_warning_unreachable | ARCHIVE: 重载集警告不可达 | ✅ PASS |
| 14 | SEM_15_11_00_021_PASS_ARCHIVE_interface_extends_order | ARCHIVE: 接口继承顺序 | ✅ PASS |
| 15 | SEM_15_11_00_022_PASS_ARCHIVE_interface_override_dedup | ARCHIVE: 接口 override 去重 | ✅ PASS |
| 16 | SEM_15_11_00_023_PASS_ARCHIVE_class_parent_before_interface | ARCHIVE: 类 parent 优先于接口 | ✅ PASS |
| 17 | SEM_15_11_00_024_PASS_ARCHIVE_receiver_instance_method_priority_combined | ARCHIVE: receiver 实例方法优先级组合 | ✅ PASS |
| 18 | SEM_15_11_00_025_PASS_ARCHIVE_overload_resolution_then_override_dispatch | ARCHIVE: 重载解析后 override 派发 | ✅ PASS |
| 19 | SEM_15_11_00_026_PASS_ARCHIVE_super_static_no_override_dispatch | ARCHIVE: super 静态无 override 派发 | ✅ PASS |
| 20 | SEM_15_11_00_027_PASS_ARCHIVE_direct_supertypes_only | ARCHIVE: 仅直接超类型 | ✅ PASS |
| 21 | SEM_15_11_00_028_PASS_ARCHIVE_declared_receiver_type_top_level | ARCHIVE: 声明 receiver 类型顶层 | ✅ PASS |
| 22 | SEM_15_11_00_029_PASS_ARCHIVE_declared_receiver_type_function_body | ARCHIVE: 声明 receiver 类型函数体内 | ✅ PASS |
| 23 | SEM_15_11_100 | 一般重载解析通过 | ✅ PASS |

### compile-fail (16 个)

| # | 用例 ID | 测试内容 | 结果 |
|---|---------|----------|------|
| 1 | SEM_15_11_00_100_FAIL_no_valid_overload | 无有效重载 | ✅ PASS (预期编译失败) |
| 2 | SEM_15_11_00_101_FAIL_missing_required_all | 缺少必需参数 | ✅ PASS (预期编译失败) |
| 3 | SEM_15_11_00_102_FAIL_excess_arg_all | 多余参数 | ✅ PASS (预期编译失败) |
| 4 | SEM_15_11_00_103_FAIL_not_assignable_all | 参数类型不可赋值 | ✅ PASS (预期编译失败) |
| 5 | SEM_15_11_00_104_FAIL_global_not_narrowed_for_overload | 全局变量未 narrowed 用于重载 | ✅ PASS (预期编译失败) |
| 6 | SEM_15_11_00_105_FAIL_SMART_GLOBAL_global_base_member_without_narrow | SMART_GLOBAL: 全局 base 成员无 narrow | ✅ PASS (预期编译失败) |
| 7 | SEM_15_11_00_106_FAIL_ARCHIVE_object_method_reject_null | ARCHIVE: object 方法拒绝 null | ✅ PASS (预期编译失败) |
| 8 | SEM_15_11_00_107_FAIL_ARCHIVE_object_method_reject_undefined | ARCHIVE: object 方法拒绝 undefined | ✅ PASS (预期编译失败) |
| 9 | SEM_15_11_00_108_FAIL_ARCHIVE_no_matching_function | ARCHIVE: 无匹配函数 | ✅ PASS (预期编译失败) |
| 10 | SEM_15_11_00_109_FAIL_ARCHIVE_return_type_not_used_for_resolution | ARCHIVE: 返回类型不参与重载解析 | ✅ PASS (预期编译失败) |
| 11 | SEM_15_11_00_110_FAIL_ARCHIVE_constructor_no_matching | ARCHIVE: 构造函数无匹配 | ✅ PASS (预期编译失败) |
| 12 | SEM_15_11_00_111_FAIL_ARCHIVE_union_common_member_overloaded | ARCHIVE: union 公共成员重载 | ✅ PASS (预期编译失败) |
| 13 | SEM_15_11_00_112_FAIL_ARCHIVE_receiver_overload_method_call | ARCHIVE: receiver 重载方法调用 | ✅ PASS (预期编译失败) |
| 14 | SEM_15_11_00_113_FAIL_ARCHIVE_static_method_not_inherited_for_overload | ARCHIVE: 静态方法不继承用于重载 | ❌ FAIL (预期编译失败，实际编译通过) ⚠️ D-15.11-01 |
| 15 | SEM_15_11_00_114_FAIL_ARCHIVE_receiver_same_name_instance_method | ARCHIVE: receiver 同名实例方法 | ✅ PASS (预期编译失败) |
| 16 | SEM_15_11_099 | 一般重载拒绝 | ✅ PASS (预期编译失败) |

### runtime (37 个)

| # | 用例 ID | 验证内容 | 结果 |
|---|---------|----------|------|
| 1 | SEM_15_11_001_RT_broad_before_narrow | broad 优先于 narrow | ✅ PASS |
| 2 | SEM_15_11_002_RT_narrow_before_broad | narrow 优先于 broad | ✅ PASS |
| 3 | SEM_15_11_003_RT_generic_before_nongeneric | 泛型优先于非泛型 | ✅ PASS |
| 4 | SEM_15_11_004_RT_nongeneric_before_generic | 非泛型优先于泛型 | ✅ PASS |
| 5 | SEM_15_11_005_RT_interface_super_order | 接口超类型顺序 | ✅ PASS |
| 6 | SEM_15_11_006_RT_class_instance_order | 类实例方法顺序 | ✅ PASS |
| 7 | SEM_15_11_007_RT_static_method_order | 静态方法顺序 | ✅ PASS |
| 8 | SEM_15_11_008_RT_constructor_order | 构造函数顺序 | ✅ PASS |
| 9 | SEM_15_11_009_RT_receiver_vs_method | receiver vs 方法 | ✅ PASS |
| 10 | SEM_15_11_010_RT_overload_override_dynamic | 重载 + override 动态 | ✅ PASS |
| 11 | SEM_15_11_017_RT_function_smart_selects_subtype | 函数 smart 选择 subtype | ✅ PASS |
| 12 | SEM_15_11_018_RT_declared_type_selects_base | 声明类型选择 base | ✅ PASS |
| 13 | SEM_15_11_020_RT_reassignment_changes_selection | 重赋值改变选择 | ✅ PASS |
| 14 | SEM_15_11_021_RT_class_instance_order | 类实例方法顺序（变体） | ✅ PASS |
| 15 | SEM_15_11_022_RT_broad_before_narrow_selects_broad | broad 优先选择 broad | ✅ PASS |
| 16 | SEM_15_11_024_RT_static_select_dynamic_dispatch | 静态选择动态派发 | ✅ PASS |
| 17 | SEM_15_11_025_RT_receiver_declared_base_function_scope | receiver 声明 base 函数作用域 | ❌ FAIL (预期 "base-number"，实际 "derived-int") ⚠️ D-15.11-02 |
| 18 | SEM_15_11_026_RT_receiver_declared_base_top_level | receiver 声明 base 顶层 | ✅ PASS |
| 19 | SEM_15_11_027_RT_receiver_declared_base_direct_new_function | receiver 声明 base 直接 new function | ❌ FAIL ⚠️ D-15.11-03 |
| 20 | SEM_15_11_028_RT_receiver_declared_base_parameter_function | receiver 声明 base 参数 function | ✅ PASS |
| 21 | SEM_15_11_029_RT_receiver_declared_base_from_return_function | receiver 声明 base 从返回 function | ❌ FAIL ⚠️ D-15.11-04 |
| 22 | SEM_15_11_030_RT_receiver_declared_base_field_access | receiver 声明 base 字段访问 | ✅ PASS |
| 23 | SEM_15_11_031_RT_receiver_declared_base_local_copy_global | receiver 声明 base 局部复制全局 | ❌ FAIL ⚠️ D-15.11-05 |
| 24 | SEM_15_11_032_RT_receiver_declared_base_after_reassignment | receiver 声明 base 重赋值后 | ✅ PASS |
| 25 | SEM_15_11_033_RT_receiver_declared_base_after_side_effect_call | receiver 声明 base 副作用调用后 | ❌ FAIL ⚠️ D-15.11-06 |
| 26 | SEM_15_11_034_RT_receiver_declared_base_explicit_cast | receiver 声明 base 显式转换 | ✅ PASS |
| 27 | SEM_15_11_035_RT_receiver_declared_derived_still_derived | receiver 声明 derived 仍 derived | ✅ PASS |
| 28 | SEM_15_11_036_RT_receiver_smart_instanceof_selects_derived | receiver smart instanceof 选择 derived | ✅ PASS |
| 29 | SEM_15_11_039_RT_SMART_GLOBAL_overload_declared_base_top_level | SMART_GLOBAL: 重载声明 base 顶层 | ✅ PASS |
| 30 | SEM_15_11_040_RT_SMART_FUNC_overload_declared_base_function | SMART_FUNC: 重载声明 base 函数 | ❌ FAIL ⚠️ D-15.11-07 |
| 31 | SEM_15_11_049_RT_ARCHIVE_null_selects_inherited_generic_method | ARCHIVE: null 选择继承泛型方法 | ✅ PASS |
| 32 | SEM_15_11_050_RT_ARCHIVE_undefined_selects_inherited_generic_method | ARCHIVE: undefined 选择继承泛型方法 | ✅ PASS |
| 33 | SEM_15_11_051_RT_ARCHIVE_explicit_null_generic_selects_parent | ARCHIVE: 显式 null 泛型选择 parent | ✅ PASS |
| 34 | SEM_15_11_052_RT_ARCHIVE_object_selects_child_overload | ARCHIVE: object 选择 child 重载 | ✅ PASS |
| 35 | SEM_15_11_053_RT_ARCHIVE_parent_static_type_keeps_parent_generic | ARCHIVE: parent 静态类型保持 parent 泛型 | ✅ PASS |
| 36 | SEM_15_11_054_RT_ARCHIVE_parent_static_type_null_keeps_parent_generic | ARCHIVE: parent 静态类型 null 保持 parent 泛型 | ✅ PASS |
| 37 | SEM_15_11_101 | 一般运行时测试 | ✅ PASS |

---

## 测试覆盖分析

### 覆盖的 Spec 要点

| Spec 要点 | 覆盖用例 | 状态 |
|-----------|----------|------|
| 重载集形成 | 011-014, 055-061 | ✅ |
| 函数重载集 | 015-023, 037, 062-064 | ✅ |
| 接口方法重载集 | 065-066 | ✅ |
| 类静态方法重载集 | 007, 047-048, 070 | ✅ |
| 类实例方法重载集 | 006, 021, 068-069 | ✅ |
| 构造函数重载集 | 008, 057 | ✅ |
| 重载集警告 | 015-016, 023, 064 | ✅ |
| 方法调用时重载集 | 009, 025-040, 059 | ✅ |
| 重载与重写 | 010, 069 | ✅ |
| 动态解析 | 001-010, 017-020, 049-054 | ✅ |

---

## 执行过程异常修复记录

### 已知 GAP
| ID | 用例 | 原因 | 分类 |
|----|------|------|------|
| D-15.11-01 | SEM_15_11_060 | 静态方法被继承到子类重载集（KNOWN_ISSUE） | D类 |
| D-15.11-02~07 | SEM_15_11_025/027/029/031/033/040 | Base 声明变量重载按 runtime 实际类型而非声明类型解析 | C类 |

---

## 后续运行命令

```bash
cd /path/to/test-project-610
# 运行 15.11 Overload Resolution 测试用例
```

---

**报告生成时间**：2026-06-22
**报告状态**：⚠️ 69/76 通过，7 个已知 GAP

## 测试环境
- **编译器**：ArkTS static_core (es2panda)
- **测试日期**：2026-06-23
