# 15 Semantic Rules - Spec Original (Reference)

> 本文件为规范原文参考摘录，便于测试用例设计时对照。
> 完整规范请参考 `doc/15Semantic Rules.md`。

---

15.11.7 Overload Set Warning

A compile-time warning is issued if the order of entities in an overload set implies that some overloaded entity can never be selected for a call:

1 function f1 (p : number) {}

2 function f2 (p : number|string) {}

3 function f3 (p : string) {}

4 overload foo {f1, f2, f3} // warning: f3 will never be called as foo()

5

6 foo (5) // f1() is called

7 foo ("5") // f2() is called
