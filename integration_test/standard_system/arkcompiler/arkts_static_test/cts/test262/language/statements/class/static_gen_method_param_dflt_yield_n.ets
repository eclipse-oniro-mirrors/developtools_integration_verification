/* Licensed under the Apache License, Version 2.0 */
/*---
desc: >
tags: [compile-only, negative]
expected_out_1: [
    "Syntax error ESY0227: Unexpected token '*'.",
    "Semantic error ESE0318: Type 'Double|*ERROR_TYPE*' cannot be assigned to type 'Double'",
    "Semantic error ESE0143: Unresolved reference yield",
]
---*/

// Conversion notes: static generator + 默认参 yield
class C {
    static *g(x: number = yield): void {
    }
}

