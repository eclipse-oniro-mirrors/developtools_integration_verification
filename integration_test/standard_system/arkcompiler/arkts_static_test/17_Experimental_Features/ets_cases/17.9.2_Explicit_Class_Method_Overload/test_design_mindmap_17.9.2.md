# 17.9.2 Explicit Class Method Overload - 测试设计思维导图

## 概述
显式类方法重载使用 `[static] [async] overload identifier { method1, method2, ... }` 语法。编译时错误：static overload 包含非 static 方法，或反之；async 不匹配。访问修饰符规则：public overload → 所有方法必须 public；protected → 不能有 private。可在子类中覆盖（必须列出所有父类方法，可添加/重排）。可重载特殊名称方法（$_get, $_set, $_iterator）。

## 子类型覆盖

### 1. 基本类方法重载
- 正向编译: 类内 overload 声明，不同参数类型
- 运行时: 调用 overload 验证正确分发

### 2. static modifier
- 正向编译: static overload 包含 static 方法
- 反向编译: static overload 包含实例方法
- 反向编译: 实例 overload 包含 static 方法

### 3. async modifier
- 正向编译: async overload 包含 async 方法
- 反向编译: async 不匹配（async overload 含非 async 方法，或反之）

### 4. 访问修饰符
- 正向编译: public overload → 所有方法 public
- 反向编译: protected overload 包含 private 方法

### 5. 子类覆盖 (override)
- 正向编译: 子类覆盖父类 overload，列出所有父类方法
- 正向编译: 子类覆盖时可添加新方法
- 反向编译: 子类覆盖但缺少父类方法

### 6. 特殊名称方法
- 正向编译: overload 包含 `$_get`, `$_set`, `$_iterator` 方法

### 7. 多个 overload 声明
- 正向编译: 同一个类中有多个 overload 声明

### 8. 重载名与方法同名
- 正向编译: overload 名称与某个方法同名
- 反向编译: 同名方法不在列表中

## 分类说明
- **compile-pass**: 文件必须编译成功
- **compile-fail**: 文件必须产生编译时错误
- **runtime**: 文件测试运行时行为

## 文件命名规范
- `EXP2_MethodOverload_<场景>_pass.ets`
- `EXP2_MethodOverload_<场景>_fail.ets`
- `EXP2_MethodOverload_<场景>_runtime.ets`
