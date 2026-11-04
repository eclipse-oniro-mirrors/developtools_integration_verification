# 15.9.2 Overriding in Interfaces - 测试设计思维导图

## 1. 测试范围
验证接口覆写：接口实现、缺少实现拒绝、运行时多态

## 2. 测试用例设计
### 2.1 编号规划
| 编号前缀 | 含义 | 示例 |
|---------|------|------|
| SEM_15_09_003 | compile-pass 用例 | 接口方法实现 |
| SEM_15_09_004 | compile-fail 用例 | 缺少接口方法实现 |
| SEM_15_09_009 | runtime 用例 | 接口覆写运行时 |

### 2.2 文件命名规范
- 格式：`SEM_15_09_XXX_{CATEGORY}_{DESCRIPTION}.ets`
- 示例：`SEM_15_09_02_001_PASS_INTERFACE_IMPL.ets`

## 3. 测试点分解
### 3.1 接口方法实现（compile-pass）
- 验证类实现接口中的所有方法

### 3.2 缺少接口方法实现（compile-fail）
- 验证接口方法未实现拒绝：缺少接口方法实现应报错

### 3.3 接口覆写运行时（runtime）
- 验证接口方法覆写运行时行为：多态派发正确

## 4. 覆盖情况
| 用例编号 | 用例文件 | 类型 | 测试点 | 预期结果 |
|---------|---------|------|--------|---------|
| SEM_15_09_003 | SEM_15_09_02_001_PASS_INTERFACE_IMPL.ets | compile-pass | 接口方法实现 | ✅ compile-pass |
| SEM_15_09_004 | SEM_15_09_02_100_FAIL_MISSING_IMPL.ets | compile-fail | 缺少接口方法实现 | ✅ compile-fail |
| SEM_15_09_009 | SEM_15_09_02_200_RUNTIME_INTERFACE_OVERRIDE.ets | runtime | 接口覆写运行时 | ✅ runtime |


## 最新设计要点

从章节思维导图同步的最新测试设计点：

- default method override
- abstract method implementation

## 5. 跨章节链接
- 15.9 Overriding
- 10 Interfaces
