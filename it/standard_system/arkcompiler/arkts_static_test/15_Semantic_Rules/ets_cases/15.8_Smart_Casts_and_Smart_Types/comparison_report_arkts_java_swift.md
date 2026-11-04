# 15.8 Smart Casts and Smart Types - ArkTS/Java/Swift/TypeScript 跨语言对比报告

## 一、智能转换语义对比

### 1.1 instanceof 类型收窄

#### ArkTS
```typescript
class Animal { name: string = ""; }
class Dog extends Animal { breed: string = ""; }
function main(): void {
    let a: Animal = new Dog();
    if (a instanceof Dog) {
        let d: Dog = a;  // ✅ 智能转换：a 被收窄为 Dog
        console.log(d.breed);
    }
}
```

#### Java
```java
class Animal { String name = ""; }
class Dog extends Animal { String breed = ""; }
public static void main(String[] args) {
    Animal a = new Dog();
    if (a instanceof Dog) {
        Dog d = (Dog) a;  // ❌ 需要显式类型转换
        System.out.println(d.breed);
    }
}
```

#### Swift
```swift
class Animal { var name: String = "" }
class Dog: Animal { var breed: String = "" }
let a: Animal = Dog()
if let d = a as? Dog {  // ✅ 可选绑定（Optional Binding）
    print(d.breed)
}
```

#### TypeScript
```typescript
class Animal { name: string = ""; }
class Dog extends Animal { breed: string = ""; }
let a: Animal = new Dog();
if (a instanceof Dog) {
    let d: Dog = a;  // ✅ 类型守卫（Type Guard），自动类型收窄
    console.log(d.breed);
}
```

**对比总结**：
- ArkTS 和 TypeScript 支持智能转换（Smart Cast），instanceof 后自动类型收窄
- Java 不支持智能转换，需要显式类型转换
- Swift 支持可选绑定（Optional Binding）实现类似功能

### 1.2 类型守卫（Type Guard）

#### TypeScript
```typescript
function isString(x: any): x is string {
    return typeof x === "string";
}
let x: any = "hello";
if (isString(x)) {
    console.log(x.toUpperCase());  // ✅ x 被收窄为 string
}
```

#### ArkTS
```typescript
// ArkTS 不支持自定义类型守卫
// 只能使用 instanceof 和 typeof
function main(): void {
    let x: Object = "hello";
    if (typeof x === "string") {
        console.log((x as string).toUpperCase());  // ✅ typeof 类型收窄
    }
}
```

**对比总结**：
- TypeScript 支持自定义类型守卫（Type Guard）
- ArkTS 不支持自定义类型守卫，只能使用 instanceof 和 typeof

### 1.3 交叉类型（Intersection Types）

#### TypeScript
```typescript
interface A { a: string; }
interface B { b: string; }
type C = A & B;  // 交叉类型
let c: C = { a: "hello", b: "world" };  // ✅ 必须同时满足 A 和 B
```

#### ArkTS
```typescript
// ArkTS 不支持交叉类型（ESY145527）
// 需要等待编译器支持
```

**对比总结**：
- TypeScript 支持交叉类型（&）
- ArkTS 不支持交叉类型（ESY145527）

### 1.4 控制流分析（Control Flow Analysis）

#### ArkTS
```typescript
function foo(x: string | int): void {
    if (typeof x === "string") {
        console.log(x.toUpperCase());  // ✅ x 被收窄为 string
    } else {
        console.log(x + 1);  // ✅ x 被收窄为 int
    }
}
```

#### TypeScript
```typescript
function foo(x: string | number): void {
    if (typeof x === "string") {
        console.log(x.toUpperCase());  // ✅ x 被收窄为 string
    } else {
        console.log(x + 1);  // ✅ x 被收窄为 number
    }
}
```

#### Swift
```swift
func foo(x: Any) {
    if let s = x as? String {
        print(s.uppercased())  // ✅ x 被收窄为 String
    } else if let i = x as? Int {
        print(i + 1)  // ✅ x 被收窄为 Int
    }
}
```

**对比总结**：
- ArkTS、TypeScript、Swift 都支持控制流分析（Control Flow Analysis）
- 控制流分析用于智能转换，提高类型安全

## 二、实测结果

### 2.1 ArkTS 实测结果
| 测试点 | 预期 | 实际 | 结果 |
|--------|------|------|------|
| 基本智能转换 | 通过 | 通过 | ✅ |
| 智能转换拒绝 | 失败 | 失败 | ✅ |
| 运行时智能转换 | 通过 | 通过 | ✅ |

### 2.2 Java 实测结果
- instanceof 类型检查：✅ 支持
- 智能转换：❌ 不支持（需要显式转换）
- 交叉类型：❌ 不支持
- 控制流分析：❌ 有限支持

### 2.3 Swift 实测结果
- 类型收窄：✅ 支持（可选绑定）
- 智能转换：✅ 支持
- 交叉类型：❌ 不支持
- 控制流分析：✅ 支持

### 2.4 TypeScript 实测结果
- 智能转换：✅ 支持（类型守卫）
- 交叉类型：✅ 支持（&）
- 控制流分析：✅ 支持

## 三、关键发现

### 3.1 ArkTS 智能转换特点
1. **支持 instanceof 类型收窄**：instanceof 后自动类型收窄
2. **支持 typeof 类型收窄**：typeof 后自动类型收窄
3. **不支持自定义类型守卫**：只能使用 instanceof 和 typeof
4. **不支持交叉类型**：暂不支持（ESY145527）
5. **支持控制流分析**：控制流分析用于智能转换

### 3.2 与规范一致性
- ✅ ArkTS 实现与规范 15.8 一致
- ✅ 基本智能转换正确
- ✅ 智能转换拒绝正确
- ✅ 运行时智能转换正确
- ⚠️ 交叉类型支持待编译器完善（ESY145527）

### 3.3 待改进点
- ⚠️ 交叉类型支持（ESY145527）
- ⚠️ 差分类型支持（依赖交叉类型）
- ⚠️ 自定义类型守卫支持
- ⚠️ 智能转换规则文档化

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
