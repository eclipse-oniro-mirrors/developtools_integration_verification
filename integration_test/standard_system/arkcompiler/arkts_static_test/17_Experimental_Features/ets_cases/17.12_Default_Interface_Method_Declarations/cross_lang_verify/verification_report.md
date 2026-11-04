# 17.12 Default Interface Method Declarations - 跨语言验证实测报告

**验证日期：** 2026-06-23
**验证环境：** WSL2 Ubuntu 22.04

---

## 一、ArkTS 实测结果

| 用例 | 预期 | 实测结果 | 退出码 | 备注 |
|------|------|---------|--------|------|
| EXP2_17_12_001 compile-pass | 编译通过 | ✅ 编译通过 | 0 | 接口默认方法基本声明 |
| EXP2_17_12_002 compile-pass | 编译通过 | ✅ 编译通过 | 0 | 多个默认方法 |
| EXP2_17_12_003 compile-pass | 编译通过 | ✅ 编译通过 | 0 | 私有默认方法 |
| EXP2_17_12_004 compile-pass | 编译通过 | ✅ 编译通过 | 0 | 多参数类型（修复 Formatter→DataFormatter） |
| EXP2_17_12_005 compile-pass | 编译通过 | ✅ 编译通过 | 0 | this 访问接口属性 |
| EXP2_17_12_010 compile-fail | 编译失败 | ✅ 编译失败 (ESE0127/ESE0139) | 1 | 私有方法不可外部访问 |
| EXP2_17_12_011 compile-fail | 编译失败 | ✅ 编译失败 (ESE985118/ESE0136) | 1 | 返回类型不兼容 |
| EXP2_17_12_012 compile-fail | 编译失败 | ✅ 编译失败 (ESE0087) | 1 | 调用不存在方法 |
| EXP2_17_12_013 compile-fail | 编译失败 | ✅ 编译失败 (ESE0130) | 1 | 重复方法定义 |
| EXP2_17_12_014 compile-fail | 编译失败 | ✅ 编译失败 (ESY0228) | 1 | 语法错误 |
| EXP2_17_12_020 runtime | 运行时通过 | ✅ PASS: default method invoked correctly | 0 | |
| EXP2_17_12_021 runtime | 运行时通过 | ✅ PASS: override takes precedence | 0 | |
| EXP2_17_12_022 runtime | 运行时通过 | ✅ PASS: private default methods work | 0 | |
| EXP2_17_12_023 runtime | 运行时通过 | ✅ PASS: complex logic works | 0 | |

---

## 二、Java 实测结果

**环境：** Java 21.0.11

| 文件 | 编译 | 运行 | 输出 | 退出码 |
|------|------|------|------|--------|
| JavaDefaultBasic.java | ✅ | ✅ | Hello from default method / PASS | 0 |
| JavaPrivateDefault.java | ✅ | ✅ | PASS: sum=7, product=15 | 0 |
| JavaOverridePrecedence.java | ✅ | ✅ | PASS: override takes precedence | 0 |
| JavaComplexLogic.java | ✅ | ✅ | PASS: complex logic works correctly | 0 |

**Java 差异说明：**
- Java 使用 `default` 关键字显式声明默认方法
- Java 9+ 支持 `private` 接口方法
- Java 接口不能声明实例字段，不能使用 `this.xxx` 访问实例属性
- Java 的 `@Override` 注解是可选的，但推荐使用

---

## 三、Swift 实测结果

**环境：** Swift 5.10 **不可用**（未安装于当前系统）

Swift 代码文件已创建于 `cross_lang_verify/` 目录，但无法执行。以下是基于 Swift 语言规范的预期行为：

| 文件 | 预期编译 | 预期运行 | Swift 特性说明 |
|------|---------|---------|---------------|
| SwiftDefaultBasic.swift | ✅ | ✅ | Swift 用 protocol extension 而非接口内默认方法 |
| SwiftOverridePrecedence.swift | ✅ | ✅ | 类方法优先于 extension 默认实现 |
| SwiftComplexLogic.swift | ✅ | ✅ | extension 可访问 protocol 声明的属性（通过 `{ get }`） |

**Swift 关键差异：**
- Swift **不支持**接口内默认方法声明语法
- Swift 通过 **协议扩展（protocol extension）** 提供默认实现
- Swift 协议扩展中 **不支持 private 方法**
- Swift 协议扩展不能直接访问 stored properties，需要通过协议声明计算属性 `{ get }`

---

## 四、Syntax 差异对比

| 特性 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 默认方法声明位置 | 接口内 `method(): type { body }` | 接口内 `default type method() { body }` | 协议扩展 `extension Proto { func method() {} }` |
| 私有默认方法 | ✅ `private method() {}` | ✅ (Java 9+) `private type method() {}` | ❌ 不支持 |
| 接口实例属性 | ✅ `name: string` | ❌（仅常量） | ❌（需声明为 `{ get }`） |
| this 访问实例属性 | ✅ `this.name` | ❌ 无实例属性 | ✅（通过协议声明 `{ get }`） |
| 类重写默认方法 | ✅ 签名匹配即可 | ✅ + `@Override` 可选 | ✅ 签名匹配即可 |
| 类选择不重写 | ✅ 继承默认 | ✅ 继承默认 | ✅ 继承 extension 默认 |

> **核心发现：** ArkTS 的默认接口方法设计在语法简洁性上优于 Java（省略 `default` 关键字）且能力上超过 Swift（支持 private、this.属性访问）。ArkTS 是三者中唯一同时支持 **接口内实例属性 + 私有默认方法 + this 属性访问** 的语言。
