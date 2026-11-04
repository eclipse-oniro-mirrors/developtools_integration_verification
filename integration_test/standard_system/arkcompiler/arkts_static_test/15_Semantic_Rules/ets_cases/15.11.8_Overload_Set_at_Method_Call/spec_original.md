# 15 Semantic Rules - Spec Original (Reference)

> 本文件为规范原文参考摘录，便于测试用例设计时对照。
> 完整规范请参考 `doc/15Semantic Rules.md`。

---

15.11.8 Overload Set at Method Call

Additional processing of an _overload set _is used at _Method Call Expression _because an identifier at the call site can denote both _instance methods _and Functions with Receiver.

If the identifier at the call expression denotes _functions with receiver only, then Overload Set for Functions _is used. However, only _functions with receiver _(not ordinary functions) are considered for overload resolution:

1 class C {}

2

3 function foo(this : C) {} // #1

4 function foo(this : C , s : string) {} // #2

5 function foo(c : C , n: number) {} // #3

6

7 let c = new C()

8 c.foo() // only function #1, #2, but not #3 are considered here

9

10 foo(c) // all three functions are considered here

If the identifier denotes both instance methods and functions with receiver, then the overload set for methods is used for overload resolution, i.e., no function with receiver is called. Otherwise, a compile-time warning is issued as represented in the example below:

1 // File1

2 export class C {

3 bar() {} 4 }

5 export function foo(this : C) {}

(continues on next page)

(continued from previous page) 6

7 // File2

8 import {C, foo as bar} from "File1"

9

10 new C().bar() // C.bar is called, warning is issued

. Note

If a function with receiver is declared, and the name of the function is the same as the name of an accessible instance method or field of the receiver type, then a compile-time error occurs in most cases (see the example in Functions with Receiver). A warning is issued where no such error is reported.
