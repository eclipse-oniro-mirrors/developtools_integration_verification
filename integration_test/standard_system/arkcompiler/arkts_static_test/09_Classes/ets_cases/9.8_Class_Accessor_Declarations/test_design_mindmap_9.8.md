# 9.8 Class Accessor Declarations - 测试设计思维导图

## 概述
本节定义**类访问器声明 (Class Accessor Declarations)** 的语法与语义。Accessor 是一种特殊的类成员，通过 `get` / `set` 关键字声明，以**属性访问语法 (property access syntax)** 对外暴露读/写操作，内部封装私有字段 (private backing store) 及校验逻辑。Accessor 本质上不是方法 (method)，不能通过函数调用语法 `obj.prop()` 调用。

## 核心规则

### 1. Getter 声明规则
- 使用 `get` 关键字声明：`get name(): ReturnType { ... }`
- 返回类型可**省略**，由编译器从 body 推断 (inferred return type)
- **禁止声明参数** -- 有参数时 compile-time error
- 访问语法：`obj.name`（不是 `obj.name()`）

### 2. Setter 声明规则
- 使用 `set` 关键字声明：`set name(param: Type) { ... }`
- **必须恰好一个参数**（不允许无参数或可选参数）
- **禁止声明显式返回类型** -- 有返回类型时 compile-time error
- 访问语法：`obj.name = value`（不是 `obj.name(value)`）

### 3. 访问器名称冲突规则
- Accessor 名称 **不能与非静态字段 (non-static field)** 名称冲突 -- compile-time error
- Accessor 名称 **不能与方法 (method)** 名称冲突 -- compile-time error
- Field **不能覆盖 (override)** 超类 accessor；accessor 不能覆盖超类 field -- compile-time error

### 4. Override 协变/逆变规则
- 子类 override getter 返回类型必须**协变 (covariant)**：与超类 getter 返回类型相同或更具体 (subtype)
- 子类 override setter 参数类型必须**逆变 (contravariant)**：与超类 setter 参数类型相同或更泛化 (supertype)
- 违反协变/逆变规则 → compile-time error

### 5. 同名 getter/setter 修饰符匹配规则 ⚠️
- spec 要求：同名 getter 和 setter 必须具有**相同的访问修饰符 (accessor modifiers)**，否则 compile-time error
- **实测发现 (CLS-I1)**：ArkTS 编译器**未拒绝** `static get` + 实例 `set` 的修饰符不匹配 -- spec 与实现不一致（MEDIUM）
- 需关注：`abstract` 修饰符匹配、`static` vs 实例匹配等场景

### 6. 特殊形态
- **getter-only**：只声明 getter 无 setter → 只读计算属性 (readonly computed property)
- **setter-only**：只声明 setter 无 getter → 只写属性 (write-only property)
- **abstract accessor**：抽象类中声明 abstract getter/setter，由子类实现
- **static accessor**：静态 getter/setter，通过类名访问 (Classname.prop)
- **计算属性 (computed property)**：getter body 中基于其余字段计算返回值 (如 `fullName = surname + forename`)

### 7. 与方法的本质区别
- Accessor 使用**属性访问语法** `obj.prop` / `obj.prop = v`
- 方法使用**函数调用语法** `obj.method()` / `obj.method(arg)`
- 将 accessor 当作方法调用 (如 `p.age()`) → compile-time error

## 测试点覆盖

### compile-pass（已实现 11 个）

1. **基本 getter/setter 声明与访问** (001)
   - private backing store + getter/setter 封装
   - 外部通过属性访问语法读写

2. **getter 返回类型推断** (002)
   - 省略返回类型时从 body 推断 int / string / boolean

3. **override accessor 协变/逆变正确场景** (003)
   - getter 返回类型协变（更具体的子类型）
   - setter 参数类型逆变（更泛化的父类型）

4. **同名 getter/setter 修饰符不匹配** (008) ⚠️
   - `static get` + 实例 `set` -- 当前 ArkTS 允许（与 spec 不一致）

5. **getter-only 只读计算属性** (015, 023)
   - 只声明 getter，无 setter（如 area / perimeter）

6. **setter-only 只写属性** (016, 031)
   - 只声明 setter，无 getter（日志累加器 / 配置器）

7. **abstract accessor 声明与实现** (017)
   - 抽象类声明 abstract getter/setter
   - 子类提供具体实现

8. **static accessor 通过类名访问** (018)
   - 静态 getter/setter 声明
   - 通过 `ClassName.prop` 读写

9. **计算属性 getter** (027)
   - getter body 组合多个字段计算返回值（如 `fullName`）

### compile-fail（已实现 14 个）

10. **accessor 被当作方法调用** (004)
    - `p.age()` / `p.age(17)` → compile-time error

