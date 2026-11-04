# 3.21.5 Readonly Utility Type - ArkTS vs Java vs Swift 对比报告

## 实测

| 语言 | 结果 |
|------|------|
| ArkTS | ✅ 8/9 |
| Java | ✅ N/A pass=1 |
| Swift | ✅ N/A pass=1 |

## 对比

| Readonly 类型 | ArkTS | Java | Swift |
|-------------|-------|------|-------|
| Readonly<T> | ✅ | ❌ | ❌ |
| 模拟方式 | Readonly\<I\> | final / unmodifiable | let 常量绑定 |