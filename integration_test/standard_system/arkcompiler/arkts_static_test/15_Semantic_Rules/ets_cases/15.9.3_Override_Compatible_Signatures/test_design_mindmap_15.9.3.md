# 15.9.3 Override Compatible Signatures - 测试设计思维导图

## 1. 测试范围
验证兼容签名：兼容覆写（协变+逆变）、不兼容拒绝、运行时行为

## 2. 测试用例设计
### 2.1 编号规划
| 编号前缀 | 含义 | 示例 |
|---------|------|------|
| SEM_15_09_005 | compile-pass 用例 | 兼容签名覆写 |
| SEM_15_09_006 | compile-fail 用例 | 不兼容签名覆写 |
| SEM_15_09_008 | runtime 用例 | 兼容签名覆写运行时 |

### 2.2 文件命名规范
- 格式：`SEM_15_09_XXX_{CATEGORY}_{DESCRIPTION}.ets`
- 示例：`SEM_15_09_03_001_PASS_COMPATIBLE_OVERRIDE.ets`

## 3. 测试点分解
### 3.1 兼容签名覆写（compile-pass）
- 验证覆写兼容签名：返回值协变 + 参数逆变时签名兼容

### 3.2 不兼容签名覆写（compile-fail）
- 验证覆写签名不可兼容拒绝：逆变返回值 + 协变参数

### 3.3 兼容签名覆写运行时（runtime）
- 验证兼容签名覆写运行时行为：基类引用调用派生类方法

## 4. 覆盖情况
| 用例编号 | 用例文件 | 类型 | 测试点 | 预期结果 |
|---------|---------|------|--------|---------|
| SEM_15_09_005 | SEM_15_09_03_001_PASS_COMPATIBLE_OVERRIDE.ets | compile-pass | 兼容签名覆写 | ✅ compile-pass |
| SEM_15_09_006 | SEM_15_09_03_100_FAIL_INCOMPATIBLE_OVERRIDE.ets | compile-fail | 不兼容签名覆写 | ✅ compile-fail |
| SEM_15_09_008 | SEM_15_09_03_200_RUNTIME_COMPATIBLE_OVERRIDE.ets | runtime | 兼容签名覆写运行时 | ✅ runtime |


## 最新设计要点

从章节思维导图同步的最新测试设计点：

- parameter types same
- return type covariance

## 5. 跨章节链接
- 15.9 Overriding
- 15.5 Variance
