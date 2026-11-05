/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Syntax error if `arguments` used in class field (ternary expression)
tags: [compile-only, negative]
expected_out_1: ["Semantic error ESE0143: Unresolved reference arguments"]
---*/

class C {
    public x: number = false ? {} : arguments;
}

