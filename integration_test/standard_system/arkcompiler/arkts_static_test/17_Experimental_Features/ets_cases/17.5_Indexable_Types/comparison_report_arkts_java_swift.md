# 17.5 Indexable Types - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-23
**规范来源：** ArkTS Static Spec 17.5, Java JLS SE21 15.13 (Array Access), Swift Language Reference (Subscripts)
**测试基础：** 15 个用例（8 compile-pass + 4 compile-fail + 3 runtime）

---

## 一、概览：三语言定位

| 语言 | 索引类型系统定位 | 设计哲学 |
|------|------------|---------|
| **ArkTS** | 通过 $_get/$_set 特殊方法启用索引语法 | 方法签名驱动，编译器识别特殊方法名 |
| **Java** | **无用户自定义索引语法** | 操作符重载完全禁止，使用显式方法调用 |
| **Swift** | 通过 `subscript` 关键字定义索引 | 一等公民语法，类型安全 + 灵活参数 |

---

## 二、章节对应关系

| ArkTS 17.5 概念 | Java | Swift | 备注 |
|---------------|------|-------|------|
| $_get(index: int): T | N/A（用 arr[i] 或 list.get(i)） | `subscript(index: Int) -> T { get }` | Swift 最接近 |
| $_set(index: int, value: T): void | N/A（用 arr[i]=v 或 list.set(i,v)） | `subscript(index: Int) -> T { set }` | Swift 最接近 |
| 仅 $_get（只读索引） | N/A | get-only subscript | 功能等价 |
| 仅 $_set（只写索引） | N/A | N/A（Swift subscript 不支持仅 set） | ArkTS 独有 |
| $_get(key: string): T | Map.get(key) | `subscript(key: String) -> T` | 实现方式不同 |
| 接口中的抽象 $_get/$_set | N/A（Java interface 无此概念） | Protocol 中的 subscript 要求 | Swift 支持 |
| 泛型类中的索引 | N/A | 泛型 subscript | 都支持 |
| async $_get/$_set（应报错） | N/A | N/A | ArkTS 明确禁止 |

---

## 三、关键差异矩阵

### 3.1 索引语法定义方式

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 定义方式 | 特殊方法 `$_get` / `$_set` | N/A | `subscript` 关键字 |
| 编译器识别 | 按方法名识别 | N/A | 按关键字识别 |
| 参数限制 | int 或 string | N/A | 任意类型 |
| 返回类型 | 任意（$_get）/ void（$_set） | N/A | 任意 |
| get+set 语法 | 两个独立方法 | N/A | 一个 subscript 块内 get/set |
| 重载方式 | 有限（类层次或不同类） | N/A | 完全支持（一个类型内多个 subscript） |
| async 支持 | 禁止（ESY0220 编译错误） | N/A | N/A（async/await 但 subscript 不支持） |

### 3.2 索引能力对比

| 能力 | ArkTS | Java | Swift |
|------|-------|------|-------|
| int 索引 | obj[0] | arr[0] (仅数组) | obj[0] |
| string 索引 | obj["key"] | N/A (需 map.get) | obj["key"] |
| 只读索引 | $_get only | N/A | get-only subscript |
| 只写索引 | $_set only | N/A | 不支持 |
| 用户自定义类型索引 | 支持 | 不支持 | 支持 |
| 泛型索引 | 支持 | N/A | 支持 |
| 索引重载 | 有限 | N/A | 完全 |
| 索引嵌套 | obj[obj[0]] = obj[1] | N/A | 支持 |

### 3.3 错误处理

| 场景 | ArkTS | Java | Swift |
|------|-------|------|-------|
| async $_get | ESY0220 编译错误 | N/A | N/A |
| async $_set | ESY0220 编译错误 | N/A | N/A |
| 只读 obj[i]=v | ESE0250 编译错误 | N/A | 编译错误 (get-only) |
| 只写 v=obj[i] | ESE0250 编译错误 | N/A | N/A |
| 越界访问 | RangeError (运行时) | ArrayIndexOutOfBoundsException | fatalError |

---

## 四、用例 1:1 对照（含实测结果）

### 用例 001：基本索引读写

**ArkTS（实测通过）：**
```typescript
class MyIndexable {
  private data: string[] = ["a", "b", "c"]
  $_get(index: int): string { return this.data[index] }
  $_set(index: int, value: string): void { this.data[index] = value }
}
let obj = new MyIndexable()
let v: string = obj[0]    // calls $_get
obj[1] = "x"              // calls $_set
```

**Java（实测通过，但无 [] 语法）：**
```java
String[] arr = {"a", "b", "c"};
String v = arr[0];        // built-in array syntax
arr[1] = "x";             // built-in array syntax
// Java cannot define custom [] behavior for user classes
```

**Swift：**
```swift
struct MyStore {
    private var data = ["a", "b", "c"]
    subscript(index: Int) -> String {
        get { return data[index] }
        set { data[index] = newValue }
    }
}
var obj = MyStore()
let v = obj[0]            // calls subscript getter
obj[1] = "x"              // calls subscript setter
```

**结论：** ArkTS 和 Swift 都支持自定义索引语法；Java 仅支持内置数组索引。

---

