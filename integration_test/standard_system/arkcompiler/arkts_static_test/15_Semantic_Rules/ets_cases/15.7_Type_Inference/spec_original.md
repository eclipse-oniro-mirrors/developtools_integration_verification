# 15 Semantic Rules - Spec Original (Reference)

> 本文件为规范原文参考摘录，便于测试用例设计时对照。
> 完整规范请参考 `doc/15Semantic Rules.md`。

---

15.7 Type Inference

ArkTS supports strong typing but allows not to burden a programmer with the task of specifying type annotations everywhere. A smart compiler can infer types of some entities and expressions from the surrounding context. This technique called _type inference _allows keeping type safety and program code readability, doing less typing, and focusing on business logic. Type inference is applied by the compiler in the following contexts:

• Type Inference for Constant Expressions;

• Variable and constant declarations (see Type Inference from Initializer);

• Implicit generic instantiations (see Implicit Generic Instantiations);

• Function, method or lambda return type (see Return Type Inference);

• Lambda expression parameter type (see Lambda Signature);

• Array literal type inference (see Array Literal Type Inference from Context, and Array Type Inference from Types of Elements);

• Object literal type inference (see Object Literal);

• Smart casts (see Smart Casts and Smart Types).
