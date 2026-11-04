# 15 Semantic Rules - Spec Original (Reference)

> 本文件为规范原文参考摘录，便于测试用例设计时对照。
> 完整规范请参考 `doc/15Semantic Rules.md`。

---

15.11.3 Overload Set for Interface Methods

An overload set for a given interface is formed from the following:

• Implicitly overloaded methods (see Implicit Method Overloading);

• Explicitly overloaded methods listed in Explicit Interface Method Overload;

• Overload sets from superinterfaces, if any.

The following steps are taken to form an overload set:

Explicitly and implicitly overloaded methods defined in a given interface are added into the overload set in the order described in Forming an Overload Set.

Overload sets from each direct superinterface are added at the end of an overload set in the order of the implements clauses. A method that is already added to the overload set is not added again.

. **Note **

Overload sets from non-direct superinterfaces are not considered as they are already accounted for in direct super- interfaces.

Forming an _overload set _for an interface that has no superinterface is represented in the example below:

1 interface I {

2 foo(x : number) // #1

3 foo(s : string) // #2

4 _// The overload set for 'foo ' is {foo#1, foo#2} _5 }

6

7 interface J {

8 foo(x : number) // #1

9 foo(s : string) // #2

10 fooOpt(x? : number)

11 overload foo { foo, fooOpt}

12 _// The overload set for 'foo ' is {foo#1, foo#2, fooOpt} _13 }

Overload sets for an interface with superinterfaces is represented in the example below:

1 interface I1 {

2 foo(x : number) _// #1 _3 }

4 interface I2 {

5 foo(s : string) // #2

6 foo(b : boolean) _// #3 _7 }

8 interface J extends I1, I2 { // the order in extends list is used

9 foo() // #4

10 /* The overload set is {foo#4, foo#1, foo#2, foo#3}

11 _Formed as: set(J)={foo#4} append set(I1)={foo#1} append set(I2)={foo#2, foo#3} _12 */

13 }

That overridden methods occur only once in a list (I and I2 as defined above) is represented in the example below:

1 interface K extends I1, I2 {

2 foo(s : string) // #2 as it overrides I2.foo

3 /* The overload set is {foo#2 , foo#1 , foo#3}

4 Formed as: set(K)={foo#2} append set(I1)={foo#1} append set(I2)={foo#2, foo#3}

5 Second occurrence of foo#2 is skipped.

6 _*/ _7 }

Combining implicit and explicit overloads is represented in the example below:

1 interface I {

2 foo(s : string) // #1

3 fooOpt(x? : number)

4 overload foo {fooOpt, foo}

5 _// The overload set is {fooOpt, foo#1} _6 }

7

8 interface J1 extends I {

9 foo(b : boolean) // #2

10 /* The overload set is {foo#2, fooOpt, foo#1}

11 Formed as: {foo#2} append set(I)={fooOpt, foo#1}

(continues on next page)

(continued from previous page)

12 */

13 }

14

15 interface J2 extends I {

16 foo(b : boolean) // #2

17 overload foo {foo, fooOpt}

18 /* The overload set is {foo#2, fooOpt, foo#1}

19 Formed as: {foo#2, fooOpt} append set(A)={fooOpt, foo#1}

20 Second occurrence of fooOpt is skipped.

21 _*/ _22 }
