# 3.9 Type Object - ArkTS vs Java vs Swift

## 一、Object 概念对比

| 维度 | ArkTS Object | Java Object | Swift AnyObject |
|------|-------------|-------------|------------------|
| 顶类型地位 | 除 nullish/never 外 | 所有引用类型 | 所有 class 类型 |
| 接受 null | ❌ | ✅ | ❌（需 AnyObject?） |
| 接受原始类型 | ✅（装箱）| ✅（装箱）| ❌（仅 class）|
| 内置方法 | toString 等 | toString/equals 等 | 无（class 自定义）|

## 二、关键差异

| 特性 | ArkTS | Java | Swift |
|------|-------|------|-------|
| Object 与 Any 区分 | ✅（Any > Object）| ❌（仅 Object）| ✅（Any > AnyObject）|
| 装箱透明 | ✅ | ✅（Java 5+）| ❌ |

## 三、综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 顶类型清晰度 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| null 安全 | ⭐⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐⭐ |
| 通用性 | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ |

## 四、用例 1:1 对照（三环境实测结果）

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | Object 持有 class 实例 | ✅ compile-pass + runtime | ✅ 编译通过 + 运行通过 | ✅ AnyObject |
| 002 | Object 持有 int（装箱）| ✅ compile-pass + runtime | ✅ Integer 装箱 | ❌ Int 不是 AnyObject |
| 003 | Object 持有 string | ✅ compile-pass + runtime | ✅ 编译通过 | ✅ String 是 AnyObject |
| 004 | Object 拒绝 null | ✅ compile-fail | ⚠️ compile-pass（null 可赋给 Object） | ❌ AnyObject 不接受 nil |
| 005 | Object 拒绝 undefined | ✅ compile-fail | N/A | N/A |
| 006 | Object 调用 toString | ✅ runtime | ✅ runtime | ✅ runtime（需转型） |
| 007 | nullish (T\|null) 赋给 Object（compile-fail）| ✅ compile-fail | ⚠️ compile-pass | ✅ compile-fail（需 Any?） |

### 关键差异详解

#### 004: Object 拒绝 null ⭐

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `let o: Object = null;` | ❌ compile-fail（nullish 不兼容 Object） |
| Java | `Object o = null;` | ✅ compile-pass（null 是 Object 兼容的） |
| Swift | `var o: AnyObject = nil;` | ❌ compile-fail（需 AnyObject?） |

#### 007: nullish 赋给 Object ⭐

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `let nullable: Object \| null = null; let o: Object = nullable;` | ❌ compile-fail |
| Java | `Object nullable = null; Object o = nullable;` | ✅ compile-pass |
| Swift | `let nullable: AnyObject? = nil; let o: AnyObject = nullable!;` | ❌ compile-fail（需强制解包） |

## 五、对应规范

| 语言 | 规范 |
|------|------|
| ArkTS | §3.9 Type Object |
| Java | JLS §4.3.2 Object |
| Swift | TSPL: Type Casting (AnyObject) |
