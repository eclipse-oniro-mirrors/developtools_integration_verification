# 15.11.3 Overload Set for Interface Methods - Test Report

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
| SEM_15_11_03_001_PASS_interface_overload_set | SEM_15_11_03_001_PASS_interface_overload_set.ets | compile-pass | ✅ |
| SEM_15_11_03_002_PASS_interface_method_overloads | SEM_15_11_03_002_PASS_interface_method_overloads.ets | compile-pass | ✅ |
| SEM_15_11_03_003_PASS_interface_no_super | SEM_15_11_03_003_PASS_interface_no_super.ets | compile-pass | ✅ |
| SEM_15_11_03_004_PASS_interface_extends_order | SEM_15_11_03_004_PASS_interface_extends_order.ets | compile-pass | ✅ |
| SEM_15_11_03_005_PASS_interface_override_dedup | SEM_15_11_03_005_PASS_interface_override_dedup.ets | compile-pass | ✅ |
| SEM_15_11_03_006_PASS_interface_implicit_explicit_combine | SEM_15_11_03_006_PASS_interface_implicit_explicit_combine.ets | compile-pass | ✅ |
| SEM_15_11_03_100_FAIL_no_matching_overload | SEM_15_11_03_100_FAIL_no_matching_overload.ets | compile-fail | ✅ |
| SEM_15_11_03_101_FAIL_call_no_matching_overload | SEM_15_11_03_101_FAIL_call_no_matching_overload.ets | compile-fail | ✅ |
| SEM_15_11_03_102_FAIL_interface_with_overload | SEM_15_11_03_102_FAIL_interface_with_overload.ets | compile-fail | ✅ |
| SEM_15_11_03_200_RUNTIME_interface_overload | SEM_15_11_03_200_RUNTIME_interface_overload.ets | runtime | ✅ |

## Result Statistics
| Category | Count | Pass | Fail |
|---|---|---|---|
| compile-pass | 6 | 6 | 0 |
| compile-fail | 3 | 3 | 0 |
| runtime | 1 | 1 | 0 |
| **Total** | **10** | **10** | **0** |

## Detailed Results

### compile-pass (6/6 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_11_03_001_PASS_interface_overload_set | SEM_15_11_03_001_PASS_interface_overload_set.ets | compile-pass | compile-pass | ✅ |
| SEM_15_11_03_002_PASS_interface_method_overloads | SEM_15_11_03_002_PASS_interface_method_overloads.ets | compile-pass | compile-pass | ✅ |
| SEM_15_11_03_003_PASS_interface_no_super | SEM_15_11_03_003_PASS_interface_no_super.ets | compile-pass | compile-pass | ✅ |
| SEM_15_11_03_004_PASS_interface_extends_order | SEM_15_11_03_004_PASS_interface_extends_order.ets | compile-pass | compile-pass | ✅ |
| SEM_15_11_03_005_PASS_interface_override_dedup | SEM_15_11_03_005_PASS_interface_override_dedup.ets | compile-pass | compile-pass | ✅ |
| SEM_15_11_03_006_PASS_interface_implicit_explicit_combine | SEM_15_11_03_006_PASS_interface_implicit_explicit_combine.ets | compile-pass | compile-pass | ✅ |

### compile-fail (3/3 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_11_03_100_FAIL_no_matching_overload | SEM_15_11_03_100_FAIL_no_matching_overload.ets | compile-fail | compile-fail | ✅ |
| SEM_15_11_03_101_FAIL_call_no_matching_overload | SEM_15_11_03_101_FAIL_call_no_matching_overload.ets | compile-fail | compile-fail | ✅ |
| SEM_15_11_03_102_FAIL_interface_with_overload | SEM_15_11_03_102_FAIL_interface_with_overload.ets | compile-fail | compile-fail | ✅ |

### runtime (1/1 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_11_03_200_RUNTIME_interface_overload | SEM_15_11_03_200_RUNTIME_interface_overload.ets | runtime | runtime | ✅ |

## Issues Found
无

## 测试环境
- **编译器**：ArkTS static_core (es2panda)
- **测试日期**：2026-06-23
