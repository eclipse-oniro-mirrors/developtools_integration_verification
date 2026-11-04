# 17.3 Value Array Types - 测试设计思维导图

## 概述
ValueArray<T> 是 ArkTS 实验特性中的值数组类型。T 必须是值类型（byte/short/int/long/float/double/char/boolean）。元素以原始值（而非引用）存储在连续内存中。ValueArray<T> 不是泛型类型，尽管使用了类似的尖括号记法。可通过数组字面量或构造函数 `constructor(len: int, elem: T)` 创建。length 属性在运行时设置一次。ValueArray 类型之间不存在子类型关系，除非类型参数完全相同。

## 子规则完整枚举

### 1. ValueArray 基本类型支持
- **正向编译**: ValueArray<int> 字面量创建、ValueArray<long> 字面量创建、ValueArray<float> 字面量创建、ValueArray<double> 字面量创建、ValueArray<char> 字面量创建、ValueArray<boolean> 字面量创建、ValueArray<byte> 字面量创建、ValueArray<short> 字面量创建
- **反向编译**: ValueArray<string>（string 不是值类型）、ValueArray<int|undefined>（联合类型不是值类型）、ValueArray<Object>（Object 不是值类型）、ValueArray 使用类型参数 T（非具体值类型）
- **运行时**: 验证元素值是否正确、验证 length 属性、验证元素可变性、验证越界访问行为

### 2. ValueArray 构造函数创建
- **正向编译**: `new ValueArray<int>(5, 0)` 创建指定长度的数组、`new ValueArray<double>(3, 7.)` 使用双精度元素初始化
- **反向编译**: 构造函数参数类型不匹配
- **运行时**: 验证构造函数创建的数组长度和元素值

### 3. ValueArray 类型系统约束
- **正向编译**: 无子类型关系（同类型参数间赋值）
- **反向编译**: ValueArray<int> 赋值给 ValueArray<long>（不同类型参数不可相互赋值）、在不同 ValueArray 类型间建立子类型关系
- **运行时**: 类型确认

### 4. ValueArray 元素操作
- **正向编译**: 通过索引读写元素、length 属性访问
- **反向编译**: 使用非 int 类型索引（类型不安全）、给 length 重新赋值（只读属性）
- **运行时**: 元素修改后值正确持久化、越界索引访问行为

## 测试点汇总

| 分类 | 测试点 | 期望结果 |
|------|--------|---------|
| compile-pass | ValueArray<int> 字面量创建 | 编译通过 |
| compile-pass | ValueArray<long> 字面量创建 | 编译通过 |
| compile-pass | ValueArray<float> 字面量创建 | 编译通过 |
| compile-pass | ValueArray<double> 字面量创建 | 编译通过 |
| compile-pass | ValueArray<char> 字面量创建 | 编译通过 |
| compile-pass | ValueArray<boolean> 字面量创建 | 编译通过 |
| compile-pass | ValueArray<byte> 字面量创建 | 编译通过 |
| compile-pass | ValueArray<short> 字面量创建 | 编译通过 |
| compile-pass | new ValueArray<int>(5, 0) 构造函数创建 | 编译通过 |
| compile-pass | new ValueArray<double>(3, 7.) 构造函数创建 | 编译通过 |
| compile-fail | ValueArray<string>（string 不是值类型） | 编译错误 |
| compile-fail | ValueArray<int\|undefined>（联合类型不是值类型） | 编译错误 |
| compile-fail | ValueArray<Object>（Object 不是值类型） | 编译错误 |
| compile-fail | ValueArray<T>（泛型类型参数，非具体值类型） | 编译错误 |
| compile-fail | ValueArray<int> 赋值给 ValueArray<long>（不同 ValueArray 类型无子类型关系） | 编译错误 |
| runtime | 验证字面量创建后元素值正确 | 运行时通过 |
| runtime | 验证构造函数创建后 length 和元素值正确 | 运行时通过 |
| runtime | 验证索引写入元素后值正确持久化 | 运行时通过 |
| runtime | 验证越界索引访问行为 | 运行时通过 |

## 文件命名规范
- 前缀：`EXP2_`（17_Experimental_Features）
- 格式：`EXP2_17_03_YYY_{PASS|FAIL|RUNTIME}_{DESCRIPTION}.ets`
- 编号：PASS (001-010), FAIL (011-015), RUNTIME (020-024)
