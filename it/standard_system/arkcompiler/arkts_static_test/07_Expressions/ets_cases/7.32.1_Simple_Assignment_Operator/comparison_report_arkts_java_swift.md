# 7.32.1 Simple Assignment Operator — 三语言对比报告

## 1. 概览

Simple Assignment Operator 定义了 `=` 赋值运算符在三种语言中的行为对比。

| 语言 | `=` 赋值 | 字段访问赋值 | 数组索引赋值 | 记录/Dict 索引赋值 | 链式赋值 | 越界检查 |
|------|:--------:|:----------:|:-----------:|:-----------------:|:--------:|:--------:|
| ArkTS | ✅ | ✅ `e.f = v` | ✅ `a[i] = v` | ✅ `rec[k] = v` | ✅ `a=b=c` | RangeError |
| Java | ✅ | ✅ `o.f = v` | ✅ `a[i] = v` | ❌ `map.put(k,v)` | ✅ `a=b=c` | ArrayIndexOutOfBoundsException |
| Swift | ✅ | ✅ `o.f = v` | ✅ `a[i] = v` | ✅ `dict[k] = v` | ❌ `=` returns Void | fatalError（不可捕获）|

## 2. 章节对应关系

| 功能点 | ArkTS 7.32.1 | Java | Swift |
|--------|-------------|------|-------|
| 简洁变量 `lhs = rhs` | ✅ int/long/float/double/string/boolean | ✅ 8 种基本类型 | ✅ Int/Float/Double/String/Bool |
| 字段访问 `e.f = v` | ✅ obj.field = value | ✅ obj.field = value | ✅ obj.field = value |
| 数组索引 `a[i] = v` | ✅ arr[idx] = value | ✅ arr[idx] = value | ✅ arr[idx] = value |
| 记录/Dict 索引 | ✅ `rec['key'] = v`（Record 类型） | ❌ `map.put("key", v)`（语法不同） | ✅ `dict["key"] = v` |
| 隐式扩宽 | ✅ byte→int→long→float→double | ✅ byte→short→int→long→float→double | ❌ 需显式转换 |
| 链式赋值 `a=b=c` | ✅ 右结合 | ✅ 右结合 | ❌ 编译错误（= 返回 Void）|
| 越界检查 | RangeError（运行时） | ArrayIndexOutOfBoundsException | fatalError（不可捕获）|
| 只读数组保护 | ⚠️ D 类：实现未检测 | ❌ 无 readonly 数组 | ✅ let 常量 |
| 类型不匹配 | ✅ compile-time error | ✅ 编译错误 | ✅ 编译错误 |

## 3. 关键差异矩阵

| 差异点 | ArkTS | Java | Swift |
|--------|:-----:|:----:|:-----:|
| `=` 简洁赋值 | ✅ | ✅ | ✅ |
| 字段访问赋值 `e.f = v` | ✅ | ✅ | ✅ |
| 数组索引赋值 `a[i] = v` | ✅ | ✅ | ✅ |
| Record/Dict 索引赋值 | ✅ | ❌（语法不同） | ✅ |
| 隐式扩宽赋值 | ✅ | ✅ | ❌ |
| 链式赋值 `a=b=c` | ✅ | ✅ | ❌ |
| 越界异常类型 | RangeError | AIOOBE | fatalError |
| 越界可捕获性 | 可捕获（try-catch） | 可捕获 | ❌ 不可捕获 |
| 编译时类型检查 | ✅ | ✅ | ✅ |
| readonly array 保护 | ⚠️ D 类 | ❌ 无此特性 | ✅ let 常量 |

## 4. 用例对照

### 用例 1: `int a = 42`（简洁变量赋值）
| 语言 | 代码 | 结果 |
|------|------|:----:|
| ArkTS | `let a: int = 0; a = 42;` | ✅ 编译通过 + 值正确 |
| Java | `int a = 0; a = 42;` | ✅ 编译通过 + 值正确 |
| Swift | `var a: Int = 0; a = 42;` | ✅ 编译通过 + 值正确 |

### 用例 2: `obj.field = value`（字段访问赋值）
| 语言 | 代码 | 结果 |
|------|------|:----:|
| ArkTS | `let d = new Data(); d.x = 99;` | ✅ 编译通过 + 值正确 |
| Java | `Data d = new Data(); d.x = 99;` | ✅ 编译通过 + 值正确 |
| Swift | `let d = Data(); d.x = 99;` | ✅ 编译通过 + 值正确 |

### 用例 3: `arr[0] = value`（数组索引赋值）
| 语言 | 代码 | 结果 |
|------|------|:----:|
| ArkTS | `let a: int[] = [0,0,0]; a[0] = 10;` | ✅ 编译通过 + 值正确 |
| Java | `int[] a = {0,0,0}; a[0] = 10;` | ✅ 编译通过 + 值正确 |
| Swift | `var a = [0,0,0]; a[0] = 10;` | ✅ 编译通过 + 值正确 |

### 用例 4: `dict['key'] = value`（记录/Dict 索引赋值）
| 语言 | 代码 | 结果 |
|------|------|:----:|
| ArkTS | `rec['a'] = 100;` (`Record<K,int>`) | ✅ 编译通过 + 值正确 |
| Java | `map.put("a", 100);` (HashMap, 语法不同) | ✅ 方法调用 |
| Swift | `dict["a"] = 100;` (Dictionary) | ✅ 编译通过 + 值正确 |

