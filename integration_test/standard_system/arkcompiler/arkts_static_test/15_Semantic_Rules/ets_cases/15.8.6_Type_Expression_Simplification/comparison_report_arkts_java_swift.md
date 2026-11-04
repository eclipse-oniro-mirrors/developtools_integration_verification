# 15.8.6 Type Expression Simplification（类型表达式简化）- ArkTS/Java/Swift/TypeScript 跨语言对比报告

## 一、对比矩阵

| 方面 | ArkTS | Java | Swift | TypeScript |
|------|-------|------|-------|------------|
| 联合类型简化 | ✅ 支持 | ❌ 不支持 | ❌ 不支持 | ✅ 支持 |
| 类型不匹配拒绝 | ✅ 支持 | ✅ 支持 | ✅ 支持 | ✅ 支持 |

## 二、测试用例对照

| 测试用例 ID | ArkTS | Java | Swift | TypeScript |
|------------|-------|------|-------|------------|
| SEM_15_08_06_001 | ✅ 通过 | ❌ 不支持 | ❌ 不支持 | ✅ 通过 |
| SEM_15_08_06_100 | ✅ 通过 | ✅ 通过 | ✅ 通过 | ✅ 通过 |
| SEM_15_08_06_200 | ✅ 通过 | ✅ 通过 | ✅ 通过 | ✅ 通过 |

## 三、详细代码对照

### 3.1 联合类型简化

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

1. **ArkTS 与 TypeScript 类似**: 都支持联合类型简化，行为一致
2. **ArkTS 与 Java/Swift 差异**: Java 和 Swift 不支持联合类型
3. **类型安全**: 所有语言都正确拒绝类型不兼容的赋值

## 五、实测结果

| 语言 | 联合类型简化 | 类型不匹配拒绝 | 备注 |
|------|-------------|---------------|------|
| ArkTS | ✅ 支持 | ✅ 支持 | - |
| Java | ❌ 不支持 | ✅ 支持 | Java 不支持联合类型 |
| Swift | ❌ 不支持 | ✅ 支持 | Swift 不支持联合类型 |
| TypeScript | ✅ 支持 | ✅ 支持 | 与 ArkTS 一致 |
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
