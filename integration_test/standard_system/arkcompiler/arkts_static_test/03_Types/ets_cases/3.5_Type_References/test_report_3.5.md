# 3.5 Type References - 测试执行报告

**测试日期：** 2026-06-11
**编译器：** es2panda
**运行时：** ark VM + boot files
**运行环境：** WSL2 Ubuntu 22.04
**对应规范：** ArkTS Static Spec §3.5 Type References

---

## 总体统计

| 分类 | 总数 | 通过 | 失败 | 通过率 |
|------|------|------|------|--------|
| compile-pass | 10 | 10 | 0 | 100% |
| compile-fail | 5 | 5 | 0 | 100% |
| runtime（真实执行） | 4 | 4 | 0 | 100% |
| **总计** | **19** | **19** | **0** | **100%** |

**🎯 一次通过率：100%**（本次执行无任何用例失败）

---

## 详细执行结果

### compile-pass（10个）

| # | 用例 ID | 测试内容 | 结果 |
|---|---------|---------|------|
| 001 | PASS_SIMPLE_NAME_REF | simple name 类型引用 | PASS |
| 002 | PASS_QUALIFIED_NAME_REF | namespace.Type 限定名 | PASS |
| 003 | PASS_NESTED_QUALIFIED | 嵌套 namespace 限定名 | PASS |
| 004 | PASS_GENERIC_EXPLICIT_ARGS | 显式 type arguments | PASS |
| 005 | PASS_GENERIC_NESTED_REF | 嵌套泛型引用 A<B<C>> | PASS |
| 006 | PASS_GENERIC_DEFAULT_TYPE_PARAM | 默认类型参数 <T = int> | PASS |
| 007 | PASS_TYPE_ALIAS_REPLACEMENT | spec 关键例子 T1=Object | PASS |
| 008 | PASS_TYPE_ALIAS_RECURSIVE | alias 链式替换 | PASS |
| 009 | PASS_GENERIC_ALIAS_REF | 泛型 alias MyType<T> | PASS |
| 010 | PASS_TYPE_PARAM_REF_INSIDE_GENERIC | 泛型类内 T 引用 | PASS |

### compile-fail（5个）

| # | 用例 ID | 测试内容 | 结果 |
|---|---------|---------|------|
| 011 | FAIL_GENERIC_WRONG_ARITY | 泛型参数数量错 | PASS |
| 012 | FAIL_GENERIC_CONSTRAINT_VIOLATE | 违反 extends 约束 | PASS |
| 013 | FAIL_VARIABLE_AS_TYPE_REF | 变量名作类型 | PASS |
| 014 | FAIL_UNDEFINED_QUALIFIED_NAME | namespace 内不存在的类型 | PASS |
| 015 | FAIL_ALIAS_DIRECT_RECURSION | type A = A 循环引用 | PASS |

### runtime（4个，真实执行 + assert）

| # | 用例 ID | 验证内容 | 断言数 | 结果 |
|---|---------|---------|--------|------|
| 016 | RUNTIME_ALIAS_TRANSPARENT | alias 与底层类型透明等价 | 3 | PASS |
| 017 | RUNTIME_GENERIC_REF_INSTANTIATE | 泛型引用实例化 | 5 | PASS |
| 018 | RUNTIME_QUALIFIED_NAME_REF | namespace.Type 实例化 | 2 | PASS |
| 019 | RUNTIME_GENERIC_ALIAS_REF | 泛型 alias MyType<T> 运行时 | 2 | PASS |

---

## 执行过程异常

**本次运行无失败用例，无需修复。**

---

## 后续运行命令

```bash
cd /mnt/d/git/ARKTS_STATIC_TEST/03_Types
SECTIONS="3.5_Type_References" bash run_types_cases_wsl.sh
```