### 用例 010：async $_get（编译失败）⭐

**ArkTS（实测）：**
```typescript
class AsyncGetIndexable {
  async $_get(index: number): Promise<string> {  // ESY0220 compile error
    return "value"
  }
}
```

**Java：** N/A（无此概念）

**Swift：** N/A（subscript 不支持 async）

**结论：** ArkTS 明确禁止 async 索引方法，与 Swift 设计一致。

---

### 用例 012：只读索引的写操作（编译失败）⭐

**ArkTS（实测）：**
```typescript
class ReadOnlyIdx {
  $_get(index: int): string { return "x" }
}
let obj = new ReadOnlyIdx()
obj[0] = "new"   // ESE0250: Object type doesn't have proper index access method
```

**Java：** N/A

**Swift：**
```swift
struct ReadOnlyIdx {
    subscript(index: Int) -> String { return "x" }
}
var obj = ReadOnlyIdx()
obj[0] = "new"   // error: Cannot assign through subscript: subscript is get-only
```

**结论：** ArkTS 和 Swift 都在编译期阻止对只读索引的写操作。

---

### 用例 021：字符串键索引 ⭐

**ArkTS（实测通过）：**
```typescript
class StringMap {
  $_get(key: string): string { return "value_" + key }
  $_set(key: string, value: string): void { /* store */ }
}
let v: string = map["name"]
map["age"] = "30"
```

**Java（无 [] 语法）：**
```java
Map<String, String> map = new HashMap<>();
map.put("name", "value_name");
String v = map.get("name");   // must use get(), not []
```

**Swift（支持）：**
```swift
struct StringMap {
    subscript(key: String) -> String {
        get { return "value_\(key)" }
        set { /* store */ }
    }
}
let v = map["name"]
map["age"] = "30"
```

**结论：** ArkTS 和 Swift 都支持字符串键索引；Java 必须使用显式方法调用。

---

## 五、三环境实测结果汇总

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | 基本 $_get+$_set | PASS | N/A (无此能力) | N/A (未安装) |
| 002 | 仅 $_get | PASS | N/A | N/A |
| 003 | 仅 $_set | PASS | N/A | N/A |
| 004 | 接口实现 | PASS | N/A | N/A |
| 005 | 子类重写 | PASS | N/A | N/A |
| 006 | 泛型类 | PASS | N/A | N/A |
| 007 | 字符串键 | PASS | N/A | N/A |
| 008 | 重载 | PASS | N/A | N/A |
| 010 | async $_get 拒绝 | FAIL (ESY0220) | N/A | N/A |
| 011 | async $_set 拒绝 | FAIL (ESY0220) | N/A | N/A |
| 012 | 只读写拒绝 | FAIL (ESE0250) | N/A | N/A |
| 013 | 只写读拒绝 | FAIL (ESE0250) | N/A | N/A |
| 020 | 运行时基本索引 | verified | verified | N/A |
| 021 | 运行时字符串索引 | verified | verified | N/A |
| 022 | 运行时泛型索引 | verified | N/A | N/A |

---

## 六、综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 自定义索引能力 | ⭐⭐⭐⭐ | ⭐ (仅数组内置) | ⭐⭐⭐⭐⭐ |
| 类型安全 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 语法简洁性 | ⭐⭐⭐⭐ | N/A | ⭐⭐⭐⭐⭐ |
| 重载灵活性 | ⭐⭐ (有限) | N/A | ⭐⭐⭐⭐⭐ (完全) |
| 只写索引支持 | ⭐⭐⭐⭐⭐ (独有) | N/A | ⭐ (不支持) |
| 参数类型灵活性 | ⭐⭐ (int/string) | N/A | ⭐⭐⭐⭐⭐ (任意) |
| async 安全 | ⭐⭐⭐⭐⭐ (明确禁止) | N/A | ⭐⭐⭐⭐⭐ |

---

## 七、核心结论

1. **ArkTS 索引类型与 Swift subscript 概念最接近**，都支持自定义 `[]` 语法
2. **ArkTS 使用特殊方法名 `$_get/$_set`** 而非 Swift 的 `subscript` 关键字，是特殊设计选择
3. **ArkTS 独有只写索引**（$_set only），Swift 不支持此模式
4. **ArkTS 索引参数类型受限**（int/string），Swift 支持任意类型
5. **ArkTS 不支持 TypeScript 风格的方法重载**语法，限制了同类型内的多参数索引
6. **Java 完全无此概念**，是最传统的设计

### ArkTS 设计建议

1. **借鉴 Swift**：考虑支持更灵活的索引参数类型（不仅仅是 int/string）
2. **借鉴 Swift**：支持同类型内的多 subscript 重载语法
3. **保持优势**：只写索引（$_set only）是特殊特性，保留
4. **文档明确**：spec 应明确 numeric 索引参数类型为 `int` 而非 `number`/`double`

---

## 八、对应规范文档

| 语言 | 规范来源 |
|------|---------|
| ArkTS | ArkTS Static Language Specification, 17.5 Indexable Types |
| Java | Java Language Specification SE21, 15.13 Array Access Expressions |
| Swift | The Swift Programming Language (Swift 5.x), Subscripts |
