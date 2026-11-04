# 4.2.1 Distinguishable by Signatures - 测试设计思维导图

## 概述
Same-name declarations are distinguishable by signatures if not overload-equivalent (§4.2.1).

## 子类型覆盖
### 1. Class method overloading
- 正向编译: 类中同名方法不同签名可区分
- 反向编译: —
- 运行时: —

### 2. Function overloading
- 正向编译: 函数同名不同签名可区分（在 4.2 主节已有覆盖）
- 反向编译: 重载等价签名报错（在 4.2 主节已有覆盖）
