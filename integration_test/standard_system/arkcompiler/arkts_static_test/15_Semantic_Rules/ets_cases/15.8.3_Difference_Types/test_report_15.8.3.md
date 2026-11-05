# 15.8.3 Difference Types - Test Report

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
| SEM_15_08_03_001_PASS_type_self_assign | SEM_15_08_03_001_PASS_type_self_assign.ets | compile-pass | ✅ |
| SEM_15_08_03_002_PASS_difference_smart_type | SEM_15_08_03_002_PASS_difference_smart_type.ets | compile-pass | ✅ |
| SEM_15_08_03_100_FAIL_DIFFERENCE_UNSUPPORTED | SEM_15_08_03_100_FAIL_DIFFERENCE_UNSUPPORTED.ets | compile-fail | ✅ |
| SEM_15_08_03_200_RUNTIME_difference | SEM_15_08_03_200_RUNTIME_difference.ets | runtime | ✅ |

## Result Statistics
| Category | Count | Pass | Fail |
|---|---|---|---|
| compile-pass | 2 | 2 | 0 |
| compile-fail | 1 | 1 | 0 |
| runtime | 1 | 1 | 0 |
| **Total** | **4** | **4** | **0** |

## Detailed Results

### compile-pass (2/2 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_08_03_001_PASS_type_self_assign | SEM_15_08_03_001_PASS_type_self_assign.ets | compile-pass | compile-pass | ✅ |
| SEM_15_08_03_002_PASS_difference_smart_type | SEM_15_08_03_002_PASS_difference_smart_type.ets | compile-pass | compile-pass | ✅ |

### compile-fail (1/1 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_08_03_100_FAIL_DIFFERENCE_UNSUPPORTED | SEM_15_08_03_100_FAIL_DIFFERENCE_UNSUPPORTED.ets | compile-fail | compile-fail | ✅ |

### runtime (1/1 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_08_03_200_RUNTIME_difference | SEM_15_08_03_200_RUNTIME_difference.ets | runtime | runtime | ✅ |

## Issues Found
无

## 测试环境
- **编译器**：ArkTS static_core (es2panda)
- **测试日期**：2026-06-23
