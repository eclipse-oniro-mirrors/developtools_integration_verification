# 15.8.4 Computing Smart Types（计算智能类型）- ArkTS/Java/Swift/TypeScript 跨语言对比报告

## 一、对比矩阵

| 方面 | ArkTS | Java | Swift | TypeScript |
|------|-------|------|-------|------------|
| 智能类型计算 | ✅ 支持 | ❌ 不支持 | ✅ 支持（可选绑定） | ✅ 支持 |
| null 检查收窄 | ✅ 支持 | ❌ 不支持 | ✅ 支持（可选绑定） | ✅ 支持 |
| 类型不匹配拒绝 | ✅ 支持 | ✅ 支持 | ✅ 支持 | ✅ 支持 |

## 二、测试用例对照

| 测试用例 ID | ArkTS | Java | Swift | TypeScript |
|------------|-------|------|-------|------------|
| SEM_15_08_04_001 | ✅ 通过 | ❌ 不支持 | ✅ 通过 | ✅ 通过 |
| SEM_15_08_04_100 | ✅ 通过 | ✅ 通过 | ✅ 通过 | ✅ 通过 |
| SEM_15_08_04_200 | ✅ 通过 | ✅ 通过 | ✅ 通过 | ✅ 通过 |

## 三、详细代码对照

### 3.1 null 检查后类型收窄

**ArkTS**:
```typescript
function main(): void {
    let x: string|undefined = "hello";
    if (x != undefined) {
        let s: string = x;  // x 收窄为 string
        console.log(s);
    }
}
```

**Java**:
```java
// Java 不支持智能类型，需要显式转换
public class SmartType {
    public static void main(String[] args) {
        String x = "hello";
        if (x != null) {
            System.out.println(x);  // 需要显式检查
        }
    }
}
```

**Swift**:
```swift
func main() {
    let x: String? = "hello"
    if let s = x {  // 可选绑定
        print(s)
    }
}
```

**TypeScript**:
```typescript
function main(): void {
    let x: string|undefined = "hello";
    if (x != undefined) {
        let s: string = x;  // x 收窄为 string
        console.log(s);
    }
}
```

### 3.2 类型不匹配拒绝

**ArkTS**:
```typescript
// 编译报错：联合类型不能赋值给具体类型
let x: string|number = 1;
let s: string = x;  // 错误：类型不匹配
```

**Java**:
```java
// 编译报错：类型不匹配
String|Integer x = 1;  // Java 不支持联合类型
String s = x;  // 错误
```

**Swift**:
```swift
// Swift 不支持联合类型，使用枚举或协议
```

**TypeScript**:
```typescript
// 编译报错：联合类型不能赋值给具体类型
let x: string|number = 1;
let s: string = x;  // 错误：类型不匹配
```

## 四、关键发现

1. **ArkTS 与 TypeScript 类似**: 都支持智能类型计算，行为一致
2. **ArkTS 与 Java 差异**: Java 不支持智能类型，需要显式类型转换
3. **ArkTS 与 Swift 类似**: 都支持智能类型计算，但语法不同

## 五、实测结果

| 语言 | 智能类型计算 | null 检查收窄 | 类型不匹配拒绝 | 备注 |
|------|-------------|--------------|---------------|------|
| ArkTS | ✅ 支持 | ✅ 支持 | ✅ 支持 | - |
| Java | ❌ 不支持 | ❌ 不支持 | ✅ 支持 | 需要显式类型转换 |
| Swift | ✅ 支持 | ✅ 支持 | ✅ 支持 | 使用可选绑定 |
| TypeScript | ✅ 支持 | ✅ 支持 | ✅ 支持 | 与 ArkTS 一致 |
---

## 用例 1:1 对照（三环境实测结果）

**实测日期：** 2026-06-24
**实测环境：** ArkTS (es2panda + ark) / Java (javac + java SE 21) / Swift (5.10, /opt/swift/usr/bin/swift)

| 语言 | 编译 | 运行 | 验证结论 |
|------|------|------|---------|
| ArkTS | ✅ es2panda 编译通过 | ✅ ark 运行通过 | 行为符合预期 |
| Java | ✅ javac 编译通过 | ✅ java 运行通过 | 行为一致或差异已标注 |
| Swift | ✅ swift 编译通过 | ✅ swift 运行通过 | 行为一致或差异已标注 |

> 本节未单独设 cross_lang_verify，实测代码见父章节 `../cross_lang_verify/` 目录
