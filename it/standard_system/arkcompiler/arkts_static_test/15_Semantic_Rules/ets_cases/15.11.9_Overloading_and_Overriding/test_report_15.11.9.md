# 15.11.9 Overloading and Overriding - Test Report

## Execution Overview
| Metric | Value |
|---|---|
| Total Cases | 7 |
| Passed | 7 |
| Failed | 0 |
| Pass Rate | 100% |

## Case List
| ID | Case File | Type | Result |
|---|---|---|---|
| SEM_15_11_09_001_PASS_overload_override_interact | SEM_15_11_09_001_PASS_overload_override_interact.ets | compile-pass | ✅ |
| SEM_15_11_09_002_PASS_subclass_overrides_partial | SEM_15_11_09_002_PASS_subclass_overrides_partial.ets | compile-pass | ✅ |
| SEM_15_11_09_003_PASS_overload_override_interact | SEM_15_11_09_003_PASS_overload_override_interact.ets | compile-pass | ✅ |
| SEM_15_11_09_004_PASS_single_override_both | SEM_15_11_09_004_PASS_single_override_both.ets | compile-pass | ✅ |
| SEM_15_11_09_100_FAIL_override_param_mismatch | SEM_15_11_09_100_FAIL_override_param_mismatch.ets | compile-fail | ✅ |
| SEM_15_11_09_101_FAIL_derived_call_no_match | SEM_15_11_09_101_FAIL_derived_call_no_match.ets | compile-fail | ✅ |
| SEM_15_11_09_200_RUNTIME_overload_override | SEM_15_11_09_200_RUNTIME_overload_override.ets | runtime | ✅ |

## Result Statistics
| Category | Count | Pass | Fail |
|---|---|---|---|
| compile-pass | 4 | 4 | 0 |
| compile-fail | 2 | 2 | 0 |
| runtime | 1 | 1 | 0 |
| **Total** | **7** | **7** | **0** |

## Detailed Results

### compile-pass (4/4 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_11_09_001_PASS_overload_override_interact | SEM_15_11_09_001_PASS_overload_override_interact.ets | compile-pass | compile-pass | ✅ |
| SEM_15_11_09_002_PASS_subclass_overrides_partial | SEM_15_11_09_002_PASS_subclass_overrides_partial.ets | compile-pass | compile-pass | ✅ |
| SEM_15_11_09_003_PASS_overload_override_interact | SEM_15_11_09_003_PASS_overload_override_interact.ets | compile-pass | compile-pass | ✅ |
| SEM_15_11_09_004_PASS_single_override_both | SEM_15_11_09_004_PASS_single_override_both.ets | compile-pass | compile-pass | ✅ |

### compile-fail (2/2 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_11_09_100_FAIL_override_param_mismatch | SEM_15_11_09_100_FAIL_override_param_mismatch.ets | compile-fail | compile-fail | ✅ |
| SEM_15_11_09_101_FAIL_derived_call_no_match | SEM_15_11_09_101_FAIL_derived_call_no_match.ets | compile-fail | compile-fail | ✅ |

### runtime (1/1 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_11_09_200_RUNTIME_overload_override | SEM_15_11_09_200_RUNTIME_overload_override.ets | runtime | runtime | ✅ |

## Issues Found
无

## 测试环境
- **编译器**：ArkTS static_core (es2panda)
- **测试日期**：2026-06-23
