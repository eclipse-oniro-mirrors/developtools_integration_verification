# 15 Semantic Rules - Spec Original (Reference)

> 本文件为规范原文参考摘录，便于测试用例设计时对照。
> 完整规范请参考 `doc/15Semantic Rules.md`。

---

15.11.4 Overload Set for Class Static Methods

An overload set of static methods for a given class is formed from implicitly overloaded methods (see Implicit Method Overloading), and from the methods listed in Explicit Class Method Overload.

The algorithm that defines the order of an _overload set _considers only the static methods defined directly in a class scope (see Forming an Overload Set) because static methods are not inherited.

The formation and the use of an _overload set _by the _overload resolution _is represented in the example below:

1 class C {

2

3 static foo() {} // implicitly overloaded foo#1

4 static foo(b : boolean) {} // implicitly overloaded foo#2

5 static fooX(x? : number) {}

6

7 static overload foo {foo, fooX}

8 _// The overload set for 'foo ' is {foo#1, foo#2, fooX} _9 }

10

11 C.foo (1) // fooX is called

12 C.foo () // foo#1 is called

13 C.foo (true) // foo#2 is called
