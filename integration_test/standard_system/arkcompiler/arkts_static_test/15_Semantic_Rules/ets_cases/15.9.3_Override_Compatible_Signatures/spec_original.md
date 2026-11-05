# 15 Semantic Rules - Spec Original (Reference)

> 本文件为规范原文参考摘录，便于测试用例设计时对照。
> 完整规范请参考 `doc/15Semantic Rules.md`。

---

15.9.3 Override-Compatible Signatures

Let’s consider classes Derived and Base for which:

• Derived is a subclass of Base

• both classes declare method foo

• in Base, foo() has a signature S1 <V1 , . . . Vk > (U1 , . . . , Un) :Un+1 ,

• in Derived, foo() has a signature S2 <W1 , . . . Wj > (T1 , . . . , Tm) :Tm+1 as in the example below:

1 class Base {

2 foo <V1, ... Vk> (p1 : U1 , ... pn : Un) : Un+1 3 }

4 class Derived extends Base {

5 override foo <W1, ... Wj> (p1 : T1 , ... pm : Tm) : Tm+1 6 }

The signature S2 is override-compatible with S1 only if **all **of the following conditions are met:

Number of parameters of both methods is the same, i.e., n = m.

Each parameter type Ti is a supertype of Ui for i in 1 . .n (contravariance).

If return type Tm+1 is this, then Un+1 is this, or any of superinterfaces or superclass of the current type.

If return type Tm+1 is not this, then it must be a subtype of Un+1 (covariance).

Number of type parameters of either method is the same, i.e., k = j.

Constraints of W1 , . . . Wj are to be contravariant (see Invariance, Covariance and Contravariance) to the appro- priate constraints of V1 , . . . Vk .

The following rule applies to generics:

• Derived class must have type parameter constraints to be subtypes (see Subtyping) of respective type parameter constraints in the base type;

• Otherwise, a compile-time error occurs.

1 class Base {}

2 class Derived extends Base {}

3 class A1 <CovariantTypeParameter extends Base> {}

4 class B1 <CovariantTypeParameter extends Derived> extends A1<CovariantTypeParameter> {}

5 // OK, derived class may have type compatible constraint of type parameters

6

7 class A2 <ContravariantTypeParameter extends Derived> {}

8 class B2 <ContravariantTypeParameter extends Base> extends A2<ContravariantTypeParameter> ˓→ {}

9 // Compile-time error, derived class cannot have non-compatible constraints of type␣ ˓→__parameters

The semantics is represented in the examples below:

Class/Interface Types
1 interface Base {

2 param(p : Derived) : void

3 ret() : Base 4 }

5

6 interface Derived extends Base {

7 param(p : Base) : void // Contravariant parameter

8 ret() : Derived _// Covariant return type _9 }

Function Types
1 interface Base {

2 param(p : (q : Base)=>Derived) : void

3 ret() : (q : Derived)=> Base 4 }

5

6 interface Derived extends Base {

7 param(p : (q : Derived)=>Base) : void // Covariant parameter type, contravariant␣ ˓→__return type

8 ret() : (q : Base)=> Derived // Contravariant parameter type, covariant␣ ˓→__return type

9 }

Union Types
1 interface BaseSuperType {}

2 interface Base extends BaseSuperType {

3 // Overriding for parameters

4 param<T extends Derived, U extends Base>(p : T | U) : void

5

6 // Overriding for return type

7 ret<T extends Derived, U extends Base>() : T | U 8 }

9

10 interface Derived extends Base {

11 // Overriding kinds for parameters, Derived <: Base

12 param<T extends Base, U extends Object>(

13 p : Base | BaseSuperType // contravariant parameter type: Derived | Base <: Base␣ ˓→ | BaseSuperType

14 ) : void

15 // Overriding kinds for return type

16 ret<T extends Base, U extends BaseSuperType>() : T | U 17 }

Type Parameter Constraint
1 interface Base {

2 param<T extends Derived>(p : T) : void

3 ret<T extends Derived>() : T 4 }

5

6 interface Derived extends Base {

7 param<T extends Base>(p : T) : void // Contravariance for constraints of type␣ ˓→__parameters

8 ret<T extends Base>() : T // Contravariance for constraints of the␣ ˓→__return type

9 }

Override compatibility with Object is represented in the example below:

1 enum E { One, Two }

2 interface Base {

3 kinds_of_parameters<T extends Derived, U extends Base>(

4 // It represents all possible kinds of parameter type

5 p01 : Derived ,

6 p02 : (q : Base)=>Derived,

7 p03 : number ,

8 p04 : T | U,

9 p05 : E ,

10 p06 : Base [] ,

11 p07 : [Base, Base]

12 ) : void

13 kinds_of_return_type() : Object _// It can be overridden by all subtypes of Object _14 }

15 interface Derived extends Base {

16 kinds_of_parameters( // Object is a supertype for all class types

17 p1 : Object ,

(continues on next page)

(continued from previous page)

18 p2 : Object ,

19 p3 : Object ,

20 p4 : Object ,

21 p5 : Object ,

22 p6 : Object ,

23 p7 : Object

24 ) : void 25 }

26

27 interface Derived1 extends Base {

28 kinds_of_return_type() : Base _// Valid overriding _29 }

30 interface Derived2 extends Base {

31 kinds_of_return_type() : (q : Derived)=> Base _// Valid overriding _32 }

33 interface Derived3 extends Base {

34 kinds_of_return_type() : number _// Valid overriding _35 }

36 interface Derived4 extends Base {

37 kinds_of_return_type() : number | string _// Valid overriding _38 }

39 interface Derived5 extends Base {

40 kinds_of_return_type() : E _// Valid overriding _41 }

42 interface Derived6 extends Base {

43 kinds_of_return_type() : Base [] _// Valid overriding _44 }

45 interface Derived7 extends Base {

46 kinds_of_return_type() : [Base, Base] _// Valid overriding _47 }
