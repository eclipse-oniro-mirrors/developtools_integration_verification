/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Syntax error if `arguments` used in class field (typeof expression)
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0318: Type '(() => String)' cannot be assigned to type 'String'
    Semantic error ESE0143: Unresolved reference arguments
---*/

class C {
    public x: string = (): string => typeof arguments;
}

