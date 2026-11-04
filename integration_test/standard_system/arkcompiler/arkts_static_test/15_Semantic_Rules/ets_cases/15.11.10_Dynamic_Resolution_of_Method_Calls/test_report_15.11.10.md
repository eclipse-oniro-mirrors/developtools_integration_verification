# 15.11.10 Dynamic Resolution of Method Calls - Test Report

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
| SEM_15_11_10_001_PASS_polymorphic_dispatch | SEM_15_11_10_001_PASS_polymorphic_dispatch.ets | compile-pass | ✅ |
| SEM_15_11_10_002_PASS_runtime_type_selects_overload | SEM_15_11_10_002_PASS_runtime_type_selects_overload.ets | compile-pass | ✅ |
| SEM_15_11_10_100_FAIL_param_type_mismatch | SEM_15_11_10_100_FAIL_param_type_mismatch.ets | compile-fail | ✅ |
| SEM_15_11_10_101_FAIL_dynamic_arg_mismatch | SEM_15_11_10_101_FAIL_dynamic_arg_mismatch.ets | compile-fail | ✅ |
| SEM_15_11_10_200_RUNTIME_dynamic_resolution | SEM_15_11_10_200_RUNTIME_dynamic_resolution.ets | runtime | ✅ |

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
| SEM_15_11_10_001_PASS_polymorphic_dispatch | SEM_15_11_10_001_PASS_polymorphic_dispatch.ets | compile-pass | compile-pass | ✅ |
| SEM_15_11_10_002_PASS_runtime_type_selects_overload | SEM_15_11_10_002_PASS_runtime_type_selects_overload.ets | compile-pass | compile-pass | ✅ |

### compile-fail (2/2 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_11_10_100_FAIL_param_type_mismatch | SEM_15_11_10_100_FAIL_param_type_mismatch.ets | compile-fail | compile-fail | ✅ |
| SEM_15_11_10_101_FAIL_dynamic_arg_mismatch | SEM_15_11_10_101_FAIL_dynamic_arg_mismatch.ets | compile-fail | compile-fail | ✅ |

### runtime (1/1 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_11_10_200_RUNTIME_dynamic_resolution | SEM_15_11_10_200_RUNTIME_dynamic_resolution.ets | runtime | runtime | ✅ |

## Issues Found
无

## 测试环境
- **编译器**：ArkTS static_core (es2panda)
- **测试日期**：2026-06-23
