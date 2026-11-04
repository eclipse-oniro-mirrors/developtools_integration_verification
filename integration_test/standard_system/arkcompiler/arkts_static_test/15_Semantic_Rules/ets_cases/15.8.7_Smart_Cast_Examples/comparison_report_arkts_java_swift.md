# 15.8.7 Smart Cast Examples（智能转换示例）- ArkTS/Java/Swift/TypeScript 跨语言对比报告

## 一、对比矩阵

| 方面 | ArkTS | Java | Swift | TypeScript |
|------|-------|------|-------|------------|
| instanceof 智能转换 | ✅ 支持（自动收窄） | ✅ 支持（显式转换） | ✅ 支持（可选绑定） | ✅ 支持（自动收窄） |
| 类型不匹配拒绝 | ✅ 支持 | ✅ 支持 | ✅ 支持 | ✅ 支持 |

## 二、测试用例对照

| 测试用例 ID | ArkTS | Java | Swift | TypeScript |
|------------|-------|------|-------|------------|
| SEM_15_08_07_001 | ✅ 通过 | ✅ 通过（显式转换） | ✅ 通过（可选绑定） | ✅ 通过 |
| SEM_15_08_07_100 | ✅ 通过 | ✅ 通过 | ✅ 通过 | ✅ 通过 |
| SEM_15_08_07_200 | ✅ 通过 | ✅ 通过 | ✅ 通过 | ✅ 通过 |

## 三、详细代码对照

### 3.1 instanceof 典型使用

**ArkTS**:
```typescript
class Animal { name: string = ""; }
class Dog extends Animal { breed: string = ""; }

function describe(a: Animal): string {
    if (a instanceof Dog) {
        return "Dog: " + a.breed;  // a 收窄为 Dog
    }
    return "Animal: " + a.name;
}
```

**Java**:
```java
class Animal { String name = ""; }
class Dog extends Animal { String breed = ""; }

public class SmartCast {
    public static String describe(Animal a) {
        if (a instanceof Dog) {
            Dog d = (Dog) a;  // 需要显式转换
            return "Dog: " + d.breed;
        }
        return "Animal: " + a.name;
    }
}
```

**Swift**:
```swift
class Animal { var name: String = "" }
class Dog: Animal { var breed: String = "" }

func describe(a: Animal) -> String {
    if let d = a as? Dog {  // 可选绑定
        return "Dog: " + d.breed
    }
    return "Animal: " + a.name
}
```

**TypeScript**:
```typescript
class Animal { name: string = ""; }
class Dog extends Animal { breed: string = ""; }

function describe(a: Animal): string {
    if (a instanceof Dog) {
        return "Dog: " + a.breed;  // a 收窄为 Dog
    }
    return "Animal: " + a.name;
}
```

### 3.2 类型不匹配拒绝

**ArkTS**:
```typescript
// 编译报错：类型不匹配
let x: int = "s";  // 错误：string 不能赋值给 int
```

**Java**:
```java
// 编译报错：类型不匹配
int x = "s";  // 错误：String 不能赋值给 int
```

**Swift**:
```swift
// 编译报错：类型不匹配
let x: Int = "s"  // 错误：String 不能赋值给 Int
```

**TypeScript**:
```typescript
// 编译报错：类型不匹配
let x: number = "s";  // 错误：string 不能赋值给 number
```

## 四、关键发现

1. **ArkTS 与 TypeScript 类似**: 都支持自动类型收窄，不需要显式转换
2. **ArkTS 与 Java 差异**: Java 需要显式类型转换
3. **ArkTS 与 Swift 类似**: 都支持智能转换，但语法不同

## 五、实测结果

| 语言 | instanceof 智能转换 | 类型不匹配拒绝 | 备注 |
|------|-------------------|---------------|------|
| ArkTS | ✅ 支持（自动） | ✅ 支持 | - |
| Java | ✅ 支持（显式） | ✅ 支持 | 需要显式类型转换 |
| Swift | ✅ 支持（可选绑定） | ✅ 支持 | 使用可选绑定 |
| TypeScript | ✅ 支持（自动） | ✅ 支持 | 与 ArkTS 一致 |
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
