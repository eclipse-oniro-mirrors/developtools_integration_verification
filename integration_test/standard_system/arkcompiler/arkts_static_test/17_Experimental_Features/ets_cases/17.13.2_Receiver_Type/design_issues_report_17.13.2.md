# 17.13.2 Receiver Type — ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-25
**测试用例数：** 14（6 compile-pass + 5 compile-fail + 3 runtime）
**通过率：** 85.7%（12/14，2 例 SPEC 不一致）
**编译器：** es2panda --extension=ets (Linux native)
**Spec 依据：** arktsspecification.md §17.13.2

## 报告分类口径

| 分类 | 含义 | 处理方式 |
|------|------|----------|
| 符合 ArkTS spec 的语言设计差异 | 行为与 Java/Swift 不同，但符合 ArkTS spec 或当前明确语义 | 不标为缺陷，仅记录差异 |
| Spec 与实现不一致 | 用例与 spec 要求不一致，且当前实现未按 spec 报错/运行 | 保留 FAIL 用例并记录 issue_report |
| 已验证规范一致行为 | 用例验证 ArkTS 行为符合 spec | 记录为通过项 |

---

## 一、符合 ArkTS spec 的语言设计差异

### 差异 A：Receiver 类型的白名单限制是 ArkTS 独有的类型安全设计

**分类：** 符合 ArkTS spec 的语言设计差异

#### Spec 依据

§17.13.2 规定：Receiver 类型只能是接口类型（interface）、类类型（class）或数组类型（T[]）。原始类型（int/string/boolean 等）、联合类型（T1|T2）、函数类型、枚举类型均不能作为 receiver 类型。这一限制确保 receiver 机制仅用于"有成员可访问"的对象类型。

#### 实测行为

```typescript
class MyClass { public value: int = 0 }
interface MyInterface { foo(): void }

// ✅ class/interface/array 作为 receiver 类型
function f1(this: MyClass): void {}
function f2(this: MyInterface): void {}
function f3(this: number[]): void {}

// ❌ 联合类型/函数类型/枚举类型作为 receiver 类型——预期编译错误
function f4(this: MyClass | MyInterface): void {}  // ESE0082
function f5(this: () => void): void {}              // ESE0082
function f6(this: MyEnum): void {}                  // ESE0082

// ⚠️ int/string 作为 receiver——spec 要求报错但实际编译通过（见第二节）
```

#### 跨语言对比

| 语言 | Receiver / Extension 目标类型限制 | 说明 |
|------|-------------------------------|------|
| ArkTS | class / interface / array 白名单 | 限制 receiver 仅用于对象类型 |
| Java | N/A — 无等价语法 | 类的方法只能在类体内定义 |
| Swift | extension 可用于 class / struct / enum / protocol | 比 ArkTS 更宽泛：支持 struct 和 enum |
| TypeScript | N/A — 无此功能 | TS 的 this 参数仅用于类型标注 |

---

### 差异 B：ArkTS 禁止原始类型作为 receiver（但编译器未完全执行）

**分类：** 符合 ArkTS spec 的语言设计差异

#### Spec 依据

§17.13.2 要求原始类型（int、string 等）不能作为 receiver 类型。原始类型无成员可访问，receiver 函数对这些无意义。此设计是合理的。

#### 跨语言对比

| 语言 | 原始类型是否可作为扩展目标 |
|------|------------------------|
| ArkTS (spec) | ❌ 禁止 |
| Java | N/A |
| Swift | ✅ extension 可用于 Int、String 等（Swift 中 Int/String 是 struct） |
| TypeScript | N/A |

Swift 允许通过 `extension Int { ... }` 为整数添加方法，但这是合理的——因为 Swift 中 Int 是 struct 且有成员。ArkTS 中 int 是原始类型，无成员，receiver 函数无意义。

---

## 二、Spec 与实现不一致

### 不一致 A：int 作为 receiver 类型——spec 要求报错但编译器通过 ⚠️

**分类：** Spec 与实现不一致

**用例 ID：** EXP2_17_13_2_007_FAIL_PRIMITIVE_INT_RECEIVER

**问题：** spec §17.13.2 明确要求原始类型（int）不能作为 receiver 类型并应产生编译错误。但 es2panda 2026-06-25 实测结果为此用例编译通过，未报错。

