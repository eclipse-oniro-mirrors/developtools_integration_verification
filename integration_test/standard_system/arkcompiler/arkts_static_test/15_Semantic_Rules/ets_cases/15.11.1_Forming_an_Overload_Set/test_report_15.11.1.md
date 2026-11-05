# 15.11.1 Forming an Overload Set - Test Report

## Execution Overview
| Metric | Value |
|---|---|
| Total Cases | 5 |
| Passed | 5 |
| Failed | 0 |
| Pass Rate | 100% |

## Case List
| ID | Case File | Type | Result |
|---|---|---|---|
| SEM_15_11_01_001_PASS_same_name_overload | SEM_15_11_01_001_PASS_same_name_overload.ets | compile-pass | ✅ |
| SEM_15_11_01_002_PASS_union_param_overload | SEM_15_11_01_002_PASS_union_param_overload.ets | compile-pass | ✅ |
| SEM_15_11_01_100_FAIL_type_mismatch | SEM_15_11_01_100_FAIL_type_mismatch.ets | compile-fail | ✅ |
| SEM_15_11_01_101_FAIL_return_type_only_diff | SEM_15_11_01_101_FAIL_return_type_only_diff.ets | compile-fail | ✅ |
| SEM_15_11_01_200_RUNTIME_overload_set | SEM_15_11_01_200_RUNTIME_overload_set.ets | runtime | ✅ |

## Result Statistics
| Category | Count | Pass | Fail |
|---|---|---|---|
| compile-pass | 2 | 2 | 0 |
| compile-fail | 2 | 2 | 0 |
| runtime | 1 | 1 | 0 |
| **Total** | **5** | **5** | **0** |

## Detailed Results

### compile-pass (2/2 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_11_01_001_PASS_same_name_overload | SEM_15_11_01_001_PASS_same_name_overload.ets | compile-pass | compile-pass | ✅ |
| SEM_15_11_01_002_PASS_union_param_overload | SEM_15_11_01_002_PASS_union_param_overload.ets | compile-pass | compile-pass | ✅ |

### compile-fail (2/2 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_11_01_100_FAIL_type_mismatch | SEM_15_11_01_100_FAIL_type_mismatch.ets | compile-fail | compile-fail | ✅ |
| SEM_15_11_01_101_FAIL_return_type_only_diff | SEM_15_11_01_101_FAIL_return_type_only_diff.ets | compile-fail | compile-fail | ✅ |

### runtime (1/1 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_11_01_200_RUNTIME_overload_set | SEM_15_11_01_200_RUNTIME_overload_set.ets | runtime | runtime | ✅ |

## Issues Found
无

## 测试环境
- **编译器**：ArkTS static_core (es2panda)
- **测试日期**：2026-06-23
