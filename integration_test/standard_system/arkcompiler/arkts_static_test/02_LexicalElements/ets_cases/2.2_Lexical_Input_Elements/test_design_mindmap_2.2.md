# 2.2 Lexical Input Elements - 测试设计思维导图（v5.1 - 补充cross_lang_verify目录和三环境实测报告）

> ⚠️ 重要说明：2.2 章节"Lexical Input Elements"涉及词法输入元素的四类（White Spaces、Line Separators、Tokens、Comments）及其组合交互。

## 概述
ArkTS 词法输入元素分为四类：White Spaces、Line Separators、Tokens、Comments。本节测试覆盖这四类元素的识别、组合、分隔和边界交互。

---

## 子类型覆盖

### 1. 四类输入元素共存
- **同行包含全部四类元素**
  - 正向编译: 一行代码中同时存在空白、Token、注释
  - 反向编译: (无)
  - 运行时: 含注释的语句执行结果正确

### 2. 空白符作为分隔符
- **空白符分隔Token**
  - 正向编译: 空格/Tab/多个空白分隔标识符与关键字
  - 反向编译: 无空白符导致Token合并(如 `letx` 非法)
  - 运行时: 空白分隔不影响语义

### 3. 行终止符作为分隔符
- **换行分隔语句**
  - 正向编译: 每行一条语句、行尾可选分号
  - 反向编译: (无)
  - 运行时: 换行分隔的多条语句顺序执行

### 4. 注释作为元素
- **单行注释**
  - 正向编译: `//` 注释、行末注释、整行注释
  - 反向编译: (无)
  - 运行时: 注释不影响变量值

### 5. Token识别
- **Token被空白/换行/注释分隔**
  - 正向编译: 各种分隔组合下的Token识别
  - 反向编译: (无)
  - 运行时: Token识别正确性

### 6. 边界交互
- **空文件**
  - 正向编译: 仅含空白/换行/注释的文件
  - 反向编译: (无)
  - 运行时: (无)

---

## 测试因子checklist 补充项

### ✅ 必须正交的因子 - 已覆盖

#### 1. 局部/全局书写
- ✅ 顶层变量/常量（用例 026）
- ✅ 函数体内局部变量（用例 026）
- ✅ class method 内局部变量（用例 026）
- ✅ 作为参数传入（用例 027）
- ✅ 作为返回值返回（用例 027）
- ✅ 作为字段读取后再使用（用例 026）

#### 2. 控制流与空白/注释
- ✅ if/else 中的注释（用例 030）
- ✅ for 循环中的注释（用例 029）
- ✅ while 循环中的注释（用例 029）
- ✅ switch 中的注释（用例 030）

### ✅ 常规组合场景 - 已覆盖

#### 1. 基础类型与转换
- ✅ 数值运算中的空白分隔（用例 003、004）
- ✅ 模板字符串中的换行（用例 012、029）

#### 2. 函数与参数
- ✅ 参数间注释（用例 027）
- ✅ 返回值上下文（用例 027）

#### 3. Unicode 在注释中
- ✅ 中文/日文注释（用例 028）
- ✅ Emoji 在注释中（用例 028）
- ✅ Unicode 字符串与词法元素交互（用例 028）

---

## 分类说明
- **compile-pass**（.ets 文件必须编译成功）
- **compile-fail**（.ets 文件必须产生编译时错误）
- **runtime**（.ets 文件测试运行时行为）

## 文件命名规范
- 前缀: LEX_02_02 表示 Chapter 2 Section 2
- 示例: `LEX_02_02_001_PASS_FOUR_ELEMENT_TYPES.ets`

---

## 规范引用来源

### ArkTS Static Language Specification

1. **§2.2 Lexical Input Elements** - 定义四类词法输入元素
2. **spec/expressions.md** - Token识别规则
3. **spec/statements.md** - 语句分隔规则
4. **spec/lexical.md** - 词法结构定义

### ⚠️ skill 文档未明确说明的内容

| 主题 | 未明确说明 | 影响 |
|------|----------|------|
| ASI（自动分号插入） | spec 未明确ASI行为 | ⭐⭐ HIGH |
| 嵌套多行注释 | spec 未明确是否支持 | ⭐ LOW |
| 空文件编译行为 | spec 未明确空文件是否合法 | ⭐ LOW |

---

**最后更新：** 2026-06-20 (v5.0 - 补充测试因子checklist)
**参考规范：**
- ArkTS Static Language Specification: `C:/Users/ymwangfa/.opencode/skills/arkts-static-spec/spec/`
- 测试因子checklist: `E:\需求\测试因子checklist.md`