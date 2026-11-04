# 15 Semantic Rules - Spec Original (Reference)

> 本文件为规范原文参考摘录，便于测试用例设计时对照。
> 完整规范请参考 `doc/15Semantic Rules.md`。

---

15.11.6 Overload Set for Constructors

For a given class, the overload set for constructors is formed from implicitly overloaded constructors (see Implicit Constructor Overloading) and from constructors listed in Explicit Constructor Overload. The order of constructors in the overload set is determined according to the following rules:

• If an overload set is formed from implicitly overloaded constructors only, the order is the textual order of con- structors declarations;

• If and overload set is formed from _explicit overload _only, the order is the order of constructors in its list.

• For a combination of implicitly and explicitly overloaded constructors, the order is based by the order in explicit overload, all unnamed constructors are included in textual order of their declarations to the beginning of the ordered set.

The example below illustrates how _overload set _is formed and used by overload resolution:

1 class C {

2 constructor () {} // ctor#1

3 constructor (s : string) // ctor#2

4 constructor fromNumber(n : number) {}

5 overload constructor { fromNumber } 6 }

7 /* The overload set of constructors for class 'C' is

8 {ctor#1, ctor2#1, fromNumber} */

9

(continues on next page)

(continued from previous page)

10 new C() // ctor#1 is used

11 new C('ab') // ctor#2 is used

12 new C(1) // fromNumber is used
