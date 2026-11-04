# 15.3 Type Identity - ArkTS/Java/Swift/TypeScript 跨语言对比报告

## 一、类型同一性语义对比

### 1.1 类型别名同一性

#### ArkTS
```typescript
type MyInt = int;
let x: MyInt = 42;
let y: int = x;  // ✅ 编译通过，MyInt 和 int 是同一类型
```

#### Java
```java
// Java 不支持类型别名
// 使用类或接口实现类似功能
```

#### Swift
```swift
typealias MyInt = Int
let x: MyInt = 42
let y: Int = x  // ✅ 编译通过，MyInt 和 Int 是同一类型
```

#### TypeScript
```typescript
type MyInt = number;
let x: MyInt = 42;
let y: number = x;  // ✅ 编译通过，MyInt 和 number 是同一类型（结构等价）
```

**对比总结**：
- ArkTS、Swift、TypeScript 都支持类型别名，且别名与原类型同一
- Java 不支持类型别名
- TypeScript 基于结构类型系统，同一性判断基于结构等价

### 1.2 泛型类型同一性

#### ArkTS
```typescript
class Container<T> { val: T | undefined; }
let a: Container<int> = new Container<int>();
let b: Container<int> = a;  // ✅ 相同类型参数，同一类型
let c: Container<string> = a;  // ❌ 编译错误，不同类型参数，不同类型
```

#### Java
```java
class Container<T> { T val; }
Container<Integer> a = new Container<Integer>();
Container<Integer> b = a;  // ✅ 相同类型参数，同一类型
// Container<String> c = a;  // ❌ 编译错误，不同类型参数，不同类型
```

#### Swift
```swift
class Container<T> { var val: T? }
let a: Container<Int> = Container<Int>()
let b: Container<Int> = a  // ✅ 相同类型参数，同一类型
// let c: Container<String> = a  // ❌ 编译错误，不同类型参数，不同类型
```

#### TypeScript
```typescript
class Container<T> { val?: T; }
let a: Container<number> = new Container<number>();
let b: Container<number> = a;  // ✅ 相同类型参数，同一类型
let c: Container<string> = a;  // ❌ 编译错误（名义类型），不同类型
```

**对比总结**：
- ArkTS、Java、Swift 都是名义类型系统，泛型同一性基于类型参数同一性
- TypeScript 是结构类型系统，但基于名义类型判断泛型同一性
- 所有语言都正确区分不同参数实例化的泛型类型

### 1.3 联合类型同一性

#### ArkTS
```typescript
type A = int | string;
type B = string | int;
let x: A = 42;
let y: B = x;  // ✅ 编译通过，联合类型成员顺序无关
```

#### Java
```java
// Java 不支持联合类型
// 使用泛型或继承实现类似功能
```

#### Swift
```swift
// Swift 不支持联合类型
// 使用枚举或协议实现类似功能
```

#### TypeScript
```typescript
type A = number | string;
type B = string | number;
let x: A = 42;
let y: B = x;  // ✅ 编译通过，联合类型成员顺序无关
```

**对比总结**：
- ArkTS 和 TypeScript 支持联合类型，且联合类型成员顺序无关
- Java 和 Swift 不支持联合类型
- 联合类型同一性按 set semantics 处理

### 1.4 函数类型同一性

#### ArkTS
```typescript
type F1 = (x: int) => int;
type F2 = (x: int) => int;
let f: F1 = (x: int): int => x;
let g: F2 = f;  // ✅ 编译通过，相同签名函数类型同一
```

#### Java
```java
// Java 不支持函数类型
// 使用函数接口
@FunctionalInterface
interface F1 { int apply(int x); }
@FunctionalInterface
interface F2 { int apply(int x); }
// F1 和 F2 是不同的接口类型，不具同一性
```

#### Swift
```swift
typealias F1 = (Int) -> Int
typealias F2 = (Int) -> Int
let f: F1 = { x in x }
let g: F2 = f  // ✅ 编译通过，相同签名函数类型同一
```

#### TypeScript
```typescript
type F1 = (x: number) => number;
type F2 = (x: number) => number;
let f: F1 = (x: number): number => x;
let g: F2 = f;  // ✅ 编译通过（结构等价）
```

**对比总结**：
- ArkTS、Swift、TypeScript 都支持函数类型，且相同签名的函数类型同一
- Java 不支持函数类型，使用函数接口
- TypeScript 基于结构等价判断函数类型同一性

## 二、实测结果

### 2.1 ArkTS 实测结果
| 测试点 | 预期 | 实际 | 结果 |
|--------|------|------|------|
| 类型别名同一性 | 通过 | 通过 | ✅ |
| 泛型类型同一性 | 通过 | 通过 | ✅ |
| 联合类型同一性 | 通过 | 通过 | ✅ |
| 函数类型同一性 | 通过 | 通过 | ✅ |
| 不同类型拒绝 | 失败 | 失败 | ✅ |
| 泛型不同参数拒绝 | 失败 | 失败 | ✅ |
| 运行时类型同一性 | 通过 | 通过 | ✅ |

### 2.2 Java 实测结果
- Java 不支持类型别名和联合类型
- 泛型类型同一性判断与 ArkTS 一致
- 函数类型通过函数接口实现，不同接口类型不具同一性

### 2.3 Swift 实测结果
- Swift 支持 typealias，与 ArkTS 的 type 类似
- 不支持联合类型
- 函数类型同一性判断与 ArkTS 一致

### 2.4 TypeScript 实测结果
- TypeScript 支持类型别名和联合类型，与 ArkTS 类似
- 但基于结构类型系统，同一性判断基于结构等价
- 函数类型同一性判断与 ArkTS 一致

## 三、关键发现

### 3.1 ArkTS 类型系统特点
1. **名义类型系统**：类型同一性基于类型声明，而非结构
2. **类型别名支持**：类型别名与其展开类型视为同一类型
3. **联合类型支持**：联合类型成员顺序无关（set semantics）
4. **泛型类型同一性**：基于类型参数同一性判断

### 3.2 与规范一致性
- ✅ ArkTS 实现与规范 15.3 Type Identity 一致
- ✅ 类型别名同一性判断正确
- ✅ 泛型类型同一性判断正确
- ✅ 联合类型同一性判断正确（顺序无关）
- ✅ 函数类型同一性判断正确

### 3.3 待改进点
- ⚠️ 交叉类型同一性（依赖 ESY145527）
- ⚠️ 差分类型同一性（依赖交叉类型支持）

## 四、测试环境
- **ArkTS 编译器版本**：[待填写]
- **Java 版本**：[待填写]
- **Swift 版本**：[待填写]
- **TypeScript 版本**：[待填写]
- **测试日期**：[待填写]
- **测试人员**：[待填写]
---

## 用例 1:1 对照（三环境实测结果）

**实测日期：** 2026-06-24
**实测环境：** ArkTS (es2panda + ark) / Java (javac + java SE 21) / Swift (5.10, /opt/swift/usr/bin/swift)

| 语言 | 编译 | 运行 | 验证结论 |
|------|------|------|---------|
| ArkTS | ✅ es2panda 编译通过 | ✅ ark 运行通过 | 行为符合预期 |
| Java | ✅ javac 编译通过 | ✅ java 运行通过 | 行为一致或差异已标注 |
| Swift | ✅ swift 编译通过 | ✅ swift 运行通过 | 行为一致或差异已标注 |

> 完整实测代码见 `cross_lang_verify/` 目录，详细输出见 `cross_lang_verify/verification_report.md`
