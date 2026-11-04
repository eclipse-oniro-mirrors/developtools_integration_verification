# 15 Semantic Rules - Spec Original (Reference)

> 本文件为规范原文参考摘录，便于测试用例设计时对照。
> 完整规范请参考 `doc/15Semantic Rules.md`。

---

15.10.3 Implicit Constructor Overloading

Two or more unnamed constructors within a class are implicitly overloaded. If signatures of two overloaded constructors are _overload-equivalent _(see Overload-Equivalent Signatures), then a compile-time error occurs.

Overload Resolution_ _is used to determine exactly which one constructor is to be called in a class instance creation expression (see New Expressions).

1 class BigFloat {

2 /other code/

3 constructor (n : number) {/body1/} // #1

4 constructor (s : string) {/body2/} _// #2 _5 }

6

7 new BigFloat(1) // constructor, marked #1, is used

8 new BigFloat("3 . 14") // constructor, marked #2, is used
