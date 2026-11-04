# 15.8.1 Type Expression（类型表达式）- ArkTS/Java/Swift/TypeScript 跨语言对比报告

## 一、对比矩阵

| 方面 | ArkTS | Java | Swift | TypeScript |
|------|-------|------|-------|------------|
| instanceof 收窄 | ✅ 支持（自动） | ✅ 支持（显式转换） | ✅ 支持（显式转换） | ✅ 支持（自动） |
| typeof 收窄 | ❌ 未实现（GAP） | ❌ 不支持 | ❌ 不支持 | ✅ 支持 |
| null/undefined 收窄 | ✅ 支持 | ❌ 不支持 | ✅ 支持（可选绑定） | ✅ 支持 |
| 智能转换作用域 | ✅ 限制 | ✅ 限制 | ✅ 限制 | ✅ 限制 |

## 二、测试用例对照

| 测试用例 ID | ArkTS | Java | Swift | TypeScript |
|------------|-------|------|-------|------------|
| SEM_15_08_01_001_PASS_INSTANCEOF_SMART_CAST | ✅ 通过 | ✅ 通过 | ✅ 通过 | ✅ 通过 |
| SEM_15_08_01_002_PASS_NULL_SMART_CAST | ✅ 通过 | ❌ 不支持 | ✅ 通过 | ✅ 通过 |
| SEM_15_08_01_100_FAIL_TYPEOF_GAP | ⚠️ GAP | ❌ 不支持 | ❌ 不支持 | ✅ 通过 |
| SEM_15_08_01_101_FAIL_SMART_CAST_OUTSIDE | ✅ 通过 | ✅ 通过 | ✅ 通过 | ✅ 通过 |
| SEM_15_08_01_200 | ✅ 通过 | ✅ 通过 | ✅ 通过 | ✅ 通过 |

## 三、详细代码对照

### 3.1 instanceof 类型收窄

**ArkTS**:
```typescript
class Animal {}
class Dog extends Animal {}

function main(): void {
    let a: Animal = new Dog();
    if (a instanceof Dog) {
        let d: Dog = a;  // 自动收窄为 Dog
        console.log(d);
    }
}
```

**Java**:
```java
class Animal {}
class Dog extends Animal {}

public class SmartCast {
    public static void main(String[] args) {
        Animal a = new Dog();
        if (a instanceof Dog) {
            Dog d = (Dog) a;  // 需要显式转换
            System.out.println(d);
        }
    }
}
```

**Swift**:
```swift
class Animal {}
class Dog: Animal {}

func main() {
    let a: Animal = Dog()
    if a is Dog {
        let d = a as! Dog  // 需要显式转换
        print(d)
    }
}
```

**TypeScript**:
```typescript
class Animal {}
class Dog extends Animal {}

function main(): void {
    let a: Animal = new Dog();
    if (a instanceof Dog) {
        let d: Dog = a;  // 自动收窄为 Dog
        console.log(d);
    }
}
```

### 3.2 typeof 类型收窄

**ArkTS**:
```typescript
// 已知 GAP：编译器未实现 typeof 收窄
function main(): void {
    let x: number|boolean = 42;
    if (typeof x === "boolean") {
        let b: boolean = x;  // 预期：x 收窄为 boolean
    }
}
```

**TypeScript**:
```typescript
function main(): void {
    let x: number|boolean = 42;
    if (typeof x === "boolean") {
        let b: boolean = x;  // x 收窄为 boolean
        console.log(b);
    }
}
```

### 3.3 null/undefined 类型收窄

**ArkTS**:
```typescript
function main(): void {
    let x: string|undefined = "hello";
    if (x != undefined) {
        let s: string = x;  // 收窄为 string
        console.log(s);
    }
}
```

**Java**:
```java
// Java 不支持 null 收窄
public class NullCast {
    public static void main(String[] args) {
        String x = "hello";
        if (x != null) {
            System.out.println(x);  // 需要显式检查
        }
    }
}
```

**Swift**:
```swift
func main() {
    let x: String? = "hello"
    if let s = x {  // 可选绑定
        print(s)
    }
}
```

**TypeScript**:
```typescript
function main(): void {
    let x: string|undefined = "hello";
    if (x != undefined) {
        let s: string = x;  // 收窄为 string
        console.log(s);
    }
}
```

## 四、关键发现

1. **ArkTS 与 TypeScript 类似**: 都支持自动类型收窄，不需要显式转换
2. **ArkTS 与 Java/Swift 差异**: Java 和 Swift 需要显式类型转换
3. **typeof 收窄 GAP**: ArkTS 未实现 `typeof` 收窄（已知 GAP，跟踪号 ESY145527），TypeScript 支持
4. **null 收窄**: ArkTS 和 TypeScript 支持 null/undefined 收窄，Java 不支持，Swift 使用可选绑定

## 五、实测结果

| 语言 | instanceof 收窄 | typeof 收窄 | null 收窄 | 智能转换作用域 | 备注 |
|------|---------------|-----------|----------|---------------|------|
| ArkTS | ✅ 支持 | ❌ 未实现 | ✅ 支持 | ✅ 限制 | 已知 GAP：typeof 收窄 |
| Java | ✅ 支持（显式） | ❌ 不支持 | ❌ 不支持 | ✅ 限制 | - |
| Swift | ✅ 支持（显式） | ❌ 不支持 | ✅ 支持（可选绑定） | ✅ 限制 | - |
| TypeScript | ✅ 支持 | ✅ 支持 | ✅ 支持 | ✅ 限制 | - |
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
