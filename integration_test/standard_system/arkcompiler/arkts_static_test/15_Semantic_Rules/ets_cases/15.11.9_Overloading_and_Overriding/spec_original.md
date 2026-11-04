# 15 Semantic Rules - Spec Original (Reference)

> 本文件为规范原文参考摘录，便于测试用例设计时对照。
> 完整规范请参考 `doc/15Semantic Rules.md`。

---

15.11.9 Overloading and Overriding

When calling an overloaded method (class instance method or interface method), both Overloading_ and Overriding _influence the actual method to call. As _compile-time _polymorphism, _overload resolution _selects the method to call from a class type or an interface type known at compile time. However, the method can be overridden in subtypes, and the actual method is called in accordance with the _runtime type _of the object from which the method is called.

. **Note **

Overriding does not influence forming of overload sets by itself despite any method declared in a class—both new or overridden—is placed in the overload set before any inherited method.

The manner _overloading _and _overriding _influence the method to call is represented in the example below:

1 class C1 {}

2 class C2 extends C1 {}

3

4 class A {

5 foo(c : C2) { console.log("A.C2") }

6 foo(c : C1) { console.log("A.C1") } 7 }

8

9 class B extends A {

10 override foo(c : C2) { console.log("B.C2") } 11 }

12

13 let a: A = new B()

14 a.foo (new C2()) // 1st call output: B.C2

15 a.foo (new C1()) // 2nd call output: A.C1

The details of the first call are as follows:

• Static type of a is A, and only this type is considered for overload resolution;

• First overloaded foo can be called, and is selected;

• Runtime type of a is B, foo(c: C2) is overridden in B, and then the method from B is called. The details of the second call are as follows:

• foo(c: C1) is selected to call;

• foo(c: C1) is not overridden, and the original method from A is called.

The situation where a single method in a subclass overrides several methods ofa superclass is represented in the example below:

1 class C1 {}

2 class C2 extends C1 {}

3

4 class A {

5 foo(c : C2) { console.log("A.C2") }

6 foo(c : C1) { console.log("A.C1") } 7 }

8

9 class D extends A {

10 foo(c : C1) { console.log("D.C1") } 11 }

12

13 let a: A = new D()

14 a.foo (new C2()) // 1st call output: D.C1

15 a.foo (new C1()) // 2nd call output: D.C1

In the example above, foo in D overrides both A methods (seeOverride-Compatible Signatures). As a result, the same method is called despite diferent methods are selected at compile time for the first and the second calls.
