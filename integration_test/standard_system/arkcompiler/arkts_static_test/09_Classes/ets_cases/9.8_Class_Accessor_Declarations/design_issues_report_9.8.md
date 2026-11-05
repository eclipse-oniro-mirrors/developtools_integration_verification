# 9.8 Class Accessor Declarations - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**测试用例：** 31

## 一、与业界静态语言的差异点

### 差异点 CLS-I1：同名 getter/setter 修饰符不匹配未被编译器拒绝

**用例：** CLS_09_08_008（实测发现）

**spec §9.8 原文：**
> "If both a getter and a setter with a particular name are defined,
> then both must have the same accessor modifiers. Otherwise, a
> compile-time error occurs."

**实测行为：**
```typescript
class DataHolder {
  private _data: int = 0
  static get data(): int { return 0 }
  set data(v: int) {  // spec 要求此处应报 compile-time error
    this._data = v
  }
}
// 实测编译通过，ArkTS 编译器未拒绝 static getter + 实例 setter 的修饰符不匹配
```

**验证：** 在 `run_classes_cases_wsl.sh` 中作为 compile-pass 执行通过。

**对比：**
| 场景 | spec 期望 | 实测 |
|------|---------|------|
| `static get` + `static set` | ✅ 通过 | ✅ 通过（一致）|
| `static get` + 实例 `set` | ❌ 拒绝 | ✅ **通过**（不一致）|
| 实例 `get` + `static set` | ❌ 拒绝 | 待验证 |
| `get` 含 `abstract` + `set` 不含 | ❌ 拒绝 | 待验证 |

**差异性质：** ArkTS Spec 与编译器行为差异

**影响：** 类型安全降级。当 getter 声明为 `static` 而 setter 为实例方法时，通过类名调用 getter 返回的值与通过实例 setter 写入的值语义上属于不同存储空间（class 级别 vs instance 级别），破坏了 accessor 配对的语义一致性。

**建议：**
1. 对齐实现与 spec：在编译器中增加同名 getter/setter 修饰符一致性检查
2. 或者更新 spec：若确实有意允许此场景，需明确说明允许的修饰符差异范围

---

## 二、符合ArkTS spec的语言设计差异

| 验证点 | 用例 | 状态 |
|-------|------|------|
| 基本 getter/setter 声明与访问语法 | 001 | ✅ |
| getter 返回类型推断（省略返回类型） | 002 | ✅ |
| override getter 返回类型协变 / setter 参数类型逆变 | 003 | ✅ |
| getter/setter 被当作方法调用拒绝 | 004 | ✅ |
| setter 参数为可选参数拒绝 | 005 | ✅ |
| accessor 名与非静态字段名冲突拒绝 | 006 | ✅ |
| accessor 名与方法名冲突拒绝 | 007, 033 | ✅ |
| 同名 getter/setter 修饰符不匹配拒绝 | - | ❌ 实测不一致（CLS-I1） |
| field 覆盖 accessor / accessor 覆盖 field 拒绝 | 009 | ✅ |
| getter/setter 运行时基本读写 + 校验逻辑 | 010 | ✅ |
| override accessor 运行时正确性 | 011 | ✅ |
| getter 声明带有参数拒绝 | 012, 024 | ✅ |
| setter 声明带有显式返回类型拒绝 | 013, 025 | ✅ |
| setter 声明无参数拒绝 | 014, 026 | ✅ |
| 只声明 getter（只读计算属性） | 015, 023 | ✅ |
| 只声明 setter（只写属性） | 016, 031 | ✅ |
| abstract getter/setter 声明与子类实现 | 017 | ✅ |
| 静态 getter/setter（通过类名访问） | 018 | ✅ |
| override getter 返回类型非协变拒绝 | 019 | ✅ |
| override setter 参数类型非逆变拒绝 | 020 | ✅ |
| abstract accessor 运行时（默认值/设置/校验） | 021 | ✅ |
| 静态 accessor 运行时 | 022 | ✅ |
| 计算属性 getter（fulName = surname + forename） | 027 | ✅ |
| getter 返回类型推断运行时 | 028 | ✅ |
| accessor 校验逻辑运行时（正常值/负数拒绝） | 032 | ✅ |

---

## 三、严重性等级总览

| 严重性 | 数量 | 问题列表 |
|-------|------|---------|
| HIGH | 0 | - |
| MEDIUM | 1 | CLS-I1：同名 getter/setter 修饰符不匹配未被编译器拒绝 |
| LOW | 0 | - |

---

## 四、累积发现汇总（9.8）

| 严重性 | 总数 |
|-------|------|
| HIGH | 0 |
| MEDIUM | 1 |
| LOW | 0 |
| 设计观察 | 0 |
