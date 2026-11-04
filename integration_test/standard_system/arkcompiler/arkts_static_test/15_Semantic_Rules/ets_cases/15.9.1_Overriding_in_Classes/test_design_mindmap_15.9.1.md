# 15.9.1 Overriding in Classes - 测试设计思维导图

## 1. 测试范围
验证类覆写：override 关键字、签名不匹配拒绝、运行时多态派发

## 2. 测试用例设计
### 2.1 编号规划
| 编号前缀 | 含义 | 示例 |
|---------|------|------|
| SEM_15_09_001 | compile-pass 用例 | 类方法覆写 |
| SEM_15_09_002 | compile-fail 用例 | 覆写签名不匹配 |
| SEM_15_09_007 | runtime 用例 | 类方法覆写运行时 |

### 2.2 文件命名规范
- 格式：`SEM_15_09_XXX_{CATEGORY}_{DESCRIPTION}.ets`
- 示例：`SEM_15_09_01_001_PASS_CLASS_OVERRIDE.ets`

## 3. 测试点分解
### 3.1 类方法覆写（compile-pass）
- 验证类方法覆写：子类 override 父类方法

### 3.2 覆写签名不匹配（compile-fail）
- 验证覆写返回类型不匹配拒绝

### 3.3 类方法覆写运行时（runtime）
- 验证类方法覆写运行时行为：多态派发正确

## 4. 覆盖情况
| 用例编号 | 用例文件 | 类型 | 测试点 | 预期结果 |
|---------|---------|------|--------|---------|
| SEM_15_09_001 | SEM_15_09_01_001_PASS_CLASS_OVERRIDE.ets | compile-pass | 类方法覆写 | ✅ compile-pass |
| SEM_15_09_002 | SEM_15_09_01_100_FAIL_OVERRIDE_SIGNATURE.ets | compile-fail | 覆写签名不匹配 | ✅ compile-fail |
| SEM_15_09_007 | SEM_15_09_01_200_RUNTIME_OVERRIDE.ets | runtime | 类方法覆写运行时 | ✅ runtime |


## 最新设计要点

从章节思维导图同步的最新测试设计点：

- override keyword required
- return type covariance
- access modifier cannot be more strict
- static methods cannot be overridden

## 5. 跨章节链接
- 15.9 Overriding
- 15.5 Variance
