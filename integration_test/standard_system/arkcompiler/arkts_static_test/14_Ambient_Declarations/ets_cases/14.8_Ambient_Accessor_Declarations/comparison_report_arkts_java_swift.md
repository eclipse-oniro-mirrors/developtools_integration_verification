# 14.8 Ambient Accessor Declarations — 跨语言对比报告

## 1. 概览

| 语言 | 访问器声明 |
|------|-----------|
| ArkTS | ✅ `declare get` / `declare set` |
| Java | ✅ getter/setter 方法 |
| Swift | ✅ 计算属性 get/set |

## 2. 章节对应关系

| ArkTS 14.8 | Java | Swift |
|-----------|------|-------|
| `declare get name(): string` | `String getName()` | `var name: String { get }` |
| `declare set name(val: string)` | `void setName(String val)` | `var name: String { set }` |
| 缺返回类型 → compile-time error | `String` 返回类型必须 | `-> String` 必须 |

## 3. 关键差异矩阵

| 特性 | ArkTS | Java | Swift |
|------|-------|------|-------|
| get 声明 | ✅ `declare get` | ✅ getter 方法 | ✅ 计算属性 |
| set 声明 | ✅ `declare set` | ✅ setter 方法 | ✅ 计算属性 |
| 返回类型校验 | ✅ compile-time error | ✅ 编译期 | ✅ 编译期 |
| 参数默认值校验 | ✅ compile-time error | ✅ 不支持 | ✅ 不支持 |
| namespace 内支持 | ✅ | N/A | N/A |

## 4. 三环境实测结果

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | get string | ✅ compile-pass | ✅ | ✅ |
| 002 | set string | ✅ compile-pass | ✅ | ✅ |
| 003 | get int | ✅ compile-pass | ✅ | ✅ |
| 004 | namespace 中 get | ✅ compile-pass | N/A | N/A |
| 005 | get 无返回类型 | ✅ compile-fail | N/A | N/A |
| 006 | set 参数默认值 | ✅ compile-fail | N/A | N/A |
| 007 | runtime | ✅ runtime | N/A | N/A |

## 5. 关键差异详解

### 声明 vs 实现

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `declare get name(): string` | ✅ 仅声明类型，无实现体 |
| Java | `String getName() { return name; }` | ⚠️ 声明+实现一体 |
| Swift | `var name: String { get { ... } }` | ⚠️ 声明+实现一体 |

## 6. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 声明简洁性 | ⭐⭐⭐（单行 declare） | ⭐⭐（完整方法） | ⭐⭐（计算属性） |
| 返回类型校验 | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ |
| 参数默认值校验 | ⭐⭐⭐ | N/A | N/A |

## 7. 核心结论

所有测试通过。编译器正确实施了 get 返回类型和 set 参数默认值校验。Ambient accessor 与 Java getter/setter、Swift 计算属性概念对应。

## 8. ArkTS 设计建议

保持当前实现 — 所有校验均已正确实施。
