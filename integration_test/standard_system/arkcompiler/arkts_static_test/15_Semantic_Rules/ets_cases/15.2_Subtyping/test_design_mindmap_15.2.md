# 15.2 Subtyping - 测试设计思维导图

## 1. 测试范围
验证子类型关系（Subtyping）规则：
- 类继承子类型（15.2.1）
- 接口实现子类型（15.2.1）
- 泛型子类型（15.2.2）
- 字面量类型子类型（15.2.3）
- 元组类型子类型（15.2.4）
- 联合类型子类型（15.2.5）
- 函数类型子类型（15.2.6）
- 固定大小数组子类型（15.2.7）
- 交叉类型子类型（15.2.8）
- 差分类型子类型（15.2.9）

## 2. 测试用例设计
### 2.1 编号规划
| 编号前缀 | 含义 | 示例 |
|---------|------|------|
| SEM_15_02_001 ~ SEM_15_02_040 | compile-pass 用例 | 各类子类型正向用例 |
| SEM_15_02_005 ~ SEM_15_02_041 | compile-fail 用例 | 各类子类型反向用例 |
| SEM_15_02_042 | runtime 用例 | 子类型运行时用例 |
| SEM_15_02_099 | compile-fail 用例 | 子类型基础拒绝（占位） |
| SEM_15_02_100 | compile-pass 用例 | 子类型基础（占位） |
| SEM_15_02_101 | runtime 用例 | 子类型运行时（占位） |

### 2.2 文件命名规范
- 格式：`SEM_15_02_XXX_{CATEGORY}_{DESCRIPTION}.ets`
- 示例：`SEM_15_02_00_001_PASS_CLASS_extends_class.ets`

## 3. 测试点分解
### 3.1 类继承子类型（15.2.1）
- 类扩展类（PASS_001）
- 类到 Object（PASS_002）
- 基类到派生类拒绝（FAIL_005）
- 不相关的类拒绝（FAIL_006）

### 3.2 接口实现子类型（15.2.1）
- 类实现接口（PASS_003）
- 接口扩展接口（PASS_004）
- 未实现的接口拒绝（FAIL_007）
- 兄弟接口拒绝（FAIL_008）

### 3.3 泛型子类型（15.2.2）
- 精确泛型父类型（PASS_009）
- 泛型接口扩展（PASS_010）
- 泛型变异性兼容（PASS_011）
- 不变性不匹配拒绝（FAIL_012）
- 类型参数数量错误（FAIL_013）
- 变异性方向错误（FAIL_014）

### 3.4 字面量类型子类型（15.2.3）
- 字符串字面量到 string（PASS_015）
- 字符串到字面量拒绝（FAIL_016）

### 3.5 元组类型子类型（15.2.4）
- 元组到元组基础（PASS_017）
- 更长元组到更短元组（PASS_018）
- 前缀更长到更短（PASS_037）
- 更短到更长拒绝（FAIL_019）

### 3.6 联合类型子类型（15.2.5）
- 成员到联合（PASS_020）
- 更小联合到更大联合（PASS_021）
- 联合到公共基础（PASS_038）
- 更大联合到更小联合拒绝（FAIL_022）

### 3.7 函数类型子类型（15.2.6）
- 返回类型协变（PASS_023）
- 参数类型逆变（PASS_024, PASS_039）
- 返回类型方向错误（FAIL_025）
- 参数类型方向错误（FAIL_026）

### 3.8 固定大小数组子类型（15.2.7）
- 引用元素协变（PASS_027）
- 方向错误拒绝（FAIL_028）
- 固定大小和可调整大小混合拒绝（FAIL_029）

### 3.9 交叉类型子类型（15.2.8）
- 交叉到组件（PASS_030）
- 组件到交叉拒绝（FAIL_031）

### 3.10 差分类型子类型（15.2.9）
- 不相交差分（PASS_032）
- 重叠差分拒绝（FAIL_033）

### 3.11 智能转换（相关）
- instanceof 缩小（PASS_040）
- 全局变量基础成员未缩小（FAIL_041）

