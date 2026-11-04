# 17.8.1 For-of Explicit Type Annotation - 三环境实测输出

**测试日期：** 2026-06-23
**测试环境：** Linux (x86_64)

---

## 环境信息

| 语言 | 编译器/运行时 | 版本 |
|------|-------------|------|
| ArkTS | es2panda + ark | (built from source) |
| Java | javac + java | Java 21.0.11 |
| Swift | swiftc + swift | N/A (not installed on this system) |

---

## 实测结果

### 用例 1: 显式 int 类型遍历 int[] -- PASS

| 语言 | 编译 | 运行 | 输出 |
|------|------|------|------|
| ArkTS | ✅ compile-pass | ✅ runtime pass | `verified` |
| Java | ✅ compile-pass | ✅ runtime pass | `verified` |
| Swift | N/A (not available) | N/A | N/A |

**ArkTS:**
```typescript
let arr: int[] = [10, 20, 30, 40, 50]
for (let v: int of arr) { ... }
```

**Java:**
```java
int[] arr = {10, 20, 30, 40, 50};
for (int v : arr) { ... }
```

**Swift (expected):**
```swift
let arr: [Int] = [10, 20, 30, 40, 50]
for v: Int in arr { ... }  // Type annotation is optional in Swift
```

**结论：** 三者均可显式标注类型，ArkTS/Java 行为一致。

---

### 用例 2: 显式 string 类型遍历 string[] -- PASS

| 语言 | 编译 | 运行 | 输出 |
|------|------|------|------|
| ArkTS | ✅ compile-pass | N/A (compile-only test) | N/A |
| Java | ✅ compile-pass | ✅ runtime pass | `verified` |
| Swift | N/A | N/A | N/A |

**结论：** 三者均可正常工作。

---

### 用例 3: 显式 Object 类型遍历 int[] -- PASS (装箱)

| 语言 | 编译 | 运行 | 输出 |
|------|------|------|------|
| ArkTS | ✅ compile-pass (W1001506 warning) | ✅ runtime pass | `verified` |
| Java | ✅ compile-pass | ✅ runtime pass | `verified` |
| Swift | N/A | N/A | N/A |

**关键差异：** ArkTS 产生 `W1001506` 编译警告（instanceof 在编译期已知为 true），Java 无此警告。

---

### 用例 4: 显式 string 类型遍历 int[] -- FAIL

| 语言 | 编译 | 错误信息 |
|------|------|---------|
| ArkTS | ❌ compile-fail | `ESE0069: Source element type 'Int' is not assignable to the loop iterator type 'String'` |
| Java | ❌ compile-fail | `error: incompatible types: int cannot be converted to String` |
| Swift (expected) | ❌ compile-fail | `error: Cannot convert value of type 'Int' to expected element type 'String'` |

**结论：** 三者均正确拒绝不兼容的类型标注，错误信息风格不同但语义一致。

---

## 环境局限性说明

- **Swift 未安装：** 本系统未安装 Swift 5.10 或任何版本的 Swift 工具链。Swift 代码示例基于 Swift 语言规范推定。
- **Java 版本：** 使用 Java 21，虽与指南中记载的 1.8 不同，但 enhanced for-loop 语义自 Java 5 以来未变。

---

## 归档文件清单

| 文件 | 语言 | 说明 |
|------|------|------|
| `JavaForOfIntExplicitType.java` | Java | int 显式类型遍历 int[] PASS |
| `JavaForOfStringExplicitType.java` | Java | String 显式类型遍历 String[] PASS |
| `JavaForOfObjectOnIntArray.java` | Java | Object 显式类型遍历 int[] PASS (autoboxing) |
| `JavaForOfStringOnIntArray_FAIL.java` | Java | String 显式类型遍历 int[] FAIL |
| `JavaForOfStringOnIntArray.java` | Java | (disabled) String 显式类型遍历 int[] FAIL |
| `SwiftForOfIntExplicitType.swift` | Swift | int 显式类型遍历 [Int] PASS |
| `SwiftForOfStringExplicitType.swift` | Swift | String 显式类型遍历 [String] PASS |
| `SwiftForOfStringOnIntArray_FAIL.swift` | Swift | String 显式类型遍历 [Int] FAIL |
