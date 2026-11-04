/* Licensed under the Apache License, Version 2.0 */
/*---
desc: >
tags: [compile-only, negative]
expected_out_1: [
    "Syntax error ESY0227: Unexpected token 'function'.",
    "Semantic error ESE0351: Variable 'bar' has already been declared.",
]
---*/

class Foo {
    async function foo(bar: number) {
        let bar: number;
    }
}

