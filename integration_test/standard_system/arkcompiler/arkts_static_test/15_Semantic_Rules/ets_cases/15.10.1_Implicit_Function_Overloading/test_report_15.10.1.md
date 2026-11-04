# 15.10.1 Implicit Function Overloading - Test Report

## Execution Overview
| Metric | Value |
|---|---|
| Total Cases | 10 |
| Passed | 10 |
| Failed | 0 |
| Pass Rate | 100% |

## Case List
| ID | Case File | Type | Result |
|---|---|---|---|
| SEM_15_10_01_001_PASS_FUNCTION_OVERLOAD | SEM_15_10_01_001_PASS_FUNCTION_OVERLOAD.ets | compile-pass | ✅ |
| SEM_15_10_01_002_PASS_PARAM_COUNT_OVERLOAD | SEM_15_10_01_002_PASS_PARAM_COUNT_OVERLOAD.ets | compile-pass | ✅ |
| SEM_15_10_01_003_PASS_UNION_OVERLOAD | SEM_15_10_01_003_PASS_UNION_OVERLOAD.ets | compile-pass | ✅ |
| SEM_15_10_01_004_PASS_UNAMBIGUOUS_OVERLOAD | SEM_15_10_01_004_PASS_UNAMBIGUOUS_OVERLOAD.ets | compile-pass | ✅ |
| SEM_15_10_01_005_PASS_function_overload_by_type | SEM_15_10_01_005_PASS_function_overload_by_type.ets | compile-pass | ✅ |
| SEM_15_10_01_006_PASS_generic_plain_equiv_first | SEM_15_10_01_006_PASS_generic_plain_equiv_first.ets | compile-pass | ✅ |
| SEM_15_10_01_007_PASS_plain_generic_equiv_first | SEM_15_10_01_007_PASS_plain_generic_equiv_first.ets | compile-pass | ✅ |
| SEM_15_10_01_100_FAIL_ERASURE_AMBIGUOUS | SEM_15_10_01_100_FAIL_ERASURE_AMBIGUOUS.ets | compile-fail | ✅ |
| SEM_15_10_01_101_FAIL_overload_equivalent_non_generic | SEM_15_10_01_101_FAIL_overload_equivalent_non_generic.ets | compile-fail | ✅ |
| SEM_15_10_01_200_RUNTIME_FUNCTION_OVERLOAD | SEM_15_10_01_200_RUNTIME_FUNCTION_OVERLOAD.ets | runtime | ✅ |

## Result Statistics
| Category | Count | Pass | Fail |
|---|---|---|---|
| compile-pass | 7 | 7 | 0 |
| compile-fail | 2 | 2 | 0 |
| runtime | 1 | 1 | 0 |
| **Total** | **10** | **10** | **0** |

## Detailed Results

### compile-pass (7/7 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_10_01_001_PASS_FUNCTION_OVERLOAD | SEM_15_10_01_001_PASS_FUNCTION_OVERLOAD.ets | compile-pass | compile-pass | ✅ |
| SEM_15_10_01_002_PASS_PARAM_COUNT_OVERLOAD | SEM_15_10_01_002_PASS_PARAM_COUNT_OVERLOAD.ets | compile-pass | compile-pass | ✅ |
| SEM_15_10_01_003_PASS_UNION_OVERLOAD | SEM_15_10_01_003_PASS_UNION_OVERLOAD.ets | compile-pass | compile-pass | ✅ |
| SEM_15_10_01_004_PASS_UNAMBIGUOUS_OVERLOAD | SEM_15_10_01_004_PASS_UNAMBIGUOUS_OVERLOAD.ets | compile-pass | compile-pass | ✅ |
| SEM_15_10_01_005_PASS_function_overload_by_type | SEM_15_10_01_005_PASS_function_overload_by_type.ets | compile-pass | compile-pass | ✅ |
| SEM_15_10_01_006_PASS_generic_plain_equiv_first | SEM_15_10_01_006_PASS_generic_plain_equiv_first.ets | compile-pass | compile-pass | ✅ |
| SEM_15_10_01_007_PASS_plain_generic_equiv_first | SEM_15_10_01_007_PASS_plain_generic_equiv_first.ets | compile-pass | compile-pass | ✅ |

### compile-fail (2/2 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_10_01_100_FAIL_ERASURE_AMBIGUOUS | SEM_15_10_01_100_FAIL_ERASURE_AMBIGUOUS.ets | compile-fail | compile-fail | ✅ |
| SEM_15_10_01_101_FAIL_overload_equivalent_non_generic | SEM_15_10_01_101_FAIL_overload_equivalent_non_generic.ets | compile-fail | compile-fail | ✅ |

### runtime (1/1 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_10_01_200_RUNTIME_FUNCTION_OVERLOAD | SEM_15_10_01_200_RUNTIME_FUNCTION_OVERLOAD.ets | runtime | runtime | ✅ |

## Issues Found
无

## 测试环境
- **编译器**：ArkTS static_core (es2panda)
- **测试日期**：2026-06-23
