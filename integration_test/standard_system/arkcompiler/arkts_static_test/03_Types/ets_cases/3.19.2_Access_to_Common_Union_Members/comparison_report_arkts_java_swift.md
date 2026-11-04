# 3.19.2 Access to Common Union Members - ArkTS vs Java vs Swift 对比报告

## 概述

ArkTS 支持对 union type 的 common member 直接访问。Java/Swift 无原生 union，需要通过 interface/protocol 或 enum/switch 显式分发。

## Java/Swift 实测环境

| 语言 | 文件 | 实测结果 |
|------|------|---------|
| Java | `cross_lang_verify/3.19.2_common_union_members/JavaCommonUnionMembers.java` | ✅ pass=6 fail=0 |
| Swift | `cross_lang_verify/3.19.2_common_union_members/SwiftCommonUnionMembers.swift` | ✅ pass=6 fail=0 |

## 对比表

| 特性 | ArkTS | Java（实测） | Swift（实测） |
|------|-------|-------------|---------------|
| 原生 union common method | ✅ | ❌（interface 模拟） | ❌（protocol 模拟） |
| 原生 union common field | ✅ | ❌（必须 cast） | ❌（必须 switch） |
| 字段类型不同应拒绝 | ⚠️ Spec 要求，实测未拒绝 | N/A | N/A |
| 方法签名不同应拒绝 | ✅ | N/A | N/A |
| overload member 应拒绝 | ✅ | N/A | N/A |
| static member 应拒绝 | ✅ | N/A | N/A |
| 缺失成员应拒绝 | ✅ | N/A（接口/协议不声明则编译失败） | N/A |

## ArkTS 示例

```typescript
class A { n: number = 1; foo(): void {} }
class B { n: number = 2; foo(): void {} }
let u: A | B = new A()
let x = u.n  // OK
u.foo()     // OK
```

## Java 实测模拟

```java
interface Shape { int area(); }
class Square implements Shape { public int area() { return 16; } }
Shape s = new Square();
s.area(); // OK: interface common method
```

字段差异需要显式 cast：

```java
if (u instanceof AWrap) {
    AWrap a = (AWrap) u;
    a.value.s; // 只有 cast 后才能访问
}
```

## Swift 实测模拟

```swift
protocol Shape { func area() -> Int }
struct Square: Shape { func area() -> Int { 16 } }
let s: any Shape = Square()
s.area()
```

字段差异需要 enum + switch：

```swift
enum ABValue { case a(AField), b(BField) }
switch u {
case .a(let a): a.s
case .b(let b): b.s
}
```

## 关键问题

Spec 要求字段类型不同时报错：

```typescript
class A { s: string = "text" }
class B { s: number = 3.14 }
let u: A | B = new A()
console.log(u.s) // spec 预期错误，实测通过
```

已记录为 `D-3.19-02`。

## 结论

1. ArkTS common union member 是强表达力特性，Java/Swift 无直接对应
2. Java/Swift 通过接口/协议只能表达共同方法，字段访问必须显式分支
3. 当前 ArkTS 实现对字段类型差异检查不完整
4. 方法签名差异、overload、static、缺失成员检查正常
