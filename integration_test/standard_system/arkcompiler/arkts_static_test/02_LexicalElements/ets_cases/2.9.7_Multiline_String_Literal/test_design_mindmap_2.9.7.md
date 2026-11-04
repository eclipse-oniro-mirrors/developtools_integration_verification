# 2.9.7 Multiline String Literal - 测试设计思维导图

## 概述
Multiline strings 由反引号包围的任意文本组成。反斜杠 `\` 转义下一个字符。

**Spec 文法：**
```
MultilineStringLiteral:
  '`' (BackticksContentCharacter)* '`'
;
BackticksContentCharacter:
  ~[`\\\r\n]
  | '\\' EscapeSequence
  | LineContinuation
;
LineContinuation:
  '\\' [\r\n\u2028\u2029]+
;
```

---

## 全覆盖测试矩阵

### 维度 1：基本多行字符串

#### A. 基本语法
- **A1** 简单多行字符串（001）
- **A2** 空多行字符串（001）

### 维度 2：特殊字符

#### B. 换行符
- **B1** 包含换行符（002）

#### C. 转义序列
- **C1** 转义反引号（003）
- **C2** 转义反斜杠（003）
- **C3** 其余转义序列（003）

### 维度 3：行续接

#### D. 行续接
- **D1** 行续接语法（004）

### 维度 4：前导空格

#### E. 前导空格
- **E1** 前导空格保留（005）

### 维度 5：compile-fail

#### F. 非法格式
- **F1** 未转义的反引号（006）

### 维度 6：runtime

#### G. 运行时验证
- **G1** 多行字符串值验证（007）
- **G2** 转义序列值验证（008）
- **G3** 前导空格保留验证（009）

---

## 编号规划
- compile-pass: 001~005 (5个)
- compile-fail: 006 (1个)
- runtime: 007~009 (3个)

---

**最后更新：** 2026-06-21
