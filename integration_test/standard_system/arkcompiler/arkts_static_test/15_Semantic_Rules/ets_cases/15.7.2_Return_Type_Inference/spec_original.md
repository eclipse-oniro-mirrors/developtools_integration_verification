# 15 Semantic Rules - Spec Original (Reference)

> 本文件为规范原文参考摘录，便于测试用例设计时对照。
> 完整规范请参考 `doc/15Semantic Rules.md`。

---

15.7.2 Return Type Inference

A missing function, method, getter, or lambda return type can be inferred from the function, method, getter, or lambda body. A compile-time error occurs if return type is missing from a native function (see Native Functions).

The current version of ArkTS allows inferring return types at least under the following conditions:

• If there is no return statement, or if all return statements have no expressions, then the return type is void (see Type void or undefined). It efectively implies that a call to a function, method, or lambda returns the value undefined.

• If there are _k _return statements (where _k _is 1 or more) with the same type expression R, then R is the return type.

• If there are _k _return statements (where _k _is 2 or more) with expressions of types T1 , ..., Tk , then R is the union type (seeUnion Types) of these types (T1 | . . . | Tk ), and its normalized version (see Union Types Normalization) is the return type. If at least one of return statements has no expression, then type undefined is added to the return type union.

• If a lambda body contains no return statement but at least one throw statement (see throw Statements), then the lambda return type is never (see Type never).

• If a function, a method, or a lambda is async (see_Asynchronous execution_), a return type is inferred by applying the above rules, and the return type T is not Promise, then the return type is assumed to be Promise.

Return type inference is represented in the example below:



1 // Explicit return type

2 function foo() : string { return "foo" }

3

4 // Implicit return type inferred as string

5 function goo() { return "goo" }

6

7 class Base {}

8 class Derived1 extends Base {}

9 class Derived2 extends Base {}

10

11 function bar (condition : boolean) {

12 if (condition)

13 return new Derived1()

14 else

15 return new Derived2() 16 }

17 // Return type of bar will be Derived1|Derived2 union type

18

19 function boo (condition : boolean) {

20 if (condition) return 1 21 }

22 // That is a compile-time error as there is an execution path with no return

_Smart types _can appear in the process of return type inference (see Smart Casts and Smart Types). A compile-time error occurs if an inferred return type is a Type Expressionthat cannot be expressed in ArkTS:

1 class C{}

2 interface I {}

3 class D extends C implements I {}

4

5 function foo(c : C) {

6 return c instanceof I ? c : new D() _// Compile-time error, inferred type is C & I _7 }
