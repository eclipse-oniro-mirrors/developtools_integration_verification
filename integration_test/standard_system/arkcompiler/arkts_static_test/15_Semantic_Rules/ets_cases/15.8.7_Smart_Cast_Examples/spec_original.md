# 15 Semantic Rules - Spec Original (Reference)

> 本文件为规范原文参考摘录，便于测试用例设计时对照。
> 完整规范请参考 `doc/15Semantic Rules.md`。

---

15.8.7 Smart Cast Examples

By using variable initializers or an assignment the compiler can narrow (smart cast) a declared type to a more precise subtype (smart type). It allows operations that are specific to the subtype:

1 function boo() {

2 let a: number | string = 42

3 a++ /* Smart type of 'a ' is number and number-specific

4 _operations are type-safe */ _5 }

6

7 class Base {}

8 class Derived extends Base { method () {} }

(continues on next page)



(continued from previous page)

9 function goo() {

10 let b : Base = new Derived

11 b.method () /* Smart type of 'b ' is Derived and Derived-specific

12 _operations can be applied in type-safe way */ _13 }

Other examples are explicit calls to instanceof or checks against undefined (see_Equality Expressions) as parts of if statements (seeif Statements_) or ternary conditional expressions (see Ternary Conditional Expressions):

1 class Base { method() { console.log("Base")}; }

2 class Derived extends Base { method() { console.log("Derived")}; }

3

4 function foo (b : Base|null , d : Derived|undefined) {

5 if (b instanceof Base) {

6 b .method()

7 }

8 if (d != undefined) {

9 d .method()

10 } 11 }

12

13 console.log( 'call with (Base, Derived) ')

14 foo( new Base(), new Derived())

15 console.log( 'call with (null, undefined) ')

16 foo(null , undefined)

17 /* Output is:

18 call with (Base, Derived)

19 Base

20 Derived

21 _call with (null, undefined) _22 */

In like cases, a smart compiler requires no additional checks or casts (see Cast Expression) to deduce a smart type of an entity.

Overloading_ _can cause tricky situations when a smart type results in calling an entity that suits the smart type rather than a declared type of an argument (see Overload Resolution):

1 class Base {b = 1}

2 class Derived extends Base{d = 2}

3

4 function fooBase (p : Base) {}

5 function fooDerived (p : Derived) {}

6

7 overload foo { fooDerived, fooBase }

8

9 function too() {

10 let a: Base = new Base

(continues on next page)

(continued from previous page)

11 foo (a) // fooBase will be called

12 let b : Base = new Derived

13 foo (b) _// as smart type of 'b ' is Derived, fooDerived will be called _14 }
