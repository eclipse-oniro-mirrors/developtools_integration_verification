/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Syntax error if `super()` used in class field (ternary expression)
tags: [compile-only, negative]
expected_out_1: [
    "Semantic error ESE0318: Type '(() => Double)' cannot be assigned to type 'Double'",
    "Semantic error ESE0201: Call to 'super' must be first statement in constructor",
    "Syntax error ESY0061: Unexpected super keyword.",
]
---*/

class C {
    public x: number = (): number => false ? {} : super();
}

