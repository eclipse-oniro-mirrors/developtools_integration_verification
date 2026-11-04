# 15 Semantic Rules - Spec Original (Reference)

> 本文件为规范原文参考摘录，便于测试用例设计时对照。
> 完整规范请参考 `doc/15Semantic Rules.md`。

---

15.8.3 Difference Types

A _difference type _is a type created from two other types by a subtraction operation, i.e., by using the operator '- '. The values of the diference type A - B are all values that belong to type A but not to type B. The same applies to the set of operations.

Diference types in ArkTS cannot be expressed directly. They appear as _smart types _of variables in the process of Computing Smart Types:

1 function foo(x : string | undefined) : number {

2 if (x == undefined) {

3 return 0

4 } else {

5 _// smart type of 'x ' here is (string | undefined - undefined) = string, _6 // hence, string property can be applied to 'x '

7 return x .length 8 }

9 }

This is discussed in detail in Subtyping for Difference Types.
