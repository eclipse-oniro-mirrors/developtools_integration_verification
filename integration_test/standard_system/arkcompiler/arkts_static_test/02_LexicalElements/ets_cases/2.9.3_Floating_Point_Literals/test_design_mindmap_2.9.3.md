# 2.9.3 Floating-Point Literals - 测试设计思维导图（v1.1 - 补充cross_lang_verify目录）

> ⚠️ 重要说明：本测试设计参考 ArkTS Static Language Specification §2.9.3，并结合 TESTING_PROCESS_GUIDE.md 要求，标准化为所有章节的统一格式。所有测试用例均已通过实际 ark VM 运行验证。

## 概述
Floating-point literals 表示十进制数字，由整数部分、小数点、小数部分、指数和 float 类型后缀组成。

**Spec 文法：**
```
FloatLiteral:
  DecimalIntegerLiteral '.' FractionalPart? ExponentPart? FloatTypeSuffix?
  | '.' FractionalPart ExponentPart? FloatTypeSuffix?
  | DecimalIntegerLiteral ExponentPart? FloatTypeSuffix
;
```

---

## 全覆盖测试矩阵

### 维度 1：标准浮点

#### A. 基本浮点
- **A1** 标准浮点：`3.14`, `0.5`, `100.0`（001）
- **A2** 无前导零浮点：`.5`, `.25`（002）

### 维度 2：下划线分隔符

#### B. 浮点带下划线
- **B1** 浮点带下划线：`3.141_592`（003）

### 维度 3：科学计数法

#### C. 科学计数法
- **C1** 科学计数法：`1e10`, `1.5e-5`, `2E3`（004）
- **C2** 科学计数法带下划线：`1_000e10`（006）

### 维度 4：float 类型后缀

#### D. float 后缀
- **D1** float 后缀：`3.14f`, `1234f`, `1e10f`（005）

### 维度 5：类型推断

#### E. 类型推断
- **E1** double 类型推断（无后缀）（007）
- **E2** float 类型推断（带 f 后缀）（008）

### 维度 6：compile-fail

#### F. 超出范围
- **F1** float 类型值超出范围（009）
- **F2** double 类型值超出范围（010）
- **F3** 无效的 float 后缀（011）

### 维度 7：runtime

#### G. 运行时验证
- **G1** 浮点运算（012）
- **G2** 科学计数法值（013）
- **G3** float 后缀值（014）
- **G4** 下划线不影响值（015）

---

## 测试因子checklist 重点补充项（对照 2.1 标准）

### ✅ 必须正交的因子（已覆盖）

#### 1. 局部/全局书写
- ✅ **顶层变量**: 浮点字面量在全局作用域中的声明
- ✅ **函数内局部变量**: 浮点字面量在函数体内的使用
- ✅ **作为参数传入**: 浮点字面量作为函数参数
- ✅ **作为返回值返回**: 浮点字面量作为函数返回值

#### 2. 类型推断
- ✅ **double 类型推断**: 无后缀浮点推断为 double
- ✅ **float 类型推断**: 带 f 后缀推断为 float

---

## 分类说明
- **compile-pass**（.ets 文件必须编译成功）
- **compile-fail**（.ets 文件必须产生编译时错误）
- **runtime**（.ets 文件测试运行时行为）

## 文件命名规范
- `<分类>_<子类型>_<场景>.ets`
- 示例: `LEX_02_09_03_001_PASS_FLOAT_STANDARD.ets`
- 前缀: LEX_02_09_03 表示 Chapter 2 Section 9.3

---

## 规范引用来源

### ArkTS Static Language Specification

1. **§2.9.3 Floating-Point Literals**
   - 语义：定义浮点字面量的语法规则和类型推断
   - 参考：spec/lexical.md

---

**最后更新：** 2026-06-21 (v1.0 - 标准化)
