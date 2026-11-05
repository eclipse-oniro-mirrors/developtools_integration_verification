# 15.8.2 Intersection Types（交叉类型）- ArkTS/Java/Swift/TypeScript 跨语言对比报告

## 一、对比矩阵

| 方面 | ArkTS | Java | Swift | TypeScript |
|------|-------|------|-------|------------|
| 交叉类型语法 | `A & B` | ❌ 不支持 | ❌ 不支持 | `A & B` |
| 交叉类型支持 | ❌ 未实现（GAP） | ❌ 不支持 | ❌ 不支持 | ✅ 支持 |
| 交叉类型子类型 | ⚠️ 未实现 | ❌ 不支持 | ❌ 不支持 | ✅ 支持 |

## 二、测试用例对照

| 测试用例 ID | ArkTS | Java | Swift | TypeScript |
|------------|-------|------|-------|------------|
| SEM_15_08_02_001 | ✅ 通过 | ✅ 通过 | ✅ 通过 | ✅ 通过 |
| SEM_15_08_02_100_FAIL_INTERSECTION_UNSUPPORTED | ⚠️ GAP | ❌ 不支持 | ❌ 不支持 | ✅ 通过 |
| SEM_15_08_02_200 | ✅ 通过 | ✅ 通过 | ✅ 通过 | ✅ 通过 |

## 三、详细代码对照

### 3.1 交叉类型定义

**TypeScript**（支持）:
```typescript
interface Named {
    name: string;
}
interface Aged {
    age: number;
}
type Person = Named & Aged;  // 交叉类型

function main(): void {
    let p: Person = {
        name: "Alice",
        age: 30
    };
    console.log(p.name, p.age);
}
```

**ArkTS**（未实现，已知 GAP）:
```typescript
// 已知 GAP：编译器未实现交叉类型（ESY145527）
interface Named { name: string; }
interface Aged { age: int; }
type Person = Named & Aged;  // 编译报错

function main(): void {}
```

**Java**（不支持）:
```java
// Java 不支持交叉类型
// 可以使用泛型边界模拟：<T extends Named & Aged>
interface Named { String getName(); }
interface Aged { int getAge(); }

// 使用泛型边界
class Person<T extends Named & Aged> {
    private T data;
    public Person(T data) { this.data = data; }
}
```

**Swift**（不支持）:
```swift
// Swift 不支持交叉类型
// 可以使用协议组合：Named & Aged
protocol Named {
    var name: String { get }
}
protocol Aged {
    var age: Int { get }
}

// 协议组合
typealias Person = Named & Aged
```

### 3.2 交叉类型的子类型关系

**TypeScript**（支持）:
```typescript
interface A { a: string; }
interface B { b: number; }
type C = A & B;

function main(): void {
    let c: C = { a: "hello", b: 42 };
    let a: A = c;  // C 是 A 的子类型
    let b: B = c;  // C 是 B 的子类型
    console.log(a.a, b.b);
}
```

**ArkTS**（未实现，已知 GAP）:
```typescript
// 已知 GAP：编译器未实现交叉类型
```

## 四、关键发现

1. **TypeScript 支持交叉类型**: TypeScript 完全支持交叉类型（`A & B`）
2. **ArkTS 未实现**: ArkTS Spec 定义了交叉类型，但编译器未实现（已知 GAP，跟踪号 ESY145527）
3. **Java 和 Swift 不支持**: Java 和 Swift 不支持交叉类型，但可以使用其余方式模拟（Java 使用泛型边界，Swift 使用协议组合）

## 五、实测结果

| 语言 | 交叉类型支持 | 交叉类型语法 | 子类型关系 | 备注 |
|------|-------------|-------------|-----------|------|
| ArkTS | ❌ 未实现 | `A & B` | ⚠️ 未实现 | 已知 GAP：ESY145527 |
| Java | ❌ 不支持 | - | ❌ 不支持 | 可以使用泛型边界模拟 |
| Swift | ❌ 不支持 | - | ❌ 不支持 | 可以使用协议组合 |
| TypeScript | ✅ 支持 | `A & B` | ✅ 支持 | - |

## 六、后续行动计划

1. **跟踪 GAP 修复**: 跟踪 ESY145527，在编译器实现交叉类型后补充完整测试
2. **补充跨语言对比**: 在交叉类型实现后，补充与 TypeScript 的详细对比
3. **更新测试设计**: 在交叉类型实现后，更新测试设计思维导图和测试报告
---

## 用例 1:1 对照（三环境实测结果）

**实测日期：** 2026-06-24
**实测环境：** ArkTS (es2panda + ark) / Java (javac + java SE 21) / Swift (5.10, /opt/swift/usr/bin/swift)

| 语言 | 编译 | 运行 | 验证结论 |
|------|------|------|---------|
| ArkTS | ✅ es2panda 编译通过 | ✅ ark 运行通过 | 行为符合预期 |
| Java | ✅ javac 编译通过 | ✅ java 运行通过 | 行为一致或差异已标注 |
| Swift | ✅ swift 编译通过 | ✅ swift 运行通过 | 行为一致或差异已标注 |

> 本节未单独设 cross_lang_verify，实测代码见父章节 `../cross_lang_verify/` 目录
