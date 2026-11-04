# 10.4 Interface Properties - 测试设计思维导图

## 概述
Interface property is an accessor in field/getter/setter form. Required property (no ?) implies getter+setter or getter-only (if readonly). Optional property (? syntax) has effective type T|undefined.

## 子类型覆盖
### 1. Required property (field form)
- 正向编译: readonly required property
- 正向编译: readwrite required property

### 2. Required property (accessor form)
- 正向编译: getter 声明
- 正向编译: setter 声明
- 正向编译: getter+setter 对

### 3. Optional property (10.4.2)
- 正向编译: ? 语法 optional 属性

### 4. Getter-only / setter-only access restriction
- 反向编译: 赋值给 getter-only 属性
- 反向编译: 读取 setter-only 属性
