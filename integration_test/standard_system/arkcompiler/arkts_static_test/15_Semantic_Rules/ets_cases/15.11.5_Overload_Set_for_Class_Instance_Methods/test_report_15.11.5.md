# 15.11.5 Overload Set for Class Instance Methods - Test Report

## Execution Overview
| Metric | Value |
|---|---|
| Total Cases | 9 |
| Passed | 9 |
| Failed | 0 |
| Pass Rate | 100% |

## Case List
| ID | Case File | Type | Result |
|---|---|---|---|
| SEM_15_11_05_001_PASS_instance_overload_set | SEM_15_11_05_001_PASS_instance_overload_set.ets | compile-pass | ✅ |
| SEM_15_11_05_002_PASS_instance_method_multi_params | SEM_15_11_05_002_PASS_instance_method_multi_params.ets | compile-pass | ✅ |
| SEM_15_11_05_003_PASS_class_no_super | SEM_15_11_05_003_PASS_class_no_super.ets | compile-pass | ✅ |
| SEM_15_11_05_004_PASS_class_superclass_superinterface | SEM_15_11_05_004_PASS_class_superclass_superinterface.ets | compile-pass | ✅ |
| SEM_15_11_05_100_FAIL_instance_arg_mismatch | SEM_15_11_05_100_FAIL_instance_arg_mismatch.ets | compile-fail | ✅ |
| SEM_15_11_05_101_FAIL_call_no_matching_overload | SEM_15_11_05_101_FAIL_call_no_matching_overload.ets | compile-fail | ✅ |
| SEM_15_11_05_102_FAIL_class_with_overload | SEM_15_11_05_102_FAIL_class_with_overload.ets | compile-fail | ✅ |
| SEM_15_11_05_103_FAIL_class_inheritance_chain | SEM_15_11_05_103_FAIL_class_inheritance_chain.ets | compile-fail | ✅ |
| SEM_15_11_05_200_RUNTIME_instance_overload | SEM_15_11_05_200_RUNTIME_instance_overload.ets | runtime | ✅ |

## Result Statistics
| Category | Count | Pass | Fail |
|---|---|---|---|
| compile-pass | 4 | 4 | 0 |
| compile-fail | 4 | 4 | 0 |
| runtime | 1 | 1 | 0 |
| **Total** | **9** | **9** | **0** |

## Detailed Results

### compile-pass (4/4 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_11_05_001_PASS_instance_overload_set | SEM_15_11_05_001_PASS_instance_overload_set.ets | compile-pass | compile-pass | ✅ |
| SEM_15_11_05_002_PASS_instance_method_multi_params | SEM_15_11_05_002_PASS_instance_method_multi_params.ets | compile-pass | compile-pass | ✅ |
| SEM_15_11_05_003_PASS_class_no_super | SEM_15_11_05_003_PASS_class_no_super.ets | compile-pass | compile-pass | ✅ |
| SEM_15_11_05_004_PASS_class_superclass_superinterface | SEM_15_11_05_004_PASS_class_superclass_superinterface.ets | compile-pass | compile-pass | ✅ |

### compile-fail (4/4 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_11_05_100_FAIL_instance_arg_mismatch | SEM_15_11_05_100_FAIL_instance_arg_mismatch.ets | compile-fail | compile-fail | ✅ |
| SEM_15_11_05_101_FAIL_call_no_matching_overload | SEM_15_11_05_101_FAIL_call_no_matching_overload.ets | compile-fail | compile-fail | ✅ |
| SEM_15_11_05_102_FAIL_class_with_overload | SEM_15_11_05_102_FAIL_class_with_overload.ets | compile-fail | compile-fail | ✅ |
| SEM_15_11_05_103_FAIL_class_inheritance_chain | SEM_15_11_05_103_FAIL_class_inheritance_chain.ets | compile-fail | compile-fail | ✅ |

### runtime (1/1 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_11_05_200_RUNTIME_instance_overload | SEM_15_11_05_200_RUNTIME_instance_overload.ets | runtime | runtime | ✅ |

## Issues Found
无

## 测试环境
- **编译器**：ArkTS static_core (es2panda)
- **测试日期**：2026-06-23
