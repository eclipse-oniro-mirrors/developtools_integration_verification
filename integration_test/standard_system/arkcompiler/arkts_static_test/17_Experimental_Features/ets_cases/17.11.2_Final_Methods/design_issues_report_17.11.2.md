# 17.11.2 Final Methods - 设计问题报告

**报告日期:** 2026-06-23
**测试用例数:** 14 (compile-pass: 5, compile-fail: 5, runtime: 4)
**通过率:** 100%

---

## 一、设计一致性问题

### 1.1 static + final 互斥的设计理由

**问题**: ArkTS 禁止 `static final` 组合方法修饰符 (ESE0048/ESE0077)，而 Java 允许 `static final` 方法（表示静态方法不可被子类隐藏）。

**实际编译器输出:**
```
ESE0048: Invalid method modifier(s): a final method can't have abstract or static modifier.
ESE0077: Invalid method modifier(s): a static method can't have abstract, final or override modifier.
```

**分析**:
- ArkTS spec 将 `final` 限定为"实例方法不可被重写"的语义
- `static` 方法本来就与实例继承无关，"static方法隐藏"是一个独立概念
- 禁止 `static final` 可能是因为 ArkTS 不区分方法重写(override)和隐藏(hide)
- 双重错误(ESE0048 + ESE0077)从两个角度报同一件事，对用户造成冗余

**建议**: 
- 合并 static+final 为单一错误
- 明确文档化 `final` 的适用范围（仅限实例方法）

### 1.2 final 方法重写时的冗余错误信息

**问题**: 子类重写 final 方法产生两个错误:
```
ESE1324203: Class member greet with type undefined in Derived cannot override greet 
  with type undefined field from class Base because the overridden method is final.
ESE0136: Method greet(): undefined in Derived not overriding any method
```

**分析**: ESE0136 ("not overriding any method") 在 ESE1324203 的上下文中是误导性的——方法确实尝试重写但被 final 阻止，不是"没有重写任何方法"。

**建议**: final 方法被重写时，仅报告 ESE1324203，不报告 ESE0136。

### 1.3 接口中 final 方法的错误类型

**问题**: 接口中声明 `final` 方法产生 `ESY0224: Identifier expected, got 'final'` — 这是语法错误而非语义错误。表明编译器在语法层面就将接口方法修饰符中的 `final` 视为非法 token。

**建议**: 考虑将此设为语义错误而非语法错误，以便未来扩展。

---

## 二、Spec 一致性确认

所有 14 个用例全部通过，ArkTS 17.11.2 Final Methods 的实现与 Spec 完全一致:

| Spec 规则 | 验证用例 | 实际错误代码 | 结论 |
|-----------|---------|-------------|------|
| `final` 方法不能被子类重写 | 006, 009 | ESE1324203 + ESE0136 | 一致 |
| `final` + `abstract` 组合非法 | 007 | ESE0047 | 一致 |
| `final` + `static` 组合非法 | 008 | ESE0048 + ESE0077 | 一致 |
| final 方法可正常声明和调用 | 001-005 | exit 0 | 一致 |
| 多层继承中 final 方法传递 | 004, 012 | exit 0 + verified | 一致 |
| 接口中不可声明 final 方法 | 010 | ESY0224 | 一致 |

---

## 三、跨语言对比 (Java 验证通过)

| 特性 | ArkTS | Java | 结论 |
|------|-------|------|------|
| final 方法声明 | `final method(): void` | `final void method()` | 语义一致 |
| 子类重写阻止 | ESE1324203 | "无法覆盖,被覆盖的方法为final" | 一致 |
| abstract + final | ESE0047 | "非法的修饰符组合: abstract和final" | 一致 |
| static + final | 禁止 (ESE0048/0077) | 允许 (不同语义) | 有意差异 |
| 运行时行为 | 正常调用 | 正常调用 | 一致 |

---

## 四、边界情况 (待后续测试)

| 场景 | 状态 | 说明 |
|------|------|------|
| 泛型类中的 final 方法 | 未测试 | `class Foo<T> { final bar(t: T): void {} }` |
| final + native 组合 | 未测试 | native 方法不希望被重写是合理的 |
| override + final 组合 | 未测试 | 子类声明 `override final method()` 应合法 |
| final 方法上的 @deprecated | 未测试 | 注解兼容性 |

---

## 五、改进建议汇总

| 优先级 | 类别 | 建议 |
|--------|------|------|
| 高 | 错误信息 | final 方法重写时仅报 ESE1324203，移除冗余 ESE0136 |
| 高 | 错误信息 | static+final 合并为单一错误而非双报 |
| 中 | 设计明确 | 文档化 final 不适用于 static 方法的设计理由 |
| 中 | 编译器 | 接口中 final 从语法错误改为语义错误 |
| 低 | 测试 | 补充泛型类 final 方法和 final+native 组合测试 |

**核心结论:** ArkTS 17.11.2 Final Methods 的实现与 spec 完全一致，与 Java/Swift 语义高度对齐。无 SPEC 不一致发现。唯一的改进空间在错误信息质量优化。
