# 9.7.4 异步方法 - 测试设计思维导图

## 概述
本节定义 ArkTS 中 **异步方法 (Async Method)** 的声明和语义。async 方法是一种可在方法体内部定义 **挂起点 (suspension point)** 的可挂起方法，挂起点通过 `await` 表达式标记。

**核心语义：**
- `async` 修饰符可用于静态方法 (static method) 和实例方法 (instance method)
- async 方法的返回类型**必须为 `Promise<T>`**（`T` 是 `Any` 的子类型）
- 方法体内 `return value` 时，若 `value` 类型为 `T`，自动装箱 (auto-box) 为 `Promise<T>`；若 `value` 本身是 `Promise<T>`，则"原样"返回
- `async` 修饰符不是函数类型的一部分：返回 `Promise` 的 non-async 方法与同签名的 async 方法在类型系统视角**无区别**
- async 方法遵循与 async function 完全相同的语义和规则

**编译期约束 (compile-time errors)：**
- async 方法**不能**同时使用 `abstract` 修饰符
- async 方法**不能**同时使用 `native` 修饰符
- async 方法的返回类型**不能**是 `Promise` 以外的类型
- async 方法**不能在静态初始化 (static initialization) 中被调用**
- `await` 表达式**仅能出现在 async 函数/方法/lambda 体内**

## 核心规则

### async 方法的声明形式
| 形式 | 示例 |
|------|------|
| async 实例方法 | `async fetch(): Promise<string> { return "data" }` |
| async 静态方法 | `static async load(): Promise<int> { return 42 }` |
| async 方法返回 Promise 值 | `async get(): Promise<Object> { return somePromise }` |
| async 方法自动装箱 T | `async get(): Promise<int> { return 42 }` // 42 自动装箱 |

### async 方法的非法声明
| 非法组合 | 原因 |
|---------|------|
| `abstract async foo(): void` | async 与 abstract 互斥 |
| `native async foo(): Promise<int>` | async 与 native 互斥 |
| `async foo(): int` | 返回类型不是 Promise |
| 在 static initializer 中调用 async | 静态初始化不允许异步操作 |

### await 表达式在 async 方法体内的语义
```typescript
class DataService {
  async fetchData(): Promise<string> {
    // await Promise 类型 → 可挂起，挂起后返回 pending Promise
    let data = await this.remoteCall()

    // await 非 Promise 类型（如 int）→ 不挂起，直接返回值
    let num = await 42

    return data
  }

  async remoteCall(): Promise<string> { /* ... */ }
}
```

## 测试点覆盖

### 1. async 实例方法基本声明与调用（PASS）
- 类中声明 `async method(): Promise<T>`，方法体内使用 `await`
- 通过实例调用 async 方法并获得 `Promise<T>` 返回值
- `await` async 方法调用并正确赋值给类型为 `T` 的变量
- async 方法内 `return T_value` 自动装箱为 `Promise<T>`

### 2. async 静态方法声明与调用（PASS）
- 类中声明 `static async method(): Promise<T>`
- 通过类名直接调用静态 async 方法
- 静态 async 方法返回 Promise，调用方可 `await` 其结果

### 3. async 方法返回 Promise 实例（PASS）
- async 方法显式 `return` 一个 `Promise<T>` 实例（原样返回）
- async 方法 `return` 类型为 `T` 的值（自动装箱）

### 4. async 方法内 await 表达式（PASS）⭐
- `await` 后跟 `Promise<T>` 类型表达式 → 可能挂起 (suspend)
- `await` 后跟非 Promise 类型（如 `int`、`string`）→ 不挂起，直接返回值
- `await` 表达式结果类型为 `Awaited<type(expression)>`

### 5. 反向：async 与 abstract 互斥（FAIL）
- `abstract async foo(): void` → compile-time error
- `abstract async foo(): Promise<void>` → compile-time error

### 6. 反向：async 返回类型非 Promise（FAIL）
- `async foo(): int` → compile-time error
- `async foo(): string` → compile-time error

### 7. 反向：non-async 方法内使用 await（FAIL）
- 普通方法（无 async）内使用 `await` 表达式 → compile-time error

### 8. Runtime 验证
- async 方法在 ark VM 上正确执行，返回 Promise 并 resolved
- async 方法通过 `await` 挂起后正确恢复执行
- async 方法返回值类型与 Promise 泛型参数一致

## 边界值与边缘场景

### 边界值
- async 方法返回 `Promise<void>`（T 为 void，允许无参数 `return`）
- async 方法返回 `Promise<Object>`（T 为 Object 类型）
- async 方法体内零个 await（无挂起点，不创建额外 C_CORO）
- async 方法体内多个 await（多个挂起点，创建多个 C_CORO）
- async 方法在继承链中：父类 async 方法被子类 override
- async 方法与泛型类的组合：`class Box<T> { async get(): Promise<T> { ... } }`

### 边缘场景
- async 方法抛出异常 → Promise rejected
- async 方法与 optional chaining 结合：`obj?.asyncMethod()`
- await 表达式作用于 `undefined`（optional chaining 返回 undefined 的情况）
- async lambda 作为方法参数传入

## 编号规划
- compile-pass: 014 ~ 020（预留 7 个槽位，当前已用 014、042）
- compile-fail: 043 ~ 050（预留 8 个槽位，当前已用 043）
- runtime: 044 ~ 050（预留 7 个槽位，当前已用 044）

> 注：014 编号遵循 9.7 节 Method Declarations 全局编号序列。当前已有用例：
> - CLS_09_07_014: PASS async 方法基本用法
> - CLS_09_07_042: PASS async 方法返回 Promise
> - CLS_09_07_043: FAIL abstract async 组合
> - CLS_09_07_044: RUNTIME async 方法调用

## 文件命名规范
`CLS_09_07_NNN_{CATEGORY}_{DESCRIPTION}.ets`

- `CLS` — Classes 章节前缀
- `09_07` — 9.7 Method Declarations 子节
- `NNN` — 三位数字编号（在 9.7 节全局序列中分配）
- `{CATEGORY}` — `PASS` / `FAIL` / `RUNTIME`
- `{DESCRIPTION}` — 蛇形命名 (snake_case) 的英文描述
