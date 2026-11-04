# 15 Semantic Rules - Spec Original (Reference)

> 本文件为规范原文参考摘录，便于测试用例设计时对照。
> 完整规范请参考 `doc/15Semantic Rules.md`。

---

15.9 Overriding

_Method overriding _is the language feature closely connected with inheritance. It allows a subclass or a subinterface to ofer a specific implementation of a method already defined in its supertype optionally with modified signature.

The actual method to be called is determined at runtime based on object type. Thus, overriding is related to runtime polymorphism.

. **Note **

_Overriding _does not apply to constructors.

ArkTS uses the _override-compatibility _rule to check the correctness of overriding. The _overriding _is correct if method signature in a subtype (subclass or subinterface) is _override-compatible _with the method defined in a supertype (see Override-Compatible Signatures).

An implementation is forced to _Make a Bridge Method for Overriding Method_in some cases of method overriding.
