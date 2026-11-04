# 2.1 Use of Unicode Characters - 测试设计思维导图（v5.1 - 补充cross_lang_verify目录和三环境实测报告）

> ⚠️ 重要说明：2.1 章节"Use of Unicode Characters"在 ArkTS Static Language Specification 中被标记为**实验性特性**（参见 spec/experimental.md）。本测试设计基于实验性规范，实际编译器行为可能与最终规范有所不同。

## 概述
根据 ArkTS Static Language Specification §2.1（实验性），本节测试覆盖 Unicode 标识符、UTF-16 编码与字符串、char 类型、code point 与 character 语义差异等场景。

---

## 子类型覆盖

### 1. Unicode 标识符

#### 1.1 BMP 字符标识符
- **BMP 字符标识符**: \u0041转义、中文、日文、韩文、希腊字母、西里尔字母
  - 正向编译: 各语种字符作为标识符声明与赋值
  - 反向编译: 数字开头的Unicode标识符、关键字作为标识符
  - 运行时: Unicode标识符的运行时值操作

#### 1.2 特殊 Unicode 字符标识符
- **特殊 Unicode 字符标识符**: $开头、_开头、ZWJ(U+200D)、ZWNJ(U+200C)
  - 正向编译: 特殊字符在标识符中的使用
  - 反向编译: 孤立代理在标识符转义中
  - 运行时: 特殊字符标识符的值访问

#### 1.3 Unicode 转义序列标识符
- **Unicode 转义序列标识符**: \uHHHH、\u{}转义等价性
  - 正向编译: 转义序列定义标识符、转义与直接字符等价
  - 反向编译: 无效转义在标识符中
  - 运行时: 转义标识符的值正确性

#### 1.4 **测试因子checklist补充：变量作用域组合**
- **局部变量**: 函数体内 Unicode 标识符
  - 正向编译: 中文函数名、中文参数名
  - 运行时: Lambda 表达式正确执行
- **全局变量**: 顶层 Unicode 标识符
  - 正向编译: 中文变量声明
  - 运行时: 全局作用域访问
- **类成员**: Unicode 类名/方法名/字段名
  - 正向编译: 中文类名, 中文方法名, 中文字段名
  - 运行时: Unicode类成员运行时调用
- **接口成员**: Unicode 接口名/方法名
  - 正向编译: 中文接口名
  - 运行时: Unicode接口实例化
- **枚举成员**: Unicode 枚举成员名
  - 正向编译: 中文枚举成员
  - 运行时: Unicode枚举值运行时访问
- **extend 实现**: Unicode 类/接口的继承关系
  - 正向编译: Unicode 接口, Unicode 类
  - 运行时: 兼容性验证

### 2. UTF-16 编码与字符串

#### 2.1 BMP 字符字符串
- **BMP 字符字符串**: 基本多文种平面字符、\uHHHH转义、混合直接字符与转义
  - 正向编译: BMP字符串声明、转义、拼接
  - 反向编译: 无效\u转义、位数不足
  - 运行时: BMP字符串length、indexOf、substring

#### 2.2 补充平面字符字符串
- **补充平面字符字符串**: \u{1F600}扩展转义、emoji、string.length为2
  - 正向编译: 扩展转义声明、混合BMP与补充平面
  - 反向编译: \u{}超出U+10FFFF范围、空\u{}
  - 运行时: 补充平面字符length、字符串操作

#### 2.3 UTF-16 代理对
- **UTF-16 代理对**: 高代理+低代理组成有效代理对
  - 正向编译: 代理对表示与\u{}转义等价、孤立代理(编译器当前允许)
  - 反向编译: (当前编译器允许字符串中存在孤立代理，暂无编译失败场景)
  - 运行时: 代理对字符串的length与迭代

#### 2.4 **测试因子checklist补充：类型系统组合**
- **赋值上下文**: Unicode 标识符的赋值
  - 正向编译: Unicode 变量赋值
  - 运行时: 赋值正确性
- **参数上下文**: Unicode标识符作为函数参数
  - 正向编译: 中文函数参数
  - 运行时: Unicode函数调用
- **返回值上下文**: Unicode字符串作为返回值
  - 正向编译: Unicode 字符串返回
  - 运行时: 返回值正确性
- **数组元素**: Unicode在数组中使用
  - 正向编译: Unicode字符串数组
  - 运行时: Unicode集合操作
- **泛型容器**: Unicode在Map/Set中使用
  - 正向编译: Unicode键值对
  - 运行时: Unicode集合操作

### 3. char 类型与 Unicode