11. **setter 参数为可选参数** (005)
    - `set age(p?: Object)` / `set age(v?: int)` → compile-time error

12. **accessor 名与非静态字段名冲突** (006)
    - 同名字段与 accessor → compile-time error

13. **accessor 名与方法名冲突** (007, 033)
    - 同名方法与 accessor → compile-time error

14. **field 覆盖 accessor / accessor 覆盖 field** (009)
    - 子类 field 覆盖超类 accessor → compile-time error
    - 子类 accessor 覆盖超类 field → compile-time error

15. **getter 带有参数** (012, 024)
    - `get foo(x: int)` 单参数 / `get bar(a: int, b: int)` 多参数 → compile-time error

16. **setter 带有显式返回类型** (013, 025)
    - `set age(v: int): int` / `set age(v: int): void` → compile-time error

17. **setter 无参数** (014, 026)
    - `set age()` → compile-time error

18. **override getter 返回类型非协变** (019)
    - 子类 getter 返回不同类型（如 string → int / int → boolean）→ compile-time error

19. **override setter 参数类型非逆变** (020)
    - 子类 setter 参数类型更具体（如 double → int / string → boolean）→ compile-time error

### runtime（已实现 6 个，含 assert 验证）

20. **getter/setter 基本读写与校验逻辑** (010)
    - setter 写入时校验（负数拒绝、超范围拒绝、正常值接受）
    - getter 读回验证一致性
    - 3 个断言

21. **override accessor 运行时正确性** (011)
    - 子类 getter 返回正确子类型值、setter 接受基类类型参数
    - 1 个断言

22. **abstract accessor 运行时验证** (021)
    - 子类实现默认值、设置新值、范围校验（正常值/负数拒绝）
    - 5 个断言

23. **static accessor 运行时** (022)
    - 通过类名读写静态 getter/setter
    - 1 个断言

24. **getter 返回类型推断运行时** (028)
    - 无显式返回类型 getter 返回 backing field 值
    - 1 个断言

25. **accessor 校验逻辑运行时** (032)
    - 正常值写入/读出、负数被拒绝
    - 2 个断言

## 边界值与边缘场景

- getter 返回类型推断边界：复杂表达式推断、多 return 路径类型一致
- setter 参数类型与 backing field 类型不一致时的隐式转换
- override 协变边界：getter 返回类型等于超类类型（非真子类型）视为合法（协变允许相同类型）
- override 逆变边界：setter 参数类型等于超类类型视为合法（逆变允许相同类型）
- 同名 getter/setter 跨继承层次声明（子类只 override getter 不 override setter，或反之）
- static accessor 与实例 accessor 同名（当前 ArkTS 允许，见 CLS-I1）
- abstract accessor 部分实现（只实现 getter 不实现 setter -- 子类仍是 abstract）
- getter-only 属性被赋值时的行为（应 compile-time error）
- setter-only 属性被读取时的行为（应 compile-time error）
- accessor 与 constructor 参数名冲突（accessor 名与 constructor parameter 同名无冲突 -- 不同命名空间）

## 命名规范

文件命名：`CLS_09_08_NNN_{CATEGORY}_{DESCRIPTION}.ets`

- **前缀**：`CLS` = Classes 章节
- **章节编号**：`09_08` = §9.8 Class Accessor Declarations
- **用例编号**：`NNN` = 三位数字（001 ~ 033）
- **类别**：`PASS` = compile-pass / `FAIL` = compile-fail / `RUNTIME` = runtime
- **描述**：英文下划线分隔，简洁描述测试点

**示例：**
- `CLS_09_08_001_PASS_BASIC_GETTER_SETTER.ets`
- `CLS_09_08_004_FAIL_ACCESSOR_AS_METHOD.ets`
- `CLS_09_08_010_RUNTIME_GETTER_SETTER_BASIC.ets`

## 编号规划

| 分类 | 编号范围 | 数量 |
|------|---------|------|
| compile-pass | 001 ~ 003, 008, 015 ~ 018, 023, 027, 031 | 11 |
| compile-fail | 004 ~ 007, 009, 012 ~ 014, 019 ~ 020, 024 ~ 026, 033 | 14 |
| runtime | 010 ~ 011, 021 ~ 022, 028, 032 | 6 |
| **总计** | | **31** |

## 已知问题

| 编号 | 严重性 | 描述 |
|------|--------|------|
| CLS-I1 | MEDIUM | 同名 getter/setter 修饰符不匹配（`static get` + 实例 `set`）未被编译器拒绝，与 spec §9.8 规定不一致。用例 008 作为 compile-pass 通过，但 spec 要求 compile-time error。需对齐实现与 spec，或更新 spec 明确允许范围。 |
