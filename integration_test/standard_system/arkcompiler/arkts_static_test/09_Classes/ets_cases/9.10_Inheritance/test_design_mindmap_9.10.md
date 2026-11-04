# 9.10 继承 - 测试设计思维导图

## 概述
本节定义 **继承 (Inheritance)** 机制，包括：class 通过 `extends` 继承父类成员（fields, methods, accessors），通过 `implements` 实现接口约束，以及成员重写 (override) 规则。

**核心语义：**
- 子类继承父类所有非静态可访问成员（public / protected），**private 和 static 成员不被继承**
- 派生类重写基类方法/字段必须使用 `override` 关键字显式声明
- 重写方法签名必须满足 **override-compatible**：参数逆变 (contravariance) + 返回类型协变 (covariance)
- 重写字段类型必须与基类字段类型 **完全相同**，访问修饰符也必须一致
- 父类构造函数不被继承，子类必须通过 `super()` 显式或隐式调用父类构造函数
- 非抽象子类必须实现所有继承的抽象方法 / 接口方法

## 核心规则

### 继承范围 (Inheritance Scope)
| 成员类型 | 是否被继承 | 说明 |
|---------|----------|------|
| public field/method/accessor | ✅ 继承 | 子类可直接访问 |
| protected field/method/accessor | ✅ 继承 | 子类方法内可访问，外部不可见 |
| private field/method | ❌ 不继承 | 仅父类自身可访问，但可通过父类 public 方法间接访问 |
| static field/method | ❌ 不继承 | 仅通过父类名显式限定调用，子类实例不可访问 |
| constructor | ❌ 不继承 | 必须通过 super() 调用 |

### override 重写规则
| 规则 | 说明 |
|------|------|
| 显式 override 关键字 | 派生类重写基类方法/字段时必须使用 `override` |
| 方法：参数逆变 | 派生类参数类型必须是基类参数类型的**超类型** |
| 方法：返回协变 | 派生类返回类型必须是基类返回类型的**子类型** |
| 字段：类型相同 | 派生类 override 字段类型必须与基类字段类型**完全相同** |
| 字段：修饰符一致 | 派生类 override 字段的访问修饰符必须与基类**完全相同** |
| override 字段必须存在 | 基类中必须存在同名被重写字段 |
| 禁止 static override | 不能用 static override 重写父类非 static 方法 |

### extends + implements 组合
- 类可以同时 `extends` 一个父类并 `implements` 一个或多个接口
- 必须实现所有来自接口和父类抽象方法的抽象成员
- 可以 `implements` 多个接口，必须实现所有接口的 abstract methods 和 required properties

## 测试点覆盖

### 1. 基本继承：成员继承与可访问性（PASS）
- 子类继承父类所有 public/protected 非静态成员，并可新增自有成员 (001)
- 多层继承链：祖父类 -> 父类 -> 子类，子类继承所有祖先的非静态可访问成员 (002)
- protected 成员被派生类继承，且在派生类方法中可访问 (013b, 026)
- 类可实现多个接口 (013a)
- 同时 extends 和 implements，合并两边成员 (014a, 014b, 015-pass)

### 2. 方法重写 override-compatible（PASS）⭐
- 重写方法签名满足 override-compatible：参数逆变 + 返回协变 (003)
- override 参数类型是基类参数类型的超类型（逆变）(004)
- override 返回类型协变：派生类返回类型是基类返回类型的子类型 (020)

### 3. 字段重写 override（PASS）
- 派生类同名字段类型与基类相同，使用 override 修饰符重写 (016)

### 4. 反向：抽象方法实现缺失（FAIL）
- 非抽象子类未实现所有继承的抽象方法，编译失败 (005)
- 非抽象类实现接口时未实现所有抽象方法，编译失败 (006)

### 5. 反向：override 签名不兼容（FAIL）⭐
- override 返回类型不满足协变（派生类返回类型不是基类返回类型的子类型）(007, 021)
- override 参数类型不满足逆变（派生类参数不是基类参数的超类型）(008, 025)

### 6. 反向：构造函数不被继承（FAIL）
- 父类构造函数不被继承，子类默认构造函数无法调用需要参数的父类构造函数 (009)

### 7. 反向：private 成员隔离（FAIL）
- 父类 private 成员不被子类继承，子类无法访问父类 private 成员 (015-fail, 018-fail)

