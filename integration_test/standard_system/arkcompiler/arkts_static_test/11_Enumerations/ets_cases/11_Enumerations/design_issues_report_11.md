# 11 Enumerations - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

| 行为 | 用例 | 结果 |
|------|------|------|
| int 枚举基本声明 | 001 | ✅ |
| string 基类枚举 | 002 | ✅ |
| empty enum | 003 | ✅ |
| 成员名唯一 | 009 | ✅ |
| const enum 暂不支持 | 010 | ✅ |
| 混合基类型拒绝 | 011 | ✅ |
| string 缺初始化器拒绝 | 012 | ✅ |
| 初始化器省略 qualification | 013 | ✅ |
| 自动递增 | 014 | ✅ |
| 隐式 int 转数值 | 005 | ✅ |
| 显式基类 | 006 | ✅ |
| 限定名访问 | 007 | ✅ |
| 导出 | 008 | ✅ |
| values/getValueOf/fromValue | 015 | ✅ |
| 运行时 int 转换 | 016 | ✅ |

## 跨语言对比

| 枚举功能 | ArkTS | Java（实测） | Swift（实测） |
|---------|-------|-------------|---------------|
| 基本 int enum | ✅ | ✅ | ✅ |
| string rawValue | ✅ | ✅ | ✅ |
| 隐式数值转换 | ✅ | ❌ | ❌ |
| values() | ✅ FixedArray | ✅ array | ✅ allCases |
| getValueOf() | ✅ | ✅ valueOf | init?(rawValue:) |
| fromValue() | ✅ | ❌ 无 | ❌ |
| getName() | ✅ | ✅ name() | String(describing:) |
| exported members | ✅ | ✅ | ✅ |