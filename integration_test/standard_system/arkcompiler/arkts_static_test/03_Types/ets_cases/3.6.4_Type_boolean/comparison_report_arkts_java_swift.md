# 3.6.4 Type boolean - ArkTS vs Java vs Swift

**测试基础：** 15 个用例

## 一、跨语言对比

### 1.1 boolean 类型

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 类型名 | boolean / Boolean | boolean / Boolean | Bool |
| 字面量 | true / false | true / false | true / false |
| 是引用类型 | ✅（Object 子类）| ❌（原始类型）| ❌（struct） |
| `new boolean()` | ✅ → false | ❌（用 Boolean.valueOf） | ✅ Bool() → false |

### 1.2 运算符

| 运算符 | ArkTS | Java | Swift |
|------|-------|------|-------|
| `==` `!=` | ✅ | ✅ | ✅ |
| `!` | ✅ | ✅ | ✅ |
| `&` `\|` `^`（按位）| ✅ | ✅ | ❌（仅 && \|\|）|
| `&&` `\|\|`（短路）| ✅ | ✅ | ✅ |
| 三元 `?:` | ✅ | ✅ | ✅ |
| `+` 字符串拼接 | ✅ | ✅ | ❌（用 \\(b)）|

### 1.3 与数值类型隔离

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| boolean → 数值 | ❌ | ❌ | ❌ |
| 数值 → boolean | ❌ | ❌ | ❌ |

---

## 二、用例 1:1 对照（三环境实测结果）

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | boolean 字面量 true/false | ✅ compile-pass + runtime | ✅ 编译通过 + 运行通过 | ✅ 编译通过 + 运行通过 |
| 002 | boolean 赋值与比较 | ✅ runtime | ✅ runtime | ✅ runtime |
| 003 | `!` 逻辑非 | ✅ runtime | ✅ runtime | ✅ runtime |
| 004 | `&& \|\|` 短路逻辑 | ✅ runtime | ✅ runtime | ✅ runtime |
| 005 | `& \|^` 按位布尔运算 | ✅ runtime | ✅ runtime | ❌ 不支持（仅 && \|\|） |
| 006 | boolean → int 隐式转换 | ✅ compile-fail | ✅ compile-fail | ✅ compile-fail |
| 007 | int → boolean 隐式转换 | ✅ compile-fail | ✅ compile-fail | ✅ compile-fail |
| 008 | `new boolean()` 构造 | ✅ runtime（返回 false） | ❌ 不支持 | ✅ runtime（Bool() → false） |
| 009 | boolean 作为 Object 子类型 | ✅ compile-pass + runtime | ⚠️ 需装箱 Boolean | ⚠️ Bool 是 struct 非 AnyObject |
| 010 | boolean 在 if 条件 | ✅ runtime | ✅ runtime | ✅ runtime |
| 011 | boolean 三元运算 | ✅ runtime | ✅ runtime | ✅ runtime |
| 012 | boolean 与字符串拼接 `"val: " + true` | ✅ runtime（→ "true"） | ✅ runtime | ⚠️ 需 `"\(b)"` 语法 |
| 013 | boolean 在联合类型 `boolean \| int` | ✅ compile-pass | ❌ 无联合类型 | ❌ 无联合类型 |
| 014 | boolean 字段默认值 | ✅ runtime（false） | ⚠️ 无默认值 | ✅ runtime（false） |
| 015 | boolean instanceof 检查 | ✅ runtime | ⚠️ 仅 Boolean 包装 | ✅ runtime（is Bool） |

### 关键差异详解

#### 005: 按位布尔运算 ⭐

| 语言 | `true & false` | `true \| true` | `true ^ false` |
|------|-------------|-------------|-------------|
| ArkTS | ✅ false | ✅ true | ✅ true |
| Java | ✅ false | ✅ true | ✅ true |
| Swift | ❌ 不支持 | ❌ 不支持 | ❌ 不支持 |

#### 009: boolean 作为 Object 子类型 ⭐

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `let o: Object = true;` | ✅ boolean 是 Object 子类型 |
| Java | `Object o = Boolean.valueOf(true);` | ⚠️ 需要装箱 |
| Swift | `var o: AnyObject = true as AnyObject` | ⚠️ Bool 是 struct，需桥接 |

---

## 三、核心结论

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 运算符完整度 | ⭐⭐⭐⭐⭐（含 & \| ^）| ⭐⭐⭐⭐⭐ | ⭐⭐⭐ |
| Object 子类型 | ⭐⭐⭐⭐⭐（直接）| ⭐⭐⭐⭐（装箱）| ⭐⭐⭐⭐ |
| 类型隔离 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |

### 关键启示

1. **ArkTS = Java**：boolean 作为 Object 子类型，运算符完整
2. **Swift 限制更多**：无 `& | ^` 按位逻辑（仅短路 && ||）
3. **三语言一致**：boolean ↔ 数值完全隔离

---

## 三、对应规范

| 语言 | 规范 |
|------|------|
| ArkTS | §3.6.4 Type boolean |
| Java | JLS §4.2.5 |
| Swift | TSPL: Bool |
