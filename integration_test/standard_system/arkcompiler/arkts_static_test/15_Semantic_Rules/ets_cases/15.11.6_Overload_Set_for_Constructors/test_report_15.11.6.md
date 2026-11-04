# 15.11.6 Overload Set for Constructors - Test Report

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
| SEM_15_11_06_001_PASS_CTOR_RESOLUTION | SEM_15_11_06_001_PASS_CTOR_RESOLUTION.ets | compile-pass | ✅ |
| SEM_15_11_06_002_PASS_constructor_multi_params | SEM_15_11_06_002_PASS_constructor_multi_params.ets | compile-pass | ✅ |
| SEM_15_11_06_003_PASS_constructor_overload_set | SEM_15_11_06_003_PASS_constructor_overload_set.ets | compile-pass | ✅ |
| SEM_15_11_06_100_FAIL_ctor_arg_mismatch | SEM_15_11_06_100_FAIL_ctor_arg_mismatch.ets | compile-fail | ✅ |
| SEM_15_11_06_101_FAIL_call_no_matching_ctor | SEM_15_11_06_101_FAIL_call_no_matching_ctor.ets | compile-fail | ✅ |
| SEM_15_11_06_200_RUNTIME_ctor_overload | SEM_15_11_06_200_RUNTIME_ctor_overload.ets | runtime | ✅ |

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
| SEM_15_11_06_001_PASS_CTOR_RESOLUTION | SEM_15_11_06_001_PASS_CTOR_RESOLUTION.ets | compile-pass | compile-pass | ✅ |
| SEM_15_11_06_002_PASS_constructor_multi_params | SEM_15_11_06_002_PASS_constructor_multi_params.ets | compile-pass | compile-pass | ✅ |
| SEM_15_11_06_003_PASS_constructor_overload_set | SEM_15_11_06_003_PASS_constructor_overload_set.ets | compile-pass | compile-pass | ✅ |

### compile-fail (2/2 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_11_06_100_FAIL_ctor_arg_mismatch | SEM_15_11_06_100_FAIL_ctor_arg_mismatch.ets | compile-fail | compile-fail | ✅ |
| SEM_15_11_06_101_FAIL_call_no_matching_ctor | SEM_15_11_06_101_FAIL_call_no_matching_ctor.ets | compile-fail | compile-fail | ✅ |

### runtime (1/1 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_11_06_200_RUNTIME_ctor_overload | SEM_15_11_06_200_RUNTIME_ctor_overload.ets | runtime | runtime | ✅ |

## Issues Found
无

## 测试环境
- **编译器**：ArkTS static_core (es2panda)
- **测试日期**：2026-06-23
