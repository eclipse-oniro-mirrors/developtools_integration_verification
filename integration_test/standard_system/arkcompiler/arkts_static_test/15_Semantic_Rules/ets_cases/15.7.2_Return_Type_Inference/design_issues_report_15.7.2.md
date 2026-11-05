# 15.7.2 Return Type Inference（返回类型推断）- 设计问题报告

## 一、编译器实现待完善

无

## 二、差异点

### 2.1 ArkTS 与 Java 对比

| 方面 | ArkTS | Java | 差异说明 |
|------|-------|------|---------|
| 返回类型匹配 | ✅ 检查 | ✅ 检查 | 一致 |
| 返回值协变 | ✅ 支持 | ✅ 支持 | 一致 |
| 缺少 return | ❌ 编译报错 | ⚠️ 隐式返回 null | **差异**：Java 允许非 void 方法缺少 return（隐式返回 null），ArkTS 编译报错 |

**结论**: ArkTS 对缺少 return 语句的检查比 Java 更严格。

### 2.2 ArkTS 与 Swift 对比

| 方面 | ArkTS | Swift | 差异说明 |
|------|-------|-------|---------|
| 返回类型匹配 | ✅ 检查 | ✅ 检查 | 一致 |
| 返回值协变 | ✅ 支持 | ✅ 支持 | 一致 |
| 缺少 return | ❌ 编译报错 | ❌ 编译报错 | 一致 |

**结论**: ArkTS 与 Swift 对返回类型检查行为一致。

### 2.3 ArkTS 与 TypeScript 对比

| 方面 | ArkTS | TypeScript | 差异说明 |
|------|-------|------------|---------|
| 返回类型匹配 | ✅ 检查 | ✅ 检查 | 一致 |
| 返回值协变 | ✅ 支持（名义类型） | ✅ 支持（结构类型） | 类似，但类型系统不同 |
| 缺少 return | ❌ 编译报错 | ❌ 编译报错 | 一致 |

**结论**: ArkTS 与 TypeScript 对返回类型检查行为一致，但类型系统不同（ArkTS 是名义类型，TypeScript 是结构类型）。

## 三、Spec 措辞待澄清

无

## 四、测试设计建议

1. **补充泛型返回类型测试**: 建议补充泛型函数的返回类型推断测试
2. **补充复杂协变测试**: 建议补充更复杂的返回值协变测试（如多层继承）
3. **补充异步函数返回类型测试**: 建议补充 async 函数的返回类型推断测试

## 五、跨语言代码对照

### 5.1 返回类型匹配

**ArkTS**:
```typescript
function add(a: int, b: int): int {
    return a + b;
}
```

**Java**:
```java
public int add(int a, int b) {
    return a + b;
}
```

**Swift**:
```swift
func add(a: Int, b: Int) -> Int {
    return a + b
}
```

**TypeScript**:
```typescript
function add(a: number, b: number): number {
    return a + b;
}
```

### 5.2 返回值协变

**ArkTS**:
```typescript
class Animal {}
class Dog extends Animal {}

class Base {
    getAnimal(): Animal { return new Animal(); }
}
class Derived extends Base {
    getAnimal(): Dog { return new Dog(); }  // 返回值协变
}
```

**Java**:
```java
class Animal {}
class Dog extends Animal {}

class Base {
    Animal getAnimal() { return new Animal(); }
}
class Derived extends Base {
    @Override
    Dog getAnimal() { return new Dog(); }  // 返回值协变
}
```

**Swift**:
```swift
class Animal {}
class Dog: Animal {}

class Base {
    func getAnimal() -> Animal { return Animal() }
}
class Derived: Base {
    override func getAnimal() -> Dog { return Dog() }  // 返回值协变
}
```

**TypeScript**:
```typescript
class Animal {}
class Dog extends Animal {}

class Base {
    getAnimal(): Animal { return new Animal(); }
}
class Derived extends Base {
    getAnimal(): Dog { return new Dog(); }  // 返回值协变
}
```

### 5.3 缺少 return 语句

**ArkTS**:
```typescript
// 编译报错：缺少 return 语句
function getValue(): int {
    // 缺少 return
}
```

**Java**:
```java
// 编译通过，但运行时返回 null
int getValue() {
    // 缺少 return，隐式返回 null（会导致 NullPointerException）
}
```

**Swift**:
```swift
// 编译报错：缺少 return 语句
func getValue() -> Int {
    // 缺少 return
}
```

**TypeScript**:
```typescript
// 编译报错：缺少 return 语句
function getValue(): number {
    // 缺少 return
}
```
