# 14.4 Ambient Class Declarations — 跨语言对比报告

## 1. 概览

| 语言 | 定位 | 无体方法签名 |
|------|------|-------------|
| ArkTS | `declare class` 声明在别处定义的类类型 | ✅ 方法/构造器/访问器均可无体 |
| Java | 接口+抽象类提供方法签名 | ✅ 接口方法/抽象方法 |
| Swift | Protocol 声明方法签名 | ✅ Protocol 方法 |

## 2. 章节对应关系

| ArkTS 14.4 | Java | Swift |
|-----------|------|-------|
| `declare class A { field: int }` | `interface A { int field; }` 不允许字段 | ❌ protocol 不允许属性存储 |
| `declare class A { foo(): void }` | `interface A { void foo(); }` | `protocol A { func foo() -> Void }` |
| `declare class A extends B` | `interface A extends B` | `protocol A: B` |
| `declare class A implements I` | `class A implements I` | `class A: I` |
| `get/set` 访问器 | 接口允许 get/set 方法 | protocol 允许 get/set |

## 3. 关键差异矩阵

| 特性 | ArkTS | Java | Swift |
|------|-------|------|-------|
| declare class/struct | ✅ 支持 class | N/A | N/A |
| struct | ⚠️ gramma 支持但实现限制 | N/A | struct 是值类型 |
| 字段无初始化器 | ✅ ambient 字段 | ❌ 必须初始化 | ❌ 必须初始化 |
| 方法无体 | ✅ compile-time error 有体 | ✅ 接口方法无体 | ✅ protocol 方法无体 |
| static 成员 | ✅ 支持 | ✅ 接口不支持 static | ✅ 支持 |
| readonly 字段 | ✅ 支持 | ✅ final 字段 | ✅ let 属性 |
| 方法重载 | ✅ 显式 overload | ✅ 隐式重载 | ✅ 隐式重载 |
| 访问修饰 | public/protected | public/protected/private | open/public/internal |

## 4. 三环境实测结果

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | 空类 | ✅ compile-pass | N/A | N/A |
| 002 | 含字段 | ✅ compile-pass | N/A | N/A |
| 003 | static 字段 | ✅ compile-pass | N/A | N/A |
| 004 | readonly 字段 | ✅ compile-pass | N/A | N/A |
| 005 | 构造器 | ✅ compile-pass | ✅ | ✅ |
| 006 | 方法 | ✅ compile-pass | ✅ | ✅ |
| 007 | static 方法 | ✅ compile-pass | N/A | ✅ |
| 008 | 方法重载 | ✅ compile-pass | ✅ | ✅ |
| 009 | extends | ✅ compile-pass | ✅ | ✅ |
| 010 | implements | ✅ compile-pass | ✅ | ✅ |
| 011 | get/set 访问器 | ✅ compile-pass | ✅ | ✅ |
| 013~020 | compile-fail | ✅ 全部正确 | N/A | N/A |
| 022 | struct 不支持 | ✅ compile-fail | N/A | N/A |
| 021 | runtime 共存 | ✅ runtime | N/A | N/A |

## 5. 关键差异详解

### 字段必须有显式类型注解且无初始化器

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS ambient class | `x: int` | ✅ 字段声明，无初始值 |
| Java interface | `int x;` | ❌ 不允许（interface 字段必须 static final）|
| Swift protocol | `var x: Int { get set }` | ⚠️ 仅读写要求，非字段声明 |

### struct 关键字限制

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS (spec) | `declare struct Point {}` | ❌ spec 语法允许但实现限制 |
| ArkTS (实际) | `declare struct Point {}` | ❌ Semantic error：struct 仅用于 UI |
| Java | N/A | N/A |
| Swift | `struct Point {}` | ✅ 值类型，与 class 不同 |

## 6. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 类签名声明 | ⭐⭐⭐（最直接） | ⭐⭐（需接口/抽象类） | ⭐⭐（需 protocol） |
| 字段声明灵活性 | ⭐⭐⭐（无初始化器） | ⭐（必须初始化） | ⭐（必须初始化） |
| 编译器校验 | ⭐⭐⭐（正确实施） | ⭐⭐⭐ | ⭐⭐⭐ |
| struct 支持 | ⭐（语法支持但限制） | N/A | ⭐⭐⭐ |

## 7. 核心结论

1. Ambient class declarations 的编译器实施质量很高 — 所有 8 个 compile-fail 规则均正确校验
2. 编译器对 class 成员的校验比顶层 declare let/const (14.1) 更严格，class 内字段初始化器/类型检查均正确执行
3. struct 关键字在 ArkTS 中受限（仅 UI 组件上下文使用），与 Swift 的 struct 概念不同
4. Java 接口/抽象类和 Swift protocol 是概念上最接近的对照

## 8. ArkTS 设计建议

1. 保持 class 成员的严格校验（当前行为正确）
2. 考虑对齐 14.1 顶层声明的校验行为与 class 成员一致
3. 对于 struct：建议明确 spec 与实现的差异，或扩展 struct 支持到 ambient 上下文
