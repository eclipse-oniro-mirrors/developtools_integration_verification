# 15.11.2 Overload Set for Functions - Test Report

## Execution Overview
| Metric | Value |
|---|---|
| Total Cases | 6 |
| Passed | 6 |
| Failed | 0 |
| Pass Rate | 100% |

## Case List
| ID | Case File | Type | Result |
|---|---|---|---|
| SEM_15_11_02_001_PASS_OVERLOAD_RESOLUTION | SEM_15_11_02_001_PASS_OVERLOAD_RESOLUTION.ets | compile-pass | ✅ |
| SEM_15_11_02_002_PASS_generic_func_overload | SEM_15_11_02_002_PASS_generic_func_overload.ets | compile-pass | ✅ |
| SEM_15_11_02_100_FAIL_no_matching_overload | SEM_15_11_02_100_FAIL_no_matching_overload.ets | compile-fail | ✅ |
| SEM_15_11_02_101_FAIL_param_type_not_assignable | SEM_15_11_02_101_FAIL_param_type_not_assignable.ets | compile-fail | ✅ |
| SEM_15_11_02_102_FAIL_overload_set_functions | SEM_15_11_02_102_FAIL_overload_set_functions.ets | compile-fail | ✅ |
| SEM_15_11_02_200_RUNTIME_func_overload | SEM_15_11_02_200_RUNTIME_func_overload.ets | runtime | ✅ |

## Result Statistics
| Category | Count | Pass | Fail |
|---|---|---|---|
| compile-pass | 2 | 2 | 0 |
| compile-fail | 3 | 3 | 0 |
| runtime | 1 | 1 | 0 |
| **Total** | **6** | **6** | **0** |

## Detailed Results

### compile-pass (2/2 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_11_02_001_PASS_OVERLOAD_RESOLUTION | SEM_15_11_02_001_PASS_OVERLOAD_RESOLUTION.ets | compile-pass | compile-pass | ✅ |
| SEM_15_11_02_002_PASS_generic_func_overload | SEM_15_11_02_002_PASS_generic_func_overload.ets | compile-pass | compile-pass | ✅ |

### compile-fail (3/3 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_11_02_100_FAIL_no_matching_overload | SEM_15_11_02_100_FAIL_no_matching_overload.ets | compile-fail | compile-fail | ✅ |
| SEM_15_11_02_101_FAIL_param_type_not_assignable | SEM_15_11_02_101_FAIL_param_type_not_assignable.ets | compile-fail | compile-fail | ✅ |
| SEM_15_11_02_102_FAIL_overload_set_functions | SEM_15_11_02_102_FAIL_overload_set_functions.ets | compile-fail | compile-fail | ✅ |

### runtime (1/1 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_11_02_200_RUNTIME_func_overload | SEM_15_11_02_200_RUNTIME_func_overload.ets | runtime | runtime | ✅ |

## Issues Found
无

## 测试环境
- **编译器**：ArkTS static_core (es2panda)
- **测试日期**：2026-06-23
