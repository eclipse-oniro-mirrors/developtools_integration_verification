# 15.8.5 Control Flow Graph（控制流图）- 设计问题报告

## 一、编译器实现待完善

无

## 二、差异点

### 2.1 ArkTS 与 Java 对比

| 方面 | ArkTS | Java | 差异说明 |
|------|-------|------|---------|
| 控制流图类型分析 | ✅ 支持 | ❌ 不支持 | **差异**：Java 不支持基于控制流图的智能类型分析 |

**结论**: ArkTS 支持基于控制流图的智能类型分析，Java 不支持。

### 2.2 ArkTS 与 Swift 对比

| 方面 | ArkTS | Swift | 差异说明 |
|------|-------|-------|---------|
| 控制流图类型分析 | ✅ 支持 | ✅ 支持（可选绑定） | 类似，但语法不同 |

**结论**: ArkTS 和 Swift 都支持基于控制流图的智能类型分析，但语法不同。

### 2.3 ArkTS 与 TypeScript 对比

| 方面 | ArkTS | TypeScript | 差异说明 |
|------|-------|------------|---------|
| 控制流图类型分析 | ✅ 支持 | ✅ 支持 | 一致 |

**结论**: ArkTS 和 TypeScript 都支持基于控制流图的智能类型分析，行为一致。

## 三、Spec 措辞待澄清

无

## 四、测试设计建议

1. **补充复杂控制流测试**: 建议补充更复杂的控制流测试（如嵌套 `if`、循环、switch）
2. **补充多分支测试**: 建议补充多分支控制流测试（如 `if-else if-else`）
3. **补充逻辑运算符测试**: 建议补充逻辑运算符（`&&`、`||`）的控制流测试

## 五、跨语言代码对照

### 5.1 控制流图中的类型收窄

**ArkTS**:
```typescript
class Animal { name: string = ""; }
class Dog extends Animal { breed: string = ""; }

function main(): void {
    let a: Animal = new Dog();
    if (a instanceof Dog) {
        // 在 if 分支中，a 收窄为 Dog
        console.log("dog");
    }
}
```

**Java**:
```java
// Java 不支持基于控制流图的智能类型分析
// 需要显式类型转换
class Animal {}
class Dog extends Animal {}

public class CFG {
    public static void main(String[] args) {
        Animal a = new Dog();
        if (a instanceof Dog) {
            Dog d = (Dog) a;  // 需要显式转换
            System.out.println("dog");
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
    if let d = a as? Dog {  // 可选绑定
        print("dog")
    }
}
```

**TypeScript**:
```typescript
class Animal { name: string = ""; }
class Dog extends Animal { breed: string = ""; }

function main(): void {
    let a: Animal = new Dog();
    if (a instanceof Dog) {
        // 在 if 分支中，a 收窄为 Dog
        console.log("dog");
    }
}
```

## 六、关键发现

1. **控制流图类型分析**: ArkTS 支持基于控制流图的智能类型分析
2. **与 TypeScript 一致**: ArkTS 和 TypeScript 的行为一致
3. **与 Java 差异**: Java 不支持基于控制流图的智能类型分析，需要显式类型转换
