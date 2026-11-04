# 14.4.3 Ambient Iterable — 测试设计思维导图

## 概述

Ambient iterable 声明 class 实例在 ambient 上下文中可迭代，提供 TypeScript 兼容性。

**核心规则：**
1. 语法：`[Symbol.iterator]() : returnType`
2. returnType 必须实现 Iterator 接口
3. 每 class 仅允许一个 iterable
4. 仅在 ambient 上下文中支持

## 文件命名规范
- 前缀：`AMB_`
- 章节：`14_04_03`
- PASS 001~003 → FAIL 004~006 → RUNTIME 007
