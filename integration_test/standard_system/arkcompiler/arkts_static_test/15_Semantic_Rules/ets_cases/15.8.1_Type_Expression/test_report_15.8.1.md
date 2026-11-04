# 15.8.1 Type Expression - Test Report

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
| SEM_15_08_01_001_PASS_INSTANCEOF_SMART_CAST | SEM_15_08_01_001_PASS_INSTANCEOF_SMART_CAST.ets | compile-pass | ✅ |
| SEM_15_08_01_002_PASS_NULL_SMART_CAST | SEM_15_08_01_002_PASS_NULL_SMART_CAST.ets | compile-pass | ✅ |
| SEM_15_08_01_003_PASS_object_literal_type_expr | SEM_15_08_01_003_PASS_object_literal_type_expr.ets | compile-pass | ✅ |
| SEM_15_08_01_100_FAIL_TYPEOF_GAP | SEM_15_08_01_100_FAIL_TYPEOF_GAP.ets | compile-fail | ✅ |
| SEM_15_08_01_101_FAIL_SMART_CAST_OUTSIDE | SEM_15_08_01_101_FAIL_SMART_CAST_OUTSIDE.ets | compile-fail | ✅ |
| SEM_15_08_01_102_FAIL_object_literal_no_field | SEM_15_08_01_102_FAIL_object_literal_no_field.ets | compile-fail | ✅ |
| SEM_15_08_01_200_RUNTIME_type_expr | SEM_15_08_01_200_RUNTIME_type_expr.ets | runtime | ✅ |

## Result Statistics
| Category | Count | Pass | Fail |
|---|---|---|---|
| compile-pass | 3 | 3 | 0 |
| compile-fail | 3 | 3 | 0 |
| runtime | 1 | 1 | 0 |
| **Total** | **7** | **7** | **0** |

## Detailed Results

### compile-pass (3/3 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_08_01_001_PASS_INSTANCEOF_SMART_CAST | SEM_15_08_01_001_PASS_INSTANCEOF_SMART_CAST.ets | compile-pass | compile-pass | ✅ |
| SEM_15_08_01_002_PASS_NULL_SMART_CAST | SEM_15_08_01_002_PASS_NULL_SMART_CAST.ets | compile-pass | compile-pass | ✅ |
| SEM_15_08_01_003_PASS_object_literal_type_expr | SEM_15_08_01_003_PASS_object_literal_type_expr.ets | compile-pass | compile-pass | ✅ |

### compile-fail (3/3 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_08_01_100_FAIL_TYPEOF_GAP | SEM_15_08_01_100_FAIL_TYPEOF_GAP.ets | compile-fail | compile-fail | ✅ |
| SEM_15_08_01_101_FAIL_SMART_CAST_OUTSIDE | SEM_15_08_01_101_FAIL_SMART_CAST_OUTSIDE.ets | compile-fail | compile-fail | ✅ |
| SEM_15_08_01_102_FAIL_object_literal_no_field | SEM_15_08_01_102_FAIL_object_literal_no_field.ets | compile-fail | compile-fail | ✅ |

### runtime (1/1 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_08_01_200_RUNTIME_type_expr | SEM_15_08_01_200_RUNTIME_type_expr.ets | runtime | runtime | ✅ |

## Issues Found
无

## 测试环境
- **编译器**：ArkTS static_core (es2panda)
- **测试日期**：2026-06-23
