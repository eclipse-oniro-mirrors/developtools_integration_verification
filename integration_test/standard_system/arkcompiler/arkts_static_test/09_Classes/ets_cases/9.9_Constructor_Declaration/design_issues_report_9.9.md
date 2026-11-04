# 9.9 Constructor Declaration - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**生成日期：** 2026-06-19

---

## 一、与业界静态语言的差异点

### 无新发现

本节的 10 个测试用例全部与预期一致，未发现新的 spec 与实现不一致。

请参考全局 issue_report.md 中的已知问题。

---

## 二、符合ArkTS spec的语言设计差异

### 2.1 构造器语法 ✅

ArkTS 的构造器语法完整支持：
- `constructor` 关键字 + 参数
- 参数默认值
- 访问修饰符约束（public/protected/private）
- native 构造器分号体

### 2.2 构造器访问修饰符 ✅

| 修饰符 | 行为 | 验证方式 |
|--------|------|---------|
| public | 外部可 new | CLS_09_09_001 |
| private | 外部不可 new（需静态工厂） | CLS_09_09_003 |
| protected | 子类可访问 | CLS_09_09_003 间接验证 |

### 2.3 构造器参数默认值 ✅

```typescript
class Config {
  constructor(host: string = "localhost", port: int = 8080) {}
}
// new Config() 使用默认值
// new Config("example.com") 部分提供
```

### 2.4 native 构造器约束 ✅

```typescript
class Bad {
  native constructor() { /* body */ }  // ❌ 编译错误
}
class Good {
  native constructor()  // ✅ 分号体
}
```
