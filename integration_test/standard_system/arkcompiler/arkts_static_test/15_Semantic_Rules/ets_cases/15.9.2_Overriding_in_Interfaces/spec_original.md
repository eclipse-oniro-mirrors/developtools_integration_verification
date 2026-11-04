# 15 Semantic Rules - Spec Original (Reference)

> 本文件为规范原文参考摘录，便于测试用例设计时对照。
> 完整规范请参考 `doc/15Semantic Rules.md`。

---

15.9.2 Overriding in Interfaces

If a method is defined in a subinterface with the same name as an accessible method in the superinterface, then the following semantic rules apply:

• If signatures are not _override-compatible _(see Override-Compatible Signatures), and if signatures formed by using _effective signature types _of original signatures are _override-compatible _after type erasure, then a compile- time error occurs.

• If signatures are _override-compatible _(see Override-Compatible Signatures), then the method of subinterface overrides the method of superinterface _in _the subinterface.

• Otherwise, Implicit Method Overloadingis used.

1 interface Base {

2 m(p : string) : void

3 m(p : number) : void 4 }

5 interface Derived extends Base {

6 m(p : object) : void _// m overrides both Base.m(string) and Base.m(number) _7 }

. Note

Several methods of superinterface can be overridden by a single method in a subinterface.

1 interface Base {

2 method_1()

3 method_2(p : number)

4 method_3() : string

5 method_4(a : Array<string>)

6 private foo() {} _// private method with implementation body _7 }

8 interface Derived extends Base {

9 method_1() // overriding

10 method_2(p : string) // overloading

11 method_3() : number // Compile-time error, bad overriding, return type mismatch

12 method_4(a : Array<number>) // Compile-time error, original signatures are

13 // not override-compatible, but effective

14 // signatures after type erasure are compatible .

15 foo(p : number) : void // it is just a new method declaration

16 // Base.foo_() is not accessible here at all _17 }

If more than one method of the subinterface overrides the same method of the superinterface a compile-time error occurs.

1 interface I{

2 foo (p : C) : void 3 }

4 interface C extends I { // More than one method of interface C overrides the same␣ ˓→__method

5 foo (p : C) : void

6 foo (p : I) : void 7 }
