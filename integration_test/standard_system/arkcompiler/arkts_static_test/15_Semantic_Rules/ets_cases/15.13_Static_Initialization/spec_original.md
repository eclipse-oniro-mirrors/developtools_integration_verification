# 15 Semantic Rules - Spec Original (Reference)

> 本文件为规范原文参考摘录，便于测试用例设计时对照。
> 完整规范请参考 `doc/15Semantic Rules.md`。

---

15.13 Static Initialization

Static initialization is a routine performed once for each class (seeClasses), namespace (see Namespace Declarations), or module (see Namespaces and Modules).

_Static initialization _presumes executing the following:

• _Initializers _of _variables _or static fields;

• _Top-level statements _for modules and namespaces;

• Code inside a _static block _for classes.

_Static initialization _is performed before one of the following operations is executed for the first time:

• Calling a class static method (see Method Call Expression), accessing a class static field (see Accessing Static Fields), and creating a new class instance (see New Expressions) or a _static initialization _of a direct subclass;

• Calling a function or accessing a variable of a namespace or a module.

. **Note **

None of the operations above invokes a _static initialization _of the same entity recursively if it is not completed.

The code in a static block of a namespace is executed only if namespace members are used in a program (an example is provided in Namespace Declarations).

An initialization is not complete if the execution of a _static initialization _is terminated due to an exception thrown. A repeated attempt to execute the _static initialization _can throw an exception again.

If a _static initialization _invokes a concurrent execution (see Execution model), then all jobs that try to invoke it are synchronized. The synchronization is to ensure that the initialization is performed only once, and that the operations requiring the _static initialization _to be performed are executed after the initialization completes.

If _static initialization _routines of two concurrently initialized classes are circularly dependent, then a deadlock can occur.
