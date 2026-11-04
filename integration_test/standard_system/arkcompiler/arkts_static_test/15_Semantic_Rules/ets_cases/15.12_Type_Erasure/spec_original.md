# 15 Semantic Rules - Spec Original (Reference)

> 本文件为规范原文参考摘录，便于测试用例设计时对照。
> 完整规范请参考 `doc/15Semantic Rules.md`。

---

15.12 Type Erasure

Type erasure is the concept that refers to a special handling of some language types, primarilyGenerics, as members of a smaller subset of the language _type system _when considering certain parts of the language semantics. The subset defined via type mapping is referred to as effective type. _Effective type _mapping satisfies the following properties:

• For arbitrary types A and B, if A is a subtype of B, then an EffectiveType(A) is a subtype of EffectiveType(B)

• For arbitrary types A and B, EffectiveType(A | B) is identical to EffectiveType(A) | EffectiveType(B)

• For an arbitrary type A, A | undefined is a subtype of EffectiveType(A | undefined)

**– **In particular, for an arbitrary type A, undefined is a subtype of EffectiveType(A) An original type and an _effective type _can have relationships of two kinds:

• If _Effective type _of T is identical to T, then type T is preserved by type erasure;

• Otherwise, the type is considered as affected by type erasure.

If T | undefined is preserved by type erasure, then type T is preserved up to undefined.

This property limits the possible applications of type-checking expressions:

• instanceof Expression;

• Cast Expression.

Type mapping determines _effective types _as follows (the undefined union member is excluded in the right-hand-side column for brevity):




Original Type
Effective Type (undefined member excluded)

Any
Any
never	never
undefined	undefined
null	null
Generic types (seeGenerics)	Instantiation of the same generic type (see Explicit Generic In- stantiations) with type arguments selected in accordance with Type Parameter Variance:
• _Covariant _type parameters are instantiated with the con- straint type;
• _Contravariant _type parameters are instantiated with type never;
• _Invariant _type parameters are instantiated with a Wild- card Type
Type Parameters	Type Parameter Constraint
_Union Types_in the form T1	T2 . . . Tn
_Array Types_in the form T[]	Same as for a generic type Array.
Fixed-Size Array Types (FixedArray)	Instantiations of FixedArray (i.e., the efective type of type argument T is preserved).
_Function Types_in the form (P1, P2, Pn) => R	Instantiation of an internal generic _function _type with respect to the number of parameter types n. Parameter types P1, P2 . . . Pn are instantiated with Any. Return type R is instantiated with type never.
_Function Types _in the form (P1, P2, Pn, . . . PR) => R	Instantiation of an internal generic _rest-parametrized function _type with respect to the number of parameter types n. Internal generic _rest-parametrized function _of _n _parameters is a super- type of the internal generic _function _type of _n _parameters. Pa- rameter types P1, P2 . . . Pn and rest parameter type PR are instantiated with Any. Return type R is instantiated with type never.
_Tuple Types_in the form [T1, T2 . . . , Tn]	Instantiation of an internal generic tuple type with respect to the number of element types n.
String Literal Types	string
Awaited	• If T is neither a type parameter nor a subtype of Promise, then the Efective type (Awaited) is the Efective type (T);
• If T is a Promise, then the Efective type (Awaited) is the Efective type (U);
• If T is a type parameter with in variance, then the Ef- fective type (Awaited) is never;
• If T is a type parameter with out variance or no variance specified, then the Efective type (Awaited) is the Efective type (upper-bound(T)).
NonNullable	Efective type (T) - null
Partial	Special runtime partial class
Required	Effective type (T)
Readonly	Effective type (T)
Record<K, V>	Map <Effective type (K), Effective type (V)>
ReturnType	Effective type (return type of F)
Additional type mapping defines an effective signature type, i.e., an _effective type _of a corresponding type except the following:


Original Type
Effective signature type

Return type never
never
Otherwise, the original type is preserved.

A program that uses types not preserved by erasure, and relies on certain cast expressions (seeCast Expression) which narrow values to types not preserved up to undefined, can cause ClassCastError thrown during the evaluation of Field Access Expression, Method Call Expression, or Function Call Expression. Checks that cause any runtime error mentioned above ensure type safety of program execution:

1 class A<T> {

2 field : T

3

4 constructor(value : T) {

5 this.field = value

6 } 7 }

8

9 function unsafe(p : Object) : A<number> {

10 return p as A<number> // OK, but check is performed against type A<>, but not␣ ˓→__against A

11 _// thus it can cause exception later during execution _12 }

13

14 let a: A<number> = unsafe(new A<string>("a")) // A resides in A

15

16 let n = a .field // An exception is raised as the expected type is number but the actual␣ ˓→ type is string
