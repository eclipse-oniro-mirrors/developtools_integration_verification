# 15 Semantic Rules - Spec Original (Reference)

> 本文件为规范原文参考摘录，便于测试用例设计时对照。
> 完整规范请参考 `doc/15Semantic Rules.md`。

---

15.11.2 Overload Set for Functions

For a given function name, the overload set is formed from implicitly overloaded functions (see Implicit Function Overloading) and from functions listed in Explicit Function Overload (see Forming an Overload Set).

The example below illustrates how _overload set _is formed and used by overload resolution:

1 function fooN(n : number) {}

2

3 function foo() {} // implicitly overloaded foo#1

4 function foo(b : boolean) {} _// implicitly overloaded foo#2 _5

6 function fooX(x? : number) {}

7

8 overload foo {fooN, foo, fooX}

9 _// The overload set for 'foo ' is {fooN, foo#1, foo#2, fooX} _10

11 overload bar {fooX, foo}

12 // The overload set for 'bar ' is {fooX, foo#1, foo#2}

13

14 foo(1) // fooN is called

15 bar(1) // fooX is called

16

17 foo() // foo#1 is called

18 bar() // fooX is called

19

20 foo(true) // foo#2 is called

21 bar(true) // foo#2 is called
