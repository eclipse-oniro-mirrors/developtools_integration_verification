# 17.5 Indexable Types - ArkTS 与 Java/Swift 行为差异及规范一致性报告

**报告日期：** 2026-06-23
**测试用例数：** 15（compile-pass: 8, compile-fail: 4, runtime: 3）
**目的：** 通过用例执行（编译期 + 真实运行时）以及 Java/Swift 对比，确认 ArkTS 行为与 spec 的一致性，并记录语言设计差异和待确认问题。

---

## 一、Spec 与实现不一致

### 不一致 A：索引参数类型为 int 而非 number ⭐

**用例：** EXP2_17_05_001~008, 020, 022

**ArkTS spec 依据：**
17.5 Indexable Types: "Index parameter can be string or number type"

**ArkTS 实测行为：**
```typescript
// Spec says "number", implementation requires "int"
class Test {
  $_get(index: number): string { ... }   // ❌ 编译错误: Double incompatible with Int
  $_get(index: int): string { ... }      // ✅ 编译通过
}
```

使用 `number`（即 `double`）作为索引参数类型时，编译器报错：
```
ESE0046: Type 'Double' is not compatible with type 'Int' at index 1
```

**说明：**
当前 es2panda 实现中，`obj[0]` 的字面量 `0` 被推断为 `Double` 类型，但 $_get 的参数期望类型为 `Int`。这表明编译器内部将用户声明的 `index: number` 解释为 `index: double`，而数组字面量 `0` 在索引上下文被推为 `Int`。最终匹配失败。

所有用例已改为使用 `int` 作为索引参数类型以通过编译。

**跨语言对比：**

| 语言 | 索引参数类型 | 行为 |
|------|-----------|------|
| ArkTS | spec 说 number，实现要求 int | spec/实现不一致 |
| Java | N/A (无用户自定义索引) | N/A |
| Swift | 任意类型 (Int, String, 自定义等) | 完全灵活 |

**分类：** D 类（Spec 与实现不一致）

**建议：**
1. 更新 spec 17.5 明确 numeric 索引参数类型为 `int`（而非 `number`/`double`）
2. 或修改 es2panda 实现，使 `$_get(index: number)` 接受 `double` 类型的字面量参数
3. 无论采用哪种方案，spec 与实现应保持一致

---

### 不一致 B：不支持 TypeScript 风格的方法重载语法 ⭐

**用例：** EXP2_17_05_008_PASS_OVERLOAD（原始版本编译失败）

**ArkTS spec 依据：**
17.5 Indexable Types: "Can be overloaded with explicit overloads"

**ArkTS 实测行为：**
```typescript
class Test {
  $_get(index: int): string          // ❌ ESE0017: Only abstract or native methods can't have body
  $_get(index: string): string       // ❌ 同上
  $_get(index: int | string): string { ... }
}
```

**说明：**
ArkTS 不支持 TypeScript 风格的方法重载签名（无方法体的声明后跟有方法体的实现）。当前实现要求无方法体的方法声明必须是 `abstract` 或 `native`。

变通方案是在不同类中分别定义不同参数类型的 $_get，或使用抽象类的 abstract 声明。

**跨语言对比：**

| 语言 | 方法重载 | 索引重载 |
|------|---------|---------|
| ArkTS | 不支持 TS 风格重载签名 | 需用不同类实现不同索引类型 |
| Java | 支持方法重载（不同参数） | N/A |
| Swift | 支持 subscript 重载（不同类型） | 同一类型内多个 subscript |

**分类：** D 类（Spec 与实现不一致）

**建议：**
1. 如果 ArkTS 计划不支持 TS 风格重载语法，应更新 spec 移除 "explicit overloads" 描述
2. 或实现 TS 风格重载语法支持（允许无方法体声明 + 有方法体实现）
3. 当前可通过不同类分别定义不同参数类型的索引方法来模拟重载

---

## 二、符合 ArkTS spec 的设计差异

### 差异 C：$_set 返回类型必须为 void（符合 spec）

