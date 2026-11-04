# 15.9.2 Overriding in Interfaces - 测试报告

## 测试结果统计
| 类型 | 总数 | 通过 | 失败 |
|------|------|------|------|
| compile-pass | 5 | 5 | 0 |
| compile-fail | 4 | 3 | 1（GAP: effective_signature_conflict 编译器未拒绝）|
| runtime | 1 | 1 | 0 |
| **总计** | **10** | **9** | **1** |

## 问题
- SEM_15_09_02_102_FAIL_effective_signature_conflict: 编译器未拒绝（见 issue_report SEM-GAP-OVR）