### 用例 5: `a = b = c`（链式赋值）
| 语言 | 代码 | 结果 |
|------|------|:----:|
| ArkTS | `x = y = z = 77;` → x=77, y=77, z=77 | ✅ 右结合，值正确 |
| Java | `x = y = z = 77;` → x=77, y=77, z=77 | ✅ 右结合，值正确 |
| Swift | ❌ `x = y = z = 77` 编译错误 | ❌ `=` 返回 Void，不支持链式 |

### 用例 6: `arr[-1] = 5`（负索引越界）
| 语言 | 代码 | 结果 |
|------|------|:----:|
| ArkTS | `arr[-1] = 5`（字面量）| ⚠️ 编译时错误 ESE0247（编译器静态检测）|
| ArkTS | `arr[negOne()] = 99`（函数调用）| ✅ RangeError |
| Java | `arr[-1] = 99` | ✅ ArrayIndexOutOfBoundsException |
| Swift | `arr[-1] = 99` | ❌ fatalError（不可捕获）|

## 5. 三环境实测结果

| # | 维度 | ArkTS | Java | Swift |
|---|------|:-----:|:----:|:-----:|
| 001 | int 变量赋值 | ✅ compile-pass | ✅ runtime | ✅ runtime |
| 002 | long 变量赋值 | ✅ compile-pass | ✅ runtime | ✅ runtime |
| 003 | float 变量赋值 | ✅ compile-pass | ✅ runtime | ✅ runtime |
| 004 | double 变量赋值 | ✅ compile-pass | ✅ runtime | ✅ runtime |
| 005 | string 变量赋值 | ✅ compile-pass | ✅ runtime | ✅ runtime |
| 006 | boolean 变量赋值 | ✅ compile-pass | ✅ runtime | ✅ runtime |
| 007 | 字段访问 e.f = v (int) | ✅ compile-pass | ✅ runtime | ✅ runtime |
| 008 | 字段访问 e.f = v (string) | ✅ compile-pass | ✅ runtime | ✅ runtime |
| 009 | 字段访问 e.f = v (boolean) | ✅ compile-pass | ✅ runtime | ✅ runtime |
| 010 | 数组索引 a[i] = v（字面量索引） | ✅ compile-pass | ✅ runtime | ✅ runtime |
| 011 | 数组索引 a[i] = v（变量索引） | ✅ compile-pass | ✅ runtime | ✅ runtime |
| 012 | 记录索引 rec[key] = v | ✅ compile-pass | ❌ 语法不同 | ✅ runtime |
| 013 | 隐式扩宽赋值 | ✅ compile-pass | ✅ compile | ❌ 显式转换 |
| 014 | 规范 4 个示例 | ✅ compile-pass | ✅ compile | ✅ compile |
| 015 | 类型不匹配 | ✅ compile-fail | ✅ compile-error | ✅ compile-error |
| 016 | readonly array 保护 | ⚠️ D 类 | ❌ 无此特性 | ✅ let 常量 |
| 017 | readonly tuple 保护 | ⚠️ D 类 | ❌ 无此特性 | ✅ let 常量 |
| 018 | 运行时语义（17 断言） | ✅ runtime | ✅ runtime | ✅ runtime |
| 019 | 负索引越界 | ✅ RangeError | ✅ AIOOBE | ❌ fatalError |
| 020 | 索引 >= length 越界 | ✅ RangeError | ✅ AIOOBE | ❌ fatalError |
| 021 | 链式赋值 a=b=c | ✅ runtime | ✅ runtime | ❌ 不支持 |

## 6. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|:----:|:----:|:-----:|
| `=` 赋值运算符实现完整性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| 字段访问赋值 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 数组索引赋值 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| Record/Dict 索引赋值 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 隐式扩宽链 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐ |
| 链式赋值 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ❌ |
| readonly array/tuple 保护 | ⭐⭐（D 类未实现） | ❌ 无此特性 | ⭐⭐⭐⭐⭐ |
| 编译时类型检查 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 越界运行时保护 | ⭐⭐⭐⭐（RangeError） | ⭐⭐⭐⭐⭐（可捕获） | ⭐⭐（fatalError）|
| 运行时正确性 | ✅ 17/17 断言 | ✅ 全部通过 | ✅ 全部通过 |

## 7. 核心结论

1. **ArkTS ≈ Java**（最接近）— 两语言 `=` 赋值在变量/字段/数组/链式/扩宽行为上高度一致
2. **Swift 链式赋值不一致** — `=` 返回 Void，不支持 `a = b = c` 语法
3. **ArkTS Record 索引赋值独有** — `rec['key'] = v` 是 ArkTS 独有的 Record 类型特性，Java 用 `map.put()` 方法调用，Swift 用 `dict[key] = v`
4. **2 个 D 类异常** — readonly array 和 readonly tuple 的保护未实现（编译器允许非只读→只读赋值）
5. **ArkTS 负索引额外的编译时保护** — 对字面量负索引，ArkTS 编译器提供 ESE0247 编译时错误（超越 spec 要求的运行时 RangeError）
6. **Java 数值扩宽最完整** — `byte→short→int→long→float→double` 是三者中最完整的扩宽链

## 8. ArkTS 设计建议

1. **readonly array/tuple 保护** — 建议实现 spec 要求的只读数组/元组赋值保护，当前编译器允许 `readonly int[] = int[]`（D 类 #008）
2. **扩宽链完整性** — 当前 byte→int→long→float→double 完整，建议补充 char→int 的隐式扩宽
3. **负索引编译器保护** — 当前对字面量负索引提供 ESE0247 编译时错误，这是超越 spec 的安全特性，建议保留
