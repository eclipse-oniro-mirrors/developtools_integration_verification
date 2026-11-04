# 3.22 Default Values - ArkTS vs Java vs Swift 对比报告

| 默认值 | ArkTS | Java（实测） | Swift |
|-------|-------|-------------|-------|
| int 默认 | 0 | 0（字段） | N/A |
| boolean 默认 | false | false（字段） | N/A |
| 引用类型默认 | ❌ 无默认 | null（字段） | N/A |
| 类字段 T\|undefined | undefined | null | Optional 默认 nil |
| 本地变量 | 必须赋值后用 | 必须赋值后用 | 必须初始化 |