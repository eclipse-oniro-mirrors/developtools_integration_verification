# 8.15.1 catch Clause - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-18
**测试用例数：** 17（7 compile-pass + 4 compile-fail + 6 runtime）
**目的：** 通过用例执行（编译期 + 运行时）+ 跨语言对比，识别 ArkTS catch 子句的静态语言设计问题。

---

## 一、与业界静态语言的差异点

本章节未发现设计问题。所有行为均符合 ArkTS 规范 §8.15.1。

8.15.1 章节用例本次执行 100% 通过（17/17），未触发任何编译器异常或语义不符合预期行为。所有测试点（基本 catch、instanceof 类型收窄、try-catch-finally、重新抛出、Error 属性访问、多子类 instanceof、错误转换、catch 返回值类型收窄）均按规范预期通过。

### 跨章节关联问题检查

以下为全报告范围内已知的跨章节设计问题，逐项检查与 §8.15.1 的相关性：

| 跨章节问题 | 涉及章节 | 是否影响 §8.15.1 | 说明 |
|-----------|---------|-----------------|------|
| **STMT-I1**：Block 内 type 声明 spec/impl 不一致 | 8.3 | **否** | catch 块不涉及 type 别名声明，此问题范围限定于 §8.3 |
| **STMT-I2**：Label 未使用不强制报错 | 8.6 | **否** | catch 子句不使用 label 语法，此问题范围限定于 §8.6 |
| **逗号运算符仅限于 for 循环** | 8.2, 8.11 | **否（间接约束）** | 逗号运算符限制是全局 ArkTS 规则，catch 块体内同样受此约束，但这不是 catch 特有的问题 |
| **Error.code 访问器冲突** | 8.14 | **潜在相关** | catch 参数类型为 Error，当前测试覆盖了 `e.message`、`e.name`、`e.stack`，但未覆盖 `e.code`。如果 Error.code 存在 getter/setter 冲突，catch 块中访问 `e.code` 会受影响。建议补充 `e.code` 访问测试 |
| **null case 类型收窄与直接 new** | 8.13 | **否** | 此问题涉及 switch 语句的 null case 标签与 instanceof 类型收窄的交互，catch 块中的 instanceof 收窄不受此影响 |
| **char 与 int 在 switch 中可比较** | 8.13 | **否** | 此问题限定于 switch 语句的 case 标签类型检查，与 catch 子句无关 |

---

## 二、符合ArkTS spec的语言设计差异（与规范一致）

| 用例 ID | 行为描述 | 状态 |
|---------|----------|------|
| 001, 009 | 基本 try-catch 结构，catch (e) 捕获 Error，运行时验证 e.message | ✅ |
| 002, 010 | catch 内 instanceof 对 RangeError / TypeError 类型收窄，编译通过且运行时正确分流 | ✅ |
| 003 | try-catch-finally 完整三部分结构，finally 保证执行 | ✅ |
| 004, 011 | catch 块内条件检查后重新抛出（throw e），外层 catch 正确捕获 | ✅ |
| 005 | Error 对象属性访问：message、name、stack，类型正确赋值 | ✅ |
| 006 | catch 参数类型注解为 string → 编译拒绝 | ✅ |
| 007 | catch 参数类型注解为 number → 编译拒绝 | ✅ |
| 008 | catch 参数类型注解为 boolean → 编译拒绝 | ✅ |
| 012 | 错误转换：catch 捕获 RangeError 后转换为 TypeError 抛出，外层正确捕获 | ✅ |
| 013 | 多子类 instanceof：依次抛出 RangeError / TypeError / Error，instanceof 独立验证分支命中 | ✅ |
| 014 | catch 按 instanceof 类型收窄返回不同值（ZeroDivisor → -1，其余 Error → 0） | ✅ |
| 015 | instanceof 区分 3+ 个 Error 子类型（RangeError / TypeError / SyntaxError），编译通过 | ✅ |
| 016 | catch 捕获原始错误后抛出新的不同 Error 类型（错误转换），编译通过 | ✅ |
| 017 | catch 参数类型注解为 object → 编译拒绝 | ✅ |

### 评估检查点

