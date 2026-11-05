# 3.5 Type References - 测试设计思维导图

## 概述
本节定义**类型引用 (Type Reference)** 的两种形式：
1. **Simple or qualified type name**（简单或限定名）
2. **Type alias**（类型别名）

**核心语义：**
- 泛型 class/interface 的类型引用必须是 valid instantiation
- 类型参数可显式给出或基于 defaults 隐式
- 通过 type alias 引用类型时，alias 被**透明替换**为非别名类型（递归替换）

## 核心规则

### 类型引用的两种形式
| 形式 | 示例 |
|------|------|
| Simple name | `let x: int`, `let y: MyClass` |
| Qualified name | `let m: ns.MyMap`, `let n: outer.Inner` |
| Type alias | `type T = ...`，再用 `let x: T` |

### 泛型 type reference 必须 well-formed
- `Map<string, number>` ✅
- `Map<string>` ❌（参数数量不对）
- `MyClass<NotASubtype>` ❌（违反约束）

### Type alias 的透明替换语义 ⭐ 核心
```typescript
type T1 = Object
type T2 = number
function foo(t1: T1, t2: T2) {
  t1 = t2      // 用 Object 和 number 检查兼容性
  t2 = t2 + t2 // 用 number 而非 T2 检查运算合法性
}
```

## 测试点覆盖

### 1. Simple name 类型引用（PASS）
- 用预定义类型名做引用
- 用用户类/接口/枚举名做引用
- 用类型参数 T 做引用
- 用 type alias 做引用

### 2. Qualified name 类型引用（PASS）
- 通过 namespace 限定的类型引用
- 嵌套 namespace
- 类内嵌套类型引用

### 3. 泛型 type reference（PASS）
- 显式 type arguments：`Map<string, int>`
- 嵌套泛型引用：`A<B<C>>`
- 多个 type parameters：`Pair<T, U>`
- Type 默认值：`<T = int>`

### 4. Type alias 透明替换（PASS）⭐
- `type T = number`，T 与 number 可互换
- alias 嵌套：`type A = B; type B = number`
- alias 用于运算符兼容性检查（透明）
- alias 用于类型兼容性检查（替换为底层）

### 5. 反向：泛型 well-formed 验证（FAIL）
- 类型参数数量错（多/少）
- 类型参数不满足约束
- 用变量名做类型

### 6. 反向：alias 循环引用（FAIL）
- `type A = A`（直接）
- `type A = B; type B = A`（间接）

### 7. Runtime 验证
- type alias 透明性运行时验证
- 泛型 type reference 实例化运行时
- qualified name 引用 namespace 类型

## 编号规划
- compile-pass: 001 ~ 010
- compile-fail: 011 ~ 015
- runtime: 016 ~ 019

## 文件命名规范
`TYP_03_05_YYY_{CATEGORY}_{DESCRIPTION}.ets`