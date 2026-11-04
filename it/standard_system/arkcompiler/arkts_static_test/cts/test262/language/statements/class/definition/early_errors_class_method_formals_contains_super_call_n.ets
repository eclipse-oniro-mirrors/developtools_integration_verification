/* Licensed under the Apache License, Version 2.0 */
/*---
desc: It is a syntax error if FormalParameters contains SuperCall is true
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0318: Type 'Double|*ERROR_TYPE*' cannot be assigned to type 'Double'
    Semantic error ESE0201: Call to 'super' must be first statement in constructor
    Syntax error ESY0061: Unexpected super keyword.
---*/

class Foo {
    async foo(foo: number = super()): Promise<void> {
    }
}