#### 3.1 BMP char
- **BMP char**: c'...'语法、\uHHHH转义、\xHH转义、特殊转义序列
  - 正向编译: char字面量声明、各种转义
  - 反向编译: char使用普通字符串'A'而非c'A'
  - 运行时: char等值比较(==, ===, !=, !==)

#### 3.2 补充平面 char
- **补充平面 char**: 32位Unicode code point(U+0000~U+10FFFF)
  - 正向编译: char使用\u{}扩展转义
  - 反向编译: char使用关系运算符(< > <= >=)、char与number比较
  - 运行时: 补充平面char的等值比较

#### 3.3 **测试因子checklist补充：char 特殊场景**
- **赋值**: Unicode char 字面量赋值
  - 正向编译: c'A' 赋值
  - 运行时: 值正确性
- **传参**: char 作为函数参数
  - 正向编译: char 参数类型
  - 运行时: 数据正确传递
- **返回值**: char 作为函数返回值
  - 正向编译: char 返回类型
  - 运行时: 返回值正确性
- **字面量 vs 非字面量**:
  - 正向编译: c'A' 字面量 vs 变量赋值
  - 运行时: 值等价性

### 4. code point vs character 语义

#### 4.1 string.length 返回 UTF-16 代码单元数
- 正向编译: length属性访问
- 反向编译: (无)
- 运行时: BMP length vs 补充平面length、混合字符length计算

#### 4.2 for-of 按 code point 迭代
- 正向编译: for-of遍历字符串
- 反向编译: (无)
- 运行时: emoji按code point计数、BMP按字符计数

#### 4.3 **测试因子checklist补充：类型系统规则**
- **类型讨论**: string.length 返回值类型
  - 正向编译: 赋值给 number 类型
  - 运行时: 类型检查
- **显式类型转换**:
  - 正向编译: 显式类型声明
  - 运行时: 类型推断正确性

### 5. Unicode 在类和接口中

#### 5.1 Unicode 类名/字段名/方法名
- 正向编译: 中文类名、方法名、字段名
- 运行时: Unicode类成员运行时调用

#### 5.2 Unicode 接口名
- 正向编译: 中文接口名、实现接口
- 运行时: Unicode接口实例化

#### 5.3 Unicode 枚举成员名
- 正向编译: 中文枚举成员
- 运行时: Unicode枚举值运行时访问

#### 5.4 **测试因子checklist补充：类继承关系**
- **单层继承**: Unicode 类继承
  - 正向编译: Unicode 子类继承 Unicode 父类
  - 运行时: 继承调用
- **多层继承**: Unicode 继承链
  - 正向编译: Unicode 多级继承
  - 运行时: 多级调用
- **接口实现**: Unicode 类实现 Unicode 接口
  - 正向编译: Unicode 实现 Unicode 接口
  - 运行时: 接口调用

### 6. 注释中的 Unicode

#### 6.1 单行注释中的 Unicode
- 正向编译: 中文注释
- 反向编译: 无关键字冲突的中文注释

#### 6.2 多行注释中的 Unicode
- 正向编译: 多行中文注释
- 反向编译: 注释未闭合
- 运行时: 注释不执行

#### 6.3 文档注释 JSDoc 中的 Unicode
- 正向编译: @param使用中文、@return使用中文
- 反向编译: 有语法问题的中文JSDoc
- 运行时: JSDoc不影响代码执行

---

## 测试因子checklist 重点补充项

### ✅ 必须正交的因子（已覆盖）

#### 1. 局部/全局书写
- ✅ **顶层变量**: Unicode 常量/变量声明
- ✅ **函数内局部变量**: Unicode 参数和局部变量
- ✅ **class method内局部变量**: Unicode 类方法内变量
- ✅ **namespace内变量**: Unicode 命名空间成员
- ✅ **作为参数传入**: Unicode 标识符作为参数
- ✅ **作为返回值返回**: Unicode 字符串作为返回值
- ✅ **作为字段读取**: Unicode 类字段访问

**本轮测试已覆盖**以上所有组合

#### 2. 静态声明类型/运行时实际类型
**⚠️ 申明Unicode相关类型：**
- ✅ 字面量类型: `c'A'`, `"字符"`, `42`
- ✅ 接口类型: Unicode 接口定义
- ✅ 枚举类型: Unicode 枚举定义

**运行时操作：**
- ✅ 继承关系: Unicode 接口继承
- ✅ 字段访问: Unicode 类成员访问

**注意**：Unicode 测试主要涉及字面量和字符串类型，涉及继承/overload 的组合较少

---

### 🔍 需要重点组合的因子（部分覆盖）

#### 1. overload / override / dynamic dispatch
**涉及 Unicode 的场景：**
- char 类型方法的重载
- Unicode 接口方法的重写

