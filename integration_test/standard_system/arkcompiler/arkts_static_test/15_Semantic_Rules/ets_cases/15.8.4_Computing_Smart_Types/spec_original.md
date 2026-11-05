# 15 Semantic Rules - Spec Original (Reference)

> 本文件为规范原文参考摘录，便于测试用例设计时对照。
> 完整规范请参考 `doc/15Semantic Rules.md`。

---

15.8.4 Computing Smart Types

Computing smart types is based on must-alias sets. A _must-alias set _is a set of variables known to have the same value in a given context.

Two maps are used to specify a context (l, s), where:

• l: V → L, map from variables _V _to must-alias sets L;

• s: L → T, map from must-alias sets to smart types _T _ascribed to those sets.

Contexts are computed in relation to nodes of Control-flow Graph. Control-flow graph (CFG) contains the following kinds of nodes:

• Nodes for expressions that have results assigned to variables, including temporary variables;

• _Branching nodes _that have true and false branches;

• _Assuming nodes _that have an assumed condition specified;

• _Backedge nodes _that mark the transfer of control from the end point of a loop to its start point.

The way maps (l, s) are changed when processing specific nodes is described below.

The notation N(①) is used to denote a union of type x and all types to which type x can be converted, namely:

• If x is a numeric type, then a larger numeric type;

• If x is an enumeration type, then enumeration base type.

The notation ①_′ _is used to denote a map that replaces any previous map during node evaluation.

At a **variable declaration **let v: T:

• l(v):={v};

• s(l(v)):={T}, where T is a the declared type of v, that is either set explicitly, or inferred from an initializer expression.

In an **assignment to the variable **v: v = e:

• If _e _is a variable, and no implicit conversions are performed, then:

**– **l ' (v):={v} ∪ l(e);

**– **l ' (u):={v} ∪ l(e) for each u ∈ l(e);

**– **l ' (u):=l(v)-{v} for each u ∈ l(v)-{v};

**– **s ' (l ' (v)):=s(l(e));

**– **s ' (l(v)-{v}):=s(l(v)).

• Otherwise:

**– **l ' (v):={v};

**– **l ' (u):=l(v)-{v} for each u ∈ l(v)-{v};

**– **s ' (l ' (v)):=N(T(e), where T(e) is the smart type of e.

Maps evaluation at an _assumption node _are summarized in the following table:


Branching on
Positive Branch
Negative Branch
Assuming !(_v _instanceof A): s ' (l(v)):=s(l(v))-A,

_v _instanceof A Assuming _v _instanceof A:

s ' (l(v)):=s(l(v))&A

_v _=== _str _(string literal) s ' (l(v)):=str s ' (l(v)):=s(l(v))-str

_ v _=== undefined s ' (l(v)):=undefined s ' (l(v)):=s(l(v))-undefined

_v _=== null s ' (l(v)):=null s ' (l(v)):=s(l(v))-null

_v _== undefined s ' (l(v)):=undefined|null s ' (l(v)):=

s(l(v))-undefined-null

_v _== null s ' (l(v)):=null|undefined s ' (l(v)):=

s(l(v))-undefined-null

_v _=== ec, where _ec _is an enum constant

s ' (l(v)):=N(ec) s ' (l(v)):=s(l(v))

typeof _v _=== str

See **Note 2 **below for evaluation of type T.

s ' (l(v)):= s(l(v))&T s ' (l(v)) := s(l(v))-T

_v _=== e, where _e _is any expres- sion

If _e _is the variable w, no implicit con- No change

version occurs, and no consideration is given to null == undefined, then:

l ' (v):=l ' (w):=l(v)∪ l(w)

Otherwise,

s ' (l ' (v))=s(l(v))&N(T(e))

The definitions of T and N are as in the assignment clause.

_v _(truthiness check) s ' (l(v)):=s(l(v)) -

(null|undefined| "")

s ' (l(v)):=s(l(v))&T,

where T is union of all types the con- tain at least one value considered as false in Extended Conditional Ex- pressions.



. **Note **

In the table above the operator '=== ' can be replaced for '== ' except where the separate case for '== ' is listed explicitly.
For branching on typeof _v _=== str, type _T _is evaluated in accordance with the value of _str _as follows:
Value of str	Type of T
"boolean"	boolean
"string"	string
"bigint"	bigint
"char"	char
"undefined"	undefined
A name of a numeric type	The same numeric type
"object"	(Object - all types for which typeof is not equal to "object")


At a node that joins two CFG branches, namely C₁ = ( l₁ , s₁ ), and C₂ = ( l₂ , s₂ ), the following is performed for each variable v:

• l ' (v):=l₁ (v)∩ l₂ (v); and

• s ' (l ' (v)):=s₁ (l₁ (v)) | s₂ (l₂ (v)).

At each backedge node, the following updates are performed for each variable m modified in the loop body:

• l ' (u):=l(m)-{m} for each u ∈ l(m)-{m};

• l ' (m):={m};

• s ' (l ' (m)):={T}, where T is the declared type of m.
