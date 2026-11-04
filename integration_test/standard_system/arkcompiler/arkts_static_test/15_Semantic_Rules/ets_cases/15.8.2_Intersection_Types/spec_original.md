# 15 Semantic Rules - Spec Original (Reference)

> 本文件为规范原文参考摘录，便于测试用例设计时对照。
> 完整规范请参考 `doc/15Semantic Rules.md`。

---

15.8.2 Intersection Types

An _intersection type _is a type created from other types by using the intersection operator '& '. The values of intersection type A & B are all values that belong to both A and B. The same applies to the set of operations.

Intersection types cannot be expressed directly in ArkTS. Instead, they appear as _smart types _of variables in the process of Computing Smart Typesas represented below:

1 class C {

2 foo() {} 3 }

4 interface I {

5 bar() : void 6 }

7

8 function test(i : I) {

9 if (i instanceof C) {

10 // smart type of 'i ' here is of some subtype of 'C' that implements 'I '

11 // type expression for this type is I & subtype of C

12 i.foo () // OK

13 i.bar() _// OK _14 }

15 }

More details are provided in Subtyping for Intersection Types.
