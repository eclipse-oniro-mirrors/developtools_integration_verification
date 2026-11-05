# 15 Semantic Rules - Spec Original (Reference)

> 本文件为规范原文参考摘录，便于测试用例设计时对照。
> 完整规范请参考 `doc/15Semantic Rules.md`。

---

15.8.6 Type Expression Simplification

The following table summarizes the contexts for _type expression simplification _transformations to be performed at each node of the CFG:




Transformation
Initial expression
Simplified expression

Associativity of '& '
(A&B)&C
A&(B&C)
Commutativity of '& '	A&B	B&A
In case of subtyping A<:B and '& '	A&B	A
A&never	never
A&Any	A
Associativity of '	'	(A
Commutativity of '	'	A
In case of subtyping A<:B and '	'	A
A	never
A	Any
Diference with never	A-never	A
In case of subtyping A<:B and '- '	A-B	never
A-Any	never
(B-A)	A
(A-B)&B	never
Other transformations	(A&B)-C	(A-C)&(B-C)
(A	B)&C
(A	B)-C
(A-B)-C	(A-(B
The following simplifications for object types are also taken into account:

If A and B are classes and neither transitively extends the other, then A&B = never, A-B = A.

If A is a final class that does not implement the interface I, then A&I = never, A-I = A.

If A is a class or interface, and _U _is never or undefined, then A&U = never, A-U = A.

The following normalization procedure is performed for every _smart type _at every node of CFG where possible:

Push _difference types _inside _intersection types _and unions, and simplify the diference.

Push _intersection types _inside unions, and simplify the intersections.

Simplify the resultant union types.

After a simplification, _smart types _undergo approximation with _difference types _A-B recursively replaced by A.
