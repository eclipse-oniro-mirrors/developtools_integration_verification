# 15 Semantic Rules - Spec Original (Reference)

> 本文件为规范原文参考摘录，便于测试用例设计时对照。
> 完整规范请参考 `doc/15Semantic Rules.md`。

---

15.9.1 Overriding in Classes

. **Note **

Only accessible (see Accessible) methods are subjected to overriding. The same rule applies to accessors in case of overriding.

An overriding method can retain access modifier of a method from a superclass or a superinterface, or change _protected _for public (seeAccess Modifiers). Otherwise, a compile-time error occurs.

1 class Base {

2 public public_member() {}

3 protected protected_member() {}

4 private private_member() {} 5 }

6

7 interface Interface {

8 public_member() // All members are public in interfaces

9 private private_member() {} // Except private methods with default implementation

(continues on next page)

(continued from previous page)

10 }

11

12 class Derived extends Base implements Interface {

13 public override public_member() {}

14 // Public member can be overridden and/or implemented by the public one

15 public override protected_member() {}

16 // Protected member can be overridden by the protected or public one

17 override private_member() {}

18 // A compile-time error occurs as private methods of a superclass or

19 // a superinterface are not accessible in the derived class, and such

20 // a declaration attempt has nothing to override .

21 private_member() {}

22 // Will be a correct method declaration which is not related to

23 // private methods with the same name and signature from a supoer class

24 _// or superinterfaces _25 }

If an _instance method _is defined or inherited by a subclass with the same name as the _instance method _in a superclass or superinterface, then the following semantic rules are applied:

• If signatures are not _override-compatible _(see Override-Compatible Signatures), and if signatures formed by using _effective signature types _of original signatures are _override-compatible _after type erasure, then a compile- time error occurs.

• If signatures are _override-compatible _(see Override-Compatible Signatures), then the method of subinterface overrides the method of superinterface _in _the subinterface.

• Otherwise, Implicit Method Overloadingis used.

Overriding methods from a superclass is represented in the example below:

1 class Base {

2 method_ 1() {}

3 method_2(p : number) {} 4 }

5 class Derived extends Base {

6 override method_ 1() {} // overriding

7 override method_2(p : string) {} _// Compile-time error, not override-compatible _8 }

Overriding a method from a superinterface by a method from a superclass is represented in the example below:

1 interface I {

2 m() : void 3 }

4

5 class Base {

6 m() { } 7 }

8 class Derived extends Base implements I {

9 _// method 'm ' inherited from 'Base ' overrides 'm ' defined in 'I ' _10 }

A single method in a subclass can override several methods of a superclass:



1 class B {}

2 class C {

3 foo(a : A) {}

4 foo(b : B) {} 5 }

6 class D extends C {

7 foo(o : Object) { console.log("foo in D")} 8 }

9

10 let c : C = new D()

11 c.foo (new A()) // output: foo in D

12 c.foo (new B()) // output: foo in D

If more than one method of the subclass overrides the same method of the superclass a compile-time error occurs:

1 class I{

2 foo (p : C) {} 3 }

4 class C extends I { // More than one method of class C overrides the same method

5 foo (p : C) {}

6 foo (p : I) {} 7 }
