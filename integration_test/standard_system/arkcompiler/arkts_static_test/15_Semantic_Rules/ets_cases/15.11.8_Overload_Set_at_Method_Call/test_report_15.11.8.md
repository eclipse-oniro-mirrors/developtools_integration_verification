# 15.11.8 Overload Set at Method Call - Test Report

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
| SEM_15_11_08_001_PASS_arg_based_resolution | SEM_15_11_08_001_PASS_arg_based_resolution.ets | compile-pass | ✅ |
| SEM_15_11_08_002_PASS_subtype_param_selects_overload | SEM_15_11_08_002_PASS_subtype_param_selects_overload.ets | compile-pass | ✅ |
| SEM_15_11_08_003_PASS_function_with_receiver | SEM_15_11_08_003_PASS_function_with_receiver.ets | compile-pass | ✅ |
| SEM_15_11_08_100_FAIL_no_matching_overload | SEM_15_11_08_100_FAIL_no_matching_overload.ets | compile-fail | ✅ |
| SEM_15_11_08_101_FAIL_no_matching_overload | SEM_15_11_08_101_FAIL_no_matching_overload.ets | compile-fail | ✅ |
| SEM_15_11_08_200_RUNTIME_call_overload | SEM_15_11_08_200_RUNTIME_call_overload.ets | runtime | ✅ |

## Result Statistics
| Category | Count | Pass | Fail |
|---|---|---|---|
| compile-pass | 3 | 3 | 0 |
| compile-fail | 2 | 2 | 0 |
| runtime | 1 | 1 | 0 |
| **Total** | **6** | **6** | **0** |

## Detailed Results

### compile-pass (3/3 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_11_08_001_PASS_arg_based_resolution | SEM_15_11_08_001_PASS_arg_based_resolution.ets | compile-pass | compile-pass | ✅ |
| SEM_15_11_08_002_PASS_subtype_param_selects_overload | SEM_15_11_08_002_PASS_subtype_param_selects_overload.ets | compile-pass | compile-pass | ✅ |
| SEM_15_11_08_003_PASS_function_with_receiver | SEM_15_11_08_003_PASS_function_with_receiver.ets | compile-pass | compile-pass | ✅ |

### compile-fail (2/2 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_11_08_100_FAIL_no_matching_overload | SEM_15_11_08_100_FAIL_no_matching_overload.ets | compile-fail | compile-fail | ✅ |
| SEM_15_11_08_101_FAIL_no_matching_overload | SEM_15_11_08_101_FAIL_no_matching_overload.ets | compile-fail | compile-fail | ✅ |

### runtime (1/1 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_11_08_200_RUNTIME_call_overload | SEM_15_11_08_200_RUNTIME_call_overload.ets | runtime | runtime | ✅ |

## Issues Found
无

## 测试环境
- **编译器**：ArkTS static_core (es2panda)
- **测试日期**：2026-06-23
