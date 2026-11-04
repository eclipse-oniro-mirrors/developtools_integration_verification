# 15.9 Overriding - 测试设计思维导图

## 1. 测试范围
覆写基础验证：方法覆写、类型不匹配拒绝、运行时行为

## 2. 测试用例设计
### 2.1 编号规划
| 编号前缀 | 含义 | 示例 |
|---------|------|------|
| SEM_15_09_099 | compile-fail 用例 | 覆写拒绝 |
| SEM_15_09_100 | compile-pass 用例 | 覆写基础：方法覆写 |
| SEM_15_09_101 | runtime 用例 | 覆写运行时 |

### 2.2 文件命名规范
- 格式：`SEM_15_09_XXX_{CATEGORY}_{DESCRIPTION}.ets`
- 示例：`SEM_15_09_100_PASS_OVERRIDE_BASIC.ets`

## 3. 测试点分解
### 3.1 覆写基础（compile-pass）
- 验证方法覆写基础功能

### 3.2 覆写拒绝（compile-fail）
- 验证类型不匹配时覆写被拒绝

### 3.3 覆写运行时（runtime）
- 验证覆写运行时行为

## 4. 覆盖情况
| 用例编号 | 用例文件 | 类型 | 测试点 | 预期结果 |
|---------|---------|------|--------|---------|
| SEM_15_09_099 | SEM_15_09_099.ets | compile-fail | 覆写拒绝 | ✅ compile-fail |
| SEM_15_09_100 | SEM_15_09_100.ets | compile-pass | 覆写基础 | ✅ compile-pass |
| SEM_15_09_101 | SEM_15_09_101.ets | runtime | 覆写运行时 | ✅ runtime |


## 最新设计要点

从章节思维导图同步的最新测试设计点：

- normal cases
- edge cases
- error cases

## 5. 跨章节链接
- 15.9.1 Overriding in Classes
- 15.9.2 Overriding in Interfaces
- 15.9.3 Override Compatible Signatures
- 10 Interfaces
