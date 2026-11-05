# 10.6 Interface Inheritance - 测试设计思维导图

## 概述
Interface inherits all members from direct superinterfaces. Multiple inheritance merges same-named properties/methods.

## 子类型覆盖
### 1. Single inheritance chain
- 正向编译: 接口继承链

### 2. Diamond inheritance
- 正向编译: 菱形继承（多个父接口有相同成员）

### 3. Interface type variable
- 正向编译: 接口类型变量赋值实现类实例

### 4. Combined interface-class hierarchy
- 正向编译: 类实现接口 + 类继承

### 5. compile-fail
- 反向编译: 继承 getter-only 写拒绝
- 反向编译: 继承 setter-only 读拒绝
- 反向编译: 多继承 setter-only 读拒绝
- 反向编译: 多继承 getter-only 写拒绝

### 6. runtime
- 运行时: 继承链方法解析
