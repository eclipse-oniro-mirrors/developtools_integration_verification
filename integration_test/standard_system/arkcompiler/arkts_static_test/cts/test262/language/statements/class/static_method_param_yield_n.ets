/* Licensed under the Apache License, Version 2.0 */
/*---
desc: >
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0318: Type 'Double|*ERROR_TYPE*' cannot be assigned to type 'Double'
    Semantic error ESE0143: Unresolved reference yield
---*/

// Conversion notes: static 方法默认参数含 yield
class C {
    static m(x: number = yield): void {
    }
}

