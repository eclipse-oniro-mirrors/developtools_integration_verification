# 15.7.1 Type Inference for Constant Expressions（常量表达式类型推断）- 设计问题报告

## 一、编译器实现待完善

无

## 二、差异点

### 2.1 ArkTS 与 Java 对比

| 方面 | ArkTS | Java | 差异说明 |
|------|-------|------|---------|
| 算术常量 | `10 + 20` → `int` | `10 + 20` → `int` | 一致 |
| 布尔常量 | `10 > 5` → `boolean` | `10 > 5` → `boolean` | 一致 |
| 非法表达式 | ❌ 拒绝 | ❌ 拒绝 | 一致 |

**结论**: ArkTS 常量表达式推断与 Java 一致。

### 2.2 ArkTS 与 Swift 对比

| 方面 | ArkTS | Swift | 差异说明 |
|------|-------|-------|---------|
| 算术常量 | `10 + 20` → `int` | `10 + 20` → `Int` | 类似，类型名不同 |
| 布尔常量 | `10 > 5` → `boolean` | `10 > 5` → `Bool` | 类似，类型名不同 |
| 非法表达式 | ❌ 拒绝 | ❌ 拒绝 | 一致 |

**结论**: ArkTS 与 Swift 常量表达式推断类似，类型名不同。

### 2.3 ArkTS 与 TypeScript 对比

| 方面 | ArkTS | TypeScript | 差异说明 |
|------|-------|------------|---------|
| 算术常量 | `10 + 20` → `int` | `10 + 20` → `number` | **差异**：TypeScript 统一使用 `number` |
| 布尔常量 | `10 > 5` → `boolean` | `10 > 5` → `boolean` | 一致 |
| 非法表达式 | ❌ 拒绝 | ❌ 拒绝 | 一致 |

**结论**: ArkTS 区分 `int` 和 `double`，TypeScript 统一使用 `number`。

## 三、Spec 措辞待澄清

无

## 四、测试设计建议

1. **补充边界测试**: 建议补充大整数、浮点数边界值的常量表达式测试
2. **补充类型拓宽测试**: 建议补充 `int` 到 `double` 的拓宽测试
3. **补充编译期计算测试**: 建议补充更复杂的编译期常量表达式计算测试

## 五、跨语言代码对照

### 5.1 算术常量表达式

**ArkTS**:
```typescript
let a: int = 10 + 20;  // 推断为 int
let b: double = 3.14 * 2.0;  // 推断为 double
```

**Java**:
```java
int a = 10 + 20;  // 推断为 int
double b = 3.14 * 2.0;  // 推断为 double
```

**Swift**:
```swift
let a = 10 + 20  // 推断为 Int
let b = 3.14 * 2.0  // 推断为 Double
```

**TypeScript**:
```typescript
let a = 10 + 20;  // 推断为 number
let b = 3.14 * 2.0;  // 推断为 number
```

### 5.2 布尔常量表达式

**ArkTS**:
```typescript
let c: boolean = 10 > 5;  // 推断为 boolean
```

**Java**:
```java
boolean c = 10 > 5;  // 推断为 boolean
```

**Swift**:
```swift
let c = 10 > 5  // 推断为 Bool
```

**TypeScript**:
```typescript
let c = 10 > 5;  // 推断为 boolean
```
