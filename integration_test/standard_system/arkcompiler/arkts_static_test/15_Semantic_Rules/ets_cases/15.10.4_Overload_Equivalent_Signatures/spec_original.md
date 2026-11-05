# 15 Semantic Rules - Spec Original (Reference)

> 本文件为规范原文参考摘录，便于测试用例设计时对照。
> 完整规范请参考 `doc/15Semantic Rules.md`。

---

15.10.4 Overload-Equivalent Signatures

Signatures _S1 _and _S2 _are _overload-equivalent _if:

• Both have the same number of parameters;

• _Effective signature types _(see Type Erasure) of each parameter type in _S1 _and _S2 _are equal.

Return types of _S1 _and _S2 _do not afect overload-equivalence.

The following code causes a compile-time error as function signatures are overload-equivalent:

1 function foo(x : Array<string>) : string {}

2 function foo(x : Array<number>) : number {} // Compile-time error
