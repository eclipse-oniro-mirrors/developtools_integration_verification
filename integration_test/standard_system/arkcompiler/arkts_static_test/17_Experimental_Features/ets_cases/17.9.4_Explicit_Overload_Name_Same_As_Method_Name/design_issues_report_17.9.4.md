# 17.9.4 Explicit Overload Name Same As Method Name — ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-25
**测试用例数：** 8（5 compile-pass + 2 compile-fail + 1 runtime）
**通过率：** 100%（8/8，0例异常）
**编译器：** es2panda --extension=ets (Linux native)
**运行时：** ark VM
**Spec 依据：** arktsspecification.md §17.9.4

## 报告分类口径

| 分类 | 含义 | 处理方式 |
|------|------|----------|
| 符合 ArkTS spec 的语言设计差异 | 行为与 Java/Swift 不同，但符合 ArkTS spec 或当前明确语义 | 不标为缺陷，仅记录差异 |
| Spec 与实现不一致 | 用例与 spec 要求不一致，且当前实现未按 spec 报错/运行 | 保留 FAIL 用例并记录 issue_report |
| 已验证规范一致行为 | 用例验证 ArkTS 行为符合 spec | 记录为通过项 |

---

## 一、符合 ArkTS spec 的语言设计差异

### 差异 A：overload 名可与方法名相同 — Java/Swift 无此场景

**分类：** 符合 ArkTS spec 的语言设计差异

#### Spec 依据
§17.9.4 规定：overload 名可以与已有方法名相同，前提是该同名方法在 overload 列表中。如果同名方法存在但不在 overload 列表中，则产生编译错误。overload 名不在 overriding、重载实体列表、Method Reference 中考虑，因此不会产生歧义。

#### 实测行为
```typescript
class Printer {
  print(a: int): string { return "int:" + a }
  printStr(a: string): string { return "str:" + a }
  // overload 名 "print" 与方法 "print" 同名，且 print 在列表中
  overload print { print, printStr }
}
```

#### 跨语言对比

| 语言 | 同名场景 | 行为 |
|------|--------|------|
| ArkTS | overload 名与列表中的方法同名 | ✅ 允许，前提是该方法在列表中；overload 名不作为普通标识符 |
| Java | N/A（无显式 overload 声明概念） | 方法重载天然同名，无额外冲突 |
| Swift | N/A | 方法重载天然同名 |
| TypeScript | N/A | 与 Java 类似 |

**关键差异：** 此场景是 ArkTS 特殊的显式 overload 声明机制的产物。Java/Swift 不存在 "overload 声明名" 这一概念，因此不存在此类冲突。ArkTS 通过将 overload 名与普通方法名隔离到不同的命名空间来避免歧义。

---

### 差异 B：跨继承层次工作

**分类：** 符合 ArkTS spec 的语言设计差异

ArkTS 允许子类中的 overload 名与父类方法同名，跨继承层次工作。还可与子类自身方法同名。

```typescript
class Parent {
  handle(a: int): string { return "parent-int:" + a }
  handleStr(a: string): string { return "parent-str:" + a }
  overload handle { handle, handleStr }
}

class Child extends Parent {
  handleBool(a: boolean): string { return "child-bool:" + a }
  // overload 名 "handle" 与父类方法同名，跨继承层次
  overload handle { handle, handleStr, handleBool }
}
```

Java 中没有此场景。Swift 同样没有。

---

### 差异 C：overload 名在 Method Reference 和 overriding 中无歧义

**分类：** 符合 ArkTS spec 的语言设计差异

ArkTS 明确定义 overload 名不在 Function Reference 和 overriding 中考虑：
- Method Reference 指向实际方法，而非 overload 名
- overriding 中 overload 名不干扰方法重写关系
- 可以同时存在同名方法和 overload（该方法在列表中，不产生冲突）

这是 ArkTS 编译器命名空间隔离设计的体现。

---

## 二、已验证规范一致行为

经 es2panda + ark VM 实测，以下行为与 ArkTS spec §17.9.4 一致：

| 行为 | 验证方式 | 结果 |
|------|---------|------|
| overload 名与列表中方法同名 | compile-pass (004) | ✅ 通过 |
| 跨继承层次（子类 overload 与父类方法同名） | compile-pass (001) | ✅ 通过 |
| 接口中 overload 名与方法同名 | compile-pass (005) | ✅ 通过 |
| Method Reference 指向实际方法 | compile-pass (002) | ✅ 通过 |
| 无歧义场景验证 | compile-pass (003) | ✅ 通过 |
| 同名方法不在 overload 列表中 → 报错 | compile-fail (007) | ✅ 编译错误 |
| 跨继承失败场景 → 报错 | compile-fail (006) | ✅ 编译错误 |
| 运行时派发无歧义 | runtime (008) | ✅ 通过 |

---

## 三、跨语言对比摘要

| 维度 | ArkTS | Java | Swift | TypeScript |
|------|-------|------|-------|-----------|
| overload 声明名与方法同名 | ✅ 允许（方法在列表中） | N/A | N/A | N/A |
| 跨继承层次同名 | ✅ 允许 | N/A | N/A | N/A |
| 命名空间隔离（overload 名 vs 方法名） | ✅ | N/A | N/A | N/A |
| 编译验证 | ✅ es2panda — 8/8 通过 | N/A | N/A | N/A |
| Spec 一致性 | ✅ 与 spec §17.9.4 完全一致 | N/A | N/A | N/A |

---

## 四、分类汇总

| 条目 | 分类 |
|------|------|
| 差异 A：overload 名与同名方法共存 | 符合 ArkTS spec 的语言设计差异（ArkTS 独有特性） |
| 差异 B：跨继承层次工作 | 符合 ArkTS spec 的语言设计差异（ArkTS 独有特性） |
| 差异 C：命名空间隔离 | 符合 ArkTS spec 的语言设计差异（ArkTS 独有特性） |
| 已验证规范一致行为 | 8 项全部通过 |

---

## 五、关联记录

- 章节级异常汇总：[issue_report.md](../../issue_report.md)
- 测试执行报告：[test_report_17.9.4.md](test_report_17.9.4.md)
- 测试设计：[test_design_mindmap_17.9.4.md](test_design_mindmap_17.9.4.md)
- 跨语言对比：[comparison_report_arkts_java_swift.md](comparison_report_arkts_java_swift.md)
