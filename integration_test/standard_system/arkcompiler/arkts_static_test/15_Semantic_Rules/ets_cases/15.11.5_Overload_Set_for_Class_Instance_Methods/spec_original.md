# 15 Semantic Rules - Spec Original (Reference)

> 本文件为规范原文参考摘录，便于测试用例设计时对照。
> 完整规范请参考 `doc/15Semantic Rules.md`。

---

15.11.5 Overload Set for Class Instance Methods

An overload set for class instance methods of a given class is formed from the following:

• Implicitly overloaded methods (see Implicit Method Overloading);

• Explicitly overloaded methods listed in Explicit Class Method Overload;

• Methods from a direct superclass, if any.

The following steps are taken to form an overload set:

Explicitly and implicitly overloaded methods defined in a given class are added into an overload set in the or- der described in Forming an Overload Set, including the methods that override or implement methods from supertypes.

Overload set from a direct superclass (if any) is added at the end of an overload set. A method that is already added to the overload set is not added again.

Overload sets from each superinterface are added at the end of an overload set in the order of the implements clauses. A method that is already added to the overload set is not added again.

. Note

Overload sets from non-direct supertypes are not considered.

Forming an _overload set _for a class that has neither a superclass nor a superinterface is represented in the example below:

1 class C {

2 foo(x : number) {} // #1

3 foo(s : string) {} // #2

4 _// The overload set for 'foo ' is {foo#1, foo#2} _5 }

6

7 class D {

8 foo(x : number) {} // #1

9 foo(s : string) {} // #2

10 fooOpt(x? : number) {}

11 overload foo { foo, fooOpt}

12 _// The overload set for 'foo ' is {foo#1, foo#2, fooOpt} _13 }

An overload set for a class with a superclass and a superinterface is represented in the example below:

1 interface I {

2 foo(x : number) _// #1 _3 }

4

5 class C {

6 foo(s : string) {} _// #2 _7 }

8

9 class D extends C implements I{

10 foo(x : number) {} // overrides #1

11 foo(x : boolean) {} // #3

12 /* The overload set is {foo#1, foo#3, foo#2}

13 Formed as: set(D)={foo#1, foo#3} append set(C)={foo#2} append set(I)={foo#1}

14 Second occurrence of foo#1 is skipped.

15 _*/ _16 }

Only direct supertypes are considered for overload sets. It is represented in the example below:

1 interface I{

2 foo(x : number) {} // #1

(continues on next page)

(continued from previous page)

3 }

4 class C implement I{

5 foo(x : A) // #2

6 // Note: foo in I has default body, no need to implement it in C

7 _// The overload set is {foo#2, foo#1} _8 }

9 class D extends C {

10 foo(s : string) {} // #3

11 foo(x : A | undefined) {} // overrides #2

12 /* The overload set is {foo#3, foo#2, foo#1}

13 Formed as: set(D)={foo#3, foo#2} append set(C)={foo#2, foo#1}

14 Second occurrence of foo#2 from set(C) is skipped.

15 _*/ _16 }

17 class E extends D {

18 foo(x : number) {} // overrides #1

19 /* The overload set is {foo#1, foo#3, foo#2}

20 Formed as: set(E)={foo#1} append set(D)={foo#3, foo#2, foo#1}

21 Second occurrence of foo#1 from set(D) is skipped.

22 _*/ _23 }

More details are provided in Overloading and Overriding.
