# 15.8.5 Control flow Graph - Test Report

## Execution Overview
| Metric | Value |
|---|---|
| Total Cases | 3 |
| Passed | 3 |
| Failed | 0 |
| Pass Rate | 100% |

## Case List
| ID | Case File | Type | Result |
|---|---|---|---|
| SEM_15_08_05_001_PASS_if_else_branch | SEM_15_08_05_001_PASS_if_else_branch.ets | compile-pass | ✅ |
| SEM_15_08_05_100_FAIL_type_mismatch | SEM_15_08_05_100_FAIL_type_mismatch.ets | compile-fail | ✅ |
| SEM_15_08_05_200_RUNTIME_control_flow | SEM_15_08_05_200_RUNTIME_control_flow.ets | runtime | ✅ |

## Result Statistics
| Category | Count | Pass | Fail |
|---|---|---|---|
| compile-pass | 1 | 1 | 0 |
| compile-fail | 1 | 1 | 0 |
| runtime | 1 | 1 | 0 |
| **Total** | **3** | **3** | **0** |

## Detailed Results

### compile-pass (1/1 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_08_05_001_PASS_if_else_branch | SEM_15_08_05_001_PASS_if_else_branch.ets | compile-pass | compile-pass | ✅ |

### compile-fail (1/1 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_08_05_100_FAIL_type_mismatch | SEM_15_08_05_100_FAIL_type_mismatch.ets | compile-fail | compile-fail | ✅ |

### runtime (1/1 passed)
| ID | Case File | Expected | Actual | Status |
|---|---|---|---|---|
| SEM_15_08_05_200_RUNTIME_control_flow | SEM_15_08_05_200_RUNTIME_control_flow.ets | runtime | runtime | ✅ |

## Issues Found
无

## 测试环境
- **编译器**：ArkTS static_core (es2panda)
- **测试日期**：2026-06-23
