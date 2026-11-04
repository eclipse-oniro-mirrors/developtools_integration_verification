# 3.15.1 String Literal Types - 测试执行报告

## 总体统计

| 分类 | 总数 | 通过 | 失败 | 通过率 |
|------|------|------|------|--------|
| compile-pass | 7 | 7 | 0 | 100% |
| compile-fail | 3 | 3 | 0 | 100% |
| runtime（真实执行） | 3 | 3 | 0 | 100% |
| **总计** | **13** | **13** | **0** | **100%** |

> ✅ **执行时间**：2026-06-21
> ✅ **执行环境**：WSL (arkts static_core)

---

## 详细执行结果

### compile-pass (7 个)

| # | 用例 ID | 测试内容 | 结果 |
|---|---------|----------|------|
| 1 | TYP_03_15_01_001_PASS_STRING_LITERAL_DECLARE | string literal type 声明 | ✅ PASS |
| 2 | TYP_03_15_01_002_PASS_ASSIGN_TO_STRING | 赋值给 string | ✅ PASS |
| 3 | TYP_03_15_01_003_PASS_PLUS_RESULT_STRING | + 运算结果为 string | ✅ PASS |
| 4 | TYP_03_15_01_004_PASS_PLUS_WITH_STRING | 与 string 运算 | ✅ PASS |
| 5 | TYP_03_15_01_005_PASS_AS_PARAM | 作为函数参数 | ✅ PASS |
| 6 | TYP_03_15_01_006_PASS_EQUALITY | 相等比较 | ✅ PASS |
| 7 | TYP_03_15_01_007_PASS_RELATIONAL | 关系比较 | ✅ PASS |

### compile-fail (3 个)

| # | 用例 ID | 测试内容 | 结果 |
|---|---------|----------|------|
| 1 | TYP_03_15_01_008_FAIL_STRING_TO_LITERAL | string 不能赋给 literal | ✅ PASS |
| 2 | TYP_03_15_01_009_FAIL_DIFFERENT_LITERALS | 不同 literal 不能互赋 | ✅ PASS |
| 3 | TYP_03_15_01_010_FAIL_WRONG_VALUE | 字面量值不匹配 | ✅ PASS |

### runtime (3 个)

| # | 用例 ID | 验证内容 | 结果 |
|---|---------|----------|------|
| 1 | TYP_03_15_01_011_RUNTIME_PLUS_RESULT | + 运算结果验证 | ✅ PASS |
| 2 | TYP_03_15_01_012_RUNTIME_AS_PARAM | 函数参数验证 | ✅ PASS |
| 3 | TYP_03_15_01_013_RUNTIME_COMPARISON | 比较运算验证 | ✅ PASS |

---

## 后续运行命令

```bash
cd /mnt/d/git/ARKTS_STATIC_TEST/03_Types
SECTIONS="3.15.1_String_Literal_Types" bash run_types_cases_wsl.sh
```

---

**报告生成时间**：2026-06-21
**报告状态**：✅ 全部通过
