# 9.9.3 默认构造器 (Default Constructor) - 测试设计思维导图

## 概述
本节定义 **默认构造器 (Default Constructor)** 的隐式声明规则：

| 属性 | 规范 |
|------|------|
| 修饰符 | 隐式声明为 `public` |
| 参数 | 无参数 (parameterless) |
| 生成条件 | class 中无任何 constructor declaration |
| 目的 | 保证每个 class 至少有一个 constructor |
| body（非 Object 类） | (1) 调用父类无参 super() (2) 按声明顺序执行字段初始化器 |
| body（Object 类） | 空 body |

**核心约束：** 若 class 有 default constructor，但其 superclass 没有 accessible 无参 constructor，则发生 compile-time error。

## 测试点覆盖

### 1. 无显式构造器的独立类自动获得 public 默认构造器（PASS）⭐
- 类中不声明任何 constructor，可直接 `new` 实例化
- 默认构造器自动调用字段初始化器（int、string 等类型）
- 无 `extends` 子句的类隐式继承 `Object`，自动获得 public 默认构造器

### 2. 有父类的子类默认构造器链式调用（PASS）
- 父类有 accessible 无参构造器时，子类默认构造器自动插入 `super()` 调用
- 多层继承链：GrandParent -> Parent -> Child，各层默认构造器链式调用
- 字段初始化器按父到子顺序执行

### 3. 继承层次中多类型字段初始化器（RUNTIME）⭐
- int、string、boolean 等字段初始化器在默认构造器链中全部正确执行
- 验证父类字段初始化先于子类字段初始化
- 验证字段初始化器按类体中声明顺序执行

### 4. 反向：父类仅有 private 构造器（FAIL）
- 父类声明 `private constructor()`，子类无显式构造器
- 子类 default constructor 无法调用 inaccessible `super()`
- compile-time error

### 5. 反向：父类声明带参构造器后无无参构造器（FAIL）
- 父类声明 `constructor(p: int)`，不再有无参构造器
- 子类无显式构造器，default constructor 找不到可调用的无参 `super()`
- compile-time error

### 6. 反向：抽象父类仅含带参构造器（FAIL）
- `abstract class` 父类声明 `constructor(p: string)`
- 子类 `extends` 后无显式构造器
- default constructor 找不到 parameterless super constructor
- compile-time error

### 7. 边界值与边缘场景
- 空类（无字段无方法）的默认构造器
- 仅有方法、无字段的类默认构造器
- 字段初始化器含复杂表达式（如函数调用）的执行顺序
- 同时有实例字段初始化器和静态字段初始化器时的执行顺序
- default constructor 的 `public` 修饰符是否可被 override 或被覆盖
- 嵌套类（inner class / nested class）的默认构造器行为
- 泛型类的默认构造器

### 8. 运行时验证
- 默认构造器实例化后字段值正确性验证（int、string、boolean 多类型）
- 三层继承默认构造器链式调用，每层字段初始化值验证
- 继承层次中父到子字段初始化顺序验证

## 编号规划
| 分类 | 编号范围 | 说明 |
|------|---------|------|
| compile-pass | 001 ~ 003 | CLS_09_09_008 ~ CLS_09_09_012 范围内的 pass 用例 |
| compile-fail | 004 ~ 006 | CLS_09_09_009, CLS_09_09_014, CLS_09_09_050 |
| runtime | 007 ~ 009 | CLS_09_09_010, CLS_09_09_013, CLS_09_09_015 |

## 用例清单（9 total: 3P + 3F + 3R）

| # | 用例 ID | 测试内容 | 分类 |
|---|---------|---------|------|
| 001 | CLS_09_09_008 | 无显式构造器的类自动获得 public 隐式默认构造器 | compile-pass |
| 002 | CLS_09_09_011 | 父类有可访问无参构造器，子类自动获得默认构造器 | compile-pass |
| 003 | CLS_09_09_012 | 无 extends 的类隐式继承 Object，自动获得 public 默认构造器 | compile-pass |
| 004 | CLS_09_09_009 | 父类仅有 private 构造器，子类默认构造器无法调用 super() | compile-fail |
| 005 | CLS_09_09_014 | 父类声明带参构造器后无无参构造器，子类默认构造器编译失败 | compile-fail |
| 006 | CLS_09_09_050 | 抽象父类仅含带参构造器，子类 extends 无显式构造器编译失败 | compile-fail |
| 007 | CLS_09_09_010 | 默认构造器正确执行字段初始化器（int、string） | runtime |
| 008 | CLS_09_09_013 | 三层继承默认构造器链式调用，字段初始化按父到子顺序 | runtime |
| 009 | CLS_09_09_015 | 继承层次中多类型字段（int、string、boolean）初始化器全部正确执行 | runtime |

## 文件命名规范

`CLS_09_09_NNN_{CATEGORY}_{DESCRIPTION}.ets`

- **前缀**: `CLS_09_09` — Classes 章节 9.9 Constructor Declaration（与 9.9.1/9.9.2/9.9.3 共用 CLS_09_09 前缀）
- **NNN**: 3-digit 序号（008 ~ 050 区间，复用已分配 ID）
- **CATEGORY**: `PASS` / `FAIL` / `RUNTIME`
- **DESCRIPTION**: 下划线分隔的英文简短描述，全大写

示例：
- `CLS_09_09_008_PASS_DEFAULT_CONSTRUCTOR.ets`
- `CLS_09_09_009_FAIL_NO_ACCESSIBLE_SUPER_CTOR.ets`
- `CLS_09_09_010_RUNTIME_DEFAULT_CTOR_FIELD_INIT.ets`

## Spec 核心规则引用

| 规则 | 来源 |
|------|------|
| 无 constructor declaration 则隐式声明 default constructor | spec/classes.md L2112-2114 |
| default constructor 修饰符为 `public` | spec/classes.md L2116 |
| default constructor 无参数 | spec/classes.md L2118 |
| body 含父类无参 super() 调用 + 字段初始化器按序执行 | spec/classes.md L2120-2124 |
| Object 类的 default constructor body 为空 | spec/classes.md L2126-2127 |
| superclass 无 accessible 无参 constructor 则 compile-time error | spec/classes.md L2129-2131 |