## 4. 覆盖情况
### 4.1 compile-pass 用例（25 个）
| 编号 | 用例文件 | 测试点 |
|------|---------|--------|
| SEM_15_02_001 | SEM_15_02_00_001_PASS_CLASS_extends_class.ets | 类扩展类 |
| SEM_15_02_002 | SEM_15_02_00_002_PASS_CLASS_class_to_object.ets | 类到 Object |
| SEM_15_02_003 | SEM_15_02_00_004_PASS_CLASS_implements_interface.ets | 类实现接口 |
| SEM_15_02_004 | SEM_15_02_00_005_PASS_CLASS_interface_extends.ets | 接口扩展接口 |
| SEM_15_02_009 | SEM_15_02_00_007_PASS_GEN_exact_generic_super.ets | 精确泛型父类型 |
| SEM_15_02_010 | SEM_15_02_00_008_PASS_GEN_generic_interface_extends.ets | 泛型接口扩展 |
| SEM_15_02_011 | SEM_15_02_00_009_PASS_GEN_variance_compatible.ets | 泛型变异性兼容 |
| SEM_15_02_015 | SEM_15_02_00_012_PASS_LIT_string_literal_to_string.ets | 字符串字面量到 string |
| SEM_15_02_017 | SEM_15_02_00_013_PASS_TUPLE_tuple_to_tuple_base.ets | 元组到元组基础 |
| SEM_15_02_018 | SEM_15_02_00_014_PASS_TUPLE_longer_to_shorter.ets | 更长元组到更短元组 |
| SEM_15_02_020 | SEM_15_02_00_015_PASS_UNION_member_to_union.ets | 成员到联合 |
| SEM_15_02_021 | SEM_15_02_00_016_PASS_UNION_smaller_to_larger_union.ets | 更小联合到更大联合 |
| SEM_15_02_023 | SEM_15_02_00_017_PASS_FUNC_return_covariance.ets | 返回类型协变 |
| SEM_15_02_024 | SEM_15_02_00_018_PASS_FUNC_parameter_contravariance.ets | 参数类型逆变 |
| SEM_15_02_027 | SEM_15_02_00_019_PASS_FIXED_ref_element_covariance.ets | 引用元素协变 |
| SEM_15_02_030 | SEM_15_02_00_020_PASS_INTER_intersection_to_component.ets | 交叉到组件 |
| SEM_15_02_032 | SEM_15_02_00_021_PASS_DIFF_disjoint_difference.ets | 不相交差分 |
| SEM_15_02_034 | SEM_15_02_00_022_PASS_CLASS_declared_implements.ets | 声明的接口实现 |
| SEM_15_02_035 | SEM_15_02_00_023_PASS_GEN_out_covariant_assignment.ets | out 协变赋值 |
| SEM_15_02_036 | SEM_15_02_00_024_PASS_LIT_literal_union_to_string.ets | 字面量联合到 string |
| SEM_15_02_037 | SEM_15_02_00_025_PASS_TUPLE_prefix_longer_to_shorter.ets | 前缀更长到更短 |
| SEM_15_02_038 | SEM_15_02_00_026_PASS_UNION_union_to_common_base.ets | 联合到公共基础 |
| SEM_15_02_039 | SEM_15_02_00_027_PASS_FUNC_param_contravariance.ets | 参数类型逆变 |
| SEM_15_02_040 | SEM_15_02_00_028_PASS_SMART_FUNC_instanceof_narrowing.ets | instanceof 缩小 |
| SEM_15_02_100 | SEM_15_02_100.ets | 子类型基础（占位） |

### 4.2 compile-fail 用例（18 个）
| 编号 | 用例文件 | 测试点 |
|------|---------|--------|
| SEM_15_02_005 | SEM_15_02_00_100_FAIL_CLASS_base_to_derived.ets | 基类到派生类拒绝 |
| SEM_15_02_006 | SEM_15_02_00_101_FAIL_CLASS_unrelated_classes.ets | 不相关的类拒绝 |
| SEM_15_02_007 | SEM_15_02_00_102_FAIL_CLASS_not_implemented_interface.ets | 未实现的接口拒绝 |
| SEM_15_02_008 | SEM_15_02_00_103_FAIL_CLASS_sibling_interfaces.ets | 兄弟接口拒绝 |
| SEM_15_02_012 | SEM_15_02_00_104_FAIL_GEN_invariant_mismatch.ets | 不变性不匹配拒绝 |
| SEM_15_02_013 | SEM_15_02_00_105_FAIL_GEN_wrong_arg_count.ets | 类型参数数量错误 |
| SEM_15_02_014 | SEM_15_02_00_106_FAIL_GEN_variance_wrong_direction.ets | 变异性方向错误 |
| SEM_15_02_016 | SEM_15_02_00_107_FAIL_LIT_string_to_literal.ets | 字符串到字面量拒绝 |
| SEM_15_02_019 | SEM_15_02_00_108_FAIL_TUPLE_shorter_to_longer.ets | 更短到更长拒绝 |
| SEM_15_02_022 | SEM_15_02_00_109_FAIL_UNION_larger_to_smaller_union.ets | 更大联合到更小联合拒绝 |
| SEM_15_02_025 | SEM_15_02_00_110_FAIL_FUNC_return_wrong_direction.ets | 返回类型方向错误 |
| SEM_15_02_026 | SEM_15_02_00_111_FAIL_FUNC_parameter_wrong_direction.ets | 参数类型方向错误 |
| SEM_15_02_028 | SEM_15_02_00_112_FAIL_FIXED_wrong_direction.ets | 固定数组方向错误 |
| SEM_15_02_029 | SEM_15_02_00_113_FAIL_FIXED_fixed_resizable_mix.ets | 固定和可调整大小混合 |
| SEM_15_02_031 | SEM_15_02_00_114_FAIL_INTER_component_to_intersection.ets | 组件到交叉拒绝 |
| SEM_15_02_033 | SEM_15_02_00_115_FAIL_DIFF_overlap_difference.ets | 重叠差分拒绝 |
| SEM_15_02_041 | SEM_15_02_00_116_FAIL_SMART_GLOBAL_global_base_member_without_narrow.ets | 全局变量未缩小 |
| SEM_15_02_099 | SEM_15_02_099.ets | 子类型基础拒绝（占位） |

### 4.3 runtime 用例（2 个）
| 编号 | 用例文件 | 测试点 |
|------|---------|--------|
| SEM_15_02_042 | SEM_15_02_042_RT_SMART_GLOBAL_overload_declared_base_top_level.ets | 全局重载声明基础 |
| SEM_15_02_101 | SEM_15_02_101.ets | 子类型运行时（占位） |


## 最新设计要点

从章节思维导图同步的最新测试设计点：

- normal cases
- edge cases
- error cases

## 5. 跨章节链接
- 15.2.1 ~ 15.2.9 子章节
- 15.1 Semantic Essentials
- 15.4 Assignability
- 15.5 Variance
