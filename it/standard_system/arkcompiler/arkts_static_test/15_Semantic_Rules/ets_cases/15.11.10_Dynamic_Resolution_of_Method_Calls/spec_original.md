# 15 Semantic Rules - Spec Original (Reference)

> 本文件为规范原文参考摘录，便于测试用例设计时对照。
> 完整规范请参考 `doc/15Semantic Rules.md`。

---

15.11.10 Dynamic resolution of method calls

The actual method to be invoked during the _Method Call Expression _evaluation is determined in the runtime with respect to the method statically resolved during the compile time (see Overload Set at Method Call) and the actual _type _of the objectReference.

The resolution depends on the form of the call expression:

• For static method calls, overriding is not used and the statically determined method is the one to be invoked

• For super calls, overriding is not used and the statically resolved method of superclass is the one to be invoked

• For instance method calls, the actual type of the objectReference referred to as _T _is used to determine the method to be invoked.

For the statically resolved method _M _defined in the type D, let the type _C _be

• _D _if the method _M _is found in the type _D _during the execution.

• The _closest _superclass of _C _that defines the method of the signature of M.

• The _closest _superinterface of _C _that defines the method of the signature of M.

Note: For the set of programs compiled without source code updates _C _is always D

Type _T _(which is always a class) and the statically determined method _M _defined in the type _C _(where _T _is necessarily a subtype of C) are used to perform the resolution, which is defined as follows:

• If _T _is C, the result of the resolution is M.

• If _T _has a superclass and the resolution of the method _M _for the superclass of _T _succeeds and the resolved method is defined in class, let _Ms _be the result of the resolution:

**– **If the type _T _defines several method declarations that override the method _Ms _in T:

If the set of such methods contains exactly one method, this method is the result of the resolution.

Otherwise, the method resolution fails for type T.

**– **Otherwise, _Ms _is the result of the resolution.

• Otherwise, the set of the _superinterfaces _of _T _is searched for a matching method:

**– **Each considered method should be declared in the superinterface of _T _and should override the method _M _in C.

**– **For each considered method Mi, there should be no other method _Mio _satisfying the previous criterion that overrides _Mi _in the interface that defines Mio.

Note: That means, all considered method belong to subinterfaces of the declaring interface of M.

If the set contains exactly one default method, this method is the result of the resolution. Otherwise, the set either

**– **has multiple default methods

**– **has no default methods

In these cases, the resolution fails for type T.

If the method resolution fails, then a runtime error occurs.

Note: For the set of programs compiled without source code updates the resolution always results in method resolved and does never throw.
