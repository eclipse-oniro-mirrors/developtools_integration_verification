# 17.2.1 Fixed-Size Array Creation - 测试设计思维导图

## 概述
Fixed-size array 是 ArkTS 内建类型 `FixedArray<T>`，其长度在创建时确定且不可变。创建方式有两种：Array Literal 和构造函数。构造函数签名为 `constructor(len: int, elem: T)`，其中 `T` 必须被类型擦除保留（Type Erasure preserved）。若 `T` 包含类型参数（如 `T | number`），则产生编译时错误。FixedArray 支持通过下标读写元素和访问 `length` 属性，越界访问在运行时抛错。FixedArray 没有方法，与 ResizableArray 不可互赋值。

## 子规则完整枚举

### 1. 构造函数创建 — int 类型元素
- **正向编译**: `new FixedArray<int>(3, 42)` 创建 3 个 int 元素，均初始化为 42
- **反向编译**: 构造函数第一个参数非 int 类型（如 float）
- **运行时**: 验证元素数量正确、元素值初始化正确

### 2. 构造函数创建 — string 类型元素
- **正向编译**: `new FixedArray<string>(3, "a")` 创建 `["a", "a", "a"]`
- **反向编译**: 构造函数参数数量错误（缺少或多余）
- **运行时**: 验证下标读取元素值与预期一致

### 3. 构造函数创建 — float/double 类型元素
- **正向编译**: `new FixedArray<number>(4, 3.14)` 创建 4 个数值元素
- **反向编译**: 类型参数未被类型擦除保留（类型参数 T 本身）
- **运行时**: 验证所有元素初始化为给定值

### 4. Array Literal 创建 — 显式类型注解
- **正向编译**: `let a: FixedArray<number> = [1, 2, 3]` 通过字面量创建
- **反向编译**: 字面量元素类型与注解不匹配
- **运行时**: 验证长度与元素内容

### 5. Array Literal 创建 — 类型推断
- **正向编译**: 将字面量传递给 `FixedArray<T>` 形参，编译器推断字面量为 FixedArray
- **运行时**: 验证可正常传递和访问

### 6. 下标读写访问
- **正向编译**: `a[1] = 7`, `let y = a[2]` 读写指定下标
- **运行时**: 验证修改生效，读取值正确

### 7. length 属性访问
- **正向编译**: `let count = a.length` 读取长度
- **运行时**: 验证新建数组 length 正确，且不可变

### 8. 类型擦除错误
- **反向编译**: `new FixedArray<T>(5, element)` 中 T 为类型参数
- **反向编译**: `FixedArray<T | number>` 联合类型含类型参数

### 9. 运行时越界
- **运行时**: `a[3]` 当数组长度仅为 3 时抛出运行时错误

## 测试点汇总

| 分类 | 测试点 | 期望结果 |
|------|--------|---------|
| compile-pass | 构造函数创建 int 元素数组 | 编译通过 |
| compile-pass | 构造函数创建 string 元素数组 | 编译通过 |
| compile-pass | 构造函数创建 float 元素数组 | 编译通过 |
| compile-pass | Array Literal 创建（显式类型注解） | 编译通过 |
| compile-pass | Array Literal 创建（类型推断） | 编译通过 |
| compile-pass | 下标读写访问 | 编译通过 |
| compile-pass | length 属性访问 | 编译通过 |
| compile-fail | 类型参数 T 做元素类型（类型擦除不保留） | 编译错误 |
| compile-fail | 联合类型含类型参数做元素类型 | 编译错误 |
| compile-fail | 构造函数参数数量错误 | 编译错误 |
| compile-fail | 构造函数长度参数非 int 类型 | 编译错误 |
| runtime | 验证构造函数创建正确元素数量 | 运行时通过 |
| runtime | 验证所有元素初始化为给定值 | 运行时通过 |
| runtime | 验证越界下标访问抛出运行时错误 | 运行时通过 |
| runtime | 验证创建后 length 属性正确 | 运行时通过 |

## 文件命名规范
- 前缀：`EXP2_`（17_Experimental_Features）
- 格式：`EXP2_17_02_01_YYY_{PASS|FAIL|RUNTIME}_{DESCRIPTION}.ets`
- 编号：PASS (001-007), FAIL (010-013), RUNTIME (020-023)
