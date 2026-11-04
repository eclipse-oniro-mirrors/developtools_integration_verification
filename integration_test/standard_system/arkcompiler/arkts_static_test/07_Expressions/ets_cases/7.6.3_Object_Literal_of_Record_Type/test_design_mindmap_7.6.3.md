# 7.6.3 Object Literal of Record Type - 测试设计思维导图

## 概述

本测试套件覆盖 ArkTS 中 `Record<Key, Value>` 字面量的编译时类型检查和运行时行为。`Record<K, V>` 是一个泛型容器，映射 Key 类型到 Value 类型。Key 限制为数值类型、string、字符串字面量类型及这些类型的 union。测试涵盖基本 Record 类型使用、字面量 union Key 完整性检查、语法形式、约束检查（compile-fail）以及运行时索引访问行为。

## 三级测试点设计

### compile-pass

| # | 测试点 | 说明 |
|---|--------|------|
| 1 | 基本 Record 类型 | Record<string, number> 基本字符串键值对、Record<string, 对象类型>、Record<number, string>、Record<string, boolean>、Record<string, int>、Record<string, 数组类型> |
| 2 | 字面量 union Key | "a"\|"b" 两个变体全部提供、"x"\|"y"\|"z" 三个变体全部提供 |
| 3 | 语法形式 | 单条目、尾部逗号 |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 1 | 缺少变体 | 字面量 union Key 缺少变体 → 编译时错误 |
| 2 | Key 类型不兼容 | Key 类型不兼容 → 编译时错误 |
| 3 | Value 类型不兼容 | Value 类型不兼容 → 编译时错误 |
| 4 | Key 类型不合法 | Key 类型为 boolean → 编译时错误 |

### runtime

| # | 测试点 | 预期值 |
|---|--------|--------|
| 1 | Record<string, number> 索引取值验证 | 索引返回正确的 number 值 |
| 2 | Record<string, 对象> 嵌套访问 | 嵌套对象字段值可正确访问 |
| 3 | Record<number, string> 数值索引访问 | 数值索引返回正确的 string 值 |

## 文件命名规范

```
EXP_07_06_03_YYY_{CATEGORY}_{DESCRIPTION}.ets
```

- `YYY`：3 位数字序号（001, 002...），先 PASS、再 FAIL、最后 RUNTIME
- `CATEGORY`：PASS（编译通过）/ FAIL（编译失败）/ RUNTIME（运行时）
- `DESCRIPTION`：大写下划线分隔，简述测试内容

## 注释模板要求

每个测试用例文件头部必需包含以下 JSDoc 注释块：

```typescript
/**
 * @id EXP_07_06_03_YYY_{CATEGORY}_{DESC}
 * @expect compile-pass | compile-fail | runtime
 * @section 7.6.3
 * @design <测试点中文描述>
 * @note 正向用例：验证该特性编译通过的正确用法
 *       反向用例：验证该场景应产生编译时错误
 *       运行时用例：验证该场景的运行时行为
 */
```
