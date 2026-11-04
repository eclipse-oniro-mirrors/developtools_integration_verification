# 14.8 Ambient Accessor Declarations — 测试设计思维导图

## 概述

Ambient accessor declarations 使用 `declare get` / `declare set` 声明在别处定义的访问器。

**核心规则：**
1. `get` 语法：`'get' identifier '(' receiverParameter? ')' returnType`
2. `set` 语法：`'set' identifier '(' (receiverParameter ',')? requiredParameter ')'`
3. ❌ `get` 缺返回类型 → compile-time error

## 文件命名规范
- 前缀：`AMB_`
- 章节：`14_08`
- PASS 001~004 → FAIL 005~006 → RUNTIME 007
