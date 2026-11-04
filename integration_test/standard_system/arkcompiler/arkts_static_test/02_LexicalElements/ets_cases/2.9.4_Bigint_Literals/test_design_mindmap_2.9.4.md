# 2.9.4 Bigint Literals - 测试设计思维导图（v1.1 - 补充cross_lang_verify目录）

> ⚠️ 重要说明：本测试设计参考 ArkTS Static Language Specification §2.9.4，并结合 TESTING_PROCESS_GUIDE.md 要求，标准化为所有章节的统一格式。所有测试用例均已通过实际 ark VM 运行验证。

## 概述
Bigint literals 表示具有无限位数的整数。bigint 字面量始终为 bigint 类型。

**Spec 文法：**
```
BigIntLiteral: DecimalIntegerLiteral 'n';
```

---

## 全覆盖测试矩阵

### 维度 1：基本 bigint

#### A. 基本 bigint 字面量
- **A1** 基本 bigint：`153n`, `0n`, `1n`（001）

### 维度 2：下划线分隔符

#### B. bigint 带下划线
- **B1** bigint 带下划线：`1_153n`, `1_000_000n`（002）

### 维度 3：负 bigint

#### C. 负 bigint 字面量
- **C1** 负 bigint：`-153n`, `-1_000_000n`（003）

### 维度 4：大数值

#### D. 大数值 bigint
- **D1** 超出 long 范围：`9223372036854775808n`（004）

### 维度 5：类型推断

#### E. 类型推断
- **E1** bigint 类型推断（005）

### 维度 6：compile-fail

#### F. 非法格式
- **F1** 小数点后 n 后缀（006）
- **F2** 科学计数法后 n 后缀（007）

### 维度 7：runtime

#### G. 运行时验证
- **G1** bigint 运算（008）
- **G2** 下划线不影响值（009）
- **G3** BigInt 转换函数（010）
- **G4** bigint 比较（011）

---

## 测试因子checklist 重点补充项（对照 2.1 标准）

### ✅ 必须正交的因子（已覆盖）

#### 1. 局部/全局书写
- ✅ **顶层变量**: bigint 在全局作用域中的声明
- ✅ **函数内局部变量**: bigint 在函数体内的使用
- ✅ **作为参数传入**: bigint 作为函数参数
- ✅ **作为返回值返回**: bigint 作为函数返回值

#### 2. 类型推断
- ✅ **bigint 类型推断**: `153n` 推断为 bigint

---

## 分类说明
- **compile-pass**（.ets 文件必须编译成功）
- **compile-fail**（.ets 文件必须产生编译时错误）
- **runtime**（.ets 文件测试运行时行为）

## 文件命名规范
- `<分类>_<子类型>_<场景>.ets`
- 示例: `LEX_02_09_04_001_PASS_BIGINT_BASIC.ets`
- 前缀: LEX_02_09_04 表示 Chapter 2 Section 9.4

---

## 规范引用来源

### ArkTS Static Language Specification

1. **§2.9.4 Bigint Literals**
   - 语义：定义 bigint 字面量的语法规则
   - 参考：spec/lexical.md

---

**最后更新：** 2026-06-21 (v1.0 - 标准化)
