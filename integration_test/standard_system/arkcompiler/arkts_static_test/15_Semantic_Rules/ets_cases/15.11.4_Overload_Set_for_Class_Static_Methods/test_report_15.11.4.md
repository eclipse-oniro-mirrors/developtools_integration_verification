# 15.11.4 Overload Set for Class Static Methods - Test Report

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
| SEM_15_11_04_001_PASS_static_method_overload | SEM_15_11_04_001_PASS_static_method_overload.ets | compile-pass | ✅ |
| SEM_15_11_04_002_PASS_static_method_multi_overload | SEM_15_11_04_002_PASS_static_method_multi_overload.ets | compile-pass | ✅ |
| SEM_15_11_04_100_FAIL_static_arg_mismatch | SEM_15_11_04_100_FAIL_static_arg_mismatch.ets | compile-fail | ✅ |
| SEM_15_11_04_101_FAIL_conflicting_signatures | SEM_15_11_04_101_FAIL_conflicting_signatures.ets | compile-fail | ✅ |
| SEM_15_11_04_200_RUNTIME_static_overload | SEM_15_11_04_200_RUNTIME_static_overload.ets | runtime | ✅ |

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
| SEM_15_11_04_001_PASS_static_method_overload | SEM_15_11_04_001_PASS_static_method_overload.ets | compile-pass | compile-pass | ✅ |
| SEM_15_11_04_002_PASS_static_method_multi_overload | SEM_15_11_04_002_PASS_static_method_multi_overload.ets | compile-pass | compile-pass | ✅ |

### compile-fail (2/2 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_11_04_100_FAIL_static_arg_mismatch | SEM_15_11_04_100_FAIL_static_arg_mismatch.ets | compile-fail | compile-fail | ✅ |
| SEM_15_11_04_101_FAIL_conflicting_signatures | SEM_15_11_04_101_FAIL_conflicting_signatures.ets | compile-fail | compile-fail | ✅ |

### runtime (1/1 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_11_04_200_RUNTIME_static_overload | SEM_15_11_04_200_RUNTIME_static_overload.ets | runtime | runtime | ✅ |

## Issues Found
无

## 测试环境
- **编译器**：ArkTS static_core (es2panda)
- **测试日期**：2026-06-23
