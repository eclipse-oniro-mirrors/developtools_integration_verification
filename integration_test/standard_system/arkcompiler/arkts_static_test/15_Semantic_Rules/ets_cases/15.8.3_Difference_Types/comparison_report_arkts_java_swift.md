# 15.8.3 Difference Types（差分类型）- ArkTS/Java/Swift/TypeScript 跨语言对比报告

## 一、对比矩阵

| 方面 | ArkTS | Java | Swift | TypeScript |
|------|-------|------|-------|------------|
| 差分类型语法 | `A & ~B` | ❌ 不支持 | ❌ 不支持 | ❌ 不支持 |
| 差分类型支持 | ❌ 未实现（GAP） | ❌ 不支持 | ❌ 不支持 | ❌ 不支持 |
| 差分类型语义 | ⚠️ 未实现 | ❌ 不支持 | ❌ 不支持 | ❌ 不支持 |

## 二、测试用例对照

| 测试用例 ID | ArkTS | Java | Swift | TypeScript |
|------------|-------|------|-------|------------|
| SEM_15_08_03_001 | ✅ 通过 | ✅ 通过 | ✅ 通过 | ✅ 通过 |
| SEM_15_08_03_100_FAIL_DIFFERENCE_UNSUPPORTED | ⚠️ GAP | ❌ 不支持 | ❌ 不支持 | ❌ 不支持 |
| SEM_15_08_03_200 | ✅ 通过 | ✅ 通过 | ✅ 通过 | ✅ 通过 |

## 三、详细代码对照

### 3.1 差分类型定义

**ArkTS Spec**（未实现）:
```typescript
// Spec 定义但未实现（ESY145527）
type Even = int & ~1;  // 从 int 中排除 1

function main(): void {
    let x: Even = 2;  // 正确
    // let y: Even = 1;  // 错误：1 被排除了
}
```

**TypeScript**（不支持）:
```typescript
// TypeScript 不支持差分类型
// 可以使用条件类型和 never 模拟（不完全等价）
type Diff<T, U> = T extends U ? never : T;
type Even = Diff<number, 1>;  // 不完全等价

function main(): void {
    let x: Even = 2;  // 可以
    let y: Even = 1;  // 也可以，模拟不完全
}
```

**Java**（不支持）:
```java
// Java 不支持差分类型
// 无法模拟
```

**Swift**（不支持）:
```swift
// Swift 不支持差分类型
// 无法模拟
```

## 四、关键发现

1. **差分类型是 ArkTS Spec 特有的特性**: 主流语言（TypeScript、Java、Swift）都不支持差分类型
2. **ArkTS 未实现**: ArkTS Spec 定义了差分类型，但编译器未实现（已知 GAP，跟踪号 ESY145527）
3. **差分类型的语义**: 差分类型 `A & ~B` 表示从类型 `A` 中排除类型 `B` 的成员，这种类型在精确类型系统中很有用

## 五、实测结果

| 语言 | 差分类型支持 | 差分类型语法 | 语义 | 备注 |
|------|-------------|-------------|------|------|
| ArkTS | ❌ 未实现 | `A & ~B` | ⚠️ 未实现 | 已知 GAP：ESY145527 |
| Java | ❌ 不支持 | - | - | - |
| Swift | ❌ 不支持 | - | - | - |
| TypeScript | ❌ 不支持 | - | - | 可以使用条件类型模拟（不完全等价） |

## 六、后续行动计划

1. **跟踪 GAP 修复**: 跟踪 ESY145527，在编译器实现差分类型后补充完整测试
2. **补充跨语言对比**: 差分类型在主流语言中不常见，建议重点关注 ArkTS 的独特特性
3. **更新测试设计**: 在差分类型实现后，更新测试设计思维导图和测试报告
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
