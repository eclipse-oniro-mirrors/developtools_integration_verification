# 15 Semantic Rules - Spec Original (Reference)

> 本文件为规范原文参考摘录，便于测试用例设计时对照。
> 完整规范请参考 `doc/15Semantic Rules.md`。

---

15.11.1 Forming an Overload Set

Only a single _overload set _is created for each overloaded name in a scope. An overload set combines entities that are overloaded implicitly and explicitly. If an entity is not overloaded, then an _overload set _contains the very entity for the entity name. The order of an _overload set _is determined as follows:

If an overload set is formed from _implicit overloads _only, then the order of the _overload set _corresponds to the textual order of entity declaration;

If an overload set is formed from _explicit overloads _only, then the order of the _overload set _is the same as the order of the entities listed.

If an overload set is a combination of implicitly and explicitly overloaded entities, then:

• An _explicit overload _list must contain the name of an implicitly overloaded entity. Otherwise, a compile- time error occurs.

• The order is based on the order of the _explicit overload _list as an _explicit overload _has a higher priority. All implicitly overloaded entities are listed in the textual order of declaration, and are included into the _explicit overload _list at the position of the overloaded name.

The textual position of an _explicit overload _does not influence the order in the overload set. An _explicit overload _is efectively processed at the end of the scope.

An overload set for interface and instance class methods can contain methods from superinterfaces and superclasses. Methods defined in an interface or in a class are added to the overload set before any inherited method, i.e., more specific entities have a higher priority. Further details are discussed in Overload Set for Interface Methods and Overload Set for Class Instance Methods.
