# 15.11 Overload Resolution - 测试设计思维导图

## 概述
本节定义 ArkTS 中重载解析（Overload Resolution）的完整语义，包括重载集的形成、函数/方法/构造函数重载集的构建、编译期警告、以及方法调用时的动态解析。

## 核心规则

### 1. 重载集形成（15.11.1）
- 同一作用域内同名函数/方法构成重载集
- 重载集不包含继承的方法（与 Java 不同）
- 重载解析基于参数类型，不涉及返回类型

### 2. 函数重载集（15.11.2）
- 顶层函数、局部函数可重载
- 泛型函数与非泛型函数可共存
- 重载解析选择最具体的匹配

### 3. 接口方法重载集（15.11.3）
- 接口中定义的方法构成重载集
- 接口继承时方法去重
- 实现类必须匹配接口方法签名

### 4. 类静态方法重载集（15.11.4）
- 静态方法可重载
- 静态方法不参与继承（不能被 override）
- 类名调用静态方法时解析重载集

#
## 最新设计要点

从章节思维导图同步的最新测试设计点：

- normal cases
- edge cases
- error cases (ambiguous)

## 5. 类实例方法重载集（15.11.5）
- 实例方法可重载
- 实例方法可被 override（动态派发）
- 重载解析在编译期，override 派发在运行期

### 6. 构造函数重载集（15.11.6）
- 构造函数可重载
- `new` 调用时根据参数类型选择构造函数
- 构造函数重载集不包含继承的构造函数

### 7. 重载集警告（15.11.7）
- W2323: 重载集中存在不可达实体（broad 隐藏 narrow）
- 警告不影响编译通过
- 帮助开发者发现潜在逻辑问题

### 8. 方法调用时重载集（15.11.8）
- 方法调用时动态构建重载集
- receiver 类型影响重载集内容
- smart narrowing 可缩小 receiver 类型

### 9. 重载与重写交互（15.11.9）
- 重载在编译期解析
- 重写在运行期派发
- 先重载解析，再 override 派发

### 10. 动态解析（15.11.10）
- receiver 声明类型 vs smart 类型
- 动态解析基于运行时 receiver 实际类型
- 与 override 机制协同工作

## 测试点覆盖

### compile-fail（16 个）
1. 无匹配重载（SEM_15_11_011）
2. 缺少必需参数（SEM_15_11_012）
3. 多余参数（SEM_15_11_013）
4. 参数类型不可赋值（SEM_15_11_014）
5. 全局变量未 narrow 导致无匹配（SEM_15_11_019）
6. SMART_GLOBAL 模式：全局变量 base 成员无 narrow（SEM_15_11_038）
7. ARCHIVE 模式：object 方法拒绝 null（SEM_15_11_041）
8. ARCHIVE 模式：object 方法拒绝 undefined（SEM_15_11_042）
9. ARCHIVE 模式：无匹配函数（SEM_15_11_055）
10. ARCHIVE 模式：返回类型不参与重载解析（SEM_15_11_056）
11. ARCHIVE 模式：构造函数无匹配（SEM_15_11_057）
12. ARCHIVE 模式：union 公共成员重载（SEM_15_11_058）
13. ARCHIVE 模式：receiver 重载方法调用（SEM_15_11_059）
14. ARCHIVE 模式：静态方法不继承（SEM_15_11_060）
15. ARCHIVE 模式：receiver 同名实例方法（SEM_15_11_061）
16. 一般重载拒绝（SEM_15_11_099）

### compile-pass（23 个）
1. 不可达实体警告（SEM_15_11_015, SEM_15_11_016, SEM_15_11_023）
2. SMART_FUNC 模式：instanceof narrowing（SEM_15_11_037）
3. ARCHIVE 模式：null 选择继承泛型方法（SEM_15_11_043）
4. ARCHIVE 模式：undefined 选择继承泛型方法（SEM_15_11_044）
5. ARCHIVE 模式：显式 null 泛型选择 parent（SEM_15_11_045）
6. ARCHIVE 模式：object 选择 child 重载（SEM_15_11_046）
7. ARCHIVE 模式：parent 静态类型保持 parent 泛型（SEM_15_11_047, SEM_15_11_048）
8. ARCHIVE 模式：subclass 重排序显式重载（SEM_15_11_062）
9. ARCHIVE 模式：receiver 函数重载作为函数（SEM_15_11_063）
10. ARCHIVE 模式：重载集警告不可达（SEM_15_11_064）
11. ARCHIVE 模式：接口继承顺序（SEM_15_11_065）
12. ARCHIVE 模式：接口 override 去重（SEM_15_11_066）
13. ARCHIVE 模式：类 parent 优先于接口（SEM_15_11_067）
14. ARCHIVE 模式：receiver 实例方法优先级组合（SEM_15_11_068）
15. ARCHIVE 模式：重载解析后 override 派发（SEM_15_11_069）
16. ARCHIVE 模式：super 静态无 override 派发（SEM_15_11_070）
17. ARCHIVE 模式：仅直接超类型（SEM_15_11_071）
18. ARCHIVE 模式：声明 receiver 类型顶层（SEM_15_11_072）
19. ARCHIVE 模式：声明 receiver 类型函数体内（SEM_15_11_073）
20. 一般重载解析通过（SEM_15_11_100）

### runtime（37 个）
1. broad 优先于 narrow（SEM_15_11_001）
2. narrow 优先于 broad（SEM_15_11_002）
3. 泛型优先于非泛型（SEM_15_11_003）
4. 非泛型优先于泛型（SEM_15_11_004）
5. 接口超类型顺序（SEM_15_11_005）
6. 类实例方法顺序（SEM_15_11_006, SEM_15_11_021）
7. 静态方法顺序（SEM_15_11_007）
8. 构造函数顺序（SEM_15_11_008）
9. receiver vs 方法（SEM_15_11_009）
10. 重载 + override 动态（SEM_15_11_010）
11. 函数 smart 选择 subtype（SEM_15_11_017）
12. 声明类型选择 base（SEM_15_11_018）
13. 重赋值改变选择（SEM_15_11_020）
14. broad 优先选择 broad（SEM_15_11_022）
15. 静态选择动态派发（SEM_15_11_024）
16. receiver 声明 base 各种作用域（SEM_15_11_025 ~ SEM_15_11_033）
17. receiver 声明 base 显式转换（SEM_15_11_034）
18. receiver 声明 derived 仍 derived（SEM_15_11_035）
19. receiver smart instanceof 选择 derived（SEM_15_11_036）
20. SMART_GLOBAL 模式（SEM_15_11_039）
21. SMART_FUNC 模式（SEM_15_11_040）
22. ARCHIVE 模式各种场景（SEM_15_11_049 ~ SEM_15_11_054）
23. 一般运行时测试（SEM_15_11_101）

## 编号规划
- compile-fail: 011 ~ 099
- compile-pass: 015 ~ 100
- runtime: 001 ~ 101

## 文件命名规范
`SEM_15_11_YYY_{CATEGORY}_{DESCRIPTION}.ets`

## 子章节链接
- 15.11.1: 重载集形成
- 15.11.2: 函数重载集
- 15.11.3: 接口方法重载集
- 15.11.4: 类静态方法重载集
- 15.11.5: 类实例方法重载集
- 15.11.6: 构造函数重载集
- 15.11.7: 重载集警告
- 15.11.8: 方法调用时重载集
- 15.11.9: 重载与重写
- 15.11.10: 动态解析