### 8. 反向：static 成员不被继承（FAIL）
- 父类 static 方法不被子类继承，子类无法通过实例访问 (017b)

### 9. 反向：字段 override 约束违反（FAIL）
- 派生类同名字段类型与基类不同，编译失败 (017a)
- override 字段的访问修饰符与基类不一致，编译失败 (019)
- override 字段在基类中不存在同名字段，编译失败 (020-fail)
- 使用 static override 重写父类非 static 方法，编译失败 (028)

### 10. 运行时：继承链验证（RUNTIME）⭐
- 多级继承链中子类正确继承并使用祖先类成员 (010, 022b)
- 三层继承方法调用链运行时验证 (030)
- instanceof 在继承链上正确检测 (018-runtime, 022a)

### 11. 运行时：虚方法分派与重写（RUNTIME）⭐
- 通过基类引用调用方法，实际执行派生类重写版本 (011)
- 通过基类引用调用重写方法 (023b)
- getter/setter 继承与重写 (012)
- 派生类同名字段改变初始化值，运行时使用派生类初始值 (023a)

### 12. 运行时：super 与构造函数（RUNTIME）
- super.method() 调用父类被重写的方法 (019-runtime, 021-runtime)
- super() 传递参数给父类构造函数 (029)

### 13. 运行时：访问控制运行时验证（RUNTIME）
- protected 成员在子类中可访问 (016-runtime)
- private 成员可通过父类 public 方法间接访问 (027)
- 静态方法只能通过父类名显式限定调用，无法通过子类实例访问 (024)

## 边界值与边缘场景

### 边界场景
- 深层继承链（3 层及以上）：祖父 -> 父 -> 子 -> 孙
- 同时 extends 抽象类并 implements 多个接口
- override 方法签名精确匹配边界（参数恰为超类型/返回恰为子类型的边界）
- 空类继承（子类不添加任何新成员）
- 父类无参构造函数与有参构造函数场景

### 边缘场景
- 循环继承（class A extends B, class B extends A）—— 编译器应拒绝
- 多层 override 链：祖父定义方法 -> 父重写 -> 子再次重写
- extends null / extends undefined（类型系统拒绝）
- override 与 overload 混淆 —— override 要求签名兼容
- 接口中定义 default 方法与抽象方法混合继承

### 设计观察 (design observations)
- **观察 A**：ArkTS 要求显式 `override` 关键字（与 Swift/C# 一致，比 Java 严格）
- **观察 B**：字段 override 类型必须严格相同（比 Java field hiding 更安全）
- **观察 C**：override 字段访问修饰符必须完全一致（比 Java/C# 更保守）
- **观察 D**：static 方法不通过实例继承（消除 Java static "伪继承" 混淆）

## 编号规划
- compile-pass: 001 ~ 004, 013 ~ 016, 020, 026（12 个）
- compile-fail: 005 ~ 009, 015, 017 ~ 021, 025, 028（14 个）
- runtime: 010 ~ 012, 016, 018 ~ 019, 021 ~ 024, 027, 029 ~ 030（15 个）

## 文件命名规范
`CLS_09_10_NNN_{CATEGORY}_{DESCRIPTION}.ets`

- 前缀 `CLS` = Classes section
- `09_10` = 章节 9.10 Inheritance
- `NNN` = 三位数字编号（001 ~ 030）
- `{CATEGORY}` = `PASS` / `FAIL` / `RUNTIME`
- `{DESCRIPTION}` = 测试内容简述（大写，下划线分隔）

示例：
- `CLS_09_10_001_PASS_BASIC_INHERITANCE.ets`
- `CLS_09_10_007_FAIL_OVERRIDE_RETURN_NOT_COVARIANT.ets`
- `CLS_09_10_010_RUNTIME_INHERITANCE_CHAIN.ets`

## 覆盖率总结

| 分类 | 数量 | 编号范围 |
|------|------|---------|
| compile-pass | 12 | 001~004, 013~016, 020, 026 |
| compile-fail | 14 | 005~009, 015, 017~021, 025, 028 |
| runtime | 15 | 010~012, 016, 018~019, 021~024, 027, 029~030 |
| **总计** | **41** | 001 ~ 030（非连续） |
