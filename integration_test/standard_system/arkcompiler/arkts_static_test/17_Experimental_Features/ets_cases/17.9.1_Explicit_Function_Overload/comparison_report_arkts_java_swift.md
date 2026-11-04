# 17.9.1 Explicit Function Overload — 三语言对比报告

**生成日期：** 2026-06-25
**规范来源：** ArkTS Static Spec §17.9.1, Java JLS SE21 §8.4.9, Swift Language Reference (Functions)
**测试基础：** 17 个用例（7 compile-pass + 7 compile-fail + 3 runtime 真实执行），94.1% 通过率（1 例异常通过）

---

## 一、概览：三语言定位

| 语言 | 函数重载定位 | 设计哲学 |
|------|----------|---------|
| **ArkTS** | 显式 `overload` 声明式绑定顶层函数 | 声明式 + 类型安全，显式控制重载集合和优先级 |
| **Java** | 不支持顶层函数重载（仅方法重载） | OOP 纯面向对象，所有函数必须在类中；方法重载基于签名 |
| **Swift** | 不支持自由函数重载（仅方法重载） | 自由函数不支持重载；方法可通过参数标签区分 |
| **TypeScript** | 函数重载签名声明（类型级） | 编译时类型检查，运行时单一实现 |

---

## 二、章节对应关系

| ArkTS §17.9.1 | Java JLS §8.4.9 | Swift | TypeScript |
|--------------|-----------------|-------|-----------|
| `overload add { addInt, addStr }` | N/A（无顶层函数重载） | N/A | `function add(a: int): int; function add(a: string): string;` |
| 声明顺序决定优先级 | N/A | N/A | N/A（单实现，只有类型级） |
| overload 名与函数同名 | N/A | N/A | N/A |
| export overload 要求所有函数导出 | N/A | N/A | N/A |
| 泛型函数参与 overload | N/A | N/A | 泛型函数重载签名 |
| overload 名不作为函数引用 | N/A | N/A | N/A |

---

## 三、关键差异矩阵

| 维度 | ArkTS | Java | Swift | TypeScript |
|------|-------|------|-------|-----------|
| 顶层函数重载 | ✅ 显式 overload | ❌ 不支持 | ❌ 不支持 | ⚠️ 仅类型级签名 |
| 重载声明方式 | 集中式绑定 | N/A | N/A | 分散声明签名 |
| 运行时重载 | ✅ 真实分发 | N/A | N/A | ❌ 单一实现 |
| 重载方法名可不同 | ✅ | N/A | N/A | ❌ 必须同名 |
| 声明顺序影响解析 | ✅ | N/A | N/A | ❌ |
| 泛型重载 | ✅ | N/A | N/A | ✅ |
| 导出控制 | ✅ 显式验证 | N/A | N/A | N/A |
| 函数引用中考虑 overload 名 | ❌ | N/A | N/A | N/A |

---

## 四、用例 1:1 对照（三环境实测结果）

| # | 场景 | ArkTS | Java | Swift | TypeScript |
|---|------|-------|------|-------|-----------|
| 001 | 不同参数类型重载（int/string/double） | ✅ compile-pass | N/A | N/A | ⚠️ 类型级通过 |
| 002 | 不同参数数量重载（0/1/多参数） | ✅ compile-pass | N/A | N/A | ⚠️ 类型级通过 |
| 003 | export 重载 | ✅ compile-pass | N/A | N/A | ✅ export function |
| 004 | 泛型函数重载 | ✅ compile-pass | N/A | N/A | ✅ |
| 005 | 多个 overload 声明 | ✅ compile-pass | N/A | N/A | N/A |
| 006 | overload 名与函数同名 | ✅ compile-pass | N/A | N/A | N/A |
| 007 | 不同返回类型（参数区分） | ✅ compile-pass | N/A | N/A | ⚠️ 类型级通过 |
| 008 | overload 名作为函数引用 | ❌ compile-fail | N/A | N/A | N/A |
| 009 | 空 overload 列表 | ⚠️ 异常通过 | N/A | N/A | N/A |
| 010 | 未全部导出 | ❌ compile-fail | N/A | N/A | N/A |
| 011 | 重载名冲突 | ❌ compile-fail | N/A | N/A | N/A |
| 012 | 同名函数不在列表中 | ❌ compile-fail | N/A | N/A | N/A |
| 013 | 引用不可访问的函数 | ❌ compile-fail | N/A | N/A | N/A |
| 014 | 参数类型不匹配 | ❌ compile-fail | N/A | N/A | ❌ 类型错误 |
| 015 | 不同参数个数运行时分发 | ✅ runtime | N/A | N/A | N/A |
| 016 | 重载顺序分发验证 | ✅ runtime | N/A | N/A | N/A |
| 017 | 返回值正确性 | ✅ runtime | N/A | N/A | N/A |

