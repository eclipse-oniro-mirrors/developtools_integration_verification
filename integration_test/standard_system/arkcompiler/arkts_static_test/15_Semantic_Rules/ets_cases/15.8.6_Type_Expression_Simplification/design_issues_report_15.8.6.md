# 15.8.6 Type Expression Simplification（类型表达式简化）- 设计问题报告

## 一、编译器实现待完善

无

## 二、差异点

### 2.1 ArkTS 与 TypeScript 对比

| 方面 | ArkTS | TypeScript | 差异说明 |
|------|-------|------------|---------|
| 联合类型简化 | ✅ 支持 | ✅ 支持 | 一致 |

**结论**: ArkTS 和 TypeScript 都支持联合类型简化，行为一致。

### 2.2 ArkTS 与 Java 对比

| 方面 | ArkTS | Java | 差异说明 |
|------|-------|------|---------|
| 联合类型 | ✅ 支持 | ❌ 不支持 | **差异**：Java 不支持联合类型 |

**结论**: ArkTS 支持联合类型简化，Java 不支持联合类型。

### 2.3 ArkTS 与 Swift 对比

| 方面 | ArkTS | Swift | 差异说明 |
|------|-------|-------|---------|
| 联合类型 | ✅ 支持 | ❌ 不支持 | **差异**：Swift 不支持联合类型（使用枚举或协议） |

**结论**: ArkTS 支持联合类型简化，Swift 不支持联合类型。

## 三、Spec 措辞待澄清

无

## 四、测试设计建议

1. **补充复杂简化测试**: 建议补充更复杂的类型表达式简化测试（如嵌套联合类型、交叉类型简化等）
2. **补充边界测试**: 建议补充边界测试（如 `int|double` 简化为 `number`？）
3. **补充与交叉类型交互测试**: 建议补充联合类型与交叉类型交互的简化测试（依赖 ESY145527）

## 五、跨语言代码对照

### 5.1 联合类型简化

**ArkTS**:
```typescript
function main(): void {
    let x: int|int = 42;  // 联合类型简化：int|int → int
    let y: int = x;  // 可以赋值
    console.log(`${y}`);
}
```

**TypeScript**:
```typescript
function main(): void {
    let x: number|number = 42;  // 联合类型简化：number|number → number
    let y: number = x;  // 可以赋值
    console.log(`${y}`);
}
```

**Java**:
```java
// Java 不支持联合类型
// 无法测试
```

**Swift**:
```swift
// Swift 不支持联合类型
// 可以使用枚举或协议模拟
```

### 5.2 类型不匹配拒绝

**ArkTS**:
```typescript
// 编译报错：类型不匹配
let x: int = "s";  // 错误：string 不能赋值给 int
```

**TypeScript**:
```typescript
// 编译报错：类型不匹配
let x: number = "s";  // 错误：string 不能赋值给 number
```

## 六、关键发现

1. **联合类型简化**: ArkTS 正确简化联合类型（`int|int` 简化为 `int`）
2. **与 TypeScript 一致**: ArkTS 和 TypeScript 都支持联合类型简化，行为一致
3. **Java 和 Swift 不支持**: Java 和 Swift 不支持联合类型
