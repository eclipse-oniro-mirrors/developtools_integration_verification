# 15 Semantic Rules - Spec Original (Reference)

> 本文件为规范原文参考摘录，便于测试用例设计时对照。
> 完整规范请参考 `doc/15Semantic Rules.md`。

---

15.13.1 Static Initialization Safety

A compile-time error occurs if a _named reference _refers to a not yet initialized entity, including one of the following:

• Variable (see Variable and Constant Declarations) of a module or namespace (see Namespace Declarations);

• Static field of a class (see Static and Instance Fields).

If detecting an access to a not yet initialized _entity _is not possible, then runtime evaluation is performed as follows:

• Default value is produced if the type of an entity has a default value;

• Otherwise, NullPointerError is thrown.
