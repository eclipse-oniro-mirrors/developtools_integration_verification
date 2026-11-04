# 17.10.2 Native Methods - ArkTS 与 Java/Swift 行为差异及规范一致性报告

**报告日期：** 2026-06-23
**测试用例数：** 16（8 compile-pass + 5 compile-fail + 3 runtime）
**通过率：** 100%（16/16）
**编译器：** es2panda + ark VM (Linux native)
**Spec 依据：** arktsspecification.md 17.10.2

## 报告分类口径

| 分类 | 含义 | 处理方式 |
|------|------|----------|
| 符合 ArkTS spec 的语言设计差异 | 行为与 Java/Swift 不同，但符合 ArkTS spec 或当前明确语义 | 不标为缺陷，仅记录差异 |
| Spec 与实现不一致 | 用例与 spec 要求不一致，且当前实现未按 spec 报错/运行 | 保留 FAIL 用例并记录 issue_report |
| 已验证规范一致行为 | 用例验证 ArkTS 行为符合 spec | 记录为通过项 |

---

## 一、符合 ArkTS spec 的语言设计差异

### 差异 A：ArkTS native method 与 Java native method 高度语义对齐

**分类：** 符合 ArkTS spec 的语言设计差异

ArkTS 的 `native` 关键字在 class method 上下文中的语义几乎完全复制了 Java JNI 的 `native` 语义。

#### 实测行为
```typescript
class Calculator {
  native add(a: int, b: int): int          // 编译通过
  static native sqrt(x: double): double    // 编译通过
  private native internalCompute(n: int): int  // 编译通过
}
```

#### 跨语言对齐表

| 特性 | ArkTS | Java | 对齐 |
|------|-------|------|------|
| 无 body 声明 | ESE0083 拒绝 body | "本机方法不能带有主体" | 对齐 |
| native + abstract | ESE0047 拒绝 | "非法的修饰符组合: abstract和native" | 对齐 |
| native in interface | ESY0224 拒绝 | "此处不允许使用修饰符native" | 对齐 |
| static native | 允许 | 允许 | 对齐 |
| private native | 允许 | 允许 | 对齐 |
| native + generic | 允许 | 允许 (erasure) | 对齐 |
| override native | 允许 | 允许 | 对齐 |

---

### 差异 B：ArkTS native method 分号可选

**分类：** 符合 ArkTS spec 的语言设计差异

```typescript
// 两种形式均编译通过
native foo(): void      // 无分号
native bar(): void;     // 有分号
```

Java 要求方法声明后必须有分号。ArkTS 允许省略，因为 `native` 修饰符本身已表明该方法无 body。

---

### 差异 C：interface 中 native 方法的处理

**分类：** 符合 ArkTS spec 的语言设计差异

```typescript
// 编译错误 ESY0224: Identifier expected, got 'native'
interface I {
  native foo(): void
}
```

ArkTS 和 Java 均禁止在 interface 中使用 native 方法。ArkTS 在语法解析阶段即阻止此用法（ESY0224），比 Java 的语义错误（"此处不允许使用修饰符native"）更早报告。

---

### 差异 D：ArkTS 使用 LinkerUnresolvedMethodError vs Java UnsatisfiedLinkError

**分类：** 符合 ArkTS spec 的语言设计差异

| 平台 | 错误类型 | 可捕获 |
|------|---------|--------|
| ArkTS | LinkerUnresolvedMethodError | 是（try/catch 已验证） |
| Java | UnsatisfiedLinkError | 是 |

两种错误语义相同：实现了声明的 native 方法被调用但找不到平台原生实现。命名差异反映了两平台不同的运行时架构。

---

## 二、已验证规范一致行为

经 es2panda + ark VM 实测，以下行为与 ArkTS spec 17.10.2 一致：

