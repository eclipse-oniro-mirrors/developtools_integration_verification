# 15 Semantic Rules - Spec Original (Reference)

> 本文件为规范原文参考摘录，便于测试用例设计时对照。
> 完整规范请参考 `doc/15Semantic Rules.md`。

---

15.14.1 Extended Conditional Expressions

ArkTS provides extended semantics for conditional expressions to ensure better TypeScript alignment. It afects the semantics of the following:

• Ternary Conditional Expressions;

• Conditional-And Expression;

• Conditional-Or Expression;



• Logical Complement;

• while Statements and do Statements;

• for Statements;

• if Statements.


. Note
The extended semantics is to be deprecated in one of the future versions of ArkTS.

The extended semantics approach is based on the concept of _truthiness _that extends the boolean logic to operands of non-boolean types.
Depending on the kind of a valid expression’s type, the value of the valid expression can be handled as true or false as described in the table below:			
Value Type Kind	When false	When true	ArkTS Code Example to Check

string
empty string
non-empty string
s .length == 0
boolean	false	true	x
char	c '\u0000 '	any value except c '\u0000 '	x
enum	enum constant handled as false	enum constant handled as true	x.valueOf()
number (double/float)	0 or NaN	any other number	n != 0 && ! isNaN(n)
any integer type	== 0	!= 0	i != 0
bigint	== 0n	!= 0n	i != 0n
null or undefined	always	never	x != null or
x != undefined
Union types When value is false ac-
cording to this column		When value is true ac- cording to this column	x != null or
x != undefined for union types with nullish types
Any other nonNullish type never always new SomeType != null			
Extended semantics of _Conditional-And Expression _and _Conditional-Or Expression _afects the resultant type of ex- pressions as follows:

• For _conditional-and _expression A && B:

**– **If the value of A is known at compile time, then the type of an expression is the type of B when A is handled as true, and the type of A otherwise.

**– **If the value of A is unknown at compile time, then the type of an expression is union A | B.

• For _conditional-or _expression A || B:

**– **If the value of A is known at compile time, then the type of an expression is the type of B when A is handled as false, and the type of A otherwise.

**– **If the value of A is unknown at compile time, then the type of an expression is union A | B.

The way this approach works in practice is represented in the example below. Any nonzero number is handled as true. The loop continues until it becomes zero that is handled as false:

1 console.log(typeof (false || 1) )

2 console.log(typeof (true || 1) )

3 for (let i = 10 ; i; i--) {

4 console.log (i)

5 }

6 /* And the output will be

7 int

8 _boolean _9 10

10 _9 _11 _8 _12 _7 _13 _6 _14 _5 _15 _4 _16 _3 _17 _2 _18 _1 _19 */