### 关键差异详解

#### 核心对比：ArkTS 显式 overload vs Java 方法重载 ⭐

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `overload add { addInt, addStr, addDbl }` | 显式绑定三个不同名函数到 `add`，声明顺序决定优先级 |
| Java | 不支持顶层函数重载 | 只能通过类中的静态方法模拟：`Math.add(int,int)`、`Math.add(String,String)` |
| Swift | 不支持自由函数重载 | 自由函数必须使用不同名称；方法可用参数标签区分 |
| TypeScript | `function add(a: int): int; function add(a: string): string; function add(a: any): any {...}` | 仅编译时类型重载，运行时只有单一实现 |

#### ArkTS 的 overload 允许重载方法不同名 ⭐

这是 ArkTS 与所有对比语言最核心的差异：
```typescript
// ArkTS: 重载方法可以不同名
function addInt(a: int, b: int): int { return a + b }
function addStr(a: string, b: string): string { return a + b }
function addDbl(a: double, b: double): double { return a + b }
overload add { addInt, addStr, addDbl }

// Java: 重载方法必须同名（不支持顶层函数，以下假设静态方法）
static int add(int a, int b) { return a + b; }
static String add(String a, String b) { return a + b; }
static double add(double a, double b) { return a + b; }
```

---

## 五、综合评分

| 维度 | ArkTS | Java | Swift | TypeScript |
|------|-------|------|-------|-----------|
| 顶层函数重载能力 | ★★★★★ | ★☆☆☆☆ | ★☆☆☆☆ | ★★★☆☆ |
| 类型安全性 | ★★★★★ | ★★★★★ | ★★★★★ | ★★★★☆ |
| 重载声明简洁性 | ★★★★☆ | N/A | N/A | ★★★★★ |
| 运行时重载真实性 | ★★★★★ | N/A | N/A | ★☆☆☆☆ |
| 显式 API 控制 | ★★★★★ | N/A | N/A | ★★★☆☆ |
| 跨语言通用性 | ★★☆☆☆ | ★★★★☆ | ★★★☆☆ | ★★★★☆ |

---

## 六、核心结论

1. **ArkTS 的显式函数 overload 是特殊的语言特性**，在所有对比语言中无直接对应。Java 和 Swift 均不支持顶层自由函数的重载。TypeScript 仅提供编译时类型重载签名，运行时仍是单一实现。

2. **重载方法可以不同名是 ArkTS 的关键差异化设计**，这允许开发者自由命名重载变体（如 `addInt`、`addStr`、`addDbl`），同时通过 overload 名提供统一的调用接口（`add`）。

3. **声明顺序决定重载解析优先级是 ArkTS 的另一特殊特征**，Java 使用"最具体匹配"策略，ArkTS 的声明顺序策略更可预测、更透明。

4. **现有 1 例 Spec 不一致**（空 overload 列表编译通过）需要确认 spec 意图后决定修复方向。

---

## 七、ArkTS 设计建议

1. 当前设计（显式 overload 声明 + 不同名方法绑定 + 声明顺序优先级）是特殊且合理的设计，在 API 设计层面提供了 Java/Swift 无法实现的灵活性。
2. 建议统一处理空 overload 列表问题：空列表应视为编译错误或明确允许。当前 17.9.5 构造器重载也存在同样问题。
3. overload 名不能作为函数引用是有意设计，建议在 spec 中明确说明原因（避免歧义）。