| 检查点 | 结果 |
|--------|------|
| catch 标识符类型隐式为 Error | ✅ 符合规范，001/002/009/010 验证通过 |
| catch 参数不允许非 Error 类型注解（string/number/boolean/object） | ✅ 符合规范，006/007/008/017 验证通过 |
| instanceof 类型收窄后访问 Error 子属性 | ✅ 符合规范，002/010/013/014 验证通过 |
| try-catch-finally 完整结构 | ✅ 符合规范，003 验证通过 |
| catch 块内重新抛出 | ✅ 符合规范，004/011 验证通过 |
| Error 标准属性访问（message/name/stack） | ✅ 符合规范，005 验证通过 |
| 错误转换（catch 内抛出不同类型 Error） | ✅ 符合规范，012/016 验证通过 |

---

## 三、严重性等级总览

| 严重性 | 数量 | 涉及用例 |
|--------|------|----------|
| ⭐ HIGH | 0 | — |
| ⭐ MEDIUM | 0 | — |
| 设计观察 | 0 | — |
| 设计观察（非问题） | 2 | A、B |

---

## 四、跨语言对比结论

### 设计观察 A：ArkTS 要求 catch 参数显式类型为 Error，不允许任意类型注解

**规范 §8.15.1 原文：**
> Catch identifier type inside block is Error.

**实际行为：**
- `catch (e)` -- 类型隐式为 Error -- 编译通过
- `catch (e: string)` -- 编译失败 -- 符合预期
- `catch (e: number)` -- 编译失败 -- 符合预期
- `catch (e: boolean)` -- 编译失败 -- 符合预期
- `catch (e: object)` -- 编译失败 -- 符合预期

**评价：** ArkTS 强制 catch 参数为 Error 类型是一种简化设计，限制了 catch 参数只能是 Error 基类型（不能指定为 RangeError 等子类型），但通过 instanceof 运行时检查弥补。这种设计减少了类型注解的复杂度，但牺牲了编译期类型精确性。

### 设计观察 B：ArkTS 不支持多个 catch 块（multi-catch）

ArkTS 仅在单个 catch 块中使用 `instanceof` 区分错误类型，而不支持 Java 的多 catch 语法 `catch (TypeA | TypeB e)`。

**评价：** 这是有意简化。instanceof 方式提供了同样的表达能力，区别在于：
- Java 多 catch：编译期精确，每个 catch 块对应一个异常类型
- ArkTS instanceof：运行时判断，更灵活但无法在编译期保证覆盖所有分支

### catch 参数类型约束对比

| 语言 | catch 参数类型约束 |
|------|-------------------|
| ArkTS | **只能是 Error 类型**（隐式，不允许显式类型注解） |
| Java | 可以是 `Throwable` 或其子类型（`Exception`、`RuntimeException`、自定义异常） |
| Swift | `catch` 参数可省略；可指定类型：`catch let err as MyError`，类型推导灵活 |

### 多 catch 机制对比

| 语言 | 多 catch 支持 |
|------|--------------|
| ArkTS | 不支持多 catch 块，通过 `instanceof` 运行时区分 |
| Java | 支持多 catch 语法 `catch (TypeA \| TypeB e)`，编译期精确 |
| Swift | 支持多个 catch 块，每个可匹配不同错误类型（模式匹配） |

### 综合维度评价

| 维度 | 评价 |
|------|------|
| 与 spec 一致性 | 100%（本次执行 17/17 全部通过） |
| 设计严密性 | 良好，catch 参数类型强制 Error 符合静态类型设计 |
| 类型安全性 | 优于 Java（catch 不能声明任意 Throwable 类型），与 Swift 相当 |
| 表达能力 | 通过 instanceof 提供运行时类型区分，但无编译期多 catch |
| 与 Java/Swift 对比 | ArkTS = Swift 简化风格 > Java 传统多 catch |

---

## 五、改进方向建议

### 短期
- 当前设计无需改进的问题。

### 中期
- 可考虑补充 `e.code` 属性的访问测试，验证 Error.code 访问器在 catch 块中的行为是否与 8.14 节中提到的访问器冲突有关。
- 可考虑引入编译期多 catch 语法（如 `catch (e: RangeError)`）以提供编译期类型精确性，但这与 ArkTS 简化设计哲学相悖。

### 长期
- 关注 ArkTS 是否会引入类似 Java 受检异常（checked exceptions）或 Swift 的模式匹配 catch 语法。如需引入，应在规范中明确定义 catch 参数的类型传播规则。