**用例：** EXP2_17_05_011_FAIL_ASYNC_SET

**ArkTS 实测行为：**
```typescript
class Test {
  async $_set(index: int, value: string): Promise<void> { ... }
  // ESY0220: The special predefined method '$_set' cannot be asynchronous.
  // ESE0094: The special predefined method '$_set' should have void return type.
}
```

**分类：** 符合 ArkTS spec 的语言设计

---

### 差异 D：async $_get/$_set 被正确拒绝（符合 spec）

**用例：** EXP2_17_05_010_FAIL_ASYNC_GET, EXP2_17_05_011_FAIL_ASYNC_SET

**ArkTS 实测行为：**
```typescript
class Test {
  async $_get(index: int): Promise<string> { ... }
  // ESY0220: The special predefined method '$_get' cannot be asynchronous.
}
```

**跨语言对比：**

| 语言 | async 索引方法 |
|------|--------------|
| ArkTS | 明确禁止 (ESY0220 编译错误) |
| Java | N/A |
| Swift | N/A (subscript 不支持 async) |

**分类：** 符合 ArkTS spec 的语言设计

---

### 差异 E：只读/只写索引的编译期保护（符合 spec）

**用例：** EXP2_17_05_012_FAIL_READ_ONLY_WRITE, EXP2_17_05_013_FAIL_WRITE_ONLY_READ

**ArkTS 实测行为：**
```typescript
class ReadOnlyIdx {
  $_get(index: int): string { return "x" }
}
let obj = new ReadOnlyIdx()
obj[0] = "new"  // ESE0250: Object type doesn't have proper index access method.

class WriteOnlyIdx {
  $_set(index: int, value: string): void { }
}
let w = obj[0]  // ESE0250: Object type doesn't have proper index access method.
```

**跨语言对比：**

| 语言 | 只读索引写保护 | 只写索引读保护 |
|------|-------------|-------------|
| ArkTS | ESE0250 编译错误 | ESE0250 编译错误 |
| Java | N/A | N/A |
| Swift | 编译错误 (get-only subscript) | N/A (不支持只写) |

**分类：** 符合 ArkTS spec 的语言设计（ArkTS 独有的只写索引保护）

---

## 三、已验证 ArkTS 行为（与规范一致）

| 行为 | 用例编号 | 状态 |
|------|---------|------|
| int 索引基本读写 | 001, 020 | PASS |
| 仅 $_get 只读索引 | 002 | PASS |
| 仅 $_set 只写索引 | 003 | PASS |
| 接口中定义抽象 $_get/$_set | 004 | PASS |
| 子类重写 $_get | 005 | PASS |
| 泛型类中的索引操作 | 006, 022 | PASS |
| 字符串键索引读写 | 007, 021 | PASS |
| 不同类实现不同参数类型索引 | 008 | PASS |
| async $_get 编译拒绝 | 010 | PASS (ESY0220) |
| async $_set 编译拒绝 | 011 | PASS (ESY0220) |
| 只读索引写保护 | 012 | PASS (ESE0250) |
| 只写索引读保护 | 013 | PASS (ESE0250) |

---

## 四、分类汇总

| 分类 | 条目 |
|------|------|
| Spec 与实现不一致 | A (索引参数类型), B (重载语法) |
| 符合 ArkTS spec 的语言设计差异 | C, D, E |
| 已验证规范一致行为 | 12 项 |

---

## 五、后续建议

1. **Spec 更新**：将 17.5 中 "Index parameter can be string or number type" 改为 "Index parameter can be string or int type"，明确 numeric 索引为 `int`
2. **重载语法**：澄清 "Can be overloaded with explicit overloads" 的具体含义和语法，或移除该表述
3. **Swift 对齐**：考虑支持更广泛的索引参数类型（如 `float`、自定义类型），提升灵活性
4. **跨语言文档**：在 spec 中增加与 Swift subscript 的对比说明，帮助有 Swift 背景的开发者理解差异
