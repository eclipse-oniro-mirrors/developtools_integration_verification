# 15.2.1 Subtyping for Non-Generic Classes and Interfaces - 测试设计思维导图

## 1. 测试范围

验证非泛型子类型：类 extends、接口 extends、自继承拒绝、运行时多态派发。

### 1.1 测试目标

- 验证非泛型类 `extends` 产生直接子类型关系（`class B extends A → B <: A`）
- 验证接口 `extends` 产生直接子类型关系（`interface I extends J → I <: J`）
- 验证类不可 `extends` 自身（编译错误）
- 验证非泛型子类型运行时调用（父类引用调用子类方法）

### 1.2 测试要点

- 类 extends 子类型关系
- 接口 extends 子类型关系
- 多接口继承
- 自继承拒绝
- 运行时多态派发

## 2. 测试用例设计

### 2.1 编号规划

| 编号前缀 | 含义 | 示例 |
|---------|------|------|
| SEM_15_02_001 ~ SEM_15_02_010 | compile-pass 用例 | SEM_15_02_001_PASS_CLASS_EXTENDS_SUBTYPE |
| SEM_15_02_011 ~ SEM_15_02_020 | compile-fail 用例 | SEM_15_02_014_FAIL_SELF_EXTENDS |
| SEM_15_02_021 ~ SEM_15_02_030 | runtime 用例 | SEM_15_02_015_RUNTIME_SUBTYPE |

### 2.2 文件命名规范

- 格式：`SEM_15_02_XXX_PASS/FAIL/RUNTIME_描述.ets`
- 示例：`SEM_15_02_01_001_PASS_CLASS_EXTENDS_SUBTYPE.ets`
- 编号规则：`SEM` + `15_02` + `3位序号` + `类型` + `描述`

## 3. 测试点分解

### 3.1 类 extends 子类型关系

| 测试点 | 用例编号 | 测试内容 |
|--------|---------|---------|
| 类 extends 产生子类型 | SEM_15_02_001 | `class B extends A → B <: A`，B 可赋值给 A 类型变量 |

### 3.2 接口 extends 子类型关系

| 测试点 | 用例编号 | 测试内容 |
|--------|---------|---------|
| 接口 extends 产生子类型 | SEM_15_02_002 | `interface I extends J → I <: J`，I 可赋值给 J 类型变量 |
| 多接口继承 | SEM_15_02_002 | `interface ReadWrite extends Readable, Writable`，支持多接口继承 |

### 3.3 自继承拒绝

| 测试点 | 用例编号 | 测试内容 |
|--------|---------|---------|
| 类不可 extends 自身 | SEM_15_02_014 | `class A extends A` 应编译错误 |

### 3.4 运行时多态派发

| 测试点 | 用例编号 | 测试内容 |
|--------|---------|---------|
| 父类引用调用子类方法 | SEM_15_02_015 | `let a: Animal = new Dog(); a.speak()` 应调用 Dog.speak() |

## 4. 覆盖情况

### 4.1 已覆盖测试点

- [x] 类 extends 产生子类型关系
- [x] 接口 extends 产生子类型关系
- [x] 多接口继承
- [x] 自继承拒绝
- [x] 运行时多态派发

### 4.2 待覆盖测试点

- [ ] 接口不可 extends 自身
- [ ] 类与接口之间的子类型关系（类 implements 接口）
- [ ] 多层继承的子类型关系


## 最新设计要点

从章节思维导图同步的最新测试设计点：

- class extends
- interface extends
- transitive closure
- Object as implicit supertype

## 5. 测试用例清单

| 编号 | 用例文件 | 类型 | 测试点 |
|------|---------|------|--------|
| SEM_15_02_001 | SEM_15_02_01_001_PASS_CLASS_EXTENDS_SUBTYPE.ets | compile-pass | 类 extends 产生子类型关系 |
| SEM_15_02_002 | SEM_15_02_01_002_PASS_INTERFACE_EXTENDS_SUBTYPE.ets | compile-pass | 接口 extends 产生子类型关系 |
| SEM_15_02_014 | SEM_15_02_01_100_FAIL_SELF_EXTENDS.ets | compile-fail | 自继承拒绝 |
| SEM_15_02_015 | SEM_15_02_01_200_RUNTIME_SUBTYPE.ets | runtime | 运行时多态派发 |

## 6. 交叉引用

- 15.2 Subtyping (父章节)
- 9 Classes (相关章节)
- 10 Interfaces (相关章节)
