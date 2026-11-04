# 9.7.3 Abstract Methods - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-19
**测试用例数：** 17（4 compile-pass + 8 compile-fail + 5 runtime）
**目的：** 通过用例执行（编译期 + 真实运行时），识别 ArkTS 抽象方法设计

---

## 一、与业界静态语言的差异点

**无新发现的设计问题。**

9.7.3 章节用例执行 100% 通过，未触发任何编译器异常或语义不符合预期行为。所有编译期约束（abstract 与 static/final/native/async/private 互斥、非抽象类必须实现全部抽象方法）和执行期行为（多态分派、多级继承链）均与 spec 一致。

---

## 二、符合ArkTS spec的语言设计差异

| 验证点 | 用例 | 状态 |
|-------|------|------|
| abstract 类声明 abstract 方法，非 abstract 子类提供实现 | 001 | ✅ |
| 多级 abstract 继承链（abstract 类 extends abstract 类） | 001 | ✅ |
| abstract 子类以 abstract 方法覆盖基类非 abstract 具体方法 | 002 | ✅ |
| abstract 子类以 abstract 方法覆盖接口默认实现 | 003 | ✅ |
| abstract 子类以 abstract 方法覆盖基类 abstract 方法 | 004 | ✅ |
| 非 abstract 类包含 abstract 方法被拒绝 | 005 | ✅ |
| abstract 方法声明为 private 被拒绝 | 005 | ✅ |
| abstract 与 static 同时使用被拒绝 | 006, 011 | ✅ |
| abstract 与 final 同时使用被拒绝 | 007 | ✅ |
| abstract 与 native 同时使用被拒绝 | 008, 012 | ✅ |
| abstract 与 async 同时使用被拒绝 | 009 | ✅ |
| 非 abstract 子类未实现全部继承的 abstract 方法被拒绝 | 010 | ✅ |
| 基类引用多态分派到子类 abstract 方法实现（Dog/Cat） | 013 | ✅ |
| 基类引用分派 + 非 abstract 方法 describe() 正常调用 | 014 | ✅ |
| 三级抽象继承链（Layer1->Layer2->ConcreteLeaf）正确分派 | 015 | ✅ |
| 子类 override 基类非抽象方法，基类引用分派到子类实现 | 016 | ✅ |
| 多子类（Square/Rect）各自实现 abstract 方法，返回值独立 | 017 | ✅ |

---

## 三、设计观察

### 观察 A：ArkTS 允许 abstract 方法 override 非 abstract 方法 ⭐ DESIGN

**用例：** CLS_09_07_020_PASS_ABSTRACT_OVERRIDE_NONABSTRACT、CLS_09_07_026

**行为：** abstract 子类可以将基类的具体（非 abstract）方法重新声明为 abstract，迫使更下层的子类提供新实现。

```typescript
class Base { greet(): void { console.log("hello") } }
abstract class Middle extends Base { abstract override greet(): void }
class Leaf extends Middle { override greet(): void { console.log("hi") } }
```

**对比：**
| 语言 | abstract override 非 abstract |
|------|------------------------------|
| ArkTS | ✅ 允许 |
| Java | ✅ 允许 |
| Swift | ❌ 不允许（Swift 无 abstract 关键字，依赖 protocol） |

**评价：** 此设计赋予了中间抽象层"重新抽象化"的能力，允许在继承链中途将某个方法标记为"必须由更下层实现"，是一种灵活的设计模式。与 Java 行为一致。

### 观察 B：abstract 修饰符与五大修饰符全部互斥 ⭐ DESIGN

**用例：** CLS_09_07_006/015/016/017/018

**行为：** ArkTS 编译器拒绝 abstract 与以下任一修饰符同时使用：

| 组合 | 用例 | 语义冲突原因 |
|------|------|-------------|
| abstract + private | 006 | private 方法不可被子类访问/覆盖，与 abstract 要求子类实现矛盾 |
| abstract + static | 006, 011 | static 方法属于类而非实例，无多态分派 |
| abstract + final | 007 | final 禁止覆盖，abstract 要求覆盖 |
| abstract + native | 008, 012 | native 方法有原生实现体，abstract 无实现体 |
| abstract + async | 009 | async 方法隐式返回 Promise，abstract 无实现体 |

**评价：** 五大修饰符与 abstract 的互斥关系语义自洽，编译器在每个维度均正确拦截。此设计严密性值得肯定。

### 观察 C：abstract 类可实现接口，abstract 方法可覆盖接口默认实现 ⭐ DESIGN

**用例：** CLS_09_07_021_PASS_ABSTRACT_OVERRIDE_INTERFACE

**行为：** 当 abstract 类 implements 一个带默认实现的接口时，可以将该接口方法声明为 abstract，使默认实现失效，强制具体子类提供实现。

**评价：** 此设计为接口默认方法提供了"撤回默认行为"的机制，增强了 abstract 类在接口适配场景下的控制力。与 Java 行为一致。

---

## 四、跨章节差异点

**无重现。** 9.7.3 章节执行 100% 通过，未触发任何已知设计问题。

---

## 五、差异分类总览

| 严重性 | 数量 | 问题列表 |
|-------|------|---------|
| 编译器待完善 | 0 | - |
| 语言差异 | 0 | - |
| 设计观察 | 0 | - |
| 设计观察 | 3 | A、B、C |

---

## 六、跨语言对比结论

| 维度 | 评价 |
|------|------|
| 与 spec 一致性 | ⭐⭐⭐⭐⭐（执行 100% 通过）|
| 编译期约束严密性 | ⭐⭐⭐⭐⭐（五大修饰符互斥全部拦截）|
| 运行时多态分派 | ⭐⭐⭐⭐⭐（多级继承链正确）|
| abstract override 语义 | ⭐⭐⭐⭐⭐（与 Java 一致）|
| 与 Java 对比 | ArkTS = Java（抽象方法设计高度一致）|

---

## 七、累积发现汇总（含 9.7.1 ~ 9.7.3）

| 严重性 | 总数 | 来源章节 |
|-------|------|---------|
| 编译器待完善 | 0 | - |
| 语言差异 | 0 | - |
| 设计观察 | 0 | - |
| 设计观察 | 3 | 9.7.3: A、B、C |

---

## 八、改进建议

无新建议。

9.7.3 章节是 ArkTS 类系统中抽象方法设计质量最高的章节之一，编译期约束完备、运行时行为正确、与 Java 语义高度一致。
