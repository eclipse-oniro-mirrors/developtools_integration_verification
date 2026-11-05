# 15.10.4 Overload Equivalent Signatures - Test Report

## Execution Overview
| Metric | Value |
|---|---|
| Total Cases | 4 |
| Passed | 4 |
| Failed | 0 |
| Pass Rate | 100% |

## Case List
| ID | Case File | Type | Result |
|---|---|---|---|
| SEM_15_10_04_001_PASS_distinguishable_overload | SEM_15_10_04_001_PASS_distinguishable_overload.ets | compile-pass | ✅ |
| SEM_15_10_04_100_FAIL_EQUIVALENT_SIG | SEM_15_10_04_100_FAIL_EQUIVALENT_SIG.ets | compile-fail | ✅ |
| SEM_15_10_04_101_FAIL_overload_equivalent_sig | SEM_15_10_04_101_FAIL_overload_equivalent_sig.ets | compile-fail | ✅ |
| SEM_15_10_04_200_RUNTIME_equivalent_sig | SEM_15_10_04_200_RUNTIME_equivalent_sig.ets | runtime | ✅ |

## Result Statistics
| Category | Count | Pass | Fail |
|---|---|---|---|
| compile-pass | 1 | 1 | 0 |
| compile-fail | 2 | 2 | 0 |
| runtime | 1 | 1 | 0 |
| **Total** | **4** | **4** | **0** |

## Detailed Results

### compile-pass (1/1 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_10_04_001_PASS_distinguishable_overload | SEM_15_10_04_001_PASS_distinguishable_overload.ets | compile-pass | compile-pass | ✅ |

### compile-fail (2/2 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_10_04_100_FAIL_EQUIVALENT_SIG | SEM_15_10_04_100_FAIL_EQUIVALENT_SIG.ets | compile-fail | compile-fail | ✅ |
| SEM_15_10_04_101_FAIL_overload_equivalent_sig | SEM_15_10_04_101_FAIL_overload_equivalent_sig.ets | compile-fail | compile-fail | ✅ |

### runtime (1/1 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_10_04_200_RUNTIME_equivalent_sig | SEM_15_10_04_200_RUNTIME_equivalent_sig.ets | runtime | runtime | ✅ |

## Issues Found
无

## 测试环境
- **编译器**：ArkTS static_core (es2panda)
- **测试日期**：2026-06-23
