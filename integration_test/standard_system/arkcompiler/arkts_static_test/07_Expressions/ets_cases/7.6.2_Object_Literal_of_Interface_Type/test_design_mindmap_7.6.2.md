# 7.6.2 Object Literal of Interface Type - 测试设计思维导图

## 概述

接口类型 I 从上下文推断时，对象字面量类型是为 I 隐式创建的匿名类。匿名类包含与接口属性对应的字段：普通属性、getter 返回类型、setter 参数类型。getter+setter 类型必须一致（否则编译时错误），可选属性可跳过（值设为 undefined），非可选属性不可跳过（即使类型有默认值）。必须实现所有无默认实现的方法，方法可使用 override-compatible 签名。`this` 引用匿名类实例，不能引入新方法（编译时错误）。接口属性形式决定匿名类行为的读写权限。

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | 基本接口类型 | 普通属性、getter、setter 映射为匿名类字段 |
| 002 | 可选属性跳过 | 可选属性可跳过（值设为 undefined） |
| 003 | 实现无默认方法 | 实现无默认接口方法 |
| 004 | 跳过有默认方法 | 跳过有默认实现的接口方法 |
| 005 | 覆盖默认方法 | 覆盖有默认实现的接口方法 |
| 006 | Override-compatible 签名 | 更宽参数类型实现多个重载 |
| 007 | 多个重载实现 | 多个重载同时实现 |
| 008 | this 引用 | `this` 在方法体中引用匿名类实例 |
| 009 | setter-only 属性 | 可写但不可读 |
| 010 | getter-only 属性 | 可读但不可写（返回值是字面量值） |
| 011 | readonly 属性 | 同 getter-only，可读不可写 |
| 012 | 普通属性 | 可读写 |
| 013 | getter+setter 类型一致 | getter+setter 类型必须一致 |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 014 | 非可选属性跳过 | 非可选属性跳过 → 编译时错误 |
| 015 | 引入新方法 | 引入新方法 → 编译时错误 |
| 016 | getter/setter 类型不匹配 | getter/setter 类型不匹配 → 编译时错误 |
| 017 | 缺少必需方法 | 缺少必需方法 → 编译时错误 |
| 018 | setter-only 读取 | 读取 setter-only 属性 → 编译时错误 |
| 019 | getter-only 写入 | 写入 getter-only 属性 → 编译时错误 |
| 020 | readonly 写入 | 写入 readonly 属性 → 编译时错误 |
| 021 | 属性值类型不匹配 | 属性值类型不匹配 → 编译时错误 |

### runtime（验证实际计算值符合规则）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 022 | 基本字段值 | name/age 字段值正确 |
| 023 | this 引用 | this 引用正确 |
| 024 | 方法调用 | twice 方法返回值正确 |
| 025 | 可选属性 undefined | 可选属性值为 undefined |
| 026 | 默认接口方法 | 默认接口方法工作正确 |

## 文件命名规范

`EXP_07_06_02_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
