# 15 Semantic Rules - Spec Original (Reference)

> 本文件为规范原文参考摘录，便于测试用例设计时对照。
> 完整规范请参考 `doc/15Semantic Rules.md`。

---

15.8.1 Type Expression

The _type _of an entity is conventionally defined as the set of values an entity (e.g., a variable) can take, and the set of operators applicable to that entity. Two types with equal sets of values and operators are considered equal irrespective of a syntactic form used to denote the types.

However, in some cases it is useful to distinguish between equal types with diferent representation or syntactic form. For example, types Object and Object| C are equal but they behave in diferent ways as a context of an Object Literal:



1 class C {

2 num = 1 3 }

4 function foo(x : Object|C) {}

5 function bar(x : Object) {}

6

7 foo({num : 42}} // OK, object literal is of type 'C'

8 bar({num : 42}} // Compile-time error, Object does not have field 'num '

The term _type expression _is used below as notation that consists of type names and operators on types, namely:

• ' | ' for union operator;

• '& ' for intersection operator (see Intersection Types);

• '- ' for diference operator (see Difference Types).

Computing _smart types _is the process of creating, evaluating, and simplifying type expressions.

. Note

_Intersection types _and _difference types _are semantic (not syntactic notions) that cannot be represented in ArkTS.
