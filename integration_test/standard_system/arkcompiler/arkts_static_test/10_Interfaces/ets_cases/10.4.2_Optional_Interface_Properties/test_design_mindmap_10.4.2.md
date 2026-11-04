# 10.4.2 Optional Interface Properties - 测试设计思维导图

## 概述
可选接口属性（Optional Interface Properties）允许实现类选择性地提供属性声明。

## 测试点覆盖

### 1. Optional Property Declaration（正向）
- 接口声明可选属性（带 ? 标记）
- 用例: ITF_10_04_02_001

### 2. Optional Property Access（正向）
- 访问可选属性时类型收窄为含 undefined 的联合类型
- 用例: ITF_10_04_02_002

### 3. Optional Property with Default（正向）
- 可选属性在实现类中提供默认值
- 用例: ITF_10_04_02_003

### 4. Missing Optional Property（反向）
- 可选属性在非可选上下文中使用导致编译拒绝
- 用例: ITF_10_04_02_100

### 5. Runtime Optional Access（运行时）
- 可选属性运行时访问行为验证
- 用例: ITF_10_04_02_200

### 6. Runtime Optional Undefined（运行时）
- 未提供的可选属性运行时为 undefined
- 用例: ITF_10_04_02_201

## 文件命名规范
- ITF_10_04_02_YYY_{CATEGORY}_{DESCRIPTION}.ets
