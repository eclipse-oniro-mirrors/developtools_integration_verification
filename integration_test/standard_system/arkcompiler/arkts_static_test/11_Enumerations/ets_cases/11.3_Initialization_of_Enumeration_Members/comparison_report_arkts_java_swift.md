# 11.3 Initialization of Enumeration Members - ArkTS vs Java vs Swift 对比报告

## 实测

| 语言 | 结果 |
|------|------|
| ArkTS | ✅ 8/8 |
| Java | ✅ pass=3 |
| Swift | ✅ pass=2 |

## 对比

| 初始化行为 | ArkTS | Java | Swift |
|-----------|-------|------|-------|
| 自动递增 0,1,2 | ✅ | ❌ 需构造器 | ❌ 需显式 rawValue |
| `Blue=5` 后 `Green`=6 | ✅ | ❌ | ❌ |
| long/byte 基类自动递增 | ✅ | ❌ | ❌ |
| string 基类必须显式 | ✅ | ❌ | ✅ |
| 非 const 初始化器后必须显式 | ✅ | ❌ | ❌ |