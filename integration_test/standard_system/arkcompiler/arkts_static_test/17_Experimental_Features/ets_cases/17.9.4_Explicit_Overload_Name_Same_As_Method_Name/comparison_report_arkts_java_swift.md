# 17.9.4 Explicit Overload Name Same As Method Name — 三语言对比报告

**生成日期：** 2026-06-25
**规范来源：** ArkTS Static Spec §17.9.4, Java JLS SE21, Swift Language Reference
**测试基础：** 8 个用例（5 compile-pass + 2 compile-fail + 1 runtime 真实执行），100% 通过率（0 例异常）

---

## 一、概览：三语言定位

| 语言 | overload 名与方法同名场景 | 设计哲学 |
|------|----------------------|---------|
| **ArkTS** | 允许 overload 名与列表中方法同名，跨继承工作 | 命名空间隔离：overload 名与普通方法名在不同命名空间 |
| **Java** | N/A — 无显式 overload 声明，方法重载天然同名 | 不存在冲突场景，因为方法重载基于签名而非声明式绑定 |
| **Swift** | N/A — 无显式 overload 声明 | 同 Java，不存在冲突场景 |
| **TypeScript** | N/A — 无显式 overload 声明 | 同 Java |

---

## 二、章节对应关系

| ArkTS §17.9.4 | Java | Swift | TypeScript |
|--------------|------|-------|-----------|
| overload 名与列表中方法同名 | N/A（无此概念） | N/A | N/A |
| 同名方法不在列表中 → 报错 | N/A | N/A | N/A |
| 跨继承层次工作 | N/A | N/A | N/A |
| overload 名不在 Method Reference 中 | N/A | N/A | N/A |
| overload 名不在 overriding 中 | N/A | N/A | N/A |
| 接口中 overload 名与方法同名 | N/A | N/A | N/A |

---

## 三、关键差异矩阵

| 维度 | ArkTS | Java | Swift | TypeScript |
|------|-------|------|-------|-----------|
| overload 声明名与方法同名 | ✅ 允许（方法在列表中） | N/A | N/A | N/A |
| 同名方法不在列表中 → 报错 | ✅ 编译期检测 | N/A | N/A | N/A |
| 跨继承层次工作 | ✅ | N/A | N/A | N/A |
| 接口中同名 | ✅ | N/A | N/A | N/A |
| Method Reference 与 overload 名隔离 | ✅ | N/A | N/A | N/A |
| overriding 中无歧义 | ✅ | N/A | N/A | N/A |

---

## 四、用例 1:1 对照（三环境实测结果）

| # | 场景 | ArkTS | Java | Swift | TypeScript |
|---|------|-------|------|-------|-----------|
| 001 | 子类 overload 名与父类方法同名 | ✅ compile-pass | N/A | N/A | N/A |
| 002 | Method Reference 指向实际方法 | ✅ compile-pass | N/A | N/A | N/A |
| 003 | 无歧义场景 | ✅ compile-pass | N/A | N/A | N/A |
| 004 | overload 名与列表中方法同名 | ✅ compile-pass | N/A | N/A | N/A |
| 005 | 接口中 overload 名与方法同名 | ✅ compile-pass | N/A | N/A | N/A |
| 006 | 跨继承失败场景 | ❌ compile-fail | N/A | N/A | N/A |
| 007 | 同名方法不在 overload 列表中 | ❌ compile-fail | N/A | N/A | N/A |
| 008 | 运行时派发无歧义 | ✅ runtime | N/A | N/A | N/A |

### 关键差异详解

#### 核心特性：overload 名与同名方法共存 ⭐⭐⭐

这是 ArkTS 特殊设计的最集中体现：

```typescript
// ArkTS: overload 名 "handle" 与方法名 "handle" 相同
// 两者在不同命名空间，不冲突
class Printer {
  handle(a: int): string { return "int:" + a }
  handleStr(a: string): string { return "str:" + a }
  overload handle { handle, handleStr }
  //         ^^^^^^  ^^^^^^ 这两个 handle 在不同命名空间
}
```

对比语言中完全不存在此场景：

| 语言 | 为什么不存在 |
|------|-----------|
| Java | 重载基于签名，所有同名方法自然属于同一个重载组，不存在"overload 声明名"这一独立实体 |
| Swift | 同 Java，方法重载基于参数标签 |
| TypeScript | 同 Java |

#### 同名方法不在列表中 → 编译错误 ⭐

```typescript
// ArkTS: 如果类中有方法 "action" 但 overload 列表不包含它 → 编译错误
class ConflictTest {
  action(a: int): string { return "int:" + a }
  actionStr(a: string): string { return "str:" + a }
  overload action { actionStr }  // ❌ "action" 方法不在列表中！
}
```

#### 跨继承层次工作 ⭐

```typescript
// ArkTS: 子类的 overload 名可以与父类方法同名
class Parent {
  handle(a: int): string { return "parent-int:" + a }
  handleStr(a: string): string { return "parent-str:" + a }
  overload handle { handle, handleStr }
}

class Child extends Parent {
  handleBool(a: boolean): string { return "child-bool:" + a }
  overload handle { handle, handleStr, handleBool }  // ✅ 跨继承层次
}
```

---

## 五、综合评分

| 维度 | ArkTS | Java | Swift | TypeScript |
|------|-------|------|-------|-----------|
| 命名的灵活性 | ★★★★★ | N/A | N/A | N/A |
| 命名空间隔离安全 | ★★★★★ | N/A | N/A | N/A |
| 跨继承支持 | ★★★★★ | N/A | N/A | N/A |
| 简洁性 | ★★★★☆ | N/A | N/A | N/A |
| 学习曲线 | ★★★☆☆ | N/A | N/A | N/A |

---

## 六、核心结论

1. **§17.9.4 是 ArkTS 显式 overload 声明机制的必然产物。** 因为 overload 引入了"重载声明名"这一新概念（独立于方法名），自然产生了同名冲突管理需求。Java/Swift 没有"重载声明名"这一实体，因此不存在此场景。

2. **命名空间隔离设计是正确的。** overload 名与普通方法名在不同的命名空间中运行，互不干扰。overload 名不在 Function Reference、Method Reference、overriding 中考虑，完全避免了歧义。

3. **`同名方法必须在 overload 列表中` 的规则提供了良好的安全性。** 如果允许同名方法存在于 overload 列表之外，会导致调用时的混乱（`obj.methodName(args)` 应该走 overload dispatch 还是直接调用？）。编译器强制要求一致性避免了这一问题。

4. **跨继承层次的支持是完整的。** 子类可以在自己的 overload 声明中引用父类方法，包括与父类方法同名的 overload 名。这是 ArkTS 类型系统一致性的体现。

5. **100% 通过率，无 Spec 不一致。** 所有用例均按预期通过或报错。

---

## 七、ArkTS 设计建议

1. 当前命名空间隔离机制是良好的设计，建议在 spec 中明确文档化两个命名空间（重载声明名 vs 方法名）的关系。
2. 对初学者而言，overload 名与方法同名的行为可能令人困惑，建议在官方文档中增加常见问题解答。
3. IDE 应提供清晰的提示：当 overload 名与某个方法同名时，高亮显示两者并标注其在不同的命名空间。
