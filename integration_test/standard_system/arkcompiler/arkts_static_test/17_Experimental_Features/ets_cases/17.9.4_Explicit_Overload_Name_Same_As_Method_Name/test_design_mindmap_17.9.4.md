# 17.9.4 Explicit Overload Name Same As Method Name - 测试设计思维导图

## 概述
重载名可以与某个方法名相同（该方法必须在列表中）。不会产生歧义，因为重载名不在 overriding、重载实体列表、Method Reference 中考虑。跨继承层次工作。如果存在同名方法但不在 overload 列表中则编译错误。

## 子类型覆盖

### 1. 重载名与类方法同名
- 正向编译: overload 名与列表中某个方法同名
- 反向编译: 同名方法存在但不在 overload 列表中

### 2. 重载名与接口方法同名
- 正向编译: 接口中 overload 名与接口方法同名

### 3. 跨继承层次
- 正向编译: 子类中 overload 名与父类方法同名
- 正向编译: 子类中 overload 名与子类自身方法同名

### 4. 重载名不被考虑为普通方法
- 正向编译: 可以同时有同名方法和 overload（该方法在列表中）
- 反向编译: 同名方法不在列表中，试图同时存在

### 5. Method Reference 不匹配 overload 名称
- 正向编译: Method Reference 指向实际方法而非 overload 名

### 6. overriding 中不产生歧义
- 正向编译: 方法重写时 overload 名不干扰

## 分类说明
- **compile-pass**: 文件必须编译成功
- **compile-fail**: 文件必须产生编译时错误
- **runtime**: 文件测试运行时行为

## 文件命名规范
- `EXP2_NameConflict_<场景>_pass.ets`
- `EXP2_NameConflict_<场景>_fail.ets`
- `EXP2_NameConflict_<场景>_runtime.ets`
