# 15.8.2 Intersection Types（交叉类型）- 设计问题报告

## 一、编译器实现待完善

### 1.1 SEM_15_08_02_100_FAIL_INTERSECTION_UNSUPPORTED

**问题描述**: Spec §15.8.2 定义了交叉类型（`A & B`），但编译器暂不支持。

**Spec 要求**: 支持交叉类型 `Named & Aged`，表示同时具有 `Named` 和 `Aged` 两个接口的类型。

**编译器行为**: 编译报错。

**分类**: 编译器实现待完善

**跟踪**: ESY145527

**建议**: 编译器应实现交叉类型支持，与 Spec 保持一致。

## 二、差异点

### 2.1 ArkTS 与 TypeScript 对比

| 方面 | ArkTS | TypeScript | 差异说明 |
|------|-------|------------|---------|
| 交叉类型语法 | `A & B` | `A & B` | 语法相同 |
| 交叉类型支持 | ❌ 未实现（GAP） | ✅ 支持 | **差异**：TypeScript 支持交叉类型 |

**结论**: TypeScript 支持交叉类型，ArkTS 未实现（已知 GAP）。

### 2.2 ArkTS 与 Java 对比

| 方面 | ArkTS | Java | 差异说明 |
|------|-------|------|---------|
| 交叉类型 | ⚠️ 未实现 | ❌ 不支持 | Java 不支持交叉类型 |

**结论**: Java 不支持交叉类型，ArkTS Spec 定义了但编译器未实现。

### 2.3 ArkTS 与 Swift 对比

| 方面 | ArkTS | Swift | 差异说明 |
|------|-------|-------|---------|
| 交叉类型 | ⚠️ 未实现 | ❌ 不支持 | Swift 不支持交叉类型 |

**结论**: Swift 不支持交叉类型，ArkTS Spec 定义了但编译器未实现。

## 三、Spec 措辞待澄清

无

## 四、测试设计建议

1. **跟踪 GAP 修复**: 建议跟踪 ESY145527，在编译器实现交叉类型后补充完整测试
2. **补充测试用例**: 在交叉类型实现后，建议补充以下测试用例：
   - 交叉类型的子类型关系
   - 交叉类型的成员访问
   - 交叉类型的类型收窄
   - 交叉类型与泛型的交互
3. **跨语言对比**: 在交叉类型实现后，补充与 TypeScript 的详细对比

## 五、跨语言代码对照

### 5.1 交叉类型定义

**TypeScript**（支持）:
```typescript
interface Named {
    name: string;
}
interface Aged {
    age: number;
}
type Person = Named & Aged;  // 交叉类型

let p: Person = {
    name: "Alice",
    age: 30
};
```

**ArkTS**（未实现，已知 GAP）:
```typescript
// 已知 GAP：编译器未实现交叉类型
interface Named { name: string; }
interface Aged { age: int; }
type Person = Named & Aged;  // 编译报错
```

### 5.2 交叉类型的子类型关系

**TypeScript**（支持）:
```typescript
interface A { a: string; }
interface B { b: number; }
type C = A & B;

// C 是 A 的子类型，也是 B 的子类型
let c: C = { a: "hello", b: 42 };
let a: A = c;  // 正确
let b: B = c;  // 正确
```

**ArkTS**（未实现，已知 GAP）:
```typescript
// 已知 GAP：编译器未实现交叉类型
```

## 六、关键发现

1. **交叉类型未实现**: ArkTS 编译器未实现交叉类型（已知 GAP，跟踪号 ESY145527）
2. **与 TypeScript 差异**: TypeScript 支持交叉类型，ArkTS 未实现
3. **Spec 与实现不一致**: Spec §15.8.2 定义了交叉类型，但编译器不支持
