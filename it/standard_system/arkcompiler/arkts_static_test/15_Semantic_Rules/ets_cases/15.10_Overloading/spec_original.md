# 15 Semantic Rules - Spec Original (Reference)

> 本文件为规范原文参考摘录，便于测试用例设计时对照。
> 完整规范请参考 `doc/15Semantic Rules.md`。

---

15.10 Overloading

_Overloading _is the language feature that allows using the same name to call several functions, methods, or constructors with diferent signatures.

The actual function, method, or constructor to be called is determined at compile time. Thus, _overloading _is compile- time polymorphism by name.

ArkTS supports the following two _overloading _mechanisms:

• Implicit overloading, where a set of overloaded entities for functions and methods is determined by their names, or includes all unnamed constructors; and

• _Explicit overloading _(see Explicit Overload Declarations) that allows a developer to specify a set of overloaded entities explicitly.

In either case, an ordered set of overloaded entities is built at compile time, and used by Overload Resolutionto select one entity to call from within the set. _Overload resolution _uses the first-match algorithm to streamline the resolution process, i.e., only the first appropriate entity is called, while all other entities are not considered.

If signatures of implicitly overloaded entities are overload-equivalent, then a compile-time error occurs (seeOverload- Equivalent Signatures). _Explicitly overloaded entities _are never checked for overload equivalence. _Explicitly overloaded entities _with separate names never cause a compile-time error.

Overloading for the module scope name _main _is prohibited, and causes a compile-time error if attempted:

1 function main() {}

2 function main(p : string []) {}

3 // Such declarations lead to a compile-time error