**影响：** 允许 `function f(this: int): void {}` 编译通过，但 `this` 绑定到原始 int 值时无成员可访问，运行时行为未定义或异常。

**建议：** es2panda 应增加 receiver 类型的白名单检查，对 class/interface/array 之外的类型（包括 int）报编译错误。

---

### 不一致 B：string 作为 receiver 类型——spec 要求报错但编译器通过 ⚠️

**分类：** Spec 与实现不一致

**用例 ID：** EXP2_17_13_2_008_FAIL_PRIMITIVE_STRING_RECEIVER

**问题：** spec §17.13.2 明确要求原始类型（string）不能作为 receiver 类型并应产生编译错误。但 es2panda 2026-06-25 实测结果为此用例编译通过，未报错。

**影响：** 允许 `function f(this: string): void {}` 编译通过。string 虽非 class 但有内置方法（length 等），receiver 函数在语义上或可工作，但与 spec 不一致。

**建议：** 与 int 情况统一处理——要么 es2panda 实现白名单检查实现 spec 行为，要么更新 spec 明确 string 是否应允许。

---

## 三、已验证规范一致行为

经 es2panda + ark VM 实测，以下行为与 ArkTS spec §17.13.2 一致：

| 行为 | 验证方式 | 结果 |
|------|---------|------|
| class 类型作为 receiver | compile-pass (001) | ✅ 通过 |
| interface 类型作为 receiver | compile-pass (002) | ✅ 通过 |
| 数组类型 (number[]) 作为 receiver | compile-pass (003) | ✅ 通过 |
| 数组 receiver 进行操作 | compile-pass (004) | ✅ 通过 |
| 泛型类 receiver | compile-pass (005) | ✅ 通过 |
| 泛型接口 receiver | compile-pass (006) | ✅ 通过 |
| 联合类型 receiver 应报错 (ESE0082) | compile-fail (009) | ✅ 编译错误 |
| 函数类型 receiver 应报错 (ESE0082) | compile-fail (010) | ✅ 编译错误 |
| 枚举类型 receiver 应报错 (ESE0082) | compile-fail (011) | ✅ 编译错误 |
| int 作为 receiver（spec 要求报错） | compile-fail (007) | ⚠️ 异常通过 |
| string 作为 receiver（spec 要求报错） | compile-fail (008) | ⚠️ 异常通过 |
| 数组 receiver 函数运行时验证 | runtime (012) | ✅ 通过 |
| 类 receiver 函数运行时验证 | runtime (013) | ✅ 通过 |
| 接口 receiver 函数运行时验证 | runtime (014) | ✅ 通过 |

---

## 四、跨语言对比摘要

| 维度 | ArkTS | Java | Swift | TypeScript |
|------|-------|------|-------|-----------|
| 编译验证 | ✅ es2panda — 12/14 通过（2 例 SPEC 不一致） | N/A | N/A | N/A |
| 运行时验证 | ✅ ark VM — 3/3 runtime 通过 | N/A | N/A | N/A |
| Spec 一致性 | ⚠️ 与 spec 部分不一致（int/string receiver 未拦截） | N/A | N/A | N/A |
| Receiver 类型限制 | class/interface/array 白名单 | 无等价语法 | class/struct/enum/protocol | 无等价语法 |

---

## 五、分类汇总

| 条目 | 分类 |
|------|------|
| 差异 A：Receiver 类型的白名单限制 | 符合 ArkTS spec 的语言设计差异 |
| 差异 B：原始类型禁止作为 receiver | 符合 ArkTS spec 的语言设计差异 |
| 不一致 A：int 作为 receiver 异常通过 | Spec 与实现不一致 |
| 不一致 B：string 作为 receiver 异常通过 | Spec 与实现不一致 |
| 已验证规范一致行为 | 9 项通过（cp 6 + cf 3 预期报错） |

---

## 六、关联记录

- 章节级异常汇总：[issue_report.md](../../issue_report.md)
- 测试执行报告：[test_report_17.13.2.md](test_report_17.13.2.md)
- 测试设计：[test_design_mindmap_17.13.2.md](test_design_mindmap_17.13.2.md)
- 跨语言对比：[comparison_report_arkts_java_swift.md](comparison_report_arkts_java_swift.md)
