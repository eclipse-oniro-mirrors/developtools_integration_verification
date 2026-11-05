# 15 Semantic Rules - Spec Original (Reference)

> 本文件为规范原文参考摘录，便于测试用例设计时对照。
> 完整规范请参考 `doc/15Semantic Rules.md`。

---

15.10.2 Implicit Method Overloading

Two or more methods within a class or an interface are implicitly overloaded if:

• All have the same name;

• All are either static or non-static.

A compile-time error occurs if signatures of two implicitly overloaded methods are overload-equivalent (seeOverload- Equivalent Signatures).

Implicit overload can be caused by method declaration or inheritance:

1 class Base{

2 foo(p : number) {} _// #1 _3 }

4

5 class Derived extends Base {

6 foo(p : string) {} _// #2 _7 }

8

9 let d = new Derived()

10

11 d.foo(5) // method marked #1 is called

12 d.foo("5") // method marked #2 is called

When calling an overloaded method (see Method Call Expression), Overload Resolution_ _is used to determine exactly which method is to be called.

1 class C{

2 foo(p : number) {} // #1

3 foo(p : string) {} _// #2 _4 }

5

6 let c = new C()

7

8 c.foo(5) // method marked #1 is called

9 c.foo("5") // method marked #2 is called

If an instantiation of a generic class or a generic interface leads to an _overload-equivalent _method, then the textually first method is called:

1 class Template<T> {

2 foo (p : T) { console.log("generic foo") }

3 foo (p : number) { console.log("plain foo") }

4 bar (p : number) { console.log("plain bar") }

5 bar (p : T) { console.log("generic bar") } 6 }

7

8 // This instantiation leads to two overload-equivalent methods

9 let instantiation : Template<number> = new Template<number>

10

11 instantiation.foo (1) // prints 'generic foo'

12 instantiation.bar (1) // prints 'plain bar'
