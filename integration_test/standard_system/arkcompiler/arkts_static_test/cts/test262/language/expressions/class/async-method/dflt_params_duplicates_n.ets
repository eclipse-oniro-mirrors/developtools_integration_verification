/* Licensed under the Apache License, Version 2.0 */
/*---
desc: |
    It is a Syntax Error if BoundNames of FormalParameters contains any duplicate elements. (class expression async
    method)
tags: [compile-only, negative]
expected_out_1: [
    "Semantic error ESE0351: Variable 'x' has already been declared.",
    "Syntax error ESY0219: A required parameter cannot follow an optional parameter.",
]
---*/

class C {
    async method(x: number = 0, x: number): Promise<void> {
    }
}