| 行为 | 验证方式 | 结果 |
|------|---------|------|
| class 中基本 native method 声明 | compile-pass (001) | 通过 |
| native method 带多种参数类型 | compile-pass (002) | 通过 |
| static native method | compile-pass (003) | 通过 |
| private native method | compile-pass (004) | 通过 |
| 多个 native methods 共存 | compile-pass (005) | 通过 |
| native method 泛型参数 | compile-pass (006) | 通过 |
| native method 分号体 | compile-pass (007) | 通过 |
| override native method | compile-pass (008) | 通过 |
| native method 带 block body | compile-fail (009) ESE0083 | 通过 |
| native + abstract 组合 | compile-fail (010) ESE0047 + ESE0190 | 通过 |
| interface 中 native method | compile-fail (011) ESY0224 | 通过 |
| native method 无显式返回类型 | compile-fail (012) ESE0018 | 通过 |
| native method 返回类型不匹配 | compile-fail (013) ESE0318 | 通过 |
| 含 native method 的类实例化及普通方法调用 | runtime (014) exit 0 | 通过 |
| 调用未实现 native method 触发错误 | runtime (015) 错误被捕获 | 通过 |
| override native method 后正常调用 | runtime (016) exit 0 | 通过 |

---

## 三、错误码语义分析

### ESE0047: "Invalid method modifier(s): an abstract method can't have private, override, static, final or native modifier"
- 明确列出 `native` 作为与 `abstract` 互斥的修饰符
- 同时触发 ESE0190（类不抽象且未实现抽象方法）产生第二个错误
- 与 Java 的 "非法的修饰符组合: abstract和native" 语义一致

### ESY0224: "Identifier expected, got 'native'" (in interface)
- 在 interface 上下文中，`native` 被作为语法错误而非语义错误
- 解析器在遇到 `native` 时期望方法名标识符，而非修饰符关键字
- 这比 Java 的语义错误报告更早（语法级 vs 语义级）

### ESE0083: "Native, Abstract and Declare methods cannot have body"
- 统一应用于 native function 和 native method
- 消息中的 "methods" 措辞适用于两者

---

## 四、跨语言对比摘要

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 编译验证 | es2panda — 16/16 通过 | javac — 已验证 | Swift 未安装 |
| 运行时验证 | ark VM — 3/3 runtime 通过 | JVM — 已验证 | N/A |
| Spec 一致性 | 与 spec 17.10.2 一致 | JLS native 语义一致 | 无 native 关键字 |
| native method body 禁止 | ESE0083 | 本机方法不能带有主体 | N/A |
| native+abstract 禁止 | ESE0047 | 非法修饰符组合 | N/A |
| native in interface 禁止 | ESY0224 | 此处不允许使用修饰符native | N/A |
| 分号可选 | 是 | 否（必须分号） | N/A |
| 未实现调用错误 | LinkerUnresolvedMethodError | UnsatisfiedLinkError | Linker error |
| 错误可捕获 | 是（try/catch 已验证） | 是 | N/A |

---

## 五、分类汇总

| 条目 | 分类 |
|------|------|
| 差异 A：与 Java native 高度语义对齐 | 符合 ArkTS spec 的语言设计差异 |
| 差异 B：分号可选 | 符合 ArkTS spec 的语言设计差异 |
| 差异 C：interface 语法级阻止 native | 符合 ArkTS spec 的语言设计差异 |
| 差异 D：LinkerUnresolvedMethodError vs UnsatisfiedLinkError | 符合 ArkTS spec 的语言设计差异 |
| 已验证规范一致行为 | 16 项全部通过 |

---

## 六、关联记录

- 章节级异常汇总：[issue_report.md](../../issue_report.md)
- 测试执行报告：[test_report_17.10.2.md](test_report_17.10.2.md)
- 测试设计：[test_design_mindmap_17.10.2.md](test_design_mindmap_17.10.2.md)
- 跨语言对比：[comparison_report_arkts_java_swift.md](comparison_report_arkts_java_swift.md)
- 跨语言验证：[../cross_lang_verify/verification_report.md](../cross_lang_verify/verification_report.md)
