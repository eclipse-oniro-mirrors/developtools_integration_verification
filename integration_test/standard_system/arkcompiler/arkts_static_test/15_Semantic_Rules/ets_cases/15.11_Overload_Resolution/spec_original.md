# 15 Semantic Rules - Spec Original (Reference)

> 本文件为规范原文参考摘录，便于测试用例设计时对照。
> 完整规范请参考 `doc/15Semantic Rules.md`。

---

15.11 Overload Resolution

_Overload resolution _is used to select one entity to call from an _ordered set of overloaded entities _(called in short overload set) in a function call or a method call or a constructor call, where the constructor call is a part of a new expression (see New Expressions).

An overload set for each overloaded name is formed while processing declarations. The process (see Forming an Overload Set) takes into account the following:

• Textual order of implicitly overloaded entities;

• Listing order of explicit overload declarations; and

• Inheritance.

The _overload resolution _process is rather straightforward. The process takes overloaded entities one after another from an overload set, and checks the call of each entity to be valid for the arguments given. The first entity for which the call is valid is the selected entity. Other entities are not checked after the first valid entity is found.

A compile-time occurs if a call is invalid for any overload entities.

A call of an entity is valid if:

• Each required parameter has an argument;

• There is no excess argument that fails to correspond to a parameter, including to an optional parameter or to a rest parameter;

• Each argument is assignable to a corresponding parameter type, or to a corresponding element type of a rest parameter.

Return types of overload entities are not considered by overload resolution, it means that the selected entity can lead to a compile-time error, like in the following example:

1 function foo(n : number) : number {}

2 function foo(s : string) : string {}

3

4 let x: number = foo("1") // Compile-time error
