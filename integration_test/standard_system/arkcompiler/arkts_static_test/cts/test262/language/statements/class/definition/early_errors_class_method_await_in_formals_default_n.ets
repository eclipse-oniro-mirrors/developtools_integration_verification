/* Licensed under the Apache License, Version 2.0 */
/*---
desc: It is a SyntaxError if FormalParameters' default expressions contains await
tags: [compile-only, negative]
expected_out_1: [
    "Semantic error ESE0318: Type 'Double|*ERROR_TYPE*' cannot be assigned to type 'Double'",
    "Syntax error ESY0227: Unexpected token ')'.",
    "Syntax error ESY0229: Unexpected token, expected ',' or ')'.",
]
---*/

class Foo {
    async foo(x: number = await): Promise<void> {
    }
}