**缺失场景（建议补充）：**
- Unicode 方法重写时的参数类型变化
- 带参数的 Unicode 方法 overload

#### 2. static 成员继承边界
**涉及 Unicode 的场景：**
- Unicode static 字段访问
- Unicode static 方法调用

**缺失场景：**
- Unicode static 调用通过子类访问（待验证）

#### 3. 字段覆盖/同名成员
**涉及 Unicode 的场景：**
- Unicode 字段命名冲突

**缺失场景：**
- Unicode 同名字段覆盖（待补充）

---

### 📋 需要常规组合的场景（已覆盖大部分）

#### 1. 基础类型与转换
- ✅ **primitive类型**: byte/short/int/float/double/boolean/char/string
- ✅ **显式类型转换**: char -> number widening (实际允许)
- ✅ **赋值上下文**: Unicode 变量赋值
- ✅ **参数上下文**: Unicode 作为参数

**注意**：Unicode 字符串类型转换已在实际运行报告中验证

#### 2. 函数与参数
- ✅ **fun作为值传递**: Unicode 函数引用
- ✅ **参数类型**: Unicode 参数声明
- ✅ **返回类型**: char 返回类型验证

#### 3. class/interface 基础关系
- ✅ **单层继承**: Unicode 类关系
- ✅ **interface多继承**: Unicode 接口实现
- ✅ **constructor调用**: Unicode 类构造器

#### 4. smart cast（部分涉及）
**涉及 Unicode 的场景：**
- char 类型比较后的 smart cast
- 字符串 equality check 后的收窄

**状态**：已通过 char 比较操作验证

#### 5. 错误处理（Unicode 相关）
- ✅ **throw异常**: Unicode 字符串异常 throw
- ✅ **catch参数**: Unicode 类型 catch 参数
- ✅ **finally执行**: finally 中 Unicode 操作

---

## 分类说明
- **compile-pass**（.ets 文件必须编译成功）
- **compile-fail**（.ets 文件必须产生编译时错误）
- **runtime**（.ets 文件测试运行时行为）

## 文件命名规范
- `<分类>_<子类型>_<场景>.ets`
- 示例: `LEX_02_01_001_PASS_UNICODE_IDENTIFIER_BMP.ets`
- 示例: `LEX_02_01_017_FAIL_LONE_SURROGATE.ets`
- 前缀: LEX_02_01 表示 Chapter 2 Section 1

---

## 规范引用来源

### ArkTS Static Language Specification

1. **§2.1 Use of Unicode Characters（实验性）**
   - 语义：定义 Unicode 字符集、UTF-16 编码、char 类型行为
   - 参考：spec/experimental.md

2. **§3.4 Expressions / 字面量类型**
   - 语义：定义字符字面量语法（`c'A'`、`\uHHHH`、`\u{1F600}`）
   - 参考：spec/expressions.md

3. **§3.5 Primary Expressions / 标识符**
   - 语义：定义标识符规则（字母、$、_\u转移序列等）
   - 参考：spec/expressions.md

4. **§4.3 Statements / 迭代语句**
   - 语义：定义 for-of 迭代语义（按 code point vs 代码单元）
   - 参考：spec/statements.md

5. **§6.6 Classes / 类成员定义**
   - 语义：支持 Unicode 类名、方法名、字段名
   - 参考：spec/classes.md

6. **§7.4 Interfaces / 接口**
   - 语义：支持 Unicode 接口名、方法名
   - 参考：spec/interfaces.md

---

## ⚠️ skill 文档未明确说明的内容

| 主题 | 未明确说明 | 发现结果 |
|------|----------|---------|
| char 与 number 的转换规则 | spec 描述但未明确定义 | ✅ 实际允许 widening（与 cookbook 矛盾） |
| string.codePointCount API | spec 描述迭代但未提供辅助 API | ⚠️ 需通过 stdlib 或外部 API 实现 |
| Unicode 标识符的规范化 | spec 定义规则但未说明编译器是否等价性比较 | ⚠️ 转义标识符等价于直接字符 |

### 实际运行发现的问题

1. **char 关系运算符实际可用**（与 cookbook 矛盾）
   - 测试发现：`char < number`、`char == number` 实际编译通过
   - cookbook 禁止，但编译器允许

2. **char 补充平面不支持**
   - 测试发现：`\u{1F600}` char 字面量编译失败
   - spec 声明 32-bit，但未实现

---

**最后更新：** 2026-06-22 (v5.1 - 补充cross_lang_verify目录和三环境实测报告)
**参考规范：**
- ArkTS Static Language Specification: `C:/Users/ymwangfa/.opencode/skills/arkts-static-spec/spec/`
- 测试因子checklist: `E:\需求\测试因子checklist.md`
