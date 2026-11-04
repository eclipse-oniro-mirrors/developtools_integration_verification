/* Licensed under the Apache License, Version 2.0 */
/*---
desc: It is a SyntaxError if FormalParameters contains await
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0017: Only abstract or native methods can't have body.
    Syntax error ESY0194: Parameter declaration should have an explicit type annotation.
    Syntax error ESY0227: Unexpected token 'await'.
    Syntax error ESY0229: Unexpected token, expected ',' or ')'.
    Syntax error ESY0112: Unexpected token, expected an identifier.
    Syntax error ESY0227: Unexpected token ':'.
    Syntax error ESY0295: number is a predefined type, cannot be used as an identifier
    Syntax error ESY0227: Unexpected token ')'.
    Syntax error ESY0316: Hard keyword 'void' cannot be used as identifier
    Syntax error ESY0224: Identifier expected, got 'void'.
    Syntax error ESY0228: Unexpected token, expected '('.
    Syntax error ESY0227: Unexpected token '}'.
---*/

class Foo {
    async foo(await: number): Promise<void> {
    }
}

