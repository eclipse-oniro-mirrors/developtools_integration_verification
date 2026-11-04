# 4.3 Scopes - 测试设计思维导图

## 概述
Scope is the region of program text where an entity is declared and can be used. Different entities have different scope levels: module, namespace, class, interface, function/method, block.

## 子类型覆盖
### 1. Module level scope
- 正向编译: 模块内从声明点到末尾可访问
- 运行时: 跨函数访问模块变量

### 2. Namespace level scope
- 正向编译: namespace 变量从声明点到 namespace 结束可访问，并覆盖嵌套 namespace
- 反向编译: namespace 外部实体必须遵循可访问性和限定名规则

### 3. Class level scope
- 正向编译: 类中成员通过 this/super/类名/实例访问
- 反向编译: 实例成员通过类名访问

### 4. Block scope
- 正向编译: 块内声明和引用
- 反向编译: 块外引用块内变量

### 5. Scope overlapping (shadowing)
- 正向编译: 内层声明覆盖外层
- 反向编译: 对外层不可访问

### 6. Function scope
- 正向编译: 参数和函数体内声明
- 反向编译: 声明前引用

## 文件命名规范
- NAM_04_03_YYY_{CATEGORY}_{DESCRIPTION}.ets
