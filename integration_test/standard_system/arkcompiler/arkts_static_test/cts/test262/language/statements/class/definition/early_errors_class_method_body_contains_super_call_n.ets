/* Licensed under the Apache License, Version 2.0 */
/*---
desc: It is a SyntaxError if AsyncFunctionBody contains SuperCall is true
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0201: Call to 'super' must be first statement in constructor
    Syntax error ESY0061: Unexpected super keyword.
---*/

class Foo {
    async foo(): Promise<void> {
        super();
    }
}

