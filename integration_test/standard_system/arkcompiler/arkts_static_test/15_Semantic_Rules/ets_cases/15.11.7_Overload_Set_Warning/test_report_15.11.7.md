# 15.11.7 Overload Set Warning - Test Report

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
| SEM_15_11_07_001_PASS_OVERLOAD_WARNING | SEM_15_11_07_001_PASS_OVERLOAD_WARNING.ets | compile-pass | ✅ |
| SEM_15_11_07_002_PASS_distinguishable_no_warning | SEM_15_11_07_002_PASS_distinguishable_no_warning.ets | compile-pass | ✅ |
| SEM_15_11_07_003_PASS_wide_hides_narrow | SEM_15_11_07_003_PASS_wide_hides_narrow.ets | compile-pass | ✅ |
| SEM_15_11_07_004_PASS_overload_warning_unreachable | SEM_15_11_07_004_PASS_overload_warning_unreachable.ets | compile-pass | ✅ |
| SEM_15_11_07_100_FAIL_unreachable_overload | SEM_15_11_07_100_FAIL_unreachable_overload.ets | compile-fail | ✅ |
| SEM_15_11_07_200_RUNTIME_warning | SEM_15_11_07_200_RUNTIME_warning.ets | runtime | ✅ |

## Result Statistics
| Category | Count | Pass | Fail |
|---|---|---|---|
| compile-pass | 4 | 4 | 0 |
| compile-fail | 1 | 1 | 0 |
| runtime | 1 | 1 | 0 |
| **Total** | **6** | **6** | **0** |

## Detailed Results

### compile-pass (4/4 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_11_07_001_PASS_OVERLOAD_WARNING | SEM_15_11_07_001_PASS_OVERLOAD_WARNING.ets | compile-pass | compile-pass | ✅ |
| SEM_15_11_07_002_PASS_distinguishable_no_warning | SEM_15_11_07_002_PASS_distinguishable_no_warning.ets | compile-pass | compile-pass | ✅ |
| SEM_15_11_07_003_PASS_wide_hides_narrow | SEM_15_11_07_003_PASS_wide_hides_narrow.ets | compile-pass | compile-pass | ✅ |
| SEM_15_11_07_004_PASS_overload_warning_unreachable | SEM_15_11_07_004_PASS_overload_warning_unreachable.ets | compile-pass | compile-pass | ✅ |

### compile-fail (1/1 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_11_07_100_FAIL_unreachable_overload | SEM_15_11_07_100_FAIL_unreachable_overload.ets | compile-fail | compile-fail | ✅ |

### runtime (1/1 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_11_07_200_RUNTIME_warning | SEM_15_11_07_200_RUNTIME_warning.ets | runtime | runtime | ✅ |

## Issues Found
无

## 测试环境
- **编译器**：ArkTS static_core (es2panda)
- **测试日期**：2026-06-23
