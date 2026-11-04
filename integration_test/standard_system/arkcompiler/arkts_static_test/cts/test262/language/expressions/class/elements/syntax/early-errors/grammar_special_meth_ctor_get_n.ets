/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Accessor get Methods cannot be named "constructor" (class expression)
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0121: Field type annotation expected.
    Syntax error ESY0140: Type annotation isn't allowed for constructor.
    Semantic error ESE0033: Return statement with expression isn't allowed in constructor.
---*/

class C {
    get constructor(): number {
        return 0;
    }
}

