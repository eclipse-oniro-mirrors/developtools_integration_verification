# 15 Semantic Rules - Spec Original (Reference)

> 本文件为规范原文参考摘录，便于测试用例设计时对照。
> 完整规范请参考 `doc/15Semantic Rules.md`。

---

15.8 Smart Casts and Smart Types

ArkTS uses the concept of smart casts, meaning that in some cases the compiler can implicitly cast a value of a variable to a type which is more specific than the declared type of the variable. The more specific type is called smart type. _Smart casts _allow keeping type safety, require less typing from programmer and improve performance.

Smart casts are applied to local variables (see Variable and Constant Declarations) and parameters (see Parameter List), except those that are captured and modified in lambdas. Further in the text term _variable _is used for both local variables and parameters.

. Note

Smart casts are not applied to global variables and class fields, as it is difficult to track their values.

A variable has a single declared type, and can have diferent _smart types _in diferent contexts. A _smart type _of variable is always a subtype of its declared type.

_Smart type _is used by the compiler each time the value of a variable is read. It is never used when a variable value is changed.

The usage and benefits of a _smart type _are represented in the example below:

1 class C {}

2 class D extends C {

3 foo() {} 4 }

5

6 function bar(c : C) {

7 if (c instanceof D) {

8 c.foo() _// OK, here smart type of 'c' is 'D', 'foo' is safely called _9 }

10 c.foo () // Compile-time error, 'c' does not have method 'foo'

11 (c as D) .foo() _// no compile-time error, can throw runtime error _12 }

The compiler uses data-flow analysis based on Control-flow Graph_ _to compute smart types (see Computing Smart Types). The following language features influence the computation:

• Variable declarations;

• Variable assignments (a variable initialization is handled as a variable declaration combined with an assignment);

• _instanceof Expression _with variables;

• Conditional statements and conditional expressions that include:

**– **_Equality Expressions _of a variable and an expression that process string literals, null value, and undefined value in a specific way.

**– **_Equality Expressions_of typeof v and a string literal, where v is a variable.

**– **Extended Conditional Expressions.

• Loop Statements.

A _smart type _usually takes the form of a Type Expressionthat can contain types not otherwise represented in ArkTS, namely:

• Intersection Types;

• Difference Types.
