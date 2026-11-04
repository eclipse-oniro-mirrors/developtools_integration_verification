/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Syntax error if `arguments` used in class field (ternary expression)
tags: [compile-only, negative]
expected_out_1: [
    "Semantic error ESE0318: Type '(() => Double)' cannot be assigned to type 'Double'",
    "Semantic error ESE0143: Unresolved reference arguments",
]
---*/

class C {
    public x: number = (): number => false ? {} : arguments;
}

