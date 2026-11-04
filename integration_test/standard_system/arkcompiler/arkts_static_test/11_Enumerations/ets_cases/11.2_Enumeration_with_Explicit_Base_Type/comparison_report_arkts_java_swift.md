# 11.2 Enumeration with Explicit Base Type - ArkTS vs Java vs Swift 对比报告

## 实测

| 语言 | 结果 |
|------|------|
| ArkTS | ✅ 8/8 |
| Java | ✅ pass=3 |
| Swift | ✅ pass=3 |

## 对比

| 显式基类 | ArkTS | Java | Swift |
|---------|-------|------|-------|
| double | ✅ `enum E: double` | ❌ 需构造器+字段 | ✅ `: Double` |
| float | ✅ `enum E: float` | ❌ | ❌ |
| long | ✅ `enum E: long` | ❌ | ❌ |
| byte/short | ✅ | ❌ | ❌ |
| string | ✅ `enum E:string` | ❌ 需 .name() / 自定义 | ✅ `: String` |
| Object 非法 | ✅ 编译错误 | N/A | N/A |
| 非 int 缺初始化器 | ✅ 编译错误 | ❌ 错误语义不同 | ❌ rawValue 需显式 |