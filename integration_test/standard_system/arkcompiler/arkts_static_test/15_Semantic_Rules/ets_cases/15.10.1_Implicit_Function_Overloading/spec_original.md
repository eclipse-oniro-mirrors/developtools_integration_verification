# 15 Semantic Rules - Spec Original (Reference)

> 本文件为规范原文参考摘录，便于测试用例设计时对照。
> 完整规范请参考 `doc/15Semantic Rules.md`。

---

15.10.1 Implicit Function Overloading

Two or more functions declared with the same name in the same declaration scope are implicitly overloaded.

. Note

Same-name functions declared in diferent scopes cannot be _implicitly overloaded _(see Declaration Distinguishable by Signatures). A compile-time error occurs if the names of an imported function and of a function declared in the current module are the same.

When calling an overloaded function (see Function Call Expression), Overload Resolutionis used to determine exactly which function must be called.

1 function foo(p : number) {} // #1

2 function foo(p : string) {} // #2

3

4 foo(5) // function marked #1 is called

5 foo("5") // function marked #2 is called

If signatures of two implicitly overloaded non-generic functions are overload-equivalent (see Overload-Equivalent Sig- natures), then a compile-time error occurs. However, an implicit overload with instantiation of a generic and overload- equivalent non-generic function causes no compile-time error, and the textually first function is used:

1 function goo(x : int) : void {}

2 function goo(x : int) : void {} // Compile-time error, overload-equivalent

3 // non-generic functions

4

5 function foo<T>(x : T) {}

6 function foo(x : number) {}

7

8 foo(1) // OK, instance of foo() with T=number called

9

10 function bar(x : number) {}

11 function bar<T>(x : T) {}

12

13 bar(1) // OK, plain bar() called